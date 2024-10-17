module pre_pool
(
    input       clk,
    input       rst_n,
    input       upstream_busy,
    input [7:0]data_in,

    output reg [13:0] raddr,       //12544 
    output reg        ren,
    output reg [9:0]  waddr,       //784  
    output reg        wen,
    output reg [7:0]  data_out
);
    reg upstream_busy_d1;
    reg [5:0] index_x;           //0-27
    reg [5:0] index_y;            //0-27
    reg [4:0] cnt, cnt_d1;       //0..15


    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            upstream_busy_d1 <= 0;
            cnt_d1 <= 0;
        end else begin
            upstream_busy_d1 <= upstream_busy;
            cnt_d1 <= cnt;
        end
    end 

    always @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            ren <= 0;
            index_x <= 0;
            index_y <= 0;
            cnt <= 0;
        end else begin
            if(!upstream_busy && upstream_busy_d1) begin
                ren <= 1;
            end
            cnt <= ren? cnt + 1: cnt;
            if(cnt == 15) begin
                if(index_x == 27) begin
                    if(index_y != 27) begin
                        index_y <= index_y + 1;
                        index_x <= 0;
                    end else begin
                        ren <= 0;
                        index_x <= 0;
                        index_y <= 0;
                    end
                end else begin
                    index_x <= index_x + 1;
                end
            end
        end
    end

    always @(*) begin
        raddr = (4*index_y + cnt[3:2]) * 112 + 4*index_x + cnt[1:0];
    end

    reg [11:0] sum;

    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            wen <= 0;
            sum <= 0;
            data_out <= 0;
        end else begin
            if(cnt_d1 == 0) begin
                wen <= 0;
                sum <= data_in;
            end     
            else if(cnt_d1 != 15) begin
                sum <= sum + data_in;
            end 
            else begin     
            	wen <= 1; 
                data_out <= sum[11:4];
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            waddr <= 0;
        end else begin
            if(cnt == 15) begin
                waddr <= index_x + index_y * 28 ;
            end
        end
    end



endmodule