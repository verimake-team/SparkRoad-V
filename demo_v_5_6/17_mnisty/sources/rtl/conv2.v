`timescale 1ns/1ps

module conv2
(
    input               clk,
    input               rst_n,
    input               upstream_busy,
    input signed [11:0] data_in,

    output reg [8:0]    raddr,  //12*12*3 = 432
    output reg          ren,
    output reg [7:0]    waddr, //8x8x3 =  192
    output reg          wen,
    output reg signed [11:0] data_out,
    output              busy
);
    
    reg upstream_busy_d1;
    reg [4:0] index_x, index_y;  //0-11, 0-7
    reg [1:0] channel_cnt;       //0-2
    reg [1:0] layer_cnt;         //0-2

    localparam IDLE = 3'b001, FILL = 3'b010, CALC = 3'b100;
    reg [3:0] state, next_state;
    

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    always @(posedge clk) begin
        begin
            upstream_busy_d1 <= upstream_busy;
        end
    end
    
    always @(*) begin
        case (state)
            IDLE: next_state = (~upstream_busy && upstream_busy_d1)? FILL: IDLE;                            
            FILL: next_state = (raddr == 60 || raddr == 204 || raddr == 348)? CALC: FILL;         //60, 60+144, 60+288             
            CALC: begin
                if (index_x == 11 && index_y == 7 && channel_cnt == 2 && layer_cnt !=2)
                    next_state = FILL;
                else if (index_x == 11 && index_y == 7 && channel_cnt == 2 && layer_cnt == 2)
                    next_state = IDLE;
                else
                    next_state = CALC;
            end 
            default: next_state = IDLE;
        endcase
    end

    reg signed [11:0] buffer [0:59];
    reg [7:0] buffer_addr;


    assign busy = state == IDLE? 1'b0 : 1'b1;

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
                if(index_x == 11) begin
                    if(channel_cnt == 2) begin
                        if(index_y != 7) begin
                            index_y <= index_y + 1;
                            channel_cnt <= 0;
                            index_x <= 0;
                        end else begin
                            index_x <= 0;
                            index_y <= 0;
                            channel_cnt <= 0;
                            layer_cnt <= layer_cnt == 2? 0 : layer_cnt + 1;
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

    reg ren_d1;
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            raddr <= 0;
            ren <= 0;
            ren_d1 <= 0;
        end else begin
            case (state)
                IDLE: begin
                    raddr <= 0;
                    ren <= 0;
                    ren_d1 <= 0;
                    buffer_addr <= 0;
                end
                FILL: begin
                    if(raddr != 60 && raddr != 204 && raddr != 348) begin
                        ren <= 1;
                        ren_d1 <= ren;
                        raddr <= ren? raddr + 1: raddr;
                        buffer_addr <= ren_d1? buffer_addr + 1: 0;
                        buffer[buffer_addr] <= data_in;
                    end else begin
                        ren <= 0;
                        ren_d1 <= 0;
                        buffer[buffer_addr] <= data_in;
                    end

                end
                CALC: begin
                    if(channel_cnt == 2'b01 && index_x == 11)begin
                        ren <= 1;
                        raddr <= raddr + 1;
                    end
                    if(channel_cnt == 2 ) begin
                        if(index_x != 11)begin
                            raddr <= raddr + 1;
                            buffer[index_x] <= buffer[index_x + 12];
                            buffer[index_x + 12] <= buffer[index_x + 24];
                            buffer[index_x + 24] <= buffer[index_x + 36];
                            buffer[index_x + 36] <= buffer[index_x + 48];
                            buffer[index_x + 48] <= data_in;
                        end else begin
                            ren <= 0;
                            buffer[index_x] <= buffer[index_x + 12];
                            buffer[index_x + 12] <= buffer[index_x + 24];
                            buffer[index_x + 24] <= buffer[index_x + 36];
                            buffer[index_x + 36] <= buffer[index_x + 48];
                            buffer[index_x + 48] <= data_in;
                        end
                    end 
                    if(index_x == 11 && index_y == 7 && channel_cnt == 2 && layer_cnt !=3) begin
                        //raddr <= (layer_cnt + 1)* 144; 
                        case(layer_cnt)
                            2'b00: raddr <= 144;
                            2'b01: raddr <= 288;
                        endcase
                    end

                end
                default: begin
                    raddr <= 0;
                    ren <= 0;
                end
            endcase
        end
    end

    reg signed [7:0] w_1[0:24], w_2[0:24], w_3 [0:24];
    reg signed [7:0] w_4[0:24], w_5[0:24], w_6 [0:24];
    reg signed [7:0] w_7[0:24], w_8[0:24], w_9 [0:24];
    reg signed [7:0] bias [0:2];
    reg signed [7:0] w_sel[0:24];
    wire signed [11:0] bias_exp[0:2];
    //wire signed [7:0] bias_sel;        //可能需要做符号拓展
    
    initial begin
        $readmemh("./sources/rtl/weights/conv2_weight_11.txt", w_1);
        $readmemh("./sources/rtl/weights/conv2_weight_12.txt", w_2);
        $readmemh("./sources/rtl/weights/conv2_weight_13.txt", w_3);

        $readmemh("./sources/rtl/weights/conv2_weight_21.txt", w_4);
        $readmemh("./sources/rtl/weights/conv2_weight_22.txt", w_5);
        $readmemh("./sources/rtl/weights/conv2_weight_23.txt", w_6);

        $readmemh("./sources/rtl/weights/conv2_weight_31.txt", w_7);
        $readmemh("./sources/rtl/weights/conv2_weight_32.txt", w_8);
        $readmemh("./sources/rtl/weights/conv2_weight_33.txt", w_9);

        $readmemh("./sources/rtl/weights/conv2_bias.txt", bias);
    end
    
    assign bias_exp[0] = (bias[0][7] == 1) ? {4'b1111, bias[0]} : {4'b0000, bias[0]};
    assign bias_exp[1] = (bias[1][7] == 1) ? {4'b1111, bias[1]} : {4'b0000, bias[1]};
    assign bias_exp[2] = (bias[2][7] == 1) ? {4'b1111, bias[2]} : {4'b0000, bias[2]};

    integer i;
    always @(*) begin
        case(channel_cnt)
            2'b00: begin 
                case(layer_cnt)
                    2'b00: begin
                        for(i=0; i<25; i=i+1) begin
                            w_sel[i] <= w_1[i];
                        end
                       // bias_sel = bias[0];
                    end
                    2'b01: begin
                        for(i=0; i<25; i=i+1) begin
                            w_sel[i] <= w_2[i];
                        end
                       // bias_sel = 0;
                    end
                    2'b10: begin
                        for(i=0; i<25; i=i+1) begin
                            w_sel[i] <= w_3[i];
                        end
                       // bias_sel = 0;
                    end
                    default: begin
                        for(i=0; i<25; i=i+1) begin
                            w_sel[i] <= w_1[i];
                        end
                       // bias_sel = bias[0];
                    end
                endcase
            end

            2'b01: begin 
                case(layer_cnt)
                    2'b00: begin
                        for(i=0; i<25; i=i+1) begin
                            w_sel[i] <= w_4[i];
                        end
                        //bias_sel = bias[1];
                    end
                    2'b01: begin
                        for(i=0; i<25; i=i+1) begin
                            w_sel[i] <= w_5[i];
                        end
                        //bias_sel = 0;
                    end
                    2'b10: begin
                        for(i=0; i<25; i=i+1) begin
                            w_sel[i] <= w_6[i];
                        end
                        //bias_sel = 0;
                    end
                    default: begin
                        for(i=0; i<25; i=i+1) begin
                            w_sel[i] <= w_4[i];
                        end
                       // bias_sel = bias[0];
                    end
                endcase
            end

            2'b10: begin 
                case(layer_cnt)
                    2'b00: begin
                        for(i=0; i<25; i=i+1) begin
                            w_sel[i] <= w_7[i];
                        end
                        //bias_sel = bias[2];
                    end
                    2'b01: begin
                        for(i=0; i<25; i=i+1) begin
                            w_sel[i] <= w_8[i];
                        end
                        //bias_sel = 0;
                    end
                    2'b10: begin
                        for(i=0; i<25; i=i+1) begin
                            w_sel[i] <= w_9[i];
                        end
                        //bias_sel = 0;
                    end
                    default: begin
                        for(i=0; i<25; i=i+1) begin
                            w_sel[i] <= w_7[i];
                        end
                       // bias_sel = bias[0];
                    end
                endcase
            end
            
            default: begin 
                case(layer_cnt)
                    2'b00: begin
                        for(i=0; i<25; i=i+1) begin
                            w_sel[i] <= w_1[i];
                        end
                       // bias_sel = bias[0];
                    end
                    2'b01: begin
                        for(i=0; i<25; i=i+1) begin
                            w_sel[i] <= w_2[i];
                        end
                       // bias_sel = 0;
                    end
                    2'b10: begin
                        for(i=0; i<25; i=i+1) begin
                            w_sel[i] <= w_3[i];
                        end
                       // bias_sel = 0;
                    end
                    default: begin
                        for(i=0; i<25; i=i+1) begin
                            w_sel[i] <= w_1[i];
                        end
                       // bias_sel = bias[0];
                    end
                endcase
            end
        endcase
    end 

    reg signed [19:0] conv_out;

    always @(*) begin
        conv_out <= buffer[index_x] * w_sel[0] + buffer[index_x+1] * w_sel[1] + buffer[index_x+2] * w_sel[2] + buffer[index_x+3] * w_sel[3] + buffer[index_x+4] * w_sel[4] +
                    buffer[index_x+12] * w_sel[5] + buffer[index_x+13] * w_sel[6] + buffer[index_x+14] * w_sel[7] + buffer[index_x+15] * w_sel[8] + buffer[index_x+16] * w_sel[9] + 
                    buffer[index_x+24] * w_sel[10] + buffer[index_x+25] * w_sel[11] + buffer[index_x+26] * w_sel[12] + buffer[index_x+27] * w_sel[13] + buffer[index_x+28] * w_sel[14] +
                    buffer[index_x+36] * w_sel[15] + buffer[index_x+37] * w_sel[16] + buffer[index_x+38] * w_sel[17] + buffer[index_x+39] * w_sel[18] + buffer[index_x+40] * w_sel[19] + 
                    buffer[index_x+48] * w_sel[20] + buffer[index_x+49] * w_sel[21] + buffer[index_x+50] * w_sel[22] + buffer[index_x+51] * w_sel[23] + buffer[index_x+52] * w_sel[24];
        //未加bias, 因为三层只需要加一次bias
    end

    reg signed [13:0] out_buffer [0:191];      //累加buffer 14 位

    wire signed [13:0] sum3;
    wire signed [11:0] temp_out[0:2];

    assign sum3 = out_buffer[index_x + index_y * 8 + channel_cnt * 64] + conv_out[19:6];

    assign temp_out[0] = sum3[13:1] + bias_exp[0];
    assign temp_out[1] = sum3[13:1] + bias_exp[1];
    assign temp_out[2] = sum3[13:1] + bias_exp[2];      

    wire [7:0]address = index_x + index_y * 8; 


    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            wen <= 0;
            data_out <= 0;
            waddr <= 0;
        end else begin
            if(state == CALC && index_x <= 7) begin
               // if(index_x <= 7) begin
                    if(layer_cnt == 0) begin
                        wen <= 0;
                        case (channel_cnt)
                            2'b00: out_buffer [index_x + index_y * 8] <= conv_out[19:6];    //截高12位
                            2'b01: out_buffer [index_x + index_y * 8 + 64] <= conv_out[19:6];
                            2'b10: out_buffer [index_x + index_y * 8 + 128] <= conv_out[19:6];
                        endcase
                    end
                    if(layer_cnt == 1) begin
                        wen <= 0;
                        case (channel_cnt)
                            2'b00: out_buffer [index_x + index_y * 8] <= conv_out[19:6] + out_buffer [index_x + index_y * 8];
                            2'b01: out_buffer [index_x + index_y * 8 + 64] <= conv_out[19:6] + out_buffer [index_x + index_y * 8 + 64];
                            2'b10: out_buffer [index_x + index_y * 8 + 128] <= conv_out[19:6] + out_buffer [index_x + index_y * 8 + 128];
                        endcase
                    end
                    if(layer_cnt == 2) begin
                        wen <= 1;
                        case(channel_cnt)
                            2'b00: begin
                                waddr <= address;
                                data_out <= (temp_out[0] > 0)? temp_out[0] : 0;
                            end
                            2'b01: begin
                                waddr <= address + 64;
                                data_out <= (temp_out[1] > 0)? temp_out[1] : 0;
                            end
                            2'b10: begin
                                waddr <= address + 128;
                                data_out <= (temp_out[2] > 0)? temp_out[2] : 0;
                            end
                        endcase
                    end
            end else begin
                wen <= 0;
                data_out <= 0; 
                waddr <= 0;
            end  
        end
    end
endmodule