`timescale 1ns/ 1ps
module output_layer( 
input clk,
input rst_n,
input [3:0]nub,
input [9:0]raddr,
output reg [7:0]TX
);
//============reg0-9
reg T0[0:24];
reg T1[0:24];
reg T2[0:24];
reg T3[0:24];
reg T4[0:24];
reg T5[0:24];
reg T6[0:24];
reg T7[0:24];
reg T8[0:24];
reg T9[0:24];
 initial begin                                               //这里路径要对  //$readmemh ("<数据文件名>",<数组名>,<起始地址>,<结束地址>)
   $readmemh("./sources/rtl/pixel/pixel0.txt", T0);  
   $readmemh("./sources/rtl/pixel/pixel1.txt", T1);   
   $readmemh("./sources/rtl/pixel/pixel2.txt", T2);   
   $readmemh("./sources/rtl/pixel/pixel3.txt", T3);   
   $readmemh("./sources/rtl/pixel/pixel4.txt", T4);  
   $readmemh("./sources/rtl/pixel/pixel5.txt", T5);   
   $readmemh("./sources/rtl/pixel/pixel6.txt", T6);   
   $readmemh("./sources/rtl/pixel/pixel7.txt", T7);  
   $readmemh("./sources/rtl/pixel/pixel8.txt", T8);   
   $readmemh("./sources/rtl/pixel/pixel9.txt", T9);  
 end
always@(posedge clk or negedge rst_n )begin
    if( rst_n == 1'b0 )begin
        TX <= 8'b0 ;
    end
    else begin
        case( nub )
            0: TX <= {8{T0[raddr]}} ;
            1: TX <= {8{T1[raddr]}} ;
            2: TX <= {8{T2[raddr]}} ;
            3: TX <= {8{T3[raddr]}} ;
            4: TX <= {8{T4[raddr]}} ;
            5: TX <= {8{T5[raddr]}} ;
            6: TX <= {8{T6[raddr]}} ;
            7: TX <= {8{T7[raddr]}} ;
            8: TX <= {8{T8[raddr]}} ;
            9: TX <= {8{T9[raddr]}} ;
            default : TX <= 8'b0 ;
        endcase 
    end 
end

endmodule


