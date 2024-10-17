
`timescale 1ns/ 1ps
//===============
/*
全连接层+比较层，在这一层输出最后的结果，只用一个乘法器
*/
//====================
module fc( 
input clk,
input rst_n,
input layer_ren,   //收到此信号下降沿开始读
input signed [11:0] data_in,  
output  reg[3:0] data_out,              //输出0-9

output reg [5:0]raddr,   //
output reg read_flag  ,
//=========reset
output reg reset_n
);
//=====================
reg [5:0]cnt_48;   //0-47计算weight地址
reg [3:0]cnt_10;  //0-9计算bias地址
reg [1:0]cnt_4; //0-3计算比较时间 
reg layer_ren_fft1,layer_ren_fft2;
reg calc_flag ;
reg compare_flag,compare_flag_fft1;
//===============
reg signed [7:0] weight [0:479];
reg signed [7:0] bias [0:9];
reg signed [19:0] calc_out;
reg signed[11:0] buffer;
reg signed[11:0] max;
reg [3:0]nub;
 initial begin                                               //这里路径要对  //$readmemh ("<数据文件名>",<数组名>,<起始地址>,<结束地址>)
   $readmemh("./sources/rtl/weights/fc_weight.txt", weight);   
   $readmemh("./sources/rtl/weights/fc_bias.txt", bias);
 end


always@(  posedge clk or negedge rst_n   )begin
    if( rst_n == 1'b0 )begin
        cnt_48 <= 0 ;
        cnt_10 <= 0 ; 
        cnt_4 <= 0 ; 
        read_flag <= 0 ;
        calc_out <= 0 ;
        layer_ren_fft1 <= 0 ;
        layer_ren_fft2 <= 0 ;
        raddr <= 0 ; 
        calc_flag <= 0 ;
        compare_flag <= 0 ;
        compare_flag_fft1 <= 0 ;
        max <= 0 ;
        buffer <= 0 ;
        //nub <= 0 ;
        data_out <= 0 ;
    end 
    else begin
        layer_ren_fft1 <= layer_ren ;
        layer_ren_fft2 <= layer_ren_fft1 ;
        compare_flag_fft1 <= compare_flag ;
        begin //=========read_flag置一:layer_ren_fft1下降沿，calc_flac下降沿
            if(  layer_ren_fft1 !=  layer_ren_fft2   &&  layer_ren_fft2 == 1  )
                 read_flag <= 1 ;
            if(  compare_flag_fft1 !=  compare_flag   &&  compare_flag_fft1 == 1 && cnt_10 != 10  )begin
                 read_flag <= 1 ; 
            end
            if(  compare_flag_fft1 !=  compare_flag   &&  compare_flag_fft1 == 1 && cnt_10 == 10  )begin
                 data_out <= nub ; 
                 cnt_10 <= 0 ; 
            end
            if( raddr == 47 ) begin ///读了47个数读关闭
                  read_flag <= 0 ; 
            end
            if( cnt_48 == 47 ) begin ///计算了47个calc关闭
                  calc_flag <= 0 ;
                  compare_flag <= 1 ; 
            end
            if( cnt_4 == 3 ) begin ///计算了3个compare关闭
                  calc_out <= 0 ;
                  compare_flag <= 0 ;
            end
        end
        
        if(  read_flag == 1  )begin //======read_flag == 1时========计算raddr
            calc_flag <= 1 ;
            begin
                if( raddr == 47 )begin 
                    raddr <= 0 ;
                end
                else begin
                    raddr <= raddr + 1 ; 
                end
            end
        end//=====================计算raddr完成
        
        if( calc_flag == 1 )begin//======calc_flag == 1时========计算成累加
            calc_out <= calc_out + data_in * weight[ cnt_48 + 48 * cnt_10 ] ;
            if( cnt_48 == 47 )begin
                cnt_48 <= 0 ;
                cnt_10 <= cnt_10 + 1 ;
            end
            else
                cnt_48 <= cnt_48 + 1 ;
        end//计算成累加完成============
        
        if( compare_flag == 1 )begin//======比较大小
            if( cnt_4 == 0 )begin
                calc_out <= calc_out +  bias[ cnt_10 - 1 ] ;
            end
            buffer<= calc_out[18:7] ;
            if( cnt_10 == 1 )begin
                max <= calc_out[18:7] ;
            end
            if( max < buffer )begin
                max <= buffer ;
                nub<=  cnt_10 - 1  ;
            end
            if( cnt_4 == 3 )begin
                cnt_4 <= 0 ;
            end
            else
                cnt_4 <= cnt_4 + 1 ;
        end
        
    end
end

 //reset_n
always@(  posedge clk or negedge rst_n   )begin
    if( rst_n == 1'b0 )begin
        reset_n <= 1 ;
     end
     else if ( compare_flag_fft1 !=  compare_flag   &&  compare_flag_fft1 == 1 && cnt_10 == 10)
      reset_n <= 0 ;
 end
 

endmodule
