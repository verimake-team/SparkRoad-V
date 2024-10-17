`timescale 1ns/1ps

module pool2
(
    input       clk,
    input       rst_n,
    input       upstream_busy,
    input [11:0]data_in,

    output reg [7:0] raddr,     //8*8*3 =192
    output reg        ren,
    output reg [5:0]  waddr,       //4*4*3 =48
    output reg        wen,
    output reg [11:0] data_out
);
    reg upstream_busy_d1;
    reg [3:0] index_x;           //0-3
    reg [5:0] index_y;            //0-11
    reg [1:0] cnt_4, cnt_4_d1;       //0..3


    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            upstream_busy_d1 <= 0;
            cnt_4_d1 <= 0;
        end else begin
            upstream_busy_d1 <= upstream_busy;
            cnt_4_d1 <= cnt_4;
        end
    end 

    always @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            ren <= 0;
            index_x <= 0;
            index_y <= 0;
            cnt_4 <= 0;
        end else begin
            if(!upstream_busy && upstream_busy_d1) begin
                ren <= 1;
            end
            cnt_4 <= ren? cnt_4 + 1: cnt_4;
            if(cnt_4 == 3) begin
                if(index_x == 3) begin
                    if(index_y != 11) begin
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
        raddr = (2*index_y + cnt_4[1]) * 8 + 2*index_x + cnt_4[0];
    end

    reg [11:0] max;

    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            wen <= 0;
            max <= 0;
            data_out <= 0;
        end else begin
            if(cnt_4_d1 == 0) begin
                wen <= 0;
                max <= data_in;
            end     
            else if(cnt_4_d1 != 3) begin
                if(data_in > max) begin
                    max <= data_in;
                end
            end 
            else begin      //cnt_4_d1 == 3
                wen <= 1;
                if(data_in > max) begin
                    data_out <= data_in;
                end else begin
                    data_out <= max;
                end        
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            waddr <= 0;
        end else begin
            if(cnt_4 == 3) begin
                waddr <= index_x + index_y * 4;
            end
        end
    end



endmodule