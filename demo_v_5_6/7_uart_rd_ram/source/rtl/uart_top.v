// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// 
// Author: Anlogic
// 
// Description:
//
//   ʵ�ֹ��ܣ�
//   �ϵ��ʼ��RAM��д�������ַ��Ӧ�ĵ�������,�Է�����ԣ�
//   д����ɵ���LED[0]����ָʾ����ʱRAM�д洢256��8bit���ݣ�
//   �ȴ�UART���յ�һ���ֽ�����;�Դ�������Ϊ��ַ��
//   �����õ�ַ��Ӧ������;Ȼ��ͨ��UART���ͳ�ȥ��
// 
// Web: www.anlogic.com
// --------------------------------------------------------------------

module uart_top
#(
    parameter BPS_SET      =   96,  //������9600
    parameter CLK_PERIORD  =   40   //ʱ������40ns(25MHz)
)
(
	input 	wire	ext_clk_25m,	//�ⲿ����25MHzʱ���ź�
	input 	wire	ext_rst_n,		//�ⲿ���븴λ�źţ��͵�ƽ��Ч
	input 	wire	uart_rx,		//UART���������ź�
	output 	wire	uart_tx,		//UART���������ź�
	output 	wire	led
);													

//-------------------------------------
wire	clk_25m;	//PLL���25MHzʱ��
wire	clk_50m;	//PLL���50MHzʱ��
wire	clk_100m;	//PLL���100MHzʱ��
wire	sys_rst_n;	//PLL�����locked�źţ���ΪFPGA�ڲ��ĸ�λ�źţ��͵�ƽ��λ���ߵ�ƽ��������

//-------------------------------------
wire bps_start1,bps_start2;	//���յ����ݺ󣬲�����ʱ�������ź���λ
wire clk_bps1,clk_bps2;     //clk_bps_r�ߵ�ƽΪ��������λ���м������,ͬʱҲ��Ϊ�������ݵ����ݸı�� 
wire [7:0] rx_data;         //�������ݼĴ���������ֱ����һ����������
wire rx_int;                //���������ж��ź�,���յ������ڼ�ʼ��Ϊ�ߵ�ƽ
//-------------------------------------
//Double RAM 
wire 			ram_rw_ce;  //RAM��дʹ�ܣ�0-->д��1--��
wire	[7:0]	ram_output;

//-------------------------------------
//PLL����	
pll_test u_pll_test
(
	.refclk		    (ext_clk_25m	),
	.reset		    (~ext_rst_n		),
	.extlock	    (sys_rst_n		),
	.clk0_out	    (clk_25m		),
	.clk1_out	    (clk_50m		),
	.clk2_out	    (clk_100m		)
);
		
//-------------------------------------
//UART����
//-------------------------------------
	//UART�����źŲ���������
speed_setting
#(
	.BPS_SET	    (BPS_SET	    ),
	.CLK_PERIORD	(CLK_PERIORD    )
)
speed_rx

(	
    .clk            (clk_25m        ),	//������ѡ��ģ��
    .rst_n          (sys_rst_n      ),
    .bps_start      (bps_start1     ),
    .clk_bps        (clk_bps1       )
);

	//UART�������ݴ���
my_uart_rx	my_uart_rx
(		
	.clk            (clk_25m        ),	//��������ģ��
	.rst_n          (sys_rst_n      ),
	.uart_rx        (uart_rx        ),
	.rx_data        (rx_data        ),
	.rx_int         (rx_int         ),
	.clk_bps        (clk_bps1       ),
	.bps_start      (bps_start1     )
);
		
//-------------------------------------
//RAM��дʱ�����ģ��
//-------------------------------------
ram_rw_control u_ram_rw_control
(
	.clk_25m        (clk_25m        ),		
	.sys_rst_n   	(sys_rst_n      ),
	.rx_int			(rx_int         ),
	.rx_data       	(rx_data        ),
	.ram_rw_ce     	(ram_rw_ce      ),
	.ram_output    	(ram_output     ),
	.led		    (led            )	
);
//-------------------------------------
//UART����
//-------------------------------------
	//UART�����źŲ���������													
speed_setting
#(
	.BPS_SET	    (BPS_SET	    ),
	.CLK_PERIORD	(CLK_PERIORD	) 
)
speed_tx
(	
	.clk            (clk_25m        ),	//������ѡ��ģ��
	.rst_n          (sys_rst_n      ),
	.bps_start      (bps_start2     ),
	.clk_bps        (clk_bps2       )
);
						
	//UART�������ݴ���
my_uart_tx	my_uart_tx
(		
	.clk            (clk_25m        ),	//��������ģ��
	.rst_n          (sys_rst_n      ),
	.rx_data        (ram_output     ),
	.rx_int         (ram_rw_ce      ),
	.uart_tx        (uart_tx        ),
	.clk_bps        (clk_bps2       ),
	.bps_start      (bps_start2     )
);


endmodule

