module conv1
(
    input               clk,
    input               rst_n,
    input               upstream_busy,
    input [7:0]         data_in,

    output reg [9:0]    raddr,
    output reg          ren,
    output reg [10:0]   waddr,
    output reg          wen,
    output reg signed [11:0] data_out,
    output              busy
);
    
    localparam IDLE = 3'b001, FILL = 3'b010, CALC = 3'b100;
    reg [3:0] state, next_state;
    reg upstream_busy_d1;  //延迟用于边沿检测

    reg [4:0] index_x, index_y;  // 0-27, 0-23
    reg [1:0] channel_cnt;       // 0,1,2 三个卷积通道
    
    
    

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always @(posedge clk) begin
 
        upstream_busy_d1 <= upstream_busy;

    end
    
    assign busy = ~(state == IDLE);      

    always @(*) begin
        case (state)
            IDLE: next_state = (~upstream_busy && upstream_busy_d1)? FILL: IDLE;
            FILL: next_state = (raddr == 140)? CALC: FILL;
            CALC: next_state = (index_x==27 && index_y==23 && channel_cnt == 2)? IDLE: CALC;  
            default: next_state = IDLE;
        endcase
    end

    reg signed [8:0] buffer [0:139];  //拓展一位成符号数
    reg [7:0] buffer_addr;


/*********************更新CALC状态下的index********************************/
    always @(posedge clk or negedge rst_n) begin  
        if (~rst_n) begin
            index_x <= 0;
            index_y <= 0;
            channel_cnt <= 0;
        end else begin
            if (state != CALC) begin
                index_x <= 0;
                index_y <= 0;
                channel_cnt <= 0;
            end else begin
                if(index_x == 27) begin
                    if(channel_cnt == 2) begin
                        if(index_y != 23) begin
                            index_y <= index_y + 1;
                            channel_cnt <= 0;
                            index_x <= 0;
                        end else begin
                            //保持原值  index_y=23，CALC结束，等待进入其他状态
                        end
                    end else begin
                        channel_cnt <= channel_cnt + 1;
                        index_x <= 0;
                    end
                end else begin
                    index_x <= index_x + 1;
                end
            end 
        end
    end


/********************输入部分处理********************************/
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            raddr <= 0;
            ren <= 0;
            buffer_addr <= 0;
        end else begin
            case (state)
                IDLE: begin
                    raddr <= 0;
                    ren <= 0;
                    buffer_addr <= 0;
                end
                FILL: begin   //FILL状态下，连续读入140个输入并存储在buffer
                    if(raddr != 140) begin
                        ren <= 1;
                        raddr <= ren? raddr + 1: raddr;
                        buffer_addr <= raddr[7:0];              //写入buffer的地址比raddr延迟一位
                        buffer[buffer_addr] <= {1'b0,data_in};  //后续与权重相乘是有符号乘法，所以buffer增添一位并定义成有符号数
                    end else begin
                        ren <= 0;
                        buffer[buffer_addr] <= {1'b0,data_in};
                    end
                end
                CALC: begin  //CALC状态下，当channel_cnt=2时，要更新buffer
                    if(channel_cnt == 2'b01 && index_x == 27)begin
                        ren <= 1;
                        raddr <= raddr + 1;
                    end
                    if(channel_cnt == 2 ) begin
                        if(index_x != 27)begin
                            raddr <= raddr + 1;
                            buffer[index_x] <= buffer[index_x + 28];
                            buffer[index_x + 28] <= buffer[index_x + 56];
                            buffer[index_x + 56] <= buffer[index_x + 84];
                            buffer[index_x + 84] <= buffer[index_x + 112];
                            buffer[index_x + 112] <= {1'b0,data_in};
                        end else begin
                            ren <= 0;
                            buffer[index_x] <= buffer[index_x + 28];
                            buffer[index_x + 28] <= buffer[index_x + 56];
                            buffer[index_x + 56] <= buffer[index_x + 84];
                            buffer[index_x + 84] <= buffer[index_x + 112];
                            buffer[index_x + 112] <= {1'b0, data_in};

                        end
                    end 

                end
                default: begin
                    raddr <= 0;
                    ren <= 0;
                    buffer_addr <= 0;
                end
            endcase
        end
    end

    reg signed [7:0] w_1[0:24], w_2[0:24], w_3 [0:24];
    reg signed [7:0] bias [0:2];
    reg signed [7:0] w_sel[0:24];
    reg signed [15:0] bias_sel;
    
    initial begin
        $readmemh("./sources/rtl/weights/conv1_weight_1.txt", w_1);
        $readmemh("./sources/rtl/weights/conv1_weight_2.txt", w_2);
        $readmemh("./sources/rtl/weights/conv1_weight_3.txt", w_3);
        $readmemh("./sources/rtl/weights/conv1_bias.txt", bias);
    end

    integer i;
    always @(*) begin
        case(channel_cnt)
            2'b00: begin 
                for(i=0; i<25; i=i+1) begin
                    w_sel[i] <= w_1[i];
                end
                bias_sel = {bias[0], 8'b0};
            end
            2'b01: begin 
                for(i=0; i<25; i=i+1) begin
                    w_sel[i] <= w_2[i];
                end
                bias_sel = {bias[1], 8'b0};
            end
            2'b10: begin 
                for(i=0; i<25; i=i+1) begin
                    w_sel[i] <= w_3[i];
                end
                bias_sel = {bias[2], 8'b0};
            end
            default: begin 
                for(i=0; i<25; i=i+1) begin
                    w_sel[i] <= w_1[i];
                end
                bias_sel = {bias[0], 8'b0};
            end
        endcase
    end 

    reg signed [19:0] conv_out;

    always @(*) begin
        conv_out <= buffer[index_x] * w_sel[0] + buffer[index_x+1] * w_sel[1] + buffer[index_x+2] * w_sel[2] + buffer[index_x+3] * w_sel[3] + buffer[index_x+4] * w_sel[4] +
                    buffer[index_x+28] * w_sel[5] + buffer[index_x+29] * w_sel[6] + buffer[index_x+30] * w_sel[7] + buffer[index_x+31] * w_sel[8] + buffer[index_x+32] * w_sel[9] + 
                    buffer[index_x+56] * w_sel[10] + buffer[index_x+57] * w_sel[11] + buffer[index_x+58] * w_sel[12] + buffer[index_x+59] * w_sel[13] + buffer[index_x+60] * w_sel[14] +
                    buffer[index_x+84] * w_sel[15] + buffer[index_x+85] * w_sel[16] + buffer[index_x+86] * w_sel[17] + buffer[index_x+87] * w_sel[18] + buffer[index_x+88] * w_sel[19] + 
                    buffer[index_x+112] * w_sel[20] + buffer[index_x+113] * w_sel[21] + buffer[index_x+114] * w_sel[22] + buffer[index_x+115] * w_sel[23] + buffer[index_x+116] * w_sel[24] + 
                    bias_sel;
        
    end


/*********************输出部分处理********************************/
    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            wen <= 0;
            data_out <= 0;
            waddr <= 0;
        end else begin
            if(state == CALC) begin
                if(index_x <= 23) begin
                    wen <= 1;
                    data_out <= conv_out[19]? 0: conv_out[19:8];  //在池化前进行relu，主要是为了方便可视化
                    case(channel_cnt)
                        2'b00: waddr <= index_x + index_y * 24;
                        2'b01: waddr <= index_x + index_y * 24 + 576;
                        2'b10: waddr <= index_x + index_y * 24 + 1152;
                        default: waddr <= 0;
                    endcase
                end else begin
                    wen <= 0;
                    data_out <= 0;
                    waddr <= 0;
                end
            end
        end
    end
endmodule