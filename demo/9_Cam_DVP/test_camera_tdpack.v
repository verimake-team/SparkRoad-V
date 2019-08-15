// Verilog netlist created by TD v4.6.12906
// Tue Jul 30 09:10:07 2019

`timescale 1ns / 1ps
module test_camera  // sources/rtl/test_camera.v(14)
  (
  cam_data,
  cam_href,
  cam_pclk,
  cam_vsync,
  clk_24m,
  rst_n,
  cam_pwdn,
  cam_rst,
  cam_soic,
  cam_xclk,
  vga_b,
  vga_clk,
  vga_g,
  vga_hsync,
  vga_r,
  vga_vsync,
  cam_soid
  );

  input [7:0] cam_data;  // sources/rtl/test_camera.v(27)
  input cam_href;  // sources/rtl/test_camera.v(21)
  input cam_pclk;  // sources/rtl/test_camera.v(19)
  input cam_vsync;  // sources/rtl/test_camera.v(22)
  input clk_24m;  // sources/rtl/test_camera.v(16)
  input rst_n;  // sources/rtl/test_camera.v(17)
  output cam_pwdn;  // sources/rtl/test_camera.v(23)
  output cam_rst;  // sources/rtl/test_camera.v(24)
  output cam_soic;  // sources/rtl/test_camera.v(25)
  output cam_xclk;  // sources/rtl/test_camera.v(20)
  output [7:0] vga_b;  // sources/rtl/test_camera.v(31)
  output vga_clk;  // sources/rtl/test_camera.v(32)
  output [7:0] vga_g;  // sources/rtl/test_camera.v(30)
  output vga_hsync;  // sources/rtl/test_camera.v(33)
  output [7:0] vga_r;  // sources/rtl/test_camera.v(29)
  output vga_vsync;  // sources/rtl/test_camera.v(34)
  inout cam_soid;  // sources/rtl/test_camera.v(26)

  wire [7:0] cam_data_pad;  // sources/rtl/test_camera.v(27)
  wire [19:0] camera_addr;  // sources/rtl/test_camera.v(45)
  wire [15:0] camera_wrdat;  // sources/rtl/test_camera.v(44)
  wire [15:0] \u_camera_reader/current_pixel ;  // sources/rtl/camera_reader.v(37)
  wire [19:0] \u_camera_reader/n8 ;
  wire [19:0] \u_camera_reader/n9 ;
  wire [19:0] \u_camera_reader/pixel_counter ;  // sources/rtl/camera_reader.v(32)
  wire [7:0] \u_camera_reader/subpixel ;  // sources/rtl/camera_reader.v(36)
  wire [7:0] vga_b_pad;  // sources/rtl/test_camera.v(31)
  wire [7:0] vga_g_pad;  // sources/rtl/test_camera.v(30)
  wire [7:0] vga_r_pad;  // sources/rtl/test_camera.v(29)
  wire [15:0] vga_rdaddr;  // sources/rtl/test_camera.v(59)
  wire [0:6] vga_rdaddr_piped;
  wire [0:6] vga_rdaddr_piped_piped;
  wire _al_u430_o;
  wire _al_u440_o;
  wire _al_u487_o;
  wire _al_u488_o;
  wire _al_u489_o;
  wire _al_u491_o;
  wire _al_u492_o;
  wire _al_u493_o;
  wire _al_u494_o;
  wire _al_u495_o;
  wire _al_u496_o;
  wire _al_u497_o;
  wire _al_u498_o;
  wire _al_u499_o;
  wire _al_u500_o;
  wire _al_u501_o;
  wire _al_u502_o;
  wire _al_u503_o;
  wire _al_u504_o;
  wire _al_u505_o;
  wire _al_u506_o;
  wire _al_u507_o;
  wire _al_u508_o;
  wire _al_u509_o;
  wire _al_u510_o;
  wire _al_u511_o;
  wire _al_u512_o;
  wire _al_u513_o;
  wire _al_u514_o;
  wire _al_u515_o;
  wire _al_u516_o;
  wire _al_u517_o;
  wire _al_u519_o;
  wire _al_u520_o;
  wire _al_u521_o;
  wire _al_u522_o;
  wire _al_u523_o;
  wire _al_u524_o;
  wire _al_u525_o;
  wire _al_u526_o;
  wire _al_u527_o;
  wire _al_u528_o;
  wire _al_u529_o;
  wire _al_u530_o;
  wire _al_u531_o;
  wire _al_u532_o;
  wire _al_u533_o;
  wire _al_u534_o;
  wire _al_u535_o;
  wire _al_u536_o;
  wire _al_u537_o;
  wire _al_u538_o;
  wire _al_u539_o;
  wire _al_u540_o;
  wire _al_u541_o;
  wire _al_u542_o;
  wire _al_u543_o;
  wire _al_u544_o;
  wire _al_u545_o;
  wire _al_u547_o;
  wire _al_u548_o;
  wire _al_u549_o;
  wire _al_u550_o;
  wire _al_u551_o;
  wire _al_u552_o;
  wire _al_u553_o;
  wire _al_u554_o;
  wire _al_u555_o;
  wire _al_u556_o;
  wire _al_u557_o;
  wire _al_u558_o;
  wire _al_u559_o;
  wire _al_u560_o;
  wire _al_u561_o;
  wire _al_u562_o;
  wire _al_u563_o;
  wire _al_u564_o;
  wire _al_u565_o;
  wire _al_u566_o;
  wire _al_u567_o;
  wire _al_u568_o;
  wire _al_u569_o;
  wire _al_u570_o;
  wire _al_u571_o;
  wire _al_u572_o;
  wire _al_u573_o;
  wire _al_u575_o;
  wire _al_u576_o;
  wire _al_u577_o;
  wire _al_u578_o;
  wire _al_u579_o;
  wire _al_u580_o;
  wire _al_u581_o;
  wire _al_u582_o;
  wire _al_u583_o;
  wire _al_u584_o;
  wire _al_u585_o;
  wire _al_u586_o;
  wire _al_u587_o;
  wire _al_u588_o;
  wire _al_u589_o;
  wire _al_u590_o;
  wire _al_u591_o;
  wire _al_u592_o;
  wire _al_u593_o;
  wire _al_u594_o;
  wire _al_u595_o;
  wire _al_u596_o;
  wire _al_u597_o;
  wire _al_u598_o;
  wire _al_u599_o;
  wire _al_u600_o;
  wire _al_u601_o;
  wire _al_u603_o;
  wire _al_u604_o;
  wire _al_u605_o;
  wire _al_u606_o;
  wire _al_u607_o;
  wire _al_u608_o;
  wire _al_u609_o;
  wire _al_u610_o;
  wire _al_u611_o;
  wire _al_u612_o;
  wire _al_u613_o;
  wire _al_u614_o;
  wire _al_u615_o;
  wire _al_u616_o;
  wire _al_u617_o;
  wire _al_u618_o;
  wire _al_u619_o;
  wire _al_u620_o;
  wire _al_u621_o;
  wire _al_u622_o;
  wire _al_u623_o;
  wire _al_u624_o;
  wire _al_u625_o;
  wire _al_u626_o;
  wire _al_u627_o;
  wire _al_u628_o;
  wire _al_u629_o;
  wire _al_u631_o;
  wire _al_u632_o;
  wire _al_u633_o;
  wire _al_u634_o;
  wire _al_u635_o;
  wire _al_u636_o;
  wire _al_u637_o;
  wire _al_u638_o;
  wire _al_u639_o;
  wire _al_u640_o;
  wire _al_u641_o;
  wire _al_u642_o;
  wire _al_u643_o;
  wire _al_u644_o;
  wire _al_u645_o;
  wire _al_u646_o;
  wire _al_u647_o;
  wire _al_u648_o;
  wire _al_u649_o;
  wire _al_u650_o;
  wire _al_u651_o;
  wire _al_u652_o;
  wire _al_u653_o;
  wire _al_u654_o;
  wire _al_u655_o;
  wire _al_u656_o;
  wire _al_u657_o;
  wire _al_u659_o;
  wire _al_u660_o;
  wire _al_u661_o;
  wire _al_u662_o;
  wire _al_u663_o;
  wire _al_u664_o;
  wire _al_u665_o;
  wire _al_u666_o;
  wire _al_u667_o;
  wire _al_u668_o;
  wire _al_u669_o;
  wire _al_u670_o;
  wire _al_u671_o;
  wire _al_u672_o;
  wire _al_u673_o;
  wire _al_u674_o;
  wire _al_u675_o;
  wire _al_u676_o;
  wire _al_u677_o;
  wire _al_u678_o;
  wire _al_u679_o;
  wire _al_u680_o;
  wire _al_u681_o;
  wire _al_u682_o;
  wire _al_u683_o;
  wire _al_u684_o;
  wire _al_u685_o;
  wire _al_u687_o;
  wire _al_u688_o;
  wire _al_u689_o;
  wire _al_u691_o;
  wire _al_u692_o;
  wire _al_u693_o;
  wire _al_u695_o;
  wire _al_u696_o;
  wire _al_u697_o;
  wire _al_u699_o;
  wire _al_u700_o;
  wire _al_u701_o;
  wire _al_u703_o;
  wire _al_u704_o;
  wire _al_u705_o;
  wire _al_u707_o;
  wire _al_u708_o;
  wire _al_u709_o;
  wire _al_u711_o;
  wire _al_u712_o;
  wire _al_u713_o;
  wire _al_u714_o;
  wire _al_u715_o;
  wire _al_u716_o;
  wire _al_u717_o;
  wire _al_u718_o;
  wire _al_u719_o;
  wire _al_u720_o;
  wire _al_u721_o;
  wire _al_u722_o;
  wire _al_u723_o;
  wire _al_u724_o;
  wire _al_u725_o;
  wire _al_u726_o;
  wire _al_u727_o;
  wire _al_u728_o;
  wire _al_u729_o;
  wire _al_u730_o;
  wire _al_u731_o;
  wire _al_u732_o;
  wire _al_u733_o;
  wire _al_u734_o;
  wire _al_u735_o;
  wire _al_u736_o;
  wire _al_u737_o;
  wire _al_u739_o;
  wire _al_u740_o;
  wire _al_u741_o;
  wire _al_u742_o;
  wire _al_u743_o;
  wire _al_u744_o;
  wire _al_u745_o;
  wire _al_u746_o;
  wire _al_u747_o;
  wire _al_u748_o;
  wire _al_u749_o;
  wire _al_u750_o;
  wire _al_u751_o;
  wire _al_u752_o;
  wire _al_u753_o;
  wire _al_u754_o;
  wire _al_u755_o;
  wire _al_u756_o;
  wire _al_u757_o;
  wire _al_u758_o;
  wire _al_u759_o;
  wire _al_u760_o;
  wire _al_u761_o;
  wire _al_u762_o;
  wire _al_u763_o;
  wire _al_u764_o;
  wire _al_u765_o;
  wire \and_Ncamera_addr[11]_o_and_camera_wrreq ;
  wire \and_Ncamera_addr[12]_o ;
  wire \and_Ncamera_addr[12]_o_al_n177 ;
  wire \and_Ncamera_addr[12]_o_al_n208 ;
  wire \and_Ncamera_addr[12]_o_al_n240 ;
  wire \and_Nvga_rdaddr[11]__o_and_vga_rden ;
  wire \and_Nvga_rdaddr[12]__o ;
  wire \and_Nvga_rdaddr[12]__o_al_n180 ;
  wire \and_Nvga_rdaddr[12]__o_al_n211 ;
  wire \and_Nvga_rdaddr[12]__o_al_n243 ;
  wire \and_camera_addr[12]__o ;
  wire \and_camera_addr[12]__o_al_n193 ;
  wire \and_camera_addr[12]__o_al_n224 ;
  wire \and_camera_addr[12]__o_al_n256 ;
  wire \and_vga_rdaddr[12]_N_o ;
  wire \and_vga_rdaddr[12]_N_o_al_n227 ;
  wire \and_vga_rdaddr[12]_v_o ;
  wire \and_vga_rdaddr[12]_v_o_al_n259 ;
  wire cam_pclk_pad;  // sources/rtl/test_camera.v(19)
  wire cam_rst_pad;  // sources/rtl/test_camera.v(24)
  wire cam_rst_pad_neg;
  wire cam_soid_pad;  // sources/rtl/test_camera.v(26)
  wire cam_vsync_pad;  // sources/rtl/test_camera.v(22)
  wire cam_xclk_pad;  // sources/rtl/test_camera.v(20)
  wire camera_wrreq;  // sources/rtl/test_camera.v(42)
  wire clk_24m_pad;  // sources/rtl/test_camera.v(16)
  wire clk_cam;  // sources/rtl/test_camera.v(39)
  wire clk_lcd;  // sources/rtl/test_camera.v(38)
  wire clk_sccb;  // sources/rtl/test_camera.v(40)
  wire sda;  // sources/rtl/test_camera.v(50)
  wire sda_oe;  // sources/rtl/test_camera.v(49)
  wire \u_camera_reader/add0/c11 ;
  wire \u_camera_reader/add0/c15 ;
  wire \u_camera_reader/add0/c19 ;
  wire \u_camera_reader/add0/c3 ;
  wire \u_camera_reader/add0/c7 ;
  wire \u_camera_reader/add1/c11 ;
  wire \u_camera_reader/add1/c15 ;
  wire \u_camera_reader/add1/c3 ;
  wire \u_camera_reader/add1/c7 ;
  wire \u_camera_reader/lt0_c1 ;
  wire \u_camera_reader/lt0_c11 ;
  wire \u_camera_reader/lt0_c13 ;
  wire \u_camera_reader/lt0_c15 ;
  wire \u_camera_reader/lt0_c17 ;
  wire \u_camera_reader/lt0_c19 ;
  wire \u_camera_reader/lt0_c3 ;
  wire \u_camera_reader/lt0_c5 ;
  wire \u_camera_reader/lt0_c7 ;
  wire \u_camera_reader/lt0_c9 ;
  wire \u_camera_reader/mux13_b0_sel_is_2_o ;
  wire \u_camera_reader/mux14_b0_sel_is_2_o ;
  wire \u_camera_reader/mux5_b0_sel_is_3_o ;
  wire \u_camera_reader/mux6_b0_sel_is_1_o ;
  wire \u_camera_reader/mux8_b0_sel_is_0_o ;
  wire \u_camera_reader/n2 ;
  wire \u_camera_reader/n27 ;
  wire \u_camera_reader/vsync_passed ;  // sources/rtl/camera_reader.v(34)
  wire \u_camera_reader/wrclk1 ;  // sources/rtl/camera_reader.v(38)
  wire \u_camera_reader/write_pixel ;  // sources/rtl/camera_reader.v(35)
  wire \u_img/inst_dob_i0_000 ;
  wire \u_img/inst_dob_i0_001 ;
  wire \u_img/inst_dob_i0_002 ;
  wire \u_img/inst_dob_i0_003 ;
  wire \u_img/inst_dob_i0_004 ;
  wire \u_img/inst_dob_i0_005 ;
  wire \u_img/inst_dob_i0_006 ;
  wire \u_img/inst_dob_i0_007 ;
  wire \u_img/inst_dob_i0_008 ;
  wire \u_img/inst_dob_i0_009 ;
  wire \u_img/inst_dob_i0_010 ;
  wire \u_img/inst_dob_i0_011 ;
  wire \u_img/inst_dob_i0_012 ;
  wire \u_img/inst_dob_i0_013 ;
  wire \u_img/inst_dob_i0_014 ;
  wire \u_img/inst_dob_i0_015 ;
  wire \u_img/inst_dob_i10_000 ;
  wire \u_img/inst_dob_i10_001 ;
  wire \u_img/inst_dob_i10_002 ;
  wire \u_img/inst_dob_i10_003 ;
  wire \u_img/inst_dob_i10_004 ;
  wire \u_img/inst_dob_i10_005 ;
  wire \u_img/inst_dob_i10_006 ;
  wire \u_img/inst_dob_i10_007 ;
  wire \u_img/inst_dob_i10_008 ;
  wire \u_img/inst_dob_i12_000 ;
  wire \u_img/inst_dob_i12_001 ;
  wire \u_img/inst_dob_i12_002 ;
  wire \u_img/inst_dob_i12_003 ;
  wire \u_img/inst_dob_i12_004 ;
  wire \u_img/inst_dob_i12_005 ;
  wire \u_img/inst_dob_i12_006 ;
  wire \u_img/inst_dob_i12_007 ;
  wire \u_img/inst_dob_i12_008 ;
  wire \u_img/inst_dob_i14_000 ;
  wire \u_img/inst_dob_i14_001 ;
  wire \u_img/inst_dob_i14_002 ;
  wire \u_img/inst_dob_i14_003 ;
  wire \u_img/inst_dob_i14_004 ;
  wire \u_img/inst_dob_i14_005 ;
  wire \u_img/inst_dob_i14_006 ;
  wire \u_img/inst_dob_i14_007 ;
  wire \u_img/inst_dob_i14_008 ;
  wire \u_img/inst_dob_i16_000 ;
  wire \u_img/inst_dob_i16_001 ;
  wire \u_img/inst_dob_i16_002 ;
  wire \u_img/inst_dob_i16_003 ;
  wire \u_img/inst_dob_i16_004 ;
  wire \u_img/inst_dob_i16_005 ;
  wire \u_img/inst_dob_i16_006 ;
  wire \u_img/inst_dob_i16_007 ;
  wire \u_img/inst_dob_i16_008 ;
  wire \u_img/inst_dob_i16_009 ;
  wire \u_img/inst_dob_i16_010 ;
  wire \u_img/inst_dob_i16_011 ;
  wire \u_img/inst_dob_i16_012 ;
  wire \u_img/inst_dob_i16_013 ;
  wire \u_img/inst_dob_i16_014 ;
  wire \u_img/inst_dob_i16_015 ;
  wire \u_img/inst_dob_i18_000 ;
  wire \u_img/inst_dob_i18_001 ;
  wire \u_img/inst_dob_i18_002 ;
  wire \u_img/inst_dob_i18_003 ;
  wire \u_img/inst_dob_i18_004 ;
  wire \u_img/inst_dob_i18_005 ;
  wire \u_img/inst_dob_i18_006 ;
  wire \u_img/inst_dob_i18_007 ;
  wire \u_img/inst_dob_i18_008 ;
  wire \u_img/inst_dob_i20_000 ;
  wire \u_img/inst_dob_i20_001 ;
  wire \u_img/inst_dob_i20_002 ;
  wire \u_img/inst_dob_i20_003 ;
  wire \u_img/inst_dob_i20_004 ;
  wire \u_img/inst_dob_i20_005 ;
  wire \u_img/inst_dob_i20_006 ;
  wire \u_img/inst_dob_i20_007 ;
  wire \u_img/inst_dob_i20_008 ;
  wire \u_img/inst_dob_i22_000 ;
  wire \u_img/inst_dob_i22_001 ;
  wire \u_img/inst_dob_i22_002 ;
  wire \u_img/inst_dob_i22_003 ;
  wire \u_img/inst_dob_i22_004 ;
  wire \u_img/inst_dob_i22_005 ;
  wire \u_img/inst_dob_i22_006 ;
  wire \u_img/inst_dob_i22_007 ;
  wire \u_img/inst_dob_i22_008 ;
  wire \u_img/inst_dob_i24_000 ;
  wire \u_img/inst_dob_i24_001 ;
  wire \u_img/inst_dob_i24_002 ;
  wire \u_img/inst_dob_i24_003 ;
  wire \u_img/inst_dob_i24_004 ;
  wire \u_img/inst_dob_i24_005 ;
  wire \u_img/inst_dob_i24_006 ;
  wire \u_img/inst_dob_i24_007 ;
  wire \u_img/inst_dob_i24_008 ;
  wire \u_img/inst_dob_i26_000 ;
  wire \u_img/inst_dob_i26_001 ;
  wire \u_img/inst_dob_i26_002 ;
  wire \u_img/inst_dob_i26_003 ;
  wire \u_img/inst_dob_i26_004 ;
  wire \u_img/inst_dob_i26_005 ;
  wire \u_img/inst_dob_i26_006 ;
  wire \u_img/inst_dob_i26_007 ;
  wire \u_img/inst_dob_i26_008 ;
  wire \u_img/inst_dob_i28_000 ;
  wire \u_img/inst_dob_i28_001 ;
  wire \u_img/inst_dob_i28_002 ;
  wire \u_img/inst_dob_i28_003 ;
  wire \u_img/inst_dob_i28_004 ;
  wire \u_img/inst_dob_i28_005 ;
  wire \u_img/inst_dob_i28_006 ;
  wire \u_img/inst_dob_i28_007 ;
  wire \u_img/inst_dob_i28_008 ;
  wire \u_img/inst_dob_i2_000 ;
  wire \u_img/inst_dob_i2_001 ;
  wire \u_img/inst_dob_i2_002 ;
  wire \u_img/inst_dob_i2_003 ;
  wire \u_img/inst_dob_i2_004 ;
  wire \u_img/inst_dob_i2_005 ;
  wire \u_img/inst_dob_i2_006 ;
  wire \u_img/inst_dob_i2_007 ;
  wire \u_img/inst_dob_i2_008 ;
  wire \u_img/inst_dob_i30_000 ;
  wire \u_img/inst_dob_i30_001 ;
  wire \u_img/inst_dob_i30_002 ;
  wire \u_img/inst_dob_i30_003 ;
  wire \u_img/inst_dob_i30_004 ;
  wire \u_img/inst_dob_i30_005 ;
  wire \u_img/inst_dob_i30_006 ;
  wire \u_img/inst_dob_i30_007 ;
  wire \u_img/inst_dob_i30_008 ;
  wire \u_img/inst_dob_i32_000 ;
  wire \u_img/inst_dob_i32_001 ;
  wire \u_img/inst_dob_i32_002 ;
  wire \u_img/inst_dob_i32_003 ;
  wire \u_img/inst_dob_i32_004 ;
  wire \u_img/inst_dob_i32_005 ;
  wire \u_img/inst_dob_i32_006 ;
  wire \u_img/inst_dob_i32_007 ;
  wire \u_img/inst_dob_i32_008 ;
  wire \u_img/inst_dob_i32_009 ;
  wire \u_img/inst_dob_i32_010 ;
  wire \u_img/inst_dob_i32_011 ;
  wire \u_img/inst_dob_i32_012 ;
  wire \u_img/inst_dob_i32_013 ;
  wire \u_img/inst_dob_i32_014 ;
  wire \u_img/inst_dob_i32_015 ;
  wire \u_img/inst_dob_i34_000 ;
  wire \u_img/inst_dob_i34_001 ;
  wire \u_img/inst_dob_i34_002 ;
  wire \u_img/inst_dob_i34_003 ;
  wire \u_img/inst_dob_i34_004 ;
  wire \u_img/inst_dob_i34_005 ;
  wire \u_img/inst_dob_i34_006 ;
  wire \u_img/inst_dob_i34_007 ;
  wire \u_img/inst_dob_i34_008 ;
  wire \u_img/inst_dob_i36_000 ;
  wire \u_img/inst_dob_i36_001 ;
  wire \u_img/inst_dob_i36_002 ;
  wire \u_img/inst_dob_i36_003 ;
  wire \u_img/inst_dob_i36_004 ;
  wire \u_img/inst_dob_i36_005 ;
  wire \u_img/inst_dob_i36_006 ;
  wire \u_img/inst_dob_i36_007 ;
  wire \u_img/inst_dob_i36_008 ;
  wire \u_img/inst_dob_i38_000 ;
  wire \u_img/inst_dob_i38_001 ;
  wire \u_img/inst_dob_i38_002 ;
  wire \u_img/inst_dob_i38_003 ;
  wire \u_img/inst_dob_i38_004 ;
  wire \u_img/inst_dob_i38_005 ;
  wire \u_img/inst_dob_i38_006 ;
  wire \u_img/inst_dob_i38_007 ;
  wire \u_img/inst_dob_i38_008 ;
  wire \u_img/inst_dob_i40_000 ;
  wire \u_img/inst_dob_i40_001 ;
  wire \u_img/inst_dob_i40_002 ;
  wire \u_img/inst_dob_i40_003 ;
  wire \u_img/inst_dob_i40_004 ;
  wire \u_img/inst_dob_i40_005 ;
  wire \u_img/inst_dob_i40_006 ;
  wire \u_img/inst_dob_i40_007 ;
  wire \u_img/inst_dob_i40_008 ;
  wire \u_img/inst_dob_i42_000 ;
  wire \u_img/inst_dob_i42_001 ;
  wire \u_img/inst_dob_i42_002 ;
  wire \u_img/inst_dob_i42_003 ;
  wire \u_img/inst_dob_i42_004 ;
  wire \u_img/inst_dob_i42_005 ;
  wire \u_img/inst_dob_i42_006 ;
  wire \u_img/inst_dob_i42_007 ;
  wire \u_img/inst_dob_i42_008 ;
  wire \u_img/inst_dob_i44_000 ;
  wire \u_img/inst_dob_i44_001 ;
  wire \u_img/inst_dob_i44_002 ;
  wire \u_img/inst_dob_i44_003 ;
  wire \u_img/inst_dob_i44_004 ;
  wire \u_img/inst_dob_i44_005 ;
  wire \u_img/inst_dob_i44_006 ;
  wire \u_img/inst_dob_i44_007 ;
  wire \u_img/inst_dob_i44_008 ;
  wire \u_img/inst_dob_i46_000 ;
  wire \u_img/inst_dob_i46_001 ;
  wire \u_img/inst_dob_i46_002 ;
  wire \u_img/inst_dob_i46_003 ;
  wire \u_img/inst_dob_i46_004 ;
  wire \u_img/inst_dob_i46_005 ;
  wire \u_img/inst_dob_i46_006 ;
  wire \u_img/inst_dob_i46_007 ;
  wire \u_img/inst_dob_i46_008 ;
  wire \u_img/inst_dob_i48_000 ;
  wire \u_img/inst_dob_i48_001 ;
  wire \u_img/inst_dob_i48_002 ;
  wire \u_img/inst_dob_i48_003 ;
  wire \u_img/inst_dob_i48_004 ;
  wire \u_img/inst_dob_i48_005 ;
  wire \u_img/inst_dob_i48_006 ;
  wire \u_img/inst_dob_i48_007 ;
  wire \u_img/inst_dob_i48_008 ;
  wire \u_img/inst_dob_i48_009 ;
  wire \u_img/inst_dob_i48_010 ;
  wire \u_img/inst_dob_i48_011 ;
  wire \u_img/inst_dob_i48_012 ;
  wire \u_img/inst_dob_i48_013 ;
  wire \u_img/inst_dob_i48_014 ;
  wire \u_img/inst_dob_i48_015 ;
  wire \u_img/inst_dob_i4_000 ;
  wire \u_img/inst_dob_i4_001 ;
  wire \u_img/inst_dob_i4_002 ;
  wire \u_img/inst_dob_i4_003 ;
  wire \u_img/inst_dob_i4_004 ;
  wire \u_img/inst_dob_i4_005 ;
  wire \u_img/inst_dob_i4_006 ;
  wire \u_img/inst_dob_i4_007 ;
  wire \u_img/inst_dob_i4_008 ;
  wire \u_img/inst_dob_i50_000 ;
  wire \u_img/inst_dob_i50_001 ;
  wire \u_img/inst_dob_i50_002 ;
  wire \u_img/inst_dob_i50_003 ;
  wire \u_img/inst_dob_i50_004 ;
  wire \u_img/inst_dob_i50_005 ;
  wire \u_img/inst_dob_i50_006 ;
  wire \u_img/inst_dob_i50_007 ;
  wire \u_img/inst_dob_i50_008 ;
  wire \u_img/inst_dob_i52_000 ;
  wire \u_img/inst_dob_i52_001 ;
  wire \u_img/inst_dob_i52_002 ;
  wire \u_img/inst_dob_i52_003 ;
  wire \u_img/inst_dob_i52_004 ;
  wire \u_img/inst_dob_i52_005 ;
  wire \u_img/inst_dob_i52_006 ;
  wire \u_img/inst_dob_i52_007 ;
  wire \u_img/inst_dob_i52_008 ;
  wire \u_img/inst_dob_i54_000 ;
  wire \u_img/inst_dob_i54_001 ;
  wire \u_img/inst_dob_i54_002 ;
  wire \u_img/inst_dob_i54_003 ;
  wire \u_img/inst_dob_i54_004 ;
  wire \u_img/inst_dob_i54_005 ;
  wire \u_img/inst_dob_i54_006 ;
  wire \u_img/inst_dob_i54_007 ;
  wire \u_img/inst_dob_i54_008 ;
  wire \u_img/inst_dob_i56_000 ;
  wire \u_img/inst_dob_i56_001 ;
  wire \u_img/inst_dob_i56_002 ;
  wire \u_img/inst_dob_i56_003 ;
  wire \u_img/inst_dob_i56_004 ;
  wire \u_img/inst_dob_i56_005 ;
  wire \u_img/inst_dob_i56_006 ;
  wire \u_img/inst_dob_i56_007 ;
  wire \u_img/inst_dob_i56_008 ;
  wire \u_img/inst_dob_i58_000 ;
  wire \u_img/inst_dob_i58_001 ;
  wire \u_img/inst_dob_i58_002 ;
  wire \u_img/inst_dob_i58_003 ;
  wire \u_img/inst_dob_i58_004 ;
  wire \u_img/inst_dob_i58_005 ;
  wire \u_img/inst_dob_i58_006 ;
  wire \u_img/inst_dob_i58_007 ;
  wire \u_img/inst_dob_i58_008 ;
  wire \u_img/inst_dob_i60_000 ;
  wire \u_img/inst_dob_i60_001 ;
  wire \u_img/inst_dob_i60_002 ;
  wire \u_img/inst_dob_i60_003 ;
  wire \u_img/inst_dob_i60_004 ;
  wire \u_img/inst_dob_i60_005 ;
  wire \u_img/inst_dob_i60_006 ;
  wire \u_img/inst_dob_i60_007 ;
  wire \u_img/inst_dob_i60_008 ;
  wire \u_img/inst_dob_i62_000 ;
  wire \u_img/inst_dob_i62_001 ;
  wire \u_img/inst_dob_i62_002 ;
  wire \u_img/inst_dob_i62_003 ;
  wire \u_img/inst_dob_i62_004 ;
  wire \u_img/inst_dob_i62_005 ;
  wire \u_img/inst_dob_i62_006 ;
  wire \u_img/inst_dob_i62_007 ;
  wire \u_img/inst_dob_i62_008 ;
  wire \u_img/inst_dob_i64_000 ;
  wire \u_img/inst_dob_i64_001 ;
  wire \u_img/inst_dob_i64_002 ;
  wire \u_img/inst_dob_i64_003 ;
  wire \u_img/inst_dob_i64_004 ;
  wire \u_img/inst_dob_i64_005 ;
  wire \u_img/inst_dob_i64_006 ;
  wire \u_img/inst_dob_i64_007 ;
  wire \u_img/inst_dob_i64_008 ;
  wire \u_img/inst_dob_i64_009 ;
  wire \u_img/inst_dob_i64_010 ;
  wire \u_img/inst_dob_i64_011 ;
  wire \u_img/inst_dob_i64_012 ;
  wire \u_img/inst_dob_i64_013 ;
  wire \u_img/inst_dob_i64_014 ;
  wire \u_img/inst_dob_i64_015 ;
  wire \u_img/inst_dob_i6_000 ;
  wire \u_img/inst_dob_i6_001 ;
  wire \u_img/inst_dob_i6_002 ;
  wire \u_img/inst_dob_i6_003 ;
  wire \u_img/inst_dob_i6_004 ;
  wire \u_img/inst_dob_i6_005 ;
  wire \u_img/inst_dob_i6_006 ;
  wire \u_img/inst_dob_i6_007 ;
  wire \u_img/inst_dob_i6_008 ;
  wire \u_img/inst_dob_i8_000 ;
  wire \u_img/inst_dob_i8_001 ;
  wire \u_img/inst_dob_i8_002 ;
  wire \u_img/inst_dob_i8_003 ;
  wire \u_img/inst_dob_i8_004 ;
  wire \u_img/inst_dob_i8_005 ;
  wire \u_img/inst_dob_i8_006 ;
  wire \u_img/inst_dob_i8_007 ;
  wire \u_img/inst_dob_i8_008 ;
  wire \u_pll/clk0_buf ;  // al_ip/ip_pll.v(34)
  wire vga_clk_pad;  // sources/rtl/test_camera.v(32)
  wire vga_hsync_pad;  // sources/rtl/test_camera.v(33)
  wire vga_rden;  // sources/rtl/test_camera.v(57)
  wire vga_vsync_pad;  // sources/rtl/test_camera.v(34)

  EG_PHY_PAD #(
    //.LOCATION("H13"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS33"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u151 (
    .ipad(cam_data[7]),
    .di(cam_data_pad[7]));  // sources/rtl/test_camera.v(27)
  EG_PHY_PAD #(
    //.LOCATION("G16"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS33"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u152 (
    .ipad(cam_data[6]),
    .di(cam_data_pad[6]));  // sources/rtl/test_camera.v(27)
  EG_PHY_PAD #(
    //.LOCATION("H16"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS33"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u153 (
    .ipad(cam_data[5]),
    .di(cam_data_pad[5]));  // sources/rtl/test_camera.v(27)
  EG_PHY_PAD #(
    //.LOCATION("G14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS33"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u154 (
    .ipad(cam_data[4]),
    .di(cam_data_pad[4]));  // sources/rtl/test_camera.v(27)
  EG_PHY_PAD #(
    //.LOCATION("K15"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS33"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u155 (
    .ipad(cam_data[3]),
    .di(cam_data_pad[3]));  // sources/rtl/test_camera.v(27)
  EG_PHY_PAD #(
    //.LOCATION("K16"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS33"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u156 (
    .ipad(cam_data[2]),
    .di(cam_data_pad[2]));  // sources/rtl/test_camera.v(27)
  EG_PHY_PAD #(
    //.LOCATION("J16"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS33"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u157 (
    .ipad(cam_data[1]),
    .di(cam_data_pad[1]));  // sources/rtl/test_camera.v(27)
  EG_PHY_PAD #(
    //.LOCATION("H15"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS33"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u158 (
    .ipad(cam_data[0]),
    .di(cam_data_pad[0]));  // sources/rtl/test_camera.v(27)
  EG_PHY_PAD #(
    //.LOCATION("F15"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u159 (
    .ipad(cam_href),
    .di(\u_camera_reader/n2 ));  // sources/rtl/test_camera.v(21)
  EG_PHY_PAD #(
    //.LOCATION("K12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u160 (
    .ipad(cam_pclk),
    .di(cam_pclk_pad));  // sources/rtl/test_camera.v(19)
  EG_PHY_PAD #(
    //.LOCATION("F14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u161 (
    .do({open_n171,open_n172,open_n173,1'b0}),
    .opad(cam_pwdn));  // sources/rtl/test_camera.v(23)
  EG_PHY_PAD #(
    //.LOCATION("F13"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u162 (
    .do({open_n188,open_n189,open_n190,cam_rst_pad}),
    .opad(cam_rst));  // sources/rtl/test_camera.v(24)
  EG_PHY_PAD #(
    //.LOCATION("D14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .TSMUX("INV"))
    _al_u163 (
    .do({open_n205,open_n206,open_n207,sda}),
    .ts(sda_oe),
    .di(cam_soid_pad),
    .bpad(cam_soid));  // sources/rtl/test_camera.v(61)
  EG_PHY_PAD #(
    //.LOCATION("E15"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u164 (
    .ipad(cam_vsync),
    .di(cam_vsync_pad));  // sources/rtl/test_camera.v(22)
  EG_PHY_PAD #(
    //.LOCATION("J12"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u165 (
    .do({open_n237,open_n238,open_n239,cam_xclk_pad}),
    .opad(cam_xclk));  // sources/rtl/test_camera.v(20)
  EG_PHY_PAD #(
    //.LOCATION("K14"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u166 (
    .ipad(clk_24m),
    .di(clk_24m_pad));  // sources/rtl/test_camera.v(16)
  EG_PHY_PAD #(
    //.LOCATION("G11"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    _al_u167 (
    .ipad(rst_n),
    .di(cam_rst_pad));  // sources/rtl/test_camera.v(17)
  EG_PHY_PAD #(
    //.LOCATION("C1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u168 (
    .do({open_n288,open_n289,open_n290,vga_b_pad[7]}),
    .opad(vga_b[7]));  // sources/rtl/test_camera.v(31)
  EG_PHY_PAD #(
    //.LOCATION("D1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u169 (
    .do({open_n305,open_n306,open_n307,vga_b_pad[6]}),
    .opad(vga_b[6]));  // sources/rtl/test_camera.v(31)
  EG_PHY_PAD #(
    //.LOCATION("E2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u170 (
    .do({open_n322,open_n323,open_n324,vga_b_pad[5]}),
    .opad(vga_b[5]));  // sources/rtl/test_camera.v(31)
  EG_PHY_PAD #(
    //.LOCATION("G3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u171 (
    .do({open_n339,open_n340,open_n341,vga_b_pad[4]}),
    .opad(vga_b[4]));  // sources/rtl/test_camera.v(31)
  EG_PHY_PAD #(
    //.LOCATION("E1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u172 (
    .do({open_n356,open_n357,open_n358,vga_b_pad[3]}),
    .opad(vga_b[3]));  // sources/rtl/test_camera.v(31)
  EG_PHY_PAD #(
    //.LOCATION("F2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u173 (
    .do({open_n373,open_n374,open_n375,1'b0}),
    .opad(vga_b[2]));  // sources/rtl/test_camera.v(31)
  EG_PHY_PAD #(
    //.LOCATION("F1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u174 (
    .do({open_n390,open_n391,open_n392,1'b0}),
    .opad(vga_b[1]));  // sources/rtl/test_camera.v(31)
  EG_PHY_PAD #(
    //.LOCATION("G1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("FAST"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u175 (
    .do({open_n407,open_n408,open_n409,1'b0}),
    .opad(vga_b[0]));  // sources/rtl/test_camera.v(31)
  EG_PHY_PAD #(
    //.LOCATION("H2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u176 (
    .do({open_n424,open_n425,open_n426,vga_clk_pad}),
    .opad(vga_clk));  // sources/rtl/test_camera.v(32)
  EG_PHY_PAD #(
    //.LOCATION("H5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u177 (
    .do({open_n441,open_n442,open_n443,vga_g_pad[7]}),
    .opad(vga_g[7]));  // sources/rtl/test_camera.v(30)
  EG_PHY_PAD #(
    //.LOCATION("H1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u178 (
    .do({open_n458,open_n459,open_n460,vga_g_pad[6]}),
    .opad(vga_g[6]));  // sources/rtl/test_camera.v(30)
  EG_PHY_PAD #(
    //.LOCATION("J6"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u179 (
    .do({open_n475,open_n476,open_n477,vga_g_pad[5]}),
    .opad(vga_g[5]));  // sources/rtl/test_camera.v(30)
  EG_PHY_PAD #(
    //.LOCATION("H3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u180 (
    .do({open_n492,open_n493,open_n494,vga_g_pad[4]}),
    .opad(vga_g[4]));  // sources/rtl/test_camera.v(30)
  EG_PHY_PAD #(
    //.LOCATION("J1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u181 (
    .do({open_n509,open_n510,open_n511,vga_g_pad[3]}),
    .opad(vga_g[3]));  // sources/rtl/test_camera.v(30)
  EG_PHY_PAD #(
    //.LOCATION("K1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u182 (
    .do({open_n526,open_n527,open_n528,vga_g_pad[2]}),
    .opad(vga_g[2]));  // sources/rtl/test_camera.v(30)
  EG_PHY_PAD #(
    //.LOCATION("K2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u183 (
    .do({open_n543,open_n544,open_n545,1'b0}),
    .opad(vga_g[1]));  // sources/rtl/test_camera.v(30)
  EG_PHY_PAD #(
    //.LOCATION("L1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u184 (
    .do({open_n560,open_n561,open_n562,1'b0}),
    .opad(vga_g[0]));  // sources/rtl/test_camera.v(30)
  EG_PHY_PAD #(
    //.LOCATION("J3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u185 (
    .do({open_n577,open_n578,open_n579,vga_hsync_pad}),
    .opad(vga_hsync));  // sources/rtl/test_camera.v(33)
  EG_PHY_PAD #(
    //.LOCATION("L5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u186 (
    .do({open_n594,open_n595,open_n596,vga_r_pad[7]}),
    .opad(vga_r[7]));  // sources/rtl/test_camera.v(29)
  EG_PHY_PAD #(
    //.LOCATION("L3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u187 (
    .do({open_n611,open_n612,open_n613,vga_r_pad[6]}),
    .opad(vga_r[6]));  // sources/rtl/test_camera.v(29)
  EG_PHY_PAD #(
    //.LOCATION("M2"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u188 (
    .do({open_n628,open_n629,open_n630,vga_r_pad[5]}),
    .opad(vga_r[5]));  // sources/rtl/test_camera.v(29)
  EG_PHY_PAD #(
    //.LOCATION("M1"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u189 (
    .do({open_n645,open_n646,open_n647,vga_r_pad[4]}),
    .opad(vga_r[4]));  // sources/rtl/test_camera.v(29)
  EG_PHY_PAD #(
    //.LOCATION("L4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u190 (
    .do({open_n662,open_n663,open_n664,vga_r_pad[3]}),
    .opad(vga_r[3]));  // sources/rtl/test_camera.v(29)
  EG_PHY_PAD #(
    //.LOCATION("K5"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u191 (
    .do({open_n679,open_n680,open_n681,1'b0}),
    .opad(vga_r[2]));  // sources/rtl/test_camera.v(29)
  EG_PHY_PAD #(
    //.LOCATION("K3"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u192 (
    .do({open_n696,open_n697,open_n698,1'b0}),
    .opad(vga_r[1]));  // sources/rtl/test_camera.v(29)
  EG_PHY_PAD #(
    //.LOCATION("K6"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u193 (
    .do({open_n713,open_n714,open_n715,1'b0}),
    .opad(vga_r[0]));  // sources/rtl/test_camera.v(29)
  EG_PHY_PAD #(
    //.LOCATION("J4"),
    //.PCICLAMP("ON"),
    //.PULLMODE("NONE"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u194 (
    .do({open_n730,open_n731,open_n732,vga_vsync_pad}),
    .opad(vga_vsync));  // sources/rtl/test_camera.v(34)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*B*~A)"),
    //.LUTF1("(~D*C*B*A)"),
    //.LUTG0("(~D*~C*B*~A)"),
    //.LUTG1("(~D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000000100),
    .INIT_LUTF1(16'b0000000010000000),
    .INIT_LUTG0(16'b0000000000000100),
    .INIT_LUTG1(16'b0000000010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u423|_al_u429  (
    .a({camera_addr[12],camera_addr[12]}),
    .b({camera_addr[13],camera_addr[13]}),
    .c({camera_addr[14],camera_addr[14]}),
    .d({camera_addr[15],camera_addr[15]}),
    .f({\and_camera_addr[12]__o_al_n256 ,\and_Ncamera_addr[12]_o_al_n177 }));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*~B*~A)"),
    //.LUTF1("(~D*C*~B*A)"),
    //.LUTG0("(~D*C*~B*~A)"),
    //.LUTG1("(~D*C*~B*A)"),
    .INIT_LUTF0(16'b0000000000010000),
    .INIT_LUTF1(16'b0000000000100000),
    .INIT_LUTG0(16'b0000000000010000),
    .INIT_LUTG1(16'b0000000000100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u424|_al_u428  (
    .a({camera_addr[12],camera_addr[12]}),
    .b({camera_addr[13],camera_addr[13]}),
    .c({camera_addr[14],camera_addr[14]}),
    .d({camera_addr[15],camera_addr[15]}),
    .f({\and_camera_addr[12]__o_al_n224 ,\and_Ncamera_addr[12]_o_al_n208 }));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*B*~A)"),
    //.LUT1("(~D*~C*B*A)"),
    .INIT_LUT0(16'b0000000001000000),
    .INIT_LUT1(16'b0000000000001000),
    .MODE("LOGIC"))
    \_al_u425|_al_u427  (
    .a({camera_addr[12],camera_addr[12]}),
    .b({camera_addr[13],camera_addr[13]}),
    .c({camera_addr[14],camera_addr[14]}),
    .d({camera_addr[15],camera_addr[15]}),
    .f({\and_camera_addr[12]__o_al_n193 ,\and_Ncamera_addr[12]_o_al_n240 }));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*A)"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000000000000010),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u430|_al_u426  (
    .a({open_n814,camera_addr[12]}),
    .b({camera_addr[13],camera_addr[13]}),
    .c({camera_addr[14],camera_addr[14]}),
    .d({camera_addr[12],camera_addr[15]}),
    .f({_al_u430_o,\and_camera_addr[12]__o }));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~C*B*A)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000100000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u431|_al_u445  (
    .a({open_n835,_al_u430_o}),
    .b({open_n836,camera_wrreq}),
    .c({camera_addr[15],camera_addr[11]}),
    .d({_al_u430_o,camera_addr[15]}),
    .f({\and_Ncamera_addr[12]_o ,\and_Ncamera_addr[11]_o_and_camera_wrreq }));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(D*C*B*~A)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(D*C*B*~A)"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b0100000000000000),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b0100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u432|_al_u439  (
    .a({vga_rdaddr[15],vga_rdaddr[15]}),
    .b({vga_rdaddr[14],vga_rdaddr[14]}),
    .c({vga_rdaddr[13],vga_rdaddr[13]}),
    .d({vga_rdaddr[12],vga_rdaddr[12]}),
    .f({\and_vga_rdaddr[12]_v_o_al_n259 ,\and_Nvga_rdaddr[12]__o }));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*~B*~A)"),
    //.LUTF1("(D*C*~B*~A)"),
    //.LUTG0("(~D*C*~B*~A)"),
    //.LUTG1("(D*C*~B*~A)"),
    .INIT_LUTF0(16'b0000000000010000),
    .INIT_LUTF1(16'b0001000000000000),
    .INIT_LUTG0(16'b0000000000010000),
    .INIT_LUTG1(16'b0001000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u433|_al_u438  (
    .a({vga_rdaddr[15],vga_rdaddr[15]}),
    .b({vga_rdaddr[14],vga_rdaddr[14]}),
    .c({vga_rdaddr[13],vga_rdaddr[13]}),
    .d({vga_rdaddr[12],vga_rdaddr[12]}),
    .f({\and_vga_rdaddr[12]_v_o ,\and_Nvga_rdaddr[12]__o_al_n180 }));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*B*~A)"),
    //.LUT1("(D*~C*B*~A)"),
    .INIT_LUT0(16'b0000000000000100),
    .INIT_LUT1(16'b0000010000000000),
    .MODE("LOGIC"))
    \_al_u434|_al_u437  (
    .a({vga_rdaddr[15],vga_rdaddr[15]}),
    .b({vga_rdaddr[14],vga_rdaddr[14]}),
    .c({vga_rdaddr[13],vga_rdaddr[13]}),
    .d({vga_rdaddr[12],vga_rdaddr[12]}),
    .f({\and_vga_rdaddr[12]_N_o_al_n227 ,\and_Nvga_rdaddr[12]__o_al_n211 }));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*B*~A)"),
    //.LUT1("(D*~C*~B*~A)"),
    .INIT_LUT0(16'b0000000001000000),
    .INIT_LUT1(16'b0000000100000000),
    .MODE("LOGIC"))
    \_al_u435|_al_u436  (
    .a({vga_rdaddr[15],vga_rdaddr[15]}),
    .b({vga_rdaddr[14],vga_rdaddr[14]}),
    .c({vga_rdaddr[13],vga_rdaddr[13]}),
    .d({vga_rdaddr[12],vga_rdaddr[12]}),
    .f({\and_vga_rdaddr[12]_N_o ,\and_Nvga_rdaddr[12]__o_al_n243 }));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~C*~B*A)"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b0000001000000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u441|_al_u440  (
    .a({open_n945,vga_rdaddr[15]}),
    .b({vga_rdaddr[13],vga_rdaddr[14]}),
    .c(vga_rdaddr[12:11]),
    .d({_al_u440_o,vga_rden}),
    .f({\and_Nvga_rdaddr[11]__o_and_vga_rden ,_al_u440_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u442|_al_u767  (
    .c({clk_cam,open_n970}),
    .d({cam_rst_pad,cam_rst_pad}),
    .f({cam_xclk_pad,cam_rst_pad_neg}));
  // sources/rtl/camera_reader.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(C*B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u446|u_camera_reader/reg4_b0  (
    .b({\u_camera_reader/pixel_counter [0],cam_vsync_pad}),
    .c({\u_camera_reader/vsync_passed ,cam_rst_pad}),
    .ce(\u_camera_reader/mux14_b0_sel_is_2_o ),
    .clk(cam_pclk_pad),
    .d({\u_camera_reader/n2 ,\u_camera_reader/mux6_b0_sel_is_1_o }),
    .mi({open_n1003,cam_data_pad[0]}),
    .f({\u_camera_reader/mux6_b0_sel_is_1_o ,\u_camera_reader/mux14_b0_sel_is_2_o }),
    .q({open_n1008,\u_camera_reader/current_pixel [0]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(C*~B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u464|u_camera_reader/reg3_b0  (
    .b({\u_camera_reader/pixel_counter [0],cam_vsync_pad}),
    .c({\u_camera_reader/vsync_passed ,cam_rst_pad}),
    .ce(\u_camera_reader/mux13_b0_sel_is_2_o ),
    .clk(cam_pclk_pad),
    .d({\u_camera_reader/n2 ,\u_camera_reader/mux5_b0_sel_is_3_o }),
    .mi({open_n1014,cam_data_pad[0]}),
    .f({\u_camera_reader/mux5_b0_sel_is_3_o ,\u_camera_reader/mux13_b0_sel_is_2_o }),
    .q({open_n1030,\u_camera_reader/subpixel [0]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*D)"),
    //.LUT1("(B*~(~D*~(C*A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000011111111),
    .INIT_LUT1(16'b1100110010000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \_al_u466|u_camera_reader/vsync_passed_reg  (
    .a({\u_camera_reader/n2 ,open_n1031}),
    .b({cam_vsync_pad,open_n1032}),
    .c({\u_camera_reader/vsync_passed ,\u_camera_reader/vsync_passed }),
    .clk(cam_pclk_pad),
    .d({\u_camera_reader/write_pixel ,cam_vsync_pad}),
    .sr(cam_rst_pad_neg),
    .f({\u_camera_reader/mux8_b0_sel_is_0_o ,open_n1046}),
    .q({open_n1050,\u_camera_reader/vsync_passed }));  // sources/rtl/camera_reader.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b1100101000000000),
    .INIT_LUTF1(16'b0000000011001010),
    .INIT_LUTG0(16'b1100101000000000),
    .INIT_LUTG1(16'b0000000011001010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u487|_al_u708  (
    .a({\u_img/inst_dob_i0_009 ,\u_img/inst_dob_i32_010 }),
    .b({\u_img/inst_dob_i16_009 ,\u_img/inst_dob_i48_010 }),
    .c({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[4]}),
    .d({vga_rdaddr_piped_piped[5],vga_rdaddr_piped_piped[5]}),
    .f({_al_u487_o,_al_u708_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b0000000011001010),
    .INIT_LUT1(16'b1100101000000000),
    .MODE("LOGIC"))
    \_al_u488|_al_u707  (
    .a({\u_img/inst_dob_i32_009 ,\u_img/inst_dob_i0_010 }),
    .b({\u_img/inst_dob_i48_009 ,\u_img/inst_dob_i16_010 }),
    .c({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[4]}),
    .d({vga_rdaddr_piped_piped[5],vga_rdaddr_piped_piped[5]}),
    .f({_al_u488_o,_al_u707_o}));
  // sources/rtl/camera_reader.v(43)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTF1("(B*~(C*~D))"),
    //.LUTG0("(~D)"),
    //.LUTG1("(B*~(C*~D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTF1(16'b1100110000001100),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b1100110000001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u489|u_camera_reader/wrclk1_reg  (
    .b({vga_rden,open_n1097}),
    .c({vga_rdaddr_piped_piped[6],open_n1098}),
    .clk(cam_pclk_pad),
    .d({\u_img/inst_dob_i64_009 ,\u_camera_reader/wrclk1 }),
    .f({_al_u489_o,open_n1117}),
    .q({open_n1121,\u_camera_reader/wrclk1 }));  // sources/rtl/camera_reader.v(43)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(C*~(~D*~B*~A))"),
    .INIT_LUT0(16'b0000000011001010),
    .INIT_LUT1(16'b1111000011100000),
    .MODE("LOGIC"))
    \_al_u490|_al_u687  (
    .a({_al_u487_o,\u_img/inst_dob_i0_015 }),
    .b({_al_u488_o,\u_img/inst_dob_i16_015 }),
    .c({_al_u489_o,vga_rdaddr_piped_piped[4]}),
    .d({vga_rdaddr_piped_piped[6],vga_rdaddr_piped_piped[5]}),
    .f({vga_g_pad[6],_al_u687_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b0000000000110101),
    .MODE("LOGIC"))
    \_al_u491|_al_u761  (
    .a({\u_img/inst_dob_i24_008 ,\u_img/inst_dob_i20_000 }),
    .b({\u_img/inst_dob_i26_008 ,\u_img/inst_dob_i22_000 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u491_o,_al_u761_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b1100101000000000),
    .INIT_LUTF1(16'b0011010100000000),
    .INIT_LUTG0(16'b1100101000000000),
    .INIT_LUTG1(16'b0011010100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u492|_al_u755  (
    .a({\u_img/inst_dob_i28_008 ,\u_img/inst_dob_i12_000 }),
    .b({\u_img/inst_dob_i30_008 ,\u_img/inst_dob_i14_000 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u492_o,_al_u755_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b0000000000110101),
    .MODE("LOGIC"))
    \_al_u493|_al_u748  (
    .a({\u_img/inst_dob_i16_008 ,\u_img/inst_dob_i60_000 }),
    .b({\u_img/inst_dob_i18_008 ,\u_img/inst_dob_i62_000 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u493_o,_al_u748_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b1100101000000000),
    .INIT_LUTF1(16'b0011010100000000),
    .INIT_LUTG0(16'b1100101000000000),
    .INIT_LUTG1(16'b0011010100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u494|_al_u742  (
    .a({\u_img/inst_dob_i20_008 ,\u_img/inst_dob_i44_000 }),
    .b({\u_img/inst_dob_i22_008 ,\u_img/inst_dob_i46_000 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u494_o,_al_u742_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(D*~C*~B))"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(~A*~(D*~C*~B))"),
    //.LUTG1("(~C*~B*~D)"),
    .INIT_LUTF0(16'b0101010001010101),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b0101010001010101),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u495|_al_u496  (
    .a({open_n1230,_al_u495_o}),
    .b({_al_u494_o,_al_u491_o}),
    .c({vga_rdaddr_piped_piped[3],_al_u492_o}),
    .d({_al_u493_o,vga_rdaddr_piped_piped[3]}),
    .f({_al_u495_o,_al_u496_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b0000000011001010),
    .INIT_LUT1(16'b0000000000110101),
    .MODE("LOGIC"))
    \_al_u497|_al_u733  (
    .a({\u_img/inst_dob_i8_008 ,\u_img/inst_dob_i24_001 }),
    .b({\u_img/inst_dob_i10_008 ,\u_img/inst_dob_i26_001 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u497_o,_al_u733_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b1100101000000000),
    .INIT_LUTF1(16'b0011010100000000),
    .INIT_LUTG0(16'b1100101000000000),
    .INIT_LUTG1(16'b0011010100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u498|_al_u727  (
    .a({\u_img/inst_dob_i12_008 ,\u_img/inst_dob_i12_001 }),
    .b({\u_img/inst_dob_i14_008 ,\u_img/inst_dob_i14_001 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u498_o,_al_u727_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b0000000011001010),
    .INIT_LUT1(16'b0000000000110101),
    .MODE("LOGIC"))
    \_al_u499|_al_u720  (
    .a({\u_img/inst_dob_i0_008 ,\u_img/inst_dob_i56_001 }),
    .b({\u_img/inst_dob_i2_008 ,\u_img/inst_dob_i58_001 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u499_o,_al_u720_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b1100101000000000),
    .INIT_LUTF1(16'b0011010100000000),
    .INIT_LUTG0(16'b1100101000000000),
    .INIT_LUTG1(16'b0011010100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u500|_al_u714  (
    .a({\u_img/inst_dob_i4_008 ,\u_img/inst_dob_i44_001 }),
    .b({\u_img/inst_dob_i6_008 ,\u_img/inst_dob_i46_001 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u500_o,_al_u714_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~A*~(D*~C*~B))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0101010001010101),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u501|_al_u502  (
    .a({open_n1343,_al_u501_o}),
    .b({_al_u500_o,_al_u497_o}),
    .c({vga_rdaddr_piped_piped[3],_al_u498_o}),
    .d({_al_u499_o,vga_rdaddr_piped_piped[3]}),
    .f({_al_u501_o,_al_u502_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b0000000010101100),
    .MODE("LOGIC"))
    \_al_u503|_al_u704  (
    .a({_al_u496_o,\u_img/inst_dob_i32_011 }),
    .b({_al_u502_o,\u_img/inst_dob_i48_011 }),
    .c({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[4]}),
    .d({vga_rdaddr_piped_piped[5],vga_rdaddr_piped_piped[5]}),
    .f({_al_u503_o,_al_u704_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b0000000000110101),
    .MODE("LOGIC"))
    \_al_u504|_al_u681  (
    .a({\u_img/inst_dob_i40_008 ,\u_img/inst_dob_i52_002 }),
    .b({\u_img/inst_dob_i42_008 ,\u_img/inst_dob_i54_002 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u504_o,_al_u681_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b1100101000000000),
    .INIT_LUTF1(16'b0011010100000000),
    .INIT_LUTG0(16'b1100101000000000),
    .INIT_LUTG1(16'b0011010100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u505|_al_u675  (
    .a({\u_img/inst_dob_i44_008 ,\u_img/inst_dob_i44_002 }),
    .b({\u_img/inst_dob_i46_008 ,\u_img/inst_dob_i46_002 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u505_o,_al_u675_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b0000000011001010),
    .INIT_LUT1(16'b0000000000110101),
    .MODE("LOGIC"))
    \_al_u506|_al_u668  (
    .a({\u_img/inst_dob_i32_008 ,\u_img/inst_dob_i24_002 }),
    .b({\u_img/inst_dob_i34_008 ,\u_img/inst_dob_i26_002 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u506_o,_al_u668_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b1100101000000000),
    .INIT_LUTF1(16'b0011010100000000),
    .INIT_LUTG0(16'b1100101000000000),
    .INIT_LUTG1(16'b0011010100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u507|_al_u662  (
    .a({\u_img/inst_dob_i36_008 ,\u_img/inst_dob_i12_002 }),
    .b({\u_img/inst_dob_i38_008 ,\u_img/inst_dob_i14_002 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u507_o,_al_u662_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~A*~(D*~C*~B))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0101010001010101),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u508|_al_u509  (
    .a({open_n1472,_al_u508_o}),
    .b({_al_u507_o,_al_u504_o}),
    .c({vga_rdaddr_piped_piped[3],_al_u505_o}),
    .d({_al_u506_o,vga_rdaddr_piped_piped[3]}),
    .f({_al_u508_o,_al_u509_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b0000000011001010),
    .INIT_LUT1(16'b0000000000110101),
    .MODE("LOGIC"))
    \_al_u510|_al_u653  (
    .a({\u_img/inst_dob_i56_008 ,\u_img/inst_dob_i56_003 }),
    .b({\u_img/inst_dob_i58_008 ,\u_img/inst_dob_i58_003 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u510_o,_al_u653_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b1100101000000000),
    .INIT_LUTF1(16'b0011010100000000),
    .INIT_LUTG0(16'b1100101000000000),
    .INIT_LUTG1(16'b0011010100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u511|_al_u647  (
    .a({\u_img/inst_dob_i60_008 ,\u_img/inst_dob_i44_003 }),
    .b({\u_img/inst_dob_i62_008 ,\u_img/inst_dob_i46_003 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u511_o,_al_u647_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b0000000011001010),
    .INIT_LUT1(16'b0000000000110101),
    .MODE("LOGIC"))
    \_al_u512|_al_u640  (
    .a({\u_img/inst_dob_i48_008 ,\u_img/inst_dob_i24_003 }),
    .b({\u_img/inst_dob_i50_008 ,\u_img/inst_dob_i26_003 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u512_o,_al_u640_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b1100101000000000),
    .INIT_LUTF1(16'b0011010100000000),
    .INIT_LUTG0(16'b1100101000000000),
    .INIT_LUTG1(16'b0011010100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u513|_al_u634  (
    .a({\u_img/inst_dob_i52_008 ,\u_img/inst_dob_i4_003 }),
    .b({\u_img/inst_dob_i54_008 ,\u_img/inst_dob_i6_003 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u513_o,_al_u634_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(D*~C*~B))"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(~A*~(D*~C*~B))"),
    //.LUTG1("(~C*~B*~D)"),
    .INIT_LUTF0(16'b0101010001010101),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b0101010001010101),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u514|_al_u515  (
    .a({open_n1581,_al_u514_o}),
    .b({_al_u513_o,_al_u510_o}),
    .c({vga_rdaddr_piped_piped[3],_al_u511_o}),
    .d({_al_u512_o,vga_rdaddr_piped_piped[3]}),
    .f({_al_u514_o,_al_u515_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b0000000011001010),
    .INIT_LUTF1(16'b1100101000000000),
    .INIT_LUTG0(16'b0000000011001010),
    .INIT_LUTG1(16'b1100101000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u516|_al_u703  (
    .a({_al_u509_o,\u_img/inst_dob_i0_011 }),
    .b({_al_u515_o,\u_img/inst_dob_i16_011 }),
    .c({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[4]}),
    .d({vga_rdaddr_piped_piped[5],vga_rdaddr_piped_piped[5]}),
    .f({_al_u516_o,_al_u703_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C*~D))"),
    //.LUT1("(C*~(~D*~(~B*~A)))"),
    .INIT_LUT0(16'b1100110000001100),
    .INIT_LUT1(16'b1111000000010000),
    .MODE("LOGIC"))
    \_al_u518|_al_u517  (
    .a({_al_u503_o,open_n1630}),
    .b({_al_u516_o,vga_rden}),
    .c({_al_u517_o,vga_rdaddr_piped_piped[6]}),
    .d({vga_rdaddr_piped_piped[6],\u_img/inst_dob_i64_008 }),
    .f({vga_g_pad[5],_al_u517_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b0000000000110101),
    .INIT_LUT1(16'b0000000000110101),
    .MODE("LOGIC"))
    \_al_u519|_al_u624  (
    .a({\u_img/inst_dob_i56_007 ,\u_img/inst_dob_i0_004 }),
    .b({\u_img/inst_dob_i58_007 ,\u_img/inst_dob_i2_004 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u519_o,_al_u624_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b0000000000110101),
    .INIT_LUTF1(16'b0011010100000000),
    .INIT_LUTG0(16'b0000000000110101),
    .INIT_LUTG1(16'b0011010100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u520|_al_u622  (
    .a({\u_img/inst_dob_i60_007 ,\u_img/inst_dob_i8_004 }),
    .b({\u_img/inst_dob_i62_007 ,\u_img/inst_dob_i10_004 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u520_o,_al_u622_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b0000000000110101),
    .INIT_LUT1(16'b0000000000110101),
    .MODE("LOGIC"))
    \_al_u521|_al_u618  (
    .a({\u_img/inst_dob_i48_007 ,\u_img/inst_dob_i16_004 }),
    .b({\u_img/inst_dob_i50_007 ,\u_img/inst_dob_i18_004 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u521_o,_al_u618_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b0000000000110101),
    .INIT_LUTF1(16'b0011010100000000),
    .INIT_LUTG0(16'b0000000000110101),
    .INIT_LUTG1(16'b0011010100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u522|_al_u616  (
    .a({\u_img/inst_dob_i52_007 ,\u_img/inst_dob_i24_004 }),
    .b({\u_img/inst_dob_i54_007 ,\u_img/inst_dob_i26_004 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u522_o,_al_u616_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(D*~C*~B))"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(~A*~(D*~C*~B))"),
    //.LUTG1("(~C*~B*~D)"),
    .INIT_LUTF0(16'b0101010001010101),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b0101010001010101),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u523|_al_u524  (
    .a({open_n1739,_al_u523_o}),
    .b({_al_u522_o,_al_u519_o}),
    .c({vga_rdaddr_piped_piped[3],_al_u520_o}),
    .d({_al_u521_o,vga_rdaddr_piped_piped[3]}),
    .f({_al_u523_o,_al_u524_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b0000000000110101),
    .INIT_LUT1(16'b0000000000110101),
    .MODE("LOGIC"))
    \_al_u525|_al_u611  (
    .a({\u_img/inst_dob_i40_007 ,\u_img/inst_dob_i32_004 }),
    .b({\u_img/inst_dob_i42_007 ,\u_img/inst_dob_i34_004 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u525_o,_al_u611_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b0000000000110101),
    .INIT_LUTF1(16'b0011010100000000),
    .INIT_LUTG0(16'b0000000000110101),
    .INIT_LUTG1(16'b0011010100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u526|_al_u609  (
    .a({\u_img/inst_dob_i44_007 ,\u_img/inst_dob_i40_004 }),
    .b({\u_img/inst_dob_i46_007 ,\u_img/inst_dob_i42_004 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u526_o,_al_u609_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b0000000000110101),
    .INIT_LUT1(16'b0000000000110101),
    .MODE("LOGIC"))
    \_al_u527|_al_u605  (
    .a({\u_img/inst_dob_i32_007 ,\u_img/inst_dob_i48_004 }),
    .b({\u_img/inst_dob_i34_007 ,\u_img/inst_dob_i50_004 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u527_o,_al_u605_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b0000000000110101),
    .INIT_LUTF1(16'b0011010100000000),
    .INIT_LUTG0(16'b0000000000110101),
    .INIT_LUTG1(16'b0011010100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u528|_al_u603  (
    .a({\u_img/inst_dob_i36_007 ,\u_img/inst_dob_i56_004 }),
    .b({\u_img/inst_dob_i38_007 ,\u_img/inst_dob_i58_004 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u528_o,_al_u603_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~A*~(D*~C*~B))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0101010001010101),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u529|_al_u530  (
    .a({open_n1852,_al_u529_o}),
    .b({_al_u528_o,_al_u525_o}),
    .c({vga_rdaddr_piped_piped[3],_al_u526_o}),
    .d({_al_u527_o,vga_rdaddr_piped_piped[3]}),
    .f({_al_u529_o,_al_u530_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT_LUTF0(16'b1100101000000000),
    .INIT_LUTF1(16'b1010110000000000),
    .INIT_LUTG0(16'b1100101000000000),
    .INIT_LUTG1(16'b1010110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u531|_al_u700  (
    .a({_al_u524_o,\u_img/inst_dob_i32_012 }),
    .b({_al_u530_o,\u_img/inst_dob_i48_012 }),
    .c({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[4]}),
    .d({vga_rdaddr_piped_piped[5],vga_rdaddr_piped_piped[5]}),
    .f({_al_u531_o,_al_u700_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b0000000000110101),
    .INIT_LUT1(16'b0000000000110101),
    .MODE("LOGIC"))
    \_al_u532|_al_u596  (
    .a({\u_img/inst_dob_i24_007 ,\u_img/inst_dob_i0_005 }),
    .b({\u_img/inst_dob_i26_007 ,\u_img/inst_dob_i2_005 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u532_o,_al_u596_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b0000000000110101),
    .INIT_LUTF1(16'b0011010100000000),
    .INIT_LUTG0(16'b0000000000110101),
    .INIT_LUTG1(16'b0011010100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u533|_al_u594  (
    .a({\u_img/inst_dob_i28_007 ,\u_img/inst_dob_i8_005 }),
    .b({\u_img/inst_dob_i30_007 ,\u_img/inst_dob_i10_005 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u533_o,_al_u594_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b0000000000110101),
    .INIT_LUT1(16'b0000000000110101),
    .MODE("LOGIC"))
    \_al_u534|_al_u590  (
    .a({\u_img/inst_dob_i16_007 ,\u_img/inst_dob_i16_005 }),
    .b({\u_img/inst_dob_i18_007 ,\u_img/inst_dob_i18_005 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u534_o,_al_u590_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b0000000000110101),
    .INIT_LUTF1(16'b0011010100000000),
    .INIT_LUTG0(16'b0000000000110101),
    .INIT_LUTG1(16'b0011010100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u535|_al_u588  (
    .a({\u_img/inst_dob_i20_007 ,\u_img/inst_dob_i24_005 }),
    .b({\u_img/inst_dob_i22_007 ,\u_img/inst_dob_i26_005 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u535_o,_al_u588_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~A*~(D*~C*~B))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0101010001010101),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u536|_al_u537  (
    .a({open_n1985,_al_u536_o}),
    .b({_al_u535_o,_al_u532_o}),
    .c({vga_rdaddr_piped_piped[3],_al_u533_o}),
    .d({_al_u534_o,vga_rdaddr_piped_piped[3]}),
    .f({_al_u536_o,_al_u537_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b0000000000110101),
    .INIT_LUT1(16'b0000000000110101),
    .MODE("LOGIC"))
    \_al_u538|_al_u583  (
    .a({\u_img/inst_dob_i8_007 ,\u_img/inst_dob_i32_005 }),
    .b({\u_img/inst_dob_i10_007 ,\u_img/inst_dob_i34_005 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u538_o,_al_u583_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b0000000000110101),
    .INIT_LUTF1(16'b0011010100000000),
    .INIT_LUTG0(16'b0000000000110101),
    .INIT_LUTG1(16'b0011010100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u539|_al_u581  (
    .a({\u_img/inst_dob_i12_007 ,\u_img/inst_dob_i40_005 }),
    .b({\u_img/inst_dob_i14_007 ,\u_img/inst_dob_i42_005 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u539_o,_al_u581_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b0000000000110101),
    .INIT_LUT1(16'b0000000000110101),
    .MODE("LOGIC"))
    \_al_u540|_al_u577  (
    .a({\u_img/inst_dob_i0_007 ,\u_img/inst_dob_i48_005 }),
    .b({\u_img/inst_dob_i2_007 ,\u_img/inst_dob_i50_005 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u540_o,_al_u577_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(~D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b0000000000110101),
    .INIT_LUTF1(16'b0011010100000000),
    .INIT_LUTG0(16'b0000000000110101),
    .INIT_LUTG1(16'b0011010100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u541|_al_u575  (
    .a({\u_img/inst_dob_i4_007 ,\u_img/inst_dob_i56_005 }),
    .b({\u_img/inst_dob_i6_007 ,\u_img/inst_dob_i58_005 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u541_o,_al_u575_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(D*~C*~B))"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(~A*~(D*~C*~B))"),
    //.LUTG1("(~C*~B*~D)"),
    .INIT_LUTF0(16'b0101010001010101),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b0101010001010101),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u542|_al_u543  (
    .a({open_n2094,_al_u542_o}),
    .b({_al_u541_o,_al_u538_o}),
    .c({vga_rdaddr_piped_piped[3],_al_u539_o}),
    .d({_al_u540_o,vga_rdaddr_piped_piped[3]}),
    .f({_al_u542_o,_al_u543_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT_LUT0(16'b0000000011001010),
    .INIT_LUT1(16'b0000000010101100),
    .MODE("LOGIC"))
    \_al_u544|_al_u699  (
    .a({_al_u537_o,\u_img/inst_dob_i0_012 }),
    .b({_al_u543_o,\u_img/inst_dob_i16_012 }),
    .c({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[4]}),
    .d({vga_rdaddr_piped_piped[5],vga_rdaddr_piped_piped[5]}),
    .f({_al_u544_o,_al_u699_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C*~D))"),
    //.LUT1("(C*~(~D*~(~B*~A)))"),
    .INIT_LUT0(16'b1100110000001100),
    .INIT_LUT1(16'b1111000000010000),
    .MODE("LOGIC"))
    \_al_u546|_al_u545  (
    .a({_al_u531_o,open_n2139}),
    .b({_al_u544_o,vga_rden}),
    .c({_al_u545_o,vga_rdaddr_piped_piped[6]}),
    .d({vga_rdaddr_piped_piped[6],\u_img/inst_dob_i64_007 }),
    .f({vga_g_pad[4],_al_u545_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTF1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUTF0(16'b0011000000111111),
    .INIT_LUTF1(16'b0011000000111111),
    .INIT_LUTG0(16'b0011000000111111),
    .INIT_LUTG1(16'b0011000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u547|_al_u759  (
    .b({\u_img/inst_dob_i6_006 ,\u_img/inst_dob_i26_000 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({\u_img/inst_dob_i4_006 ,\u_img/inst_dob_i24_000 }),
    .f({_al_u547_o,_al_u759_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTF1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUTF0(16'b0011000000111111),
    .INIT_LUTF1(16'b0011000000111111),
    .INIT_LUTG0(16'b0011000000111111),
    .INIT_LUTG1(16'b0011000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u548|_al_u758  (
    .b({\u_img/inst_dob_i2_006 ,\u_img/inst_dob_i30_000 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({\u_img/inst_dob_i0_006 ,\u_img/inst_dob_i28_000 }),
    .f({_al_u548_o,_al_u758_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b0000000010101100),
    .MODE("LOGIC"))
    \_al_u549|_al_u556  (
    .a({_al_u547_o,\u_img/inst_dob_i20_006 }),
    .b({_al_u548_o,\u_img/inst_dob_i22_006 }),
    .c({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[2]}),
    .f({_al_u549_o,_al_u556_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b1100101000000000),
    .MODE("LOGIC"))
    \_al_u550|_al_u569  (
    .a({\u_img/inst_dob_i12_006 ,\u_img/inst_dob_i60_006 }),
    .b({\u_img/inst_dob_i14_006 ,\u_img/inst_dob_i62_006 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u550_o,_al_u569_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b1100101000000000),
    .INIT_LUTF1(16'b0000000011001010),
    .INIT_LUTG0(16'b1100101000000000),
    .INIT_LUTG1(16'b0000000011001010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u551|_al_u563  (
    .a({\u_img/inst_dob_i8_006 ,\u_img/inst_dob_i44_006 }),
    .b({\u_img/inst_dob_i10_006 ,\u_img/inst_dob_i46_006 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[2],vga_rdaddr_piped_piped[2]}),
    .f({_al_u551_o,_al_u563_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUT1("(~D*~(C*~B*~A))"),
    .INIT_LUT0(16'b0011000000111111),
    .INIT_LUT1(16'b0000000011101111),
    .MODE("LOGIC"))
    \_al_u552|_al_u666  (
    .a({_al_u550_o,open_n2276}),
    .b({_al_u551_o,\u_img/inst_dob_i18_002 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],\u_img/inst_dob_i16_002 }),
    .f({_al_u552_o,_al_u666_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUT1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUT0(16'b0011000000111111),
    .INIT_LUT1(16'b0011000000111111),
    .MODE("LOGIC"))
    \_al_u553|_al_u753  (
    .b({\u_img/inst_dob_i30_006 ,\u_img/inst_dob_i2_000 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({\u_img/inst_dob_i28_006 ,\u_img/inst_dob_i0_000 }),
    .f({_al_u553_o,_al_u753_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUT1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUT0(16'b0011000000111111),
    .INIT_LUT1(16'b0011000000111111),
    .MODE("LOGIC"))
    \_al_u554|_al_u746  (
    .b({\u_img/inst_dob_i26_006 ,\u_img/inst_dob_i50_000 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({\u_img/inst_dob_i24_006 ,\u_img/inst_dob_i48_000 }),
    .f({_al_u554_o,_al_u746_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(D*~(~C*~B*~A))"),
    .INIT_LUT0(16'b0000000011001010),
    .INIT_LUT1(16'b1111111000000000),
    .MODE("LOGIC"))
    \_al_u558|_al_u557  (
    .a({_al_u556_o,\u_img/inst_dob_i16_006 }),
    .b({_al_u557_o,\u_img/inst_dob_i18_006 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u558_o,_al_u557_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("(~(D*~C)*~(B*~A))"),
    .INIT_LUT0(16'b1010110000000000),
    .INIT_LUT1(16'b1011000010111011),
    .MODE("LOGIC"))
    \_al_u559|_al_u555  (
    .a({_al_u549_o,_al_u553_o}),
    .b({_al_u552_o,_al_u554_o}),
    .c({_al_u555_o,vga_rdaddr_piped_piped[2]}),
    .d({_al_u558_o,vga_rdaddr_piped_piped[3]}),
    .f({_al_u559_o,_al_u555_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b0011000000111111),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b0011000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u560|_al_u562  (
    .a({open_n2381,_al_u560_o}),
    .b({\u_img/inst_dob_i38_006 ,_al_u561_o}),
    .c(vga_rdaddr_piped_piped[1:2]),
    .d({\u_img/inst_dob_i36_006 ,vga_rdaddr_piped_piped[3]}),
    .f({_al_u560_o,_al_u562_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTF1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUTF0(16'b0011000000111111),
    .INIT_LUTF1(16'b0011000000111111),
    .INIT_LUTG0(16'b0011000000111111),
    .INIT_LUTG1(16'b0011000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u561|_al_u745  (
    .b({\u_img/inst_dob_i34_006 ,\u_img/inst_dob_i54_000 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({\u_img/inst_dob_i32_006 ,\u_img/inst_dob_i52_000 }),
    .f({_al_u561_o,_al_u745_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~D*~(C*~B*~A))"),
    //.LUTG0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~D*~(C*~B*~A))"),
    .INIT_LUTF0(16'b0000000011001010),
    .INIT_LUTF1(16'b0000000011101111),
    .INIT_LUTG0(16'b0000000011001010),
    .INIT_LUTG1(16'b0000000011101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u565|_al_u564  (
    .a({_al_u563_o,\u_img/inst_dob_i40_006 }),
    .b({_al_u564_o,\u_img/inst_dob_i42_006 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u565_o,_al_u564_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTF1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUTF0(16'b0011000000111111),
    .INIT_LUTF1(16'b0011000000111111),
    .INIT_LUTG0(16'b0011000000111111),
    .INIT_LUTG1(16'b0011000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u566|_al_u740  (
    .b({\u_img/inst_dob_i54_006 ,\u_img/inst_dob_i34_000 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({\u_img/inst_dob_i52_006 ,\u_img/inst_dob_i32_000 }),
    .f({_al_u566_o,_al_u740_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUT1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUT0(16'b0011000000111111),
    .INIT_LUT1(16'b0011000000111111),
    .MODE("LOGIC"))
    \_al_u567|_al_u731  (
    .b({\u_img/inst_dob_i50_006 ,\u_img/inst_dob_i18_001 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({\u_img/inst_dob_i48_006 ,\u_img/inst_dob_i16_001 }),
    .f({_al_u567_o,_al_u731_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(D*~(C*~B*~A))"),
    .INIT_LUT0(16'b0000000011001010),
    .INIT_LUT1(16'b1110111100000000),
    .MODE("LOGIC"))
    \_al_u571|_al_u570  (
    .a({_al_u569_o,\u_img/inst_dob_i56_006 }),
    .b({_al_u570_o,\u_img/inst_dob_i58_006 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u571_o,_al_u570_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("(~(D*~C)*~(B*~A))"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("(~(D*~C)*~(B*~A))"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b1011000010111011),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b1011000010111011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u572|_al_u568  (
    .a({_al_u562_o,_al_u566_o}),
    .b({_al_u565_o,_al_u567_o}),
    .c({_al_u568_o,vga_rdaddr_piped_piped[2]}),
    .d({_al_u571_o,vga_rdaddr_piped_piped[3]}),
    .f({_al_u572_o,_al_u568_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~A*~(D*~B))"),
    //.LUTF1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(C*~A*~(D*~B))"),
    //.LUTG1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b0100000001010000),
    .INIT_LUTF1(16'b0000000011001010),
    .INIT_LUTG0(16'b0100000001010000),
    .INIT_LUTG1(16'b0000000011001010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u573|_al_u574  (
    .a({_al_u559_o,_al_u573_o}),
    .b({_al_u572_o,\u_img/inst_dob_i64_006 }),
    .c({vga_rdaddr_piped_piped[5],vga_rden}),
    .d({vga_rdaddr_piped_piped[6],vga_rdaddr_piped_piped[6]}),
    .f({_al_u573_o,vga_g_pad[3]}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0011010100000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u579|_al_u578  (
    .a({open_n2572,\u_img/inst_dob_i52_005 }),
    .b({_al_u578_o,\u_img/inst_dob_i54_005 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({_al_u577_o,vga_rdaddr_piped_piped[2]}),
    .f({_al_u579_o,_al_u578_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~A*~(D*~C*~B))"),
    //.LUTG0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~A*~(D*~C*~B))"),
    .INIT_LUTF0(16'b0011010100000000),
    .INIT_LUTF1(16'b0101010001010101),
    .INIT_LUTG0(16'b0011010100000000),
    .INIT_LUTG1(16'b0101010001010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u580|_al_u576  (
    .a({_al_u579_o,\u_img/inst_dob_i60_005 }),
    .b({_al_u575_o,\u_img/inst_dob_i62_005 }),
    .c({_al_u576_o,vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[2]}),
    .f({_al_u580_o,_al_u576_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0011010100000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u585|_al_u584  (
    .a({open_n2617,\u_img/inst_dob_i36_005 }),
    .b({_al_u584_o,\u_img/inst_dob_i38_005 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({_al_u583_o,vga_rdaddr_piped_piped[2]}),
    .f({_al_u585_o,_al_u584_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~A*~(D*~C*~B))"),
    //.LUTG0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~A*~(D*~C*~B))"),
    .INIT_LUTF0(16'b0011010100000000),
    .INIT_LUTF1(16'b0101010001010101),
    .INIT_LUTG0(16'b0011010100000000),
    .INIT_LUTG1(16'b0101010001010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u586|_al_u582  (
    .a({_al_u585_o,\u_img/inst_dob_i44_005 }),
    .b({_al_u581_o,\u_img/inst_dob_i46_005 }),
    .c({_al_u582_o,vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[2]}),
    .f({_al_u586_o,_al_u582_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b1010110000000000),
    .MODE("LOGIC"))
    \_al_u587|_al_u696  (
    .a({_al_u580_o,\u_img/inst_dob_i32_013 }),
    .b({_al_u586_o,\u_img/inst_dob_i48_013 }),
    .c({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[4]}),
    .d({vga_rdaddr_piped_piped[5],vga_rdaddr_piped_piped[5]}),
    .f({_al_u587_o,_al_u696_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0011010100000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u592|_al_u591  (
    .a({open_n2682,\u_img/inst_dob_i20_005 }),
    .b({_al_u591_o,\u_img/inst_dob_i22_005 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({_al_u590_o,vga_rdaddr_piped_piped[2]}),
    .f({_al_u592_o,_al_u591_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~A*~(D*~C*~B))"),
    //.LUTG0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~A*~(D*~C*~B))"),
    .INIT_LUTF0(16'b0011010100000000),
    .INIT_LUTF1(16'b0101010001010101),
    .INIT_LUTG0(16'b0011010100000000),
    .INIT_LUTG1(16'b0101010001010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u593|_al_u589  (
    .a({_al_u592_o,\u_img/inst_dob_i28_005 }),
    .b({_al_u588_o,\u_img/inst_dob_i30_005 }),
    .c({_al_u589_o,vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[2]}),
    .f({_al_u593_o,_al_u589_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0011010100000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u598|_al_u597  (
    .a({open_n2727,\u_img/inst_dob_i4_005 }),
    .b({_al_u597_o,\u_img/inst_dob_i6_005 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({_al_u596_o,vga_rdaddr_piped_piped[2]}),
    .f({_al_u598_o,_al_u597_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~A*~(D*~C*~B))"),
    //.LUTG0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~A*~(D*~C*~B))"),
    .INIT_LUTF0(16'b0011010100000000),
    .INIT_LUTF1(16'b0101010001010101),
    .INIT_LUTG0(16'b0011010100000000),
    .INIT_LUTG1(16'b0101010001010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u599|_al_u595  (
    .a({_al_u598_o,\u_img/inst_dob_i12_005 }),
    .b({_al_u594_o,\u_img/inst_dob_i14_005 }),
    .c({_al_u595_o,vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[2]}),
    .f({_al_u599_o,_al_u595_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT_LUTF0(16'b0000000011001010),
    .INIT_LUTF1(16'b0000000010101100),
    .INIT_LUTG0(16'b0000000011001010),
    .INIT_LUTG1(16'b0000000010101100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u600|_al_u695  (
    .a({_al_u593_o,\u_img/inst_dob_i0_013 }),
    .b({_al_u599_o,\u_img/inst_dob_i16_013 }),
    .c({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[4]}),
    .d({vga_rdaddr_piped_piped[5],vga_rdaddr_piped_piped[5]}),
    .f({_al_u600_o,_al_u695_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(C*~D))"),
    //.LUTF1("(C*~(~D*~(~B*~A)))"),
    //.LUTG0("(B*~(C*~D))"),
    //.LUTG1("(C*~(~D*~(~B*~A)))"),
    .INIT_LUTF0(16'b1100110000001100),
    .INIT_LUTF1(16'b1111000000010000),
    .INIT_LUTG0(16'b1100110000001100),
    .INIT_LUTG1(16'b1111000000010000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u602|_al_u601  (
    .a({_al_u587_o,open_n2796}),
    .b({_al_u600_o,vga_rden}),
    .c({_al_u601_o,vga_rdaddr_piped_piped[6]}),
    .d({vga_rdaddr_piped_piped[6],\u_img/inst_dob_i64_005 }),
    .f({vga_g_pad[2],_al_u601_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0011010100000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u607|_al_u606  (
    .a({open_n2821,\u_img/inst_dob_i52_004 }),
    .b({_al_u606_o,\u_img/inst_dob_i54_004 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({_al_u605_o,vga_rdaddr_piped_piped[2]}),
    .f({_al_u607_o,_al_u606_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~A*~(D*~C*~B))"),
    //.LUTG0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~A*~(D*~C*~B))"),
    .INIT_LUTF0(16'b0011010100000000),
    .INIT_LUTF1(16'b0101010001010101),
    .INIT_LUTG0(16'b0011010100000000),
    .INIT_LUTG1(16'b0101010001010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u608|_al_u604  (
    .a({_al_u607_o,\u_img/inst_dob_i60_004 }),
    .b({_al_u603_o,\u_img/inst_dob_i62_004 }),
    .c({_al_u604_o,vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[2]}),
    .f({_al_u608_o,_al_u604_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0011010100000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u613|_al_u612  (
    .a({open_n2866,\u_img/inst_dob_i36_004 }),
    .b({_al_u612_o,\u_img/inst_dob_i38_004 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({_al_u611_o,vga_rdaddr_piped_piped[2]}),
    .f({_al_u613_o,_al_u612_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~A*~(D*~C*~B))"),
    //.LUTG0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~A*~(D*~C*~B))"),
    .INIT_LUTF0(16'b0011010100000000),
    .INIT_LUTF1(16'b0101010001010101),
    .INIT_LUTG0(16'b0011010100000000),
    .INIT_LUTG1(16'b0101010001010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u614|_al_u610  (
    .a({_al_u613_o,\u_img/inst_dob_i44_004 }),
    .b({_al_u609_o,\u_img/inst_dob_i46_004 }),
    .c({_al_u610_o,vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[2]}),
    .f({_al_u614_o,_al_u610_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT_LUTF0(16'b1100101000000000),
    .INIT_LUTF1(16'b1010110000000000),
    .INIT_LUTG0(16'b1100101000000000),
    .INIT_LUTG1(16'b1010110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u615|_al_u692  (
    .a({_al_u608_o,\u_img/inst_dob_i32_014 }),
    .b({_al_u614_o,\u_img/inst_dob_i48_014 }),
    .c({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[4]}),
    .d({vga_rdaddr_piped_piped[5],vga_rdaddr_piped_piped[5]}),
    .f({_al_u615_o,_al_u692_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0011010100000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u620|_al_u619  (
    .a({open_n2935,\u_img/inst_dob_i20_004 }),
    .b({_al_u619_o,\u_img/inst_dob_i22_004 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({_al_u618_o,vga_rdaddr_piped_piped[2]}),
    .f({_al_u620_o,_al_u619_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~A*~(D*~C*~B))"),
    //.LUTG0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~A*~(D*~C*~B))"),
    .INIT_LUTF0(16'b0011010100000000),
    .INIT_LUTF1(16'b0101010001010101),
    .INIT_LUTG0(16'b0011010100000000),
    .INIT_LUTG1(16'b0101010001010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u621|_al_u617  (
    .a({_al_u620_o,\u_img/inst_dob_i28_004 }),
    .b({_al_u616_o,\u_img/inst_dob_i30_004 }),
    .c({_al_u617_o,vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[2]}),
    .f({_al_u621_o,_al_u617_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0011010100000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u626|_al_u625  (
    .a({open_n2980,\u_img/inst_dob_i4_004 }),
    .b({_al_u625_o,\u_img/inst_dob_i6_004 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({_al_u624_o,vga_rdaddr_piped_piped[2]}),
    .f({_al_u626_o,_al_u625_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~A*~(D*~C*~B))"),
    //.LUTG0("(D*~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~A*~(D*~C*~B))"),
    .INIT_LUTF0(16'b0011010100000000),
    .INIT_LUTF1(16'b0101010001010101),
    .INIT_LUTG0(16'b0011010100000000),
    .INIT_LUTG1(16'b0101010001010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u627|_al_u623  (
    .a({_al_u626_o,\u_img/inst_dob_i12_004 }),
    .b({_al_u622_o,\u_img/inst_dob_i14_004 }),
    .c({_al_u623_o,vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[2]}),
    .f({_al_u627_o,_al_u623_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT_LUT0(16'b0000000011001010),
    .INIT_LUT1(16'b0000000010101100),
    .MODE("LOGIC"))
    \_al_u628|_al_u691  (
    .a({_al_u621_o,\u_img/inst_dob_i0_014 }),
    .b({_al_u627_o,\u_img/inst_dob_i16_014 }),
    .c({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[4]}),
    .d({vga_rdaddr_piped_piped[5],vga_rdaddr_piped_piped[5]}),
    .f({_al_u628_o,_al_u691_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(C*~D))"),
    //.LUTF1("(C*~(~D*~(~B*~A)))"),
    //.LUTG0("(B*~(C*~D))"),
    //.LUTG1("(C*~(~D*~(~B*~A)))"),
    .INIT_LUTF0(16'b1100110000001100),
    .INIT_LUTF1(16'b1111000000010000),
    .INIT_LUTG0(16'b1100110000001100),
    .INIT_LUTG1(16'b1111000000010000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u630|_al_u629  (
    .a({_al_u615_o,open_n3045}),
    .b({_al_u628_o,vga_rden}),
    .c({_al_u629_o,vga_rdaddr_piped_piped[6]}),
    .d({vga_rdaddr_piped_piped[6],\u_img/inst_dob_i64_004 }),
    .f({vga_b_pad[7],_al_u629_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b0011000000111111),
    .MODE("LOGIC"))
    \_al_u631|_al_u633  (
    .a({open_n3070,_al_u631_o}),
    .b({\u_img/inst_dob_i10_003 ,_al_u632_o}),
    .c(vga_rdaddr_piped_piped[1:2]),
    .d({\u_img/inst_dob_i8_003 ,vga_rdaddr_piped_piped[3]}),
    .f({_al_u631_o,_al_u633_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUT1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUT0(16'b0011000000111111),
    .INIT_LUT1(16'b0011000000111111),
    .MODE("LOGIC"))
    \_al_u632|_al_u730  (
    .b({\u_img/inst_dob_i14_003 ,\u_img/inst_dob_i22_001 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({\u_img/inst_dob_i12_003 ,\u_img/inst_dob_i20_001 }),
    .f({_al_u632_o,_al_u730_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~D*~(~C*~B*~A))"),
    //.LUTG0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~D*~(~C*~B*~A))"),
    .INIT_LUTF0(16'b0000000011001010),
    .INIT_LUTF1(16'b0000000011111110),
    .INIT_LUTG0(16'b0000000011001010),
    .INIT_LUTG1(16'b0000000011111110),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u636|_al_u635  (
    .a({_al_u634_o,\u_img/inst_dob_i0_003 }),
    .b({_al_u635_o,\u_img/inst_dob_i2_003 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u636_o,_al_u635_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTF1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUTF0(16'b0011000000111111),
    .INIT_LUTF1(16'b0011000000111111),
    .INIT_LUTG0(16'b0011000000111111),
    .INIT_LUTG1(16'b0011000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u637|_al_u725  (
    .b({\u_img/inst_dob_i22_003 ,\u_img/inst_dob_i2_001 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({\u_img/inst_dob_i20_003 ,\u_img/inst_dob_i0_001 }),
    .f({_al_u637_o,_al_u725_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTF1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUTF0(16'b0011000000111111),
    .INIT_LUTF1(16'b0011000000111111),
    .INIT_LUTG0(16'b0011000000111111),
    .INIT_LUTG1(16'b0011000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u638|_al_u718  (
    .b({\u_img/inst_dob_i18_003 ,\u_img/inst_dob_i50_001 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({\u_img/inst_dob_i16_003 ,\u_img/inst_dob_i48_001 }),
    .f({_al_u638_o,_al_u718_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(D*~(C*~B*~A))"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b1110111100000000),
    .MODE("LOGIC"))
    \_al_u642|_al_u641  (
    .a({_al_u640_o,\u_img/inst_dob_i28_003 }),
    .b({_al_u641_o,\u_img/inst_dob_i30_003 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u642_o,_al_u641_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("(~(D*~C)*~(B*~A))"),
    .INIT_LUT0(16'b0000000010101100),
    .INIT_LUT1(16'b1011000010111011),
    .MODE("LOGIC"))
    \_al_u643|_al_u639  (
    .a({_al_u633_o,_al_u637_o}),
    .b({_al_u636_o,_al_u638_o}),
    .c({_al_u639_o,vga_rdaddr_piped_piped[2]}),
    .d({_al_u642_o,vga_rdaddr_piped_piped[3]}),
    .f({_al_u643_o,_al_u639_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b0011000000111111),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b0011000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u644|_al_u646  (
    .a({open_n3229,_al_u644_o}),
    .b({\u_img/inst_dob_i38_003 ,_al_u645_o}),
    .c(vga_rdaddr_piped_piped[1:2]),
    .d({\u_img/inst_dob_i36_003 ,vga_rdaddr_piped_piped[3]}),
    .f({_al_u644_o,_al_u646_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUT1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUT0(16'b0011000000111111),
    .INIT_LUT1(16'b0011000000111111),
    .MODE("LOGIC"))
    \_al_u645|_al_u717  (
    .b({\u_img/inst_dob_i34_003 ,\u_img/inst_dob_i54_001 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({\u_img/inst_dob_i32_003 ,\u_img/inst_dob_i52_001 }),
    .f({_al_u645_o,_al_u717_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~D*~(C*~B*~A))"),
    //.LUTG0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~D*~(C*~B*~A))"),
    .INIT_LUTF0(16'b0000000011001010),
    .INIT_LUTF1(16'b0000000011101111),
    .INIT_LUTG0(16'b0000000011001010),
    .INIT_LUTG1(16'b0000000011101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u649|_al_u648  (
    .a({_al_u647_o,\u_img/inst_dob_i40_003 }),
    .b({_al_u648_o,\u_img/inst_dob_i42_003 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u649_o,_al_u648_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUT1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUT0(16'b0011000000111111),
    .INIT_LUT1(16'b0011000000111111),
    .MODE("LOGIC"))
    \_al_u650|_al_u712  (
    .b({\u_img/inst_dob_i54_003 ,\u_img/inst_dob_i34_001 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({\u_img/inst_dob_i52_003 ,\u_img/inst_dob_i32_001 }),
    .f({_al_u650_o,_al_u712_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTF1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUTF0(16'b0011000000111111),
    .INIT_LUTF1(16'b0011000000111111),
    .INIT_LUTG0(16'b0011000000111111),
    .INIT_LUTG1(16'b0011000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u651|_al_u679  (
    .b({\u_img/inst_dob_i50_003 ,\u_img/inst_dob_i58_002 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({\u_img/inst_dob_i48_003 ,\u_img/inst_dob_i56_002 }),
    .f({_al_u651_o,_al_u679_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(D*~(C*~B*~A))"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b1110111100000000),
    .MODE("LOGIC"))
    \_al_u655|_al_u654  (
    .a({_al_u653_o,\u_img/inst_dob_i60_003 }),
    .b({_al_u654_o,\u_img/inst_dob_i62_003 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u655_o,_al_u654_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("(~(D*~C)*~(B*~A))"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("(~(D*~C)*~(B*~A))"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b1011000010111011),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b1011000010111011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u656|_al_u652  (
    .a({_al_u646_o,_al_u650_o}),
    .b({_al_u649_o,_al_u651_o}),
    .c({_al_u652_o,vga_rdaddr_piped_piped[2]}),
    .d({_al_u655_o,vga_rdaddr_piped_piped[3]}),
    .f({_al_u656_o,_al_u652_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~A*~(D*~B))"),
    //.LUTF1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(C*~A*~(D*~B))"),
    //.LUTG1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUTF0(16'b0100000001010000),
    .INIT_LUTF1(16'b0000000011001010),
    .INIT_LUTG0(16'b0100000001010000),
    .INIT_LUTG1(16'b0000000011001010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u657|_al_u658  (
    .a({_al_u643_o,_al_u657_o}),
    .b({_al_u656_o,\u_img/inst_dob_i64_003 }),
    .c({vga_rdaddr_piped_piped[5],vga_rden}),
    .d({vga_rdaddr_piped_piped[6],vga_rdaddr_piped_piped[6]}),
    .f({_al_u657_o,vga_b_pad[6]}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUT0(16'b0000000010101100),
    .INIT_LUT1(16'b0011000000111111),
    .MODE("LOGIC"))
    \_al_u659|_al_u661  (
    .a({open_n3416,_al_u659_o}),
    .b({\u_img/inst_dob_i6_002 ,_al_u660_o}),
    .c(vga_rdaddr_piped_piped[1:2]),
    .d({\u_img/inst_dob_i4_002 ,vga_rdaddr_piped_piped[3]}),
    .f({_al_u659_o,_al_u661_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTF1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUTF0(16'b0011000000111111),
    .INIT_LUTF1(16'b0011000000111111),
    .INIT_LUTG0(16'b0011000000111111),
    .INIT_LUTG1(16'b0011000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u660|_al_u678  (
    .b({\u_img/inst_dob_i2_002 ,\u_img/inst_dob_i62_002 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({\u_img/inst_dob_i0_002 ,\u_img/inst_dob_i60_002 }),
    .f({_al_u660_o,_al_u678_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~D*~(C*~B*~A))"),
    //.LUTG0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~D*~(C*~B*~A))"),
    .INIT_LUTF0(16'b0000000011001010),
    .INIT_LUTF1(16'b0000000011101111),
    .INIT_LUTG0(16'b0000000011001010),
    .INIT_LUTG1(16'b0000000011101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u664|_al_u663  (
    .a({_al_u662_o,\u_img/inst_dob_i8_002 }),
    .b({_al_u663_o,\u_img/inst_dob_i10_002 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u664_o,_al_u663_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUT1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUT0(16'b0011000000111111),
    .INIT_LUT1(16'b0011000000111111),
    .MODE("LOGIC"))
    \_al_u665|_al_u673  (
    .b({\u_img/inst_dob_i22_002 ,\u_img/inst_dob_i34_002 }),
    .c({vga_rdaddr_piped_piped[1],vga_rdaddr_piped_piped[1]}),
    .d({\u_img/inst_dob_i20_002 ,\u_img/inst_dob_i32_002 }),
    .f({_al_u665_o,_al_u673_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(D*~(C*~B*~A))"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b1110111100000000),
    .MODE("LOGIC"))
    \_al_u670|_al_u669  (
    .a({_al_u668_o,\u_img/inst_dob_i28_002 }),
    .b({_al_u669_o,\u_img/inst_dob_i30_002 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u670_o,_al_u669_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("(~(D*~C)*~(B*~A))"),
    .INIT_LUT0(16'b0000000010101100),
    .INIT_LUT1(16'b1011000010111011),
    .MODE("LOGIC"))
    \_al_u671|_al_u667  (
    .a({_al_u661_o,_al_u665_o}),
    .b({_al_u664_o,_al_u666_o}),
    .c({_al_u667_o,vga_rdaddr_piped_piped[2]}),
    .d({_al_u670_o,vga_rdaddr_piped_piped[3]}),
    .f({_al_u671_o,_al_u667_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b0011000000111111),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b0011000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u672|_al_u674  (
    .a({open_n3549,_al_u672_o}),
    .b({\u_img/inst_dob_i38_002 ,_al_u673_o}),
    .c(vga_rdaddr_piped_piped[1:2]),
    .d({\u_img/inst_dob_i36_002 ,vga_rdaddr_piped_piped[3]}),
    .f({_al_u672_o,_al_u674_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~D*~(C*~B*~A))"),
    //.LUTG0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~D*~(C*~B*~A))"),
    .INIT_LUTF0(16'b0000000011001010),
    .INIT_LUTF1(16'b0000000011101111),
    .INIT_LUTG0(16'b0000000011001010),
    .INIT_LUTG1(16'b0000000011101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u677|_al_u676  (
    .a({_al_u675_o,\u_img/inst_dob_i40_002 }),
    .b({_al_u676_o,\u_img/inst_dob_i42_002 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u677_o,_al_u676_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(D*~(~C*~B*~A))"),
    .INIT_LUT0(16'b0000000011001010),
    .INIT_LUT1(16'b1111111000000000),
    .MODE("LOGIC"))
    \_al_u683|_al_u682  (
    .a({_al_u681_o,\u_img/inst_dob_i48_002 }),
    .b({_al_u682_o,\u_img/inst_dob_i50_002 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u683_o,_al_u682_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("(~(D*~C)*~(B*~A))"),
    //.LUTG0("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("(~(D*~C)*~(B*~A))"),
    .INIT_LUTF0(16'b1010110000000000),
    .INIT_LUTF1(16'b1011000010111011),
    .INIT_LUTG0(16'b1010110000000000),
    .INIT_LUTG1(16'b1011000010111011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u684|_al_u680  (
    .a({_al_u674_o,_al_u678_o}),
    .b({_al_u677_o,_al_u679_o}),
    .c({_al_u680_o,vga_rdaddr_piped_piped[2]}),
    .d({_al_u683_o,vga_rdaddr_piped_piped[3]}),
    .f({_al_u684_o,_al_u680_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~A*~(D*~B))"),
    //.LUT1("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT_LUT0(16'b0100000001010000),
    .INIT_LUT1(16'b0000000011001010),
    .MODE("LOGIC"))
    \_al_u685|_al_u686  (
    .a({_al_u671_o,_al_u685_o}),
    .b({_al_u684_o,\u_img/inst_dob_i64_002 }),
    .c({vga_rdaddr_piped_piped[5],vga_rden}),
    .d({vga_rdaddr_piped_piped[6],vga_rdaddr_piped_piped[6]}),
    .f({_al_u685_o,vga_b_pad[5]}));
  // sources/rtl/camera_reader.v(51)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b1100101000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b1100101000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u688|u_camera_reader/write_pixel_reg  (
    .a({\u_img/inst_dob_i32_015 ,open_n3662}),
    .b({\u_img/inst_dob_i48_015 ,\u_camera_reader/wrclk1 }),
    .c({vga_rdaddr_piped_piped[4],\u_camera_reader/write_pixel }),
    .clk(\u_camera_reader/wrclk1 ),
    .d({vga_rdaddr_piped_piped[5],\u_camera_reader/n27 }),
    .mi({open_n3667,\u_camera_reader/n2 }),
    .f({_al_u688_o,camera_wrreq}),
    .q({open_n3683,\u_camera_reader/write_pixel }));  // sources/rtl/camera_reader.v(51)
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C*~D))"),
    //.LUT1("(C*~(~D*~B*~A))"),
    .INIT_LUT0(16'b1100110000001100),
    .INIT_LUT1(16'b1111000011100000),
    .MODE("LOGIC"))
    \_al_u690|_al_u689  (
    .a({_al_u687_o,open_n3684}),
    .b({_al_u688_o,vga_rden}),
    .c({_al_u689_o,vga_rdaddr_piped_piped[6]}),
    .d({vga_rdaddr_piped_piped[6],\u_img/inst_dob_i64_015 }),
    .f({vga_r_pad[7],_al_u689_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C*~D))"),
    //.LUT1("(C*~(~D*~B*~A))"),
    .INIT_LUT0(16'b1100110000001100),
    .INIT_LUT1(16'b1111000011100000),
    .MODE("LOGIC"))
    \_al_u694|_al_u693  (
    .a({_al_u691_o,open_n3705}),
    .b({_al_u692_o,vga_rden}),
    .c({_al_u693_o,vga_rdaddr_piped_piped[6]}),
    .d({vga_rdaddr_piped_piped[6],\u_img/inst_dob_i64_014 }),
    .f({vga_r_pad[6],_al_u693_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(C*~D))"),
    //.LUTF1("(C*~(~D*~B*~A))"),
    //.LUTG0("(B*~(C*~D))"),
    //.LUTG1("(C*~(~D*~B*~A))"),
    .INIT_LUTF0(16'b1100110000001100),
    .INIT_LUTF1(16'b1111000011100000),
    .INIT_LUTG0(16'b1100110000001100),
    .INIT_LUTG1(16'b1111000011100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u698|_al_u697  (
    .a({_al_u695_o,open_n3726}),
    .b({_al_u696_o,vga_rden}),
    .c({_al_u697_o,vga_rdaddr_piped_piped[6]}),
    .d({vga_rdaddr_piped_piped[6],\u_img/inst_dob_i64_013 }),
    .f({vga_r_pad[5],_al_u697_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(C*~D))"),
    //.LUTF1("(C*~(~D*~B*~A))"),
    //.LUTG0("(B*~(C*~D))"),
    //.LUTG1("(C*~(~D*~B*~A))"),
    .INIT_LUTF0(16'b1100110000001100),
    .INIT_LUTF1(16'b1111000011100000),
    .INIT_LUTG0(16'b1100110000001100),
    .INIT_LUTG1(16'b1111000011100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u702|_al_u701  (
    .a({_al_u699_o,open_n3751}),
    .b({_al_u700_o,vga_rden}),
    .c({_al_u701_o,vga_rdaddr_piped_piped[6]}),
    .d({vga_rdaddr_piped_piped[6],\u_img/inst_dob_i64_012 }),
    .f({vga_r_pad[4],_al_u701_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C*~D))"),
    //.LUT1("(C*~(~D*~B*~A))"),
    .INIT_LUT0(16'b1100110000001100),
    .INIT_LUT1(16'b1111000011100000),
    .MODE("LOGIC"))
    \_al_u706|_al_u705  (
    .a({_al_u703_o,open_n3776}),
    .b({_al_u704_o,vga_rden}),
    .c({_al_u705_o,vga_rdaddr_piped_piped[6]}),
    .d({vga_rdaddr_piped_piped[6],\u_img/inst_dob_i64_011 }),
    .f({vga_r_pad[3],_al_u705_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C*~D))"),
    //.LUT1("(C*~(~D*~B*~A))"),
    .INIT_LUT0(16'b1100110000001100),
    .INIT_LUT1(16'b1111000011100000),
    .MODE("LOGIC"))
    \_al_u710|_al_u709  (
    .a({_al_u707_o,open_n3797}),
    .b({_al_u708_o,vga_rden}),
    .c({_al_u709_o,vga_rdaddr_piped_piped[6]}),
    .d({vga_rdaddr_piped_piped[6],\u_img/inst_dob_i64_010 }),
    .f({vga_g_pad[7],_al_u709_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUT0(16'b0000000010101100),
    .INIT_LUT1(16'b0011000000111111),
    .MODE("LOGIC"))
    \_al_u711|_al_u713  (
    .a({open_n3818,_al_u711_o}),
    .b({\u_img/inst_dob_i38_001 ,_al_u712_o}),
    .c(vga_rdaddr_piped_piped[1:2]),
    .d({\u_img/inst_dob_i36_001 ,vga_rdaddr_piped_piped[3]}),
    .f({_al_u711_o,_al_u713_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~D*~(C*~B*~A))"),
    //.LUTG0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~D*~(C*~B*~A))"),
    .INIT_LUTF0(16'b0000000011001010),
    .INIT_LUTF1(16'b0000000011101111),
    .INIT_LUTG0(16'b0000000011001010),
    .INIT_LUTG1(16'b0000000011101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u716|_al_u715  (
    .a({_al_u714_o,\u_img/inst_dob_i40_001 }),
    .b({_al_u715_o,\u_img/inst_dob_i42_001 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u716_o,_al_u715_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(D*~(C*~B*~A))"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b1110111100000000),
    .MODE("LOGIC"))
    \_al_u722|_al_u721  (
    .a({_al_u720_o,\u_img/inst_dob_i60_001 }),
    .b({_al_u721_o,\u_img/inst_dob_i62_001 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u722_o,_al_u721_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("(~(D*~C)*~(B*~A))"),
    .INIT_LUT0(16'b0000000010101100),
    .INIT_LUT1(16'b1011000010111011),
    .MODE("LOGIC"))
    \_al_u723|_al_u719  (
    .a({_al_u713_o,_al_u717_o}),
    .b({_al_u716_o,_al_u718_o}),
    .c({_al_u719_o,vga_rdaddr_piped_piped[2]}),
    .d({_al_u722_o,vga_rdaddr_piped_piped[3]}),
    .f({_al_u723_o,_al_u719_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b0011000000111111),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b0011000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u724|_al_u726  (
    .a({open_n3903,_al_u724_o}),
    .b({\u_img/inst_dob_i6_001 ,_al_u725_o}),
    .c(vga_rdaddr_piped_piped[1:2]),
    .d({\u_img/inst_dob_i4_001 ,vga_rdaddr_piped_piped[3]}),
    .f({_al_u724_o,_al_u726_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~D*~(C*~B*~A))"),
    //.LUTG0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~D*~(C*~B*~A))"),
    .INIT_LUTF0(16'b0000000011001010),
    .INIT_LUTF1(16'b0000000011101111),
    .INIT_LUTG0(16'b0000000011001010),
    .INIT_LUTG1(16'b0000000011101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u729|_al_u728  (
    .a({_al_u727_o,\u_img/inst_dob_i8_001 }),
    .b({_al_u728_o,\u_img/inst_dob_i10_001 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u729_o,_al_u728_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(D*~(C*~B*~A))"),
    .INIT_LUT0(16'b1100101000000000),
    .INIT_LUT1(16'b1110111100000000),
    .MODE("LOGIC"))
    \_al_u735|_al_u734  (
    .a({_al_u733_o,\u_img/inst_dob_i28_001 }),
    .b({_al_u734_o,\u_img/inst_dob_i30_001 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u735_o,_al_u734_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("(~(D*~C)*~(B*~A))"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("(~(D*~C)*~(B*~A))"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b1011000010111011),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b1011000010111011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u736|_al_u732  (
    .a({_al_u726_o,_al_u730_o}),
    .b({_al_u729_o,_al_u731_o}),
    .c({_al_u732_o,vga_rdaddr_piped_piped[2]}),
    .d({_al_u735_o,vga_rdaddr_piped_piped[3]}),
    .f({_al_u736_o,_al_u732_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~A*~(D*~B))"),
    //.LUT1("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT_LUT0(16'b0100000001010000),
    .INIT_LUT1(16'b0000000010101100),
    .MODE("LOGIC"))
    \_al_u737|_al_u738  (
    .a({_al_u723_o,_al_u737_o}),
    .b({_al_u736_o,\u_img/inst_dob_i64_001 }),
    .c({vga_rdaddr_piped_piped[5],vga_rden}),
    .d({vga_rdaddr_piped_piped[6],vga_rdaddr_piped_piped[6]}),
    .f({_al_u737_o,vga_b_pad[4]}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUT0(16'b0000000010101100),
    .INIT_LUT1(16'b0011000000111111),
    .MODE("LOGIC"))
    \_al_u739|_al_u741  (
    .a({open_n4016,_al_u739_o}),
    .b({\u_img/inst_dob_i38_000 ,_al_u740_o}),
    .c(vga_rdaddr_piped_piped[1:2]),
    .d({\u_img/inst_dob_i36_000 ,vga_rdaddr_piped_piped[3]}),
    .f({_al_u739_o,_al_u741_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~D*~(C*~B*~A))"),
    //.LUTG0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~D*~(C*~B*~A))"),
    .INIT_LUTF0(16'b0000000011001010),
    .INIT_LUTF1(16'b0000000011101111),
    .INIT_LUTG0(16'b0000000011001010),
    .INIT_LUTG1(16'b0000000011101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u744|_al_u743  (
    .a({_al_u742_o,\u_img/inst_dob_i40_000 }),
    .b({_al_u743_o,\u_img/inst_dob_i42_000 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u744_o,_al_u743_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(D*~(C*~B*~A))"),
    .INIT_LUT0(16'b0000000011001010),
    .INIT_LUT1(16'b1110111100000000),
    .MODE("LOGIC"))
    \_al_u750|_al_u749  (
    .a({_al_u748_o,\u_img/inst_dob_i56_000 }),
    .b({_al_u749_o,\u_img/inst_dob_i58_000 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u750_o,_al_u749_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUT1("(~(D*~C)*~(B*~A))"),
    .INIT_LUT0(16'b0000000010101100),
    .INIT_LUT1(16'b1011000010111011),
    .MODE("LOGIC"))
    \_al_u751|_al_u747  (
    .a({_al_u741_o,_al_u745_o}),
    .b({_al_u744_o,_al_u746_o}),
    .c({_al_u747_o,vga_rdaddr_piped_piped[2]}),
    .d({_al_u750_o,vga_rdaddr_piped_piped[3]}),
    .f({_al_u751_o,_al_u747_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUTG0("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    .INIT_LUTF0(16'b0000000010101100),
    .INIT_LUTF1(16'b0011000000111111),
    .INIT_LUTG0(16'b0000000010101100),
    .INIT_LUTG1(16'b0011000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u752|_al_u754  (
    .a({open_n4101,_al_u752_o}),
    .b({\u_img/inst_dob_i6_000 ,_al_u753_o}),
    .c(vga_rdaddr_piped_piped[1:2]),
    .d({\u_img/inst_dob_i4_000 ,vga_rdaddr_piped_piped[3]}),
    .f({_al_u752_o,_al_u754_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTF1("(~D*~(C*~B*~A))"),
    //.LUTG0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUTG1("(~D*~(C*~B*~A))"),
    .INIT_LUTF0(16'b0000000011001010),
    .INIT_LUTF1(16'b0000000011101111),
    .INIT_LUTG0(16'b0000000011001010),
    .INIT_LUTG1(16'b0000000011101111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u757|_al_u756  (
    .a({_al_u755_o,\u_img/inst_dob_i8_000 }),
    .b({_al_u756_o,\u_img/inst_dob_i10_000 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u757_o,_al_u756_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    //.LUT1("(D*~(~C*~B*~A))"),
    .INIT_LUT0(16'b0000000011001010),
    .INIT_LUT1(16'b1111111000000000),
    .MODE("LOGIC"))
    \_al_u763|_al_u762  (
    .a({_al_u761_o,\u_img/inst_dob_i16_000 }),
    .b({_al_u762_o,\u_img/inst_dob_i18_000 }),
    .c({vga_rdaddr_piped_piped[3],vga_rdaddr_piped_piped[1]}),
    .d({vga_rdaddr_piped_piped[4],vga_rdaddr_piped_piped[2]}),
    .f({_al_u763_o,_al_u762_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTF1("(~(D*~C)*~(B*~A))"),
    //.LUTG0("(D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG1("(~(D*~C)*~(B*~A))"),
    .INIT_LUTF0(16'b1010110000000000),
    .INIT_LUTF1(16'b1011000010111011),
    .INIT_LUTG0(16'b1010110000000000),
    .INIT_LUTG1(16'b1011000010111011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u764|_al_u760  (
    .a({_al_u754_o,_al_u758_o}),
    .b({_al_u757_o,_al_u759_o}),
    .c({_al_u760_o,vga_rdaddr_piped_piped[2]}),
    .d({_al_u763_o,vga_rdaddr_piped_piped[3]}),
    .f({_al_u764_o,_al_u760_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~A*~(D*~B))"),
    //.LUTF1("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    //.LUTG0("(C*~A*~(D*~B))"),
    //.LUTG1("(~D*(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C))"),
    .INIT_LUTF0(16'b0100000001010000),
    .INIT_LUTF1(16'b0000000010101100),
    .INIT_LUTG0(16'b0100000001010000),
    .INIT_LUTG1(16'b0000000010101100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u765|_al_u766  (
    .a({_al_u751_o,_al_u765_o}),
    .b({_al_u764_o,\u_img/inst_dob_i64_000 }),
    .c({vga_rdaddr_piped_piped[5],vga_rden}),
    .d({vga_rdaddr_piped_piped[6],vga_rdaddr_piped_piped[6]}),
    .f({_al_u765_o,vga_b_pad[3]}));
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  camera_init u_camera_init (
    .clk(clk_sccb),
    .reset_n(cam_rst_pad),
    .sda_in(cam_soid_pad),
    .scl(cam_soic),
    .sda(sda),
    .sda_oe(sda_oe));  // sources/rtl/test_camera.v(84)
  EG_PHY_LSLICE #(
    //.MACRO("u_camera_reader/add0/ucin_al_u770"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_camera_reader/add0/u11_al_u773  (
    .a({\u_camera_reader/pixel_counter [13],\u_camera_reader/pixel_counter [11]}),
    .b({\u_camera_reader/pixel_counter [14],\u_camera_reader/pixel_counter [12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_camera_reader/add0/c11 ),
    .f({\u_camera_reader/n8 [13],\u_camera_reader/n8 [11]}),
    .fco(\u_camera_reader/add0/c15 ),
    .fx({\u_camera_reader/n8 [14],\u_camera_reader/n8 [12]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_camera_reader/add0/ucin_al_u770"),
    //.R_POSITION("X0Y2Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_camera_reader/add0/u15_al_u774  (
    .a({\u_camera_reader/pixel_counter [17],\u_camera_reader/pixel_counter [15]}),
    .b({\u_camera_reader/pixel_counter [18],\u_camera_reader/pixel_counter [16]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_camera_reader/add0/c15 ),
    .f({\u_camera_reader/n8 [17],\u_camera_reader/n8 [15]}),
    .fco(\u_camera_reader/add0/c19 ),
    .fx({\u_camera_reader/n8 [18],\u_camera_reader/n8 [16]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_camera_reader/add0/ucin_al_u770"),
    //.R_POSITION("X0Y2Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_camera_reader/add0/u19_al_u775  (
    .a({open_n4302,\u_camera_reader/pixel_counter [19]}),
    .c(2'b00),
    .d({open_n4307,1'b0}),
    .fci(\u_camera_reader/add0/c19 ),
    .f({open_n4324,\u_camera_reader/n8 [19]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_camera_reader/add0/ucin_al_u770"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_camera_reader/add0/u3_al_u771  (
    .a({\u_camera_reader/pixel_counter [5],\u_camera_reader/pixel_counter [3]}),
    .b({\u_camera_reader/pixel_counter [6],\u_camera_reader/pixel_counter [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_camera_reader/add0/c3 ),
    .f({\u_camera_reader/n8 [5],\u_camera_reader/n8 [3]}),
    .fco(\u_camera_reader/add0/c7 ),
    .fx({\u_camera_reader/n8 [6],\u_camera_reader/n8 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_camera_reader/add0/ucin_al_u770"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_camera_reader/add0/u7_al_u772  (
    .a({\u_camera_reader/pixel_counter [9],\u_camera_reader/pixel_counter [7]}),
    .b({\u_camera_reader/pixel_counter [10],\u_camera_reader/pixel_counter [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_camera_reader/add0/c7 ),
    .f({\u_camera_reader/n8 [9],\u_camera_reader/n8 [7]}),
    .fco(\u_camera_reader/add0/c11 ),
    .fx({\u_camera_reader/n8 [10],\u_camera_reader/n8 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_camera_reader/add0/ucin_al_u770"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_camera_reader/add0/ucin_al_u770  (
    .a({\u_camera_reader/pixel_counter [1],1'b0}),
    .b({\u_camera_reader/pixel_counter [2],\u_camera_reader/pixel_counter [0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({\u_camera_reader/n8 [1],open_n4383}),
    .fco(\u_camera_reader/add0/c3 ),
    .fx({\u_camera_reader/n8 [2],\u_camera_reader/n8 [0]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_camera_reader/add1/ucin_al_u776"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_camera_reader/add1/u11_al_u779  (
    .a({camera_addr[13],camera_addr[11]}),
    .b({camera_addr[14],camera_addr[12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_camera_reader/add1/c11 ),
    .f({\u_camera_reader/n9 [13],\u_camera_reader/n9 [11]}),
    .fco(\u_camera_reader/add1/c15 ),
    .fx({\u_camera_reader/n9 [14],\u_camera_reader/n9 [12]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_camera_reader/add1/ucin_al_u776"),
    //.R_POSITION("X0Y2Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_camera_reader/add1/u15_al_u780  (
    .a({open_n4404,camera_addr[15]}),
    .c(2'b00),
    .d({open_n4409,1'b0}),
    .fci(\u_camera_reader/add1/c15 ),
    .f({open_n4426,\u_camera_reader/n9 [15]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_camera_reader/add1/ucin_al_u776"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_camera_reader/add1/u3_al_u777  (
    .a({camera_addr[5],camera_addr[3]}),
    .b({camera_addr[6],camera_addr[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_camera_reader/add1/c3 ),
    .f({\u_camera_reader/n9 [5],\u_camera_reader/n9 [3]}),
    .fco(\u_camera_reader/add1/c7 ),
    .fx({\u_camera_reader/n9 [6],\u_camera_reader/n9 [4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_camera_reader/add1/ucin_al_u776"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_camera_reader/add1/u7_al_u778  (
    .a({camera_addr[9],camera_addr[7]}),
    .b({camera_addr[10],camera_addr[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u_camera_reader/add1/c7 ),
    .f({\u_camera_reader/n9 [9],\u_camera_reader/n9 [7]}),
    .fco(\u_camera_reader/add1/c11 ),
    .fx({\u_camera_reader/n9 [10],\u_camera_reader/n9 [8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u_camera_reader/add1/ucin_al_u776"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u_camera_reader/add1/ucin_al_u776  (
    .a({camera_addr[1],1'b0}),
    .b({camera_addr[2],camera_addr[0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({\u_camera_reader/n9 [1],open_n4485}),
    .fco(\u_camera_reader/add1/c3 ),
    .fx({\u_camera_reader/n9 [2],\u_camera_reader/n9 [0]}));
  EG_PHY_MSLICE #(
    //.MACRO("u_camera_reader/lt0_0|u_camera_reader/lt0_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_camera_reader/lt0_0|u_camera_reader/lt0_cin  (
    .a(2'b00),
    .b({\u_camera_reader/pixel_counter [0],open_n4488}),
    .fco(\u_camera_reader/lt0_c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_camera_reader/lt0_0|u_camera_reader/lt0_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_camera_reader/lt0_10|u_camera_reader/lt0_9  (
    .a(2'b00),
    .b(\u_camera_reader/pixel_counter [10:9]),
    .fci(\u_camera_reader/lt0_c9 ),
    .fco(\u_camera_reader/lt0_c11 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_camera_reader/lt0_0|u_camera_reader/lt0_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_camera_reader/lt0_12|u_camera_reader/lt0_11  (
    .a(2'b00),
    .b(\u_camera_reader/pixel_counter [12:11]),
    .fci(\u_camera_reader/lt0_c11 ),
    .fco(\u_camera_reader/lt0_c13 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_camera_reader/lt0_0|u_camera_reader/lt0_cin"),
    //.R_POSITION("X0Y3Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_camera_reader/lt0_14|u_camera_reader/lt0_13  (
    .a(2'b00),
    .b(\u_camera_reader/pixel_counter [14:13]),
    .fci(\u_camera_reader/lt0_c13 ),
    .fco(\u_camera_reader/lt0_c15 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_camera_reader/lt0_0|u_camera_reader/lt0_cin"),
    //.R_POSITION("X0Y4Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_camera_reader/lt0_16|u_camera_reader/lt0_15  (
    .a(2'b00),
    .b(\u_camera_reader/pixel_counter [16:15]),
    .fci(\u_camera_reader/lt0_c15 ),
    .fco(\u_camera_reader/lt0_c17 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_camera_reader/lt0_0|u_camera_reader/lt0_cin"),
    //.R_POSITION("X0Y4Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_camera_reader/lt0_18|u_camera_reader/lt0_17  (
    .a(2'b00),
    .b(\u_camera_reader/pixel_counter [18:17]),
    .fci(\u_camera_reader/lt0_c17 ),
    .fco(\u_camera_reader/lt0_c19 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_camera_reader/lt0_0|u_camera_reader/lt0_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_camera_reader/lt0_2|u_camera_reader/lt0_1  (
    .a(2'b01),
    .b(\u_camera_reader/pixel_counter [2:1]),
    .fci(\u_camera_reader/lt0_c1 ),
    .fco(\u_camera_reader/lt0_c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_camera_reader/lt0_0|u_camera_reader/lt0_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_camera_reader/lt0_4|u_camera_reader/lt0_3  (
    .a(2'b00),
    .b(\u_camera_reader/pixel_counter [4:3]),
    .fci(\u_camera_reader/lt0_c3 ),
    .fco(\u_camera_reader/lt0_c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_camera_reader/lt0_0|u_camera_reader/lt0_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_camera_reader/lt0_6|u_camera_reader/lt0_5  (
    .a(2'b00),
    .b(\u_camera_reader/pixel_counter [6:5]),
    .fci(\u_camera_reader/lt0_c5 ),
    .fco(\u_camera_reader/lt0_c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_camera_reader/lt0_0|u_camera_reader/lt0_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_camera_reader/lt0_8|u_camera_reader/lt0_7  (
    .a(2'b00),
    .b(\u_camera_reader/pixel_counter [8:7]),
    .fci(\u_camera_reader/lt0_c7 ),
    .fco(\u_camera_reader/lt0_c9 ));
  EG_PHY_MSLICE #(
    //.MACRO("u_camera_reader/lt0_0|u_camera_reader/lt0_cin"),
    //.R_POSITION("X0Y5Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \u_camera_reader/lt0_cout|u_camera_reader/lt0_19  (
    .a(2'b00),
    .b({1'b1,\u_camera_reader/pixel_counter [19]}),
    .fci(\u_camera_reader/lt0_c19 ),
    .f({\u_camera_reader/n27 ,open_n4748}));
  // sources/rtl/camera_reader.v(56)
  // sources/rtl/camera_reader.v(56)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg0_b0|u_camera_reader/reg0_b8  (
    .clk(camera_wrreq),
    .mi({\u_camera_reader/current_pixel [0],\u_camera_reader/current_pixel [8]}),
    .q({camera_wrdat[0],camera_wrdat[8]}));  // sources/rtl/camera_reader.v(56)
  // sources/rtl/camera_reader.v(56)
  // sources/rtl/camera_reader.v(56)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg0_b10|u_camera_reader/reg0_b7  (
    .clk(camera_wrreq),
    .mi({\u_camera_reader/current_pixel [10],\u_camera_reader/current_pixel [7]}),
    .q({camera_wrdat[10],camera_wrdat[7]}));  // sources/rtl/camera_reader.v(56)
  // sources/rtl/camera_reader.v(56)
  // sources/rtl/camera_reader.v(56)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg0_b11|u_camera_reader/reg0_b6  (
    .clk(camera_wrreq),
    .mi({\u_camera_reader/current_pixel [11],\u_camera_reader/current_pixel [6]}),
    .q({camera_wrdat[11],camera_wrdat[6]}));  // sources/rtl/camera_reader.v(56)
  // sources/rtl/camera_reader.v(56)
  // sources/rtl/camera_reader.v(56)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg0_b12|u_camera_reader/reg0_b5  (
    .clk(camera_wrreq),
    .mi({\u_camera_reader/current_pixel [12],\u_camera_reader/current_pixel [5]}),
    .q({camera_wrdat[12],camera_wrdat[5]}));  // sources/rtl/camera_reader.v(56)
  // sources/rtl/camera_reader.v(56)
  // sources/rtl/camera_reader.v(56)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg0_b13|u_camera_reader/reg0_b4  (
    .clk(camera_wrreq),
    .mi({\u_camera_reader/current_pixel [13],\u_camera_reader/current_pixel [4]}),
    .q({camera_wrdat[13],camera_wrdat[4]}));  // sources/rtl/camera_reader.v(56)
  // sources/rtl/camera_reader.v(56)
  // sources/rtl/camera_reader.v(56)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg0_b14|u_camera_reader/reg0_b3  (
    .clk(camera_wrreq),
    .mi({\u_camera_reader/current_pixel [14],\u_camera_reader/current_pixel [3]}),
    .q({camera_wrdat[14],camera_wrdat[3]}));  // sources/rtl/camera_reader.v(56)
  // sources/rtl/camera_reader.v(56)
  // sources/rtl/camera_reader.v(56)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg0_b15|u_camera_reader/reg0_b2  (
    .clk(camera_wrreq),
    .mi({\u_camera_reader/current_pixel [15],\u_camera_reader/current_pixel [2]}),
    .q({camera_wrdat[15],camera_wrdat[2]}));  // sources/rtl/camera_reader.v(56)
  // sources/rtl/camera_reader.v(56)
  // sources/rtl/camera_reader.v(56)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg0_b9|u_camera_reader/reg0_b1  (
    .clk(camera_wrreq),
    .mi({\u_camera_reader/current_pixel [9],\u_camera_reader/current_pixel [1]}),
    .q({camera_wrdat[9],camera_wrdat[1]}));  // sources/rtl/camera_reader.v(56)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \u_camera_reader/reg1_b10|u_camera_reader/reg1_b0  (
    .c({\u_camera_reader/n8 [10],\u_camera_reader/n8 [0]}),
    .clk(cam_pclk_pad),
    .d({\u_camera_reader/mux8_b0_sel_is_0_o ,\u_camera_reader/mux8_b0_sel_is_0_o }),
    .sr(cam_rst_pad_neg),
    .q({\u_camera_reader/pixel_counter [10],\u_camera_reader/pixel_counter [0]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \u_camera_reader/reg1_b11|u_camera_reader/reg1_b9  (
    .c({\u_camera_reader/n8 [11],\u_camera_reader/n8 [9]}),
    .clk(cam_pclk_pad),
    .d({\u_camera_reader/mux8_b0_sel_is_0_o ,\u_camera_reader/mux8_b0_sel_is_0_o }),
    .sr(cam_rst_pad_neg),
    .q({\u_camera_reader/pixel_counter [11],\u_camera_reader/pixel_counter [9]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \u_camera_reader/reg1_b12|u_camera_reader/reg1_b8  (
    .c({\u_camera_reader/n8 [12],\u_camera_reader/n8 [8]}),
    .clk(cam_pclk_pad),
    .d({\u_camera_reader/mux8_b0_sel_is_0_o ,\u_camera_reader/mux8_b0_sel_is_0_o }),
    .sr(cam_rst_pad_neg),
    .q({\u_camera_reader/pixel_counter [12],\u_camera_reader/pixel_counter [8]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \u_camera_reader/reg1_b13|u_camera_reader/reg1_b7  (
    .c({\u_camera_reader/n8 [13],\u_camera_reader/n8 [7]}),
    .clk(cam_pclk_pad),
    .d({\u_camera_reader/mux8_b0_sel_is_0_o ,\u_camera_reader/mux8_b0_sel_is_0_o }),
    .sr(cam_rst_pad_neg),
    .q({\u_camera_reader/pixel_counter [13],\u_camera_reader/pixel_counter [7]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \u_camera_reader/reg1_b14|u_camera_reader/reg1_b6  (
    .c({\u_camera_reader/n8 [14],\u_camera_reader/n8 [6]}),
    .clk(cam_pclk_pad),
    .d({\u_camera_reader/mux8_b0_sel_is_0_o ,\u_camera_reader/mux8_b0_sel_is_0_o }),
    .sr(cam_rst_pad_neg),
    .q({\u_camera_reader/pixel_counter [14],\u_camera_reader/pixel_counter [6]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \u_camera_reader/reg1_b15|u_camera_reader/reg1_b5  (
    .c({\u_camera_reader/n8 [15],\u_camera_reader/n8 [5]}),
    .clk(cam_pclk_pad),
    .d({\u_camera_reader/mux8_b0_sel_is_0_o ,\u_camera_reader/mux8_b0_sel_is_0_o }),
    .sr(cam_rst_pad_neg),
    .q({\u_camera_reader/pixel_counter [15],\u_camera_reader/pixel_counter [5]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \u_camera_reader/reg1_b16|u_camera_reader/reg1_b4  (
    .c({\u_camera_reader/n8 [16],\u_camera_reader/n8 [4]}),
    .clk(cam_pclk_pad),
    .d({\u_camera_reader/mux8_b0_sel_is_0_o ,\u_camera_reader/mux8_b0_sel_is_0_o }),
    .sr(cam_rst_pad_neg),
    .q({\u_camera_reader/pixel_counter [16],\u_camera_reader/pixel_counter [4]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \u_camera_reader/reg1_b17|u_camera_reader/reg1_b3  (
    .c({\u_camera_reader/n8 [17],\u_camera_reader/n8 [3]}),
    .clk(cam_pclk_pad),
    .d({\u_camera_reader/mux8_b0_sel_is_0_o ,\u_camera_reader/mux8_b0_sel_is_0_o }),
    .sr(cam_rst_pad_neg),
    .q({\u_camera_reader/pixel_counter [17],\u_camera_reader/pixel_counter [3]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \u_camera_reader/reg1_b18|u_camera_reader/reg1_b2  (
    .c({\u_camera_reader/n8 [18],\u_camera_reader/n8 [2]}),
    .clk(cam_pclk_pad),
    .d({\u_camera_reader/mux8_b0_sel_is_0_o ,\u_camera_reader/mux8_b0_sel_is_0_o }),
    .sr(cam_rst_pad_neg),
    .q({\u_camera_reader/pixel_counter [18],\u_camera_reader/pixel_counter [2]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \u_camera_reader/reg1_b1|u_camera_reader/reg1_b19  (
    .c({\u_camera_reader/n8 [1],\u_camera_reader/n8 [19]}),
    .clk(cam_pclk_pad),
    .d({\u_camera_reader/mux8_b0_sel_is_0_o ,\u_camera_reader/mux8_b0_sel_is_0_o }),
    .sr(cam_rst_pad_neg),
    .q({\u_camera_reader/pixel_counter [1],\u_camera_reader/pixel_counter [19]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUT1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100010010000000),
    .INIT_LUT1(16'b1100010010000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg2_b0|u_camera_reader/reg2_b9  (
    .a({\u_camera_reader/mux6_b0_sel_is_1_o ,\u_camera_reader/mux6_b0_sel_is_1_o }),
    .b({cam_vsync_pad,cam_vsync_pad}),
    .c({\u_camera_reader/n9 [0],\u_camera_reader/n9 [9]}),
    .ce(cam_rst_pad_neg),
    .clk(cam_pclk_pad),
    .d({camera_addr[0],camera_addr[9]}),
    .q({camera_addr[0],camera_addr[9]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTF1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100010010000000),
    .INIT_LUTF1(16'b1100010010000000),
    .INIT_LUTG0(16'b1100010010000000),
    .INIT_LUTG1(16'b1100010010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg2_b10|u_camera_reader/reg2_b8  (
    .a({\u_camera_reader/mux6_b0_sel_is_1_o ,\u_camera_reader/mux6_b0_sel_is_1_o }),
    .b({cam_vsync_pad,cam_vsync_pad}),
    .c({\u_camera_reader/n9 [10],\u_camera_reader/n9 [8]}),
    .ce(cam_rst_pad_neg),
    .clk(cam_pclk_pad),
    .d({camera_addr[10],camera_addr[8]}),
    .q({camera_addr[10],camera_addr[8]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTF1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100010010000000),
    .INIT_LUTF1(16'b1100010010000000),
    .INIT_LUTG0(16'b1100010010000000),
    .INIT_LUTG1(16'b1100010010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg2_b11|u_camera_reader/reg2_b7  (
    .a({\u_camera_reader/mux6_b0_sel_is_1_o ,\u_camera_reader/mux6_b0_sel_is_1_o }),
    .b({cam_vsync_pad,cam_vsync_pad}),
    .c({\u_camera_reader/n9 [11],\u_camera_reader/n9 [7]}),
    .ce(cam_rst_pad_neg),
    .clk(cam_pclk_pad),
    .d({camera_addr[11],camera_addr[7]}),
    .q({camera_addr[11],camera_addr[7]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUT1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100010010000000),
    .INIT_LUT1(16'b1100010010000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg2_b12|u_camera_reader/reg2_b6  (
    .a({\u_camera_reader/mux6_b0_sel_is_1_o ,\u_camera_reader/mux6_b0_sel_is_1_o }),
    .b({cam_vsync_pad,cam_vsync_pad}),
    .c({\u_camera_reader/n9 [12],\u_camera_reader/n9 [6]}),
    .ce(cam_rst_pad_neg),
    .clk(cam_pclk_pad),
    .d({camera_addr[12],camera_addr[6]}),
    .q({camera_addr[12],camera_addr[6]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUT1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100010010000000),
    .INIT_LUT1(16'b1100010010000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg2_b13|u_camera_reader/reg2_b5  (
    .a({\u_camera_reader/mux6_b0_sel_is_1_o ,\u_camera_reader/mux6_b0_sel_is_1_o }),
    .b({cam_vsync_pad,cam_vsync_pad}),
    .c({\u_camera_reader/n9 [13],\u_camera_reader/n9 [5]}),
    .ce(cam_rst_pad_neg),
    .clk(cam_pclk_pad),
    .d({camera_addr[13],camera_addr[5]}),
    .q({camera_addr[13],camera_addr[5]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTF1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100010010000000),
    .INIT_LUTF1(16'b1100010010000000),
    .INIT_LUTG0(16'b1100010010000000),
    .INIT_LUTG1(16'b1100010010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg2_b14|u_camera_reader/reg2_b4  (
    .a({\u_camera_reader/mux6_b0_sel_is_1_o ,\u_camera_reader/mux6_b0_sel_is_1_o }),
    .b({cam_vsync_pad,cam_vsync_pad}),
    .c({\u_camera_reader/n9 [14],\u_camera_reader/n9 [4]}),
    .ce(cam_rst_pad_neg),
    .clk(cam_pclk_pad),
    .d({camera_addr[14],camera_addr[4]}),
    .q({camera_addr[14],camera_addr[4]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTF1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUTG1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100010010000000),
    .INIT_LUTF1(16'b1100010010000000),
    .INIT_LUTG0(16'b1100010010000000),
    .INIT_LUTG1(16'b1100010010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg2_b15|u_camera_reader/reg2_b3  (
    .a({\u_camera_reader/mux6_b0_sel_is_1_o ,\u_camera_reader/mux6_b0_sel_is_1_o }),
    .b({cam_vsync_pad,cam_vsync_pad}),
    .c({\u_camera_reader/n9 [15],\u_camera_reader/n9 [3]}),
    .ce(cam_rst_pad_neg),
    .clk(cam_pclk_pad),
    .d({camera_addr[15],camera_addr[3]}),
    .q({camera_addr[15],camera_addr[3]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_MSLICE #(
    //.LUT0("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    //.LUT1("(B*(D*~(C)*~(A)+D*C*~(A)+~(D)*C*A+D*C*A))"),
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100010010000000),
    .INIT_LUT1(16'b1100010010000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg2_b1|u_camera_reader/reg2_b2  (
    .a({\u_camera_reader/mux6_b0_sel_is_1_o ,\u_camera_reader/mux6_b0_sel_is_1_o }),
    .b({cam_vsync_pad,cam_vsync_pad}),
    .c({\u_camera_reader/n9 [1],\u_camera_reader/n9 [2]}),
    .ce(cam_rst_pad_neg),
    .clk(cam_pclk_pad),
    .d({camera_addr[1],camera_addr[2]}),
    .q({camera_addr[1],camera_addr[2]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg3_b1|u_camera_reader/reg3_b7  (
    .ce(\u_camera_reader/mux13_b0_sel_is_2_o ),
    .clk(cam_pclk_pad),
    .mi({cam_data_pad[1],cam_data_pad[7]}),
    .q({\u_camera_reader/subpixel [1],\u_camera_reader/subpixel [7]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg3_b2|u_camera_reader/reg3_b6  (
    .ce(\u_camera_reader/mux13_b0_sel_is_2_o ),
    .clk(cam_pclk_pad),
    .mi({cam_data_pad[2],cam_data_pad[6]}),
    .q({\u_camera_reader/subpixel [2],\u_camera_reader/subpixel [6]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg3_b3|u_camera_reader/reg3_b5  (
    .ce(\u_camera_reader/mux13_b0_sel_is_2_o ),
    .clk(cam_pclk_pad),
    .mi({cam_data_pad[3],cam_data_pad[5]}),
    .q({\u_camera_reader/subpixel [3],\u_camera_reader/subpixel [5]}));  // sources/rtl/camera_reader.v(95)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg3_b4  (
    .ce(\u_camera_reader/mux13_b0_sel_is_2_o ),
    .clk(cam_pclk_pad),
    .mi({open_n5472,cam_data_pad[4]}),
    .q({open_n5479,\u_camera_reader/subpixel [4]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg4_b10|u_camera_reader/reg4_b7  (
    .ce(\u_camera_reader/mux14_b0_sel_is_2_o ),
    .clk(cam_pclk_pad),
    .mi({\u_camera_reader/subpixel [2],cam_data_pad[7]}),
    .q({\u_camera_reader/current_pixel [10],\u_camera_reader/current_pixel [7]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg4_b11|u_camera_reader/reg4_b6  (
    .ce(\u_camera_reader/mux14_b0_sel_is_2_o ),
    .clk(cam_pclk_pad),
    .mi({\u_camera_reader/subpixel [3],cam_data_pad[6]}),
    .q({\u_camera_reader/current_pixel [11],\u_camera_reader/current_pixel [6]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg4_b12|u_camera_reader/reg4_b5  (
    .ce(\u_camera_reader/mux14_b0_sel_is_2_o ),
    .clk(cam_pclk_pad),
    .mi({\u_camera_reader/subpixel [4],cam_data_pad[5]}),
    .q({\u_camera_reader/current_pixel [12],\u_camera_reader/current_pixel [5]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg4_b13|u_camera_reader/reg4_b4  (
    .ce(\u_camera_reader/mux14_b0_sel_is_2_o ),
    .clk(cam_pclk_pad),
    .mi({\u_camera_reader/subpixel [5],cam_data_pad[4]}),
    .q({\u_camera_reader/current_pixel [13],\u_camera_reader/current_pixel [4]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg4_b14|u_camera_reader/reg4_b3  (
    .ce(\u_camera_reader/mux14_b0_sel_is_2_o ),
    .clk(cam_pclk_pad),
    .mi({\u_camera_reader/subpixel [6],cam_data_pad[3]}),
    .q({\u_camera_reader/current_pixel [14],\u_camera_reader/current_pixel [3]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg4_b15|u_camera_reader/reg4_b2  (
    .ce(\u_camera_reader/mux14_b0_sel_is_2_o ),
    .clk(cam_pclk_pad),
    .mi({\u_camera_reader/subpixel [7],cam_data_pad[2]}),
    .q({\u_camera_reader/current_pixel [15],\u_camera_reader/current_pixel [2]}));  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  // sources/rtl/camera_reader.v(95)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg4_b8|u_camera_reader/reg4_b1  (
    .ce(\u_camera_reader/mux14_b0_sel_is_2_o ),
    .clk(cam_pclk_pad),
    .mi({\u_camera_reader/subpixel [0],cam_data_pad[1]}),
    .q({\u_camera_reader/current_pixel [8],\u_camera_reader/current_pixel [1]}));  // sources/rtl/camera_reader.v(95)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u_camera_reader/reg4_b9  (
    .ce(\u_camera_reader/mux14_b0_sel_is_2_o ),
    .clk(cam_pclk_pad),
    .mi({open_n5682,\u_camera_reader/subpixel [1]}),
    .q({open_n5689,\u_camera_reader/current_pixel [9]}));  // sources/rtl/camera_reader.v(95)
  // address_offset=0;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0004"),
    //.WID("0x0004"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_000000_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o ,camera_addr[11:10]}),
    .csb({\and_Nvga_rdaddr[12]__o ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i0_008 ,\u_img/inst_dob_i0_007 ,\u_img/inst_dob_i0_006 ,\u_img/inst_dob_i0_005 ,\u_img/inst_dob_i0_004 ,\u_img/inst_dob_i0_003 ,\u_img/inst_dob_i0_002 ,\u_img/inst_dob_i0_001 ,\u_img/inst_dob_i0_000 }));
  // address_offset=0;data_offset=9;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0005"),
    //.WID("0x0005"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_000000_009  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n5712,open_n5713,open_n5714,open_n5715,open_n5716,open_n5717,open_n5718,camera_wrdat[9],open_n5719}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n5742,open_n5743,open_n5744,open_n5745,open_n5746,open_n5747,open_n5748,open_n5749,\u_img/inst_dob_i0_009 }));
  // address_offset=0;data_offset=10;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0006"),
    //.WID("0x0006"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_000000_010  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n5750,open_n5751,open_n5752,open_n5753,open_n5754,open_n5755,open_n5756,camera_wrdat[10],open_n5757}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n5780,open_n5781,open_n5782,open_n5783,open_n5784,open_n5785,open_n5786,open_n5787,\u_img/inst_dob_i0_010 }));
  // address_offset=0;data_offset=11;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0007"),
    //.WID("0x0007"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_000000_011  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n5788,open_n5789,open_n5790,open_n5791,open_n5792,open_n5793,open_n5794,camera_wrdat[11],open_n5795}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n5818,open_n5819,open_n5820,open_n5821,open_n5822,open_n5823,open_n5824,open_n5825,\u_img/inst_dob_i0_011 }));
  // address_offset=0;data_offset=12;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0008"),
    //.WID("0x0008"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_000000_012  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n5826,open_n5827,open_n5828,open_n5829,open_n5830,open_n5831,open_n5832,camera_wrdat[12],open_n5833}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n5856,open_n5857,open_n5858,open_n5859,open_n5860,open_n5861,open_n5862,open_n5863,\u_img/inst_dob_i0_012 }));
  // address_offset=0;data_offset=13;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0009"),
    //.WID("0x0009"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_000000_013  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n5864,open_n5865,open_n5866,open_n5867,open_n5868,open_n5869,open_n5870,camera_wrdat[13],open_n5871}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n5894,open_n5895,open_n5896,open_n5897,open_n5898,open_n5899,open_n5900,open_n5901,\u_img/inst_dob_i0_013 }));
  // address_offset=0;data_offset=14;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x000A"),
    //.WID("0x000A"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_000000_014  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n5902,open_n5903,open_n5904,open_n5905,open_n5906,open_n5907,open_n5908,camera_wrdat[14],open_n5909}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n5932,open_n5933,open_n5934,open_n5935,open_n5936,open_n5937,open_n5938,open_n5939,\u_img/inst_dob_i0_014 }));
  // address_offset=0;data_offset=15;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x000B"),
    //.WID("0x000B"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_000000_015  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n5940,open_n5941,open_n5942,open_n5943,open_n5944,open_n5945,open_n5946,camera_wrdat[15],open_n5947}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n5970,open_n5971,open_n5972,open_n5973,open_n5974,open_n5975,open_n5976,open_n5977,\u_img/inst_dob_i0_015 }));
  // address_offset=1024;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x000C"),
    //.WID("0x000C"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_001024_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o ,camera_addr[11:10]}),
    .csb({\and_Nvga_rdaddr[12]__o ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i2_008 ,\u_img/inst_dob_i2_007 ,\u_img/inst_dob_i2_006 ,\u_img/inst_dob_i2_005 ,\u_img/inst_dob_i2_004 ,\u_img/inst_dob_i2_003 ,\u_img/inst_dob_i2_002 ,\u_img/inst_dob_i2_001 ,\u_img/inst_dob_i2_000 }));
  // address_offset=2048;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x000D"),
    //.WID("0x000D"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_002048_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o ,camera_addr[11:10]}),
    .csb({\and_Nvga_rdaddr[12]__o ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i4_008 ,\u_img/inst_dob_i4_007 ,\u_img/inst_dob_i4_006 ,\u_img/inst_dob_i4_005 ,\u_img/inst_dob_i4_004 ,\u_img/inst_dob_i4_003 ,\u_img/inst_dob_i4_002 ,\u_img/inst_dob_i4_001 ,\u_img/inst_dob_i4_000 }));
  // address_offset=3072;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x000E"),
    //.WID("0x000E"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_003072_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o ,camera_addr[11:10]}),
    .csb({\and_Nvga_rdaddr[12]__o ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i6_008 ,\u_img/inst_dob_i6_007 ,\u_img/inst_dob_i6_006 ,\u_img/inst_dob_i6_005 ,\u_img/inst_dob_i6_004 ,\u_img/inst_dob_i6_003 ,\u_img/inst_dob_i6_002 ,\u_img/inst_dob_i6_001 ,\u_img/inst_dob_i6_000 }));
  // address_offset=4096;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x000F"),
    //.WID("0x000F"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_004096_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o ,camera_addr[11:10]}),
    .csb({\and_vga_rdaddr[12]_N_o ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i8_008 ,\u_img/inst_dob_i8_007 ,\u_img/inst_dob_i8_006 ,\u_img/inst_dob_i8_005 ,\u_img/inst_dob_i8_004 ,\u_img/inst_dob_i8_003 ,\u_img/inst_dob_i8_002 ,\u_img/inst_dob_i8_001 ,\u_img/inst_dob_i8_000 }));
  // address_offset=5120;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0010"),
    //.WID("0x0010"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_005120_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o ,camera_addr[11:10]}),
    .csb({\and_vga_rdaddr[12]_N_o ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i10_008 ,\u_img/inst_dob_i10_007 ,\u_img/inst_dob_i10_006 ,\u_img/inst_dob_i10_005 ,\u_img/inst_dob_i10_004 ,\u_img/inst_dob_i10_003 ,\u_img/inst_dob_i10_002 ,\u_img/inst_dob_i10_001 ,\u_img/inst_dob_i10_000 }));
  // address_offset=6144;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0011"),
    //.WID("0x0011"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_006144_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o ,camera_addr[11:10]}),
    .csb({\and_vga_rdaddr[12]_N_o ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i12_008 ,\u_img/inst_dob_i12_007 ,\u_img/inst_dob_i12_006 ,\u_img/inst_dob_i12_005 ,\u_img/inst_dob_i12_004 ,\u_img/inst_dob_i12_003 ,\u_img/inst_dob_i12_002 ,\u_img/inst_dob_i12_001 ,\u_img/inst_dob_i12_000 }));
  // address_offset=7168;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0012"),
    //.WID("0x0012"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_007168_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o ,camera_addr[11:10]}),
    .csb({\and_vga_rdaddr[12]_N_o ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i14_008 ,\u_img/inst_dob_i14_007 ,\u_img/inst_dob_i14_006 ,\u_img/inst_dob_i14_005 ,\u_img/inst_dob_i14_004 ,\u_img/inst_dob_i14_003 ,\u_img/inst_dob_i14_002 ,\u_img/inst_dob_i14_001 ,\u_img/inst_dob_i14_000 }));
  // address_offset=8192;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0013"),
    //.WID("0x0013"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_008192_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n177 ,camera_addr[11:10]}),
    .csb({\and_Nvga_rdaddr[12]__o_al_n180 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i16_008 ,\u_img/inst_dob_i16_007 ,\u_img/inst_dob_i16_006 ,\u_img/inst_dob_i16_005 ,\u_img/inst_dob_i16_004 ,\u_img/inst_dob_i16_003 ,\u_img/inst_dob_i16_002 ,\u_img/inst_dob_i16_001 ,\u_img/inst_dob_i16_000 }));
  // address_offset=8192;data_offset=9;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0014"),
    //.WID("0x0014"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_008192_009  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n6154,open_n6155,open_n6156,open_n6157,open_n6158,open_n6159,open_n6160,camera_wrdat[9],open_n6161}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n6184,open_n6185,open_n6186,open_n6187,open_n6188,open_n6189,open_n6190,open_n6191,\u_img/inst_dob_i16_009 }));
  // address_offset=8192;data_offset=10;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0015"),
    //.WID("0x0015"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_008192_010  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n6192,open_n6193,open_n6194,open_n6195,open_n6196,open_n6197,open_n6198,camera_wrdat[10],open_n6199}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n6222,open_n6223,open_n6224,open_n6225,open_n6226,open_n6227,open_n6228,open_n6229,\u_img/inst_dob_i16_010 }));
  // address_offset=8192;data_offset=11;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0016"),
    //.WID("0x0016"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_008192_011  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n6230,open_n6231,open_n6232,open_n6233,open_n6234,open_n6235,open_n6236,camera_wrdat[11],open_n6237}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n6260,open_n6261,open_n6262,open_n6263,open_n6264,open_n6265,open_n6266,open_n6267,\u_img/inst_dob_i16_011 }));
  // address_offset=8192;data_offset=12;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0017"),
    //.WID("0x0017"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_008192_012  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n6268,open_n6269,open_n6270,open_n6271,open_n6272,open_n6273,open_n6274,camera_wrdat[12],open_n6275}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n6298,open_n6299,open_n6300,open_n6301,open_n6302,open_n6303,open_n6304,open_n6305,\u_img/inst_dob_i16_012 }));
  // address_offset=8192;data_offset=13;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0018"),
    //.WID("0x0018"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_008192_013  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n6306,open_n6307,open_n6308,open_n6309,open_n6310,open_n6311,open_n6312,camera_wrdat[13],open_n6313}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n6336,open_n6337,open_n6338,open_n6339,open_n6340,open_n6341,open_n6342,open_n6343,\u_img/inst_dob_i16_013 }));
  // address_offset=8192;data_offset=14;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0019"),
    //.WID("0x0019"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_008192_014  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n6344,open_n6345,open_n6346,open_n6347,open_n6348,open_n6349,open_n6350,camera_wrdat[14],open_n6351}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n6374,open_n6375,open_n6376,open_n6377,open_n6378,open_n6379,open_n6380,open_n6381,\u_img/inst_dob_i16_014 }));
  // address_offset=8192;data_offset=15;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x001A"),
    //.WID("0x001A"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_008192_015  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n6382,open_n6383,open_n6384,open_n6385,open_n6386,open_n6387,open_n6388,camera_wrdat[15],open_n6389}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n6412,open_n6413,open_n6414,open_n6415,open_n6416,open_n6417,open_n6418,open_n6419,\u_img/inst_dob_i16_015 }));
  // address_offset=9216;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x001B"),
    //.WID("0x001B"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_009216_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n177 ,camera_addr[11:10]}),
    .csb({\and_Nvga_rdaddr[12]__o_al_n180 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i18_008 ,\u_img/inst_dob_i18_007 ,\u_img/inst_dob_i18_006 ,\u_img/inst_dob_i18_005 ,\u_img/inst_dob_i18_004 ,\u_img/inst_dob_i18_003 ,\u_img/inst_dob_i18_002 ,\u_img/inst_dob_i18_001 ,\u_img/inst_dob_i18_000 }));
  // address_offset=10240;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x001C"),
    //.WID("0x001C"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_010240_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n177 ,camera_addr[11:10]}),
    .csb({\and_Nvga_rdaddr[12]__o_al_n180 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i20_008 ,\u_img/inst_dob_i20_007 ,\u_img/inst_dob_i20_006 ,\u_img/inst_dob_i20_005 ,\u_img/inst_dob_i20_004 ,\u_img/inst_dob_i20_003 ,\u_img/inst_dob_i20_002 ,\u_img/inst_dob_i20_001 ,\u_img/inst_dob_i20_000 }));
  // address_offset=11264;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x001D"),
    //.WID("0x001D"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_011264_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n177 ,camera_addr[11:10]}),
    .csb({\and_Nvga_rdaddr[12]__o_al_n180 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i22_008 ,\u_img/inst_dob_i22_007 ,\u_img/inst_dob_i22_006 ,\u_img/inst_dob_i22_005 ,\u_img/inst_dob_i22_004 ,\u_img/inst_dob_i22_003 ,\u_img/inst_dob_i22_002 ,\u_img/inst_dob_i22_001 ,\u_img/inst_dob_i22_000 }));
  // address_offset=12288;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x001E"),
    //.WID("0x001E"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_012288_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n193 ,camera_addr[11:10]}),
    .csb({\and_vga_rdaddr[12]_v_o ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i24_008 ,\u_img/inst_dob_i24_007 ,\u_img/inst_dob_i24_006 ,\u_img/inst_dob_i24_005 ,\u_img/inst_dob_i24_004 ,\u_img/inst_dob_i24_003 ,\u_img/inst_dob_i24_002 ,\u_img/inst_dob_i24_001 ,\u_img/inst_dob_i24_000 }));
  // address_offset=13312;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x001F"),
    //.WID("0x001F"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_013312_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n193 ,camera_addr[11:10]}),
    .csb({\and_vga_rdaddr[12]_v_o ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i26_008 ,\u_img/inst_dob_i26_007 ,\u_img/inst_dob_i26_006 ,\u_img/inst_dob_i26_005 ,\u_img/inst_dob_i26_004 ,\u_img/inst_dob_i26_003 ,\u_img/inst_dob_i26_002 ,\u_img/inst_dob_i26_001 ,\u_img/inst_dob_i26_000 }));
  // address_offset=14336;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0020"),
    //.WID("0x0020"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_014336_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n193 ,camera_addr[11:10]}),
    .csb({\and_vga_rdaddr[12]_v_o ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i28_008 ,\u_img/inst_dob_i28_007 ,\u_img/inst_dob_i28_006 ,\u_img/inst_dob_i28_005 ,\u_img/inst_dob_i28_004 ,\u_img/inst_dob_i28_003 ,\u_img/inst_dob_i28_002 ,\u_img/inst_dob_i28_001 ,\u_img/inst_dob_i28_000 }));
  // address_offset=15360;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0021"),
    //.WID("0x0021"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_015360_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n193 ,camera_addr[11:10]}),
    .csb({\and_vga_rdaddr[12]_v_o ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i30_008 ,\u_img/inst_dob_i30_007 ,\u_img/inst_dob_i30_006 ,\u_img/inst_dob_i30_005 ,\u_img/inst_dob_i30_004 ,\u_img/inst_dob_i30_003 ,\u_img/inst_dob_i30_002 ,\u_img/inst_dob_i30_001 ,\u_img/inst_dob_i30_000 }));
  // address_offset=16384;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0022"),
    //.WID("0x0022"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_016384_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n208 ,camera_addr[11:10]}),
    .csb({\and_Nvga_rdaddr[12]__o_al_n211 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i32_008 ,\u_img/inst_dob_i32_007 ,\u_img/inst_dob_i32_006 ,\u_img/inst_dob_i32_005 ,\u_img/inst_dob_i32_004 ,\u_img/inst_dob_i32_003 ,\u_img/inst_dob_i32_002 ,\u_img/inst_dob_i32_001 ,\u_img/inst_dob_i32_000 }));
  // address_offset=16384;data_offset=9;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0023"),
    //.WID("0x0023"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_016384_009  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n6596,open_n6597,open_n6598,open_n6599,open_n6600,open_n6601,open_n6602,camera_wrdat[9],open_n6603}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n6626,open_n6627,open_n6628,open_n6629,open_n6630,open_n6631,open_n6632,open_n6633,\u_img/inst_dob_i32_009 }));
  // address_offset=16384;data_offset=10;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0024"),
    //.WID("0x0024"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_016384_010  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n6634,open_n6635,open_n6636,open_n6637,open_n6638,open_n6639,open_n6640,camera_wrdat[10],open_n6641}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n6664,open_n6665,open_n6666,open_n6667,open_n6668,open_n6669,open_n6670,open_n6671,\u_img/inst_dob_i32_010 }));
  // address_offset=16384;data_offset=11;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0025"),
    //.WID("0x0025"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_016384_011  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n6672,open_n6673,open_n6674,open_n6675,open_n6676,open_n6677,open_n6678,camera_wrdat[11],open_n6679}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n6702,open_n6703,open_n6704,open_n6705,open_n6706,open_n6707,open_n6708,open_n6709,\u_img/inst_dob_i32_011 }));
  // address_offset=16384;data_offset=12;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0026"),
    //.WID("0x0026"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_016384_012  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n6710,open_n6711,open_n6712,open_n6713,open_n6714,open_n6715,open_n6716,camera_wrdat[12],open_n6717}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n6740,open_n6741,open_n6742,open_n6743,open_n6744,open_n6745,open_n6746,open_n6747,\u_img/inst_dob_i32_012 }));
  // address_offset=16384;data_offset=13;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0027"),
    //.WID("0x0027"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_016384_013  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n6748,open_n6749,open_n6750,open_n6751,open_n6752,open_n6753,open_n6754,camera_wrdat[13],open_n6755}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n6778,open_n6779,open_n6780,open_n6781,open_n6782,open_n6783,open_n6784,open_n6785,\u_img/inst_dob_i32_013 }));
  // address_offset=16384;data_offset=14;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0028"),
    //.WID("0x0028"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_016384_014  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n6786,open_n6787,open_n6788,open_n6789,open_n6790,open_n6791,open_n6792,camera_wrdat[14],open_n6793}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n6816,open_n6817,open_n6818,open_n6819,open_n6820,open_n6821,open_n6822,open_n6823,\u_img/inst_dob_i32_014 }));
  // address_offset=16384;data_offset=15;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0029"),
    //.WID("0x0029"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_016384_015  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n6824,open_n6825,open_n6826,open_n6827,open_n6828,open_n6829,open_n6830,camera_wrdat[15],open_n6831}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n6854,open_n6855,open_n6856,open_n6857,open_n6858,open_n6859,open_n6860,open_n6861,\u_img/inst_dob_i32_015 }));
  // address_offset=17408;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x002A"),
    //.WID("0x002A"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_017408_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n208 ,camera_addr[11:10]}),
    .csb({\and_Nvga_rdaddr[12]__o_al_n211 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i34_008 ,\u_img/inst_dob_i34_007 ,\u_img/inst_dob_i34_006 ,\u_img/inst_dob_i34_005 ,\u_img/inst_dob_i34_004 ,\u_img/inst_dob_i34_003 ,\u_img/inst_dob_i34_002 ,\u_img/inst_dob_i34_001 ,\u_img/inst_dob_i34_000 }));
  // address_offset=18432;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x002B"),
    //.WID("0x002B"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_018432_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n208 ,camera_addr[11:10]}),
    .csb({\and_Nvga_rdaddr[12]__o_al_n211 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i36_008 ,\u_img/inst_dob_i36_007 ,\u_img/inst_dob_i36_006 ,\u_img/inst_dob_i36_005 ,\u_img/inst_dob_i36_004 ,\u_img/inst_dob_i36_003 ,\u_img/inst_dob_i36_002 ,\u_img/inst_dob_i36_001 ,\u_img/inst_dob_i36_000 }));
  // address_offset=19456;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x002C"),
    //.WID("0x002C"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_019456_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n208 ,camera_addr[11:10]}),
    .csb({\and_Nvga_rdaddr[12]__o_al_n211 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i38_008 ,\u_img/inst_dob_i38_007 ,\u_img/inst_dob_i38_006 ,\u_img/inst_dob_i38_005 ,\u_img/inst_dob_i38_004 ,\u_img/inst_dob_i38_003 ,\u_img/inst_dob_i38_002 ,\u_img/inst_dob_i38_001 ,\u_img/inst_dob_i38_000 }));
  // address_offset=20480;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x002D"),
    //.WID("0x002D"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_020480_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n224 ,camera_addr[11:10]}),
    .csb({\and_vga_rdaddr[12]_N_o_al_n227 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i40_008 ,\u_img/inst_dob_i40_007 ,\u_img/inst_dob_i40_006 ,\u_img/inst_dob_i40_005 ,\u_img/inst_dob_i40_004 ,\u_img/inst_dob_i40_003 ,\u_img/inst_dob_i40_002 ,\u_img/inst_dob_i40_001 ,\u_img/inst_dob_i40_000 }));
  // address_offset=21504;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x002E"),
    //.WID("0x002E"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_021504_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n224 ,camera_addr[11:10]}),
    .csb({\and_vga_rdaddr[12]_N_o_al_n227 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i42_008 ,\u_img/inst_dob_i42_007 ,\u_img/inst_dob_i42_006 ,\u_img/inst_dob_i42_005 ,\u_img/inst_dob_i42_004 ,\u_img/inst_dob_i42_003 ,\u_img/inst_dob_i42_002 ,\u_img/inst_dob_i42_001 ,\u_img/inst_dob_i42_000 }));
  // address_offset=22528;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x002F"),
    //.WID("0x002F"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_022528_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n224 ,camera_addr[11:10]}),
    .csb({\and_vga_rdaddr[12]_N_o_al_n227 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i44_008 ,\u_img/inst_dob_i44_007 ,\u_img/inst_dob_i44_006 ,\u_img/inst_dob_i44_005 ,\u_img/inst_dob_i44_004 ,\u_img/inst_dob_i44_003 ,\u_img/inst_dob_i44_002 ,\u_img/inst_dob_i44_001 ,\u_img/inst_dob_i44_000 }));
  // address_offset=23552;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0030"),
    //.WID("0x0030"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_023552_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n224 ,camera_addr[11:10]}),
    .csb({\and_vga_rdaddr[12]_N_o_al_n227 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i46_008 ,\u_img/inst_dob_i46_007 ,\u_img/inst_dob_i46_006 ,\u_img/inst_dob_i46_005 ,\u_img/inst_dob_i46_004 ,\u_img/inst_dob_i46_003 ,\u_img/inst_dob_i46_002 ,\u_img/inst_dob_i46_001 ,\u_img/inst_dob_i46_000 }));
  // address_offset=24576;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0031"),
    //.WID("0x0031"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_024576_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n240 ,camera_addr[11:10]}),
    .csb({\and_Nvga_rdaddr[12]__o_al_n243 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i48_008 ,\u_img/inst_dob_i48_007 ,\u_img/inst_dob_i48_006 ,\u_img/inst_dob_i48_005 ,\u_img/inst_dob_i48_004 ,\u_img/inst_dob_i48_003 ,\u_img/inst_dob_i48_002 ,\u_img/inst_dob_i48_001 ,\u_img/inst_dob_i48_000 }));
  // address_offset=24576;data_offset=9;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0032"),
    //.WID("0x0032"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_024576_009  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n7038,open_n7039,open_n7040,open_n7041,open_n7042,open_n7043,open_n7044,camera_wrdat[9],open_n7045}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n7068,open_n7069,open_n7070,open_n7071,open_n7072,open_n7073,open_n7074,open_n7075,\u_img/inst_dob_i48_009 }));
  // address_offset=24576;data_offset=10;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0033"),
    //.WID("0x0033"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_024576_010  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n7076,open_n7077,open_n7078,open_n7079,open_n7080,open_n7081,open_n7082,camera_wrdat[10],open_n7083}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n7106,open_n7107,open_n7108,open_n7109,open_n7110,open_n7111,open_n7112,open_n7113,\u_img/inst_dob_i48_010 }));
  // address_offset=24576;data_offset=11;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0034"),
    //.WID("0x0034"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_024576_011  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n7114,open_n7115,open_n7116,open_n7117,open_n7118,open_n7119,open_n7120,camera_wrdat[11],open_n7121}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n7144,open_n7145,open_n7146,open_n7147,open_n7148,open_n7149,open_n7150,open_n7151,\u_img/inst_dob_i48_011 }));
  // address_offset=24576;data_offset=12;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0035"),
    //.WID("0x0035"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_024576_012  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n7152,open_n7153,open_n7154,open_n7155,open_n7156,open_n7157,open_n7158,camera_wrdat[12],open_n7159}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n7182,open_n7183,open_n7184,open_n7185,open_n7186,open_n7187,open_n7188,open_n7189,\u_img/inst_dob_i48_012 }));
  // address_offset=24576;data_offset=13;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0036"),
    //.WID("0x0036"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_024576_013  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n7190,open_n7191,open_n7192,open_n7193,open_n7194,open_n7195,open_n7196,camera_wrdat[13],open_n7197}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n7220,open_n7221,open_n7222,open_n7223,open_n7224,open_n7225,open_n7226,open_n7227,\u_img/inst_dob_i48_013 }));
  // address_offset=24576;data_offset=14;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0037"),
    //.WID("0x0037"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_024576_014  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n7228,open_n7229,open_n7230,open_n7231,open_n7232,open_n7233,open_n7234,camera_wrdat[14],open_n7235}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n7258,open_n7259,open_n7260,open_n7261,open_n7262,open_n7263,open_n7264,open_n7265,\u_img/inst_dob_i48_014 }));
  // address_offset=24576;data_offset=15;depth=8192;width=1;num_section=1;width_per_section=1;section_size=16;working_depth=8192;working_width=1;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0038"),
    //.WID("0x0038"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("INV"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("INV"),
    .DATA_WIDTH_A("1"),
    .DATA_WIDTH_B("1"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_024576_015  (
    .addra(camera_addr[12:0]),
    .addrb(vga_rdaddr[12:0]),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa(camera_addr[15:13]),
    .csb(vga_rdaddr[15:13]),
    .dia({open_n7266,open_n7267,open_n7268,open_n7269,open_n7270,open_n7271,open_n7272,camera_wrdat[15],open_n7273}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({open_n7296,open_n7297,open_n7298,open_n7299,open_n7300,open_n7301,open_n7302,open_n7303,\u_img/inst_dob_i48_015 }));
  // address_offset=25600;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0039"),
    //.WID("0x0039"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_025600_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n240 ,camera_addr[11:10]}),
    .csb({\and_Nvga_rdaddr[12]__o_al_n243 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i50_008 ,\u_img/inst_dob_i50_007 ,\u_img/inst_dob_i50_006 ,\u_img/inst_dob_i50_005 ,\u_img/inst_dob_i50_004 ,\u_img/inst_dob_i50_003 ,\u_img/inst_dob_i50_002 ,\u_img/inst_dob_i50_001 ,\u_img/inst_dob_i50_000 }));
  // address_offset=26624;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x003A"),
    //.WID("0x003A"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_026624_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n240 ,camera_addr[11:10]}),
    .csb({\and_Nvga_rdaddr[12]__o_al_n243 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i52_008 ,\u_img/inst_dob_i52_007 ,\u_img/inst_dob_i52_006 ,\u_img/inst_dob_i52_005 ,\u_img/inst_dob_i52_004 ,\u_img/inst_dob_i52_003 ,\u_img/inst_dob_i52_002 ,\u_img/inst_dob_i52_001 ,\u_img/inst_dob_i52_000 }));
  // address_offset=27648;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x003B"),
    //.WID("0x003B"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_027648_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[12]_o_al_n240 ,camera_addr[11:10]}),
    .csb({\and_Nvga_rdaddr[12]__o_al_n243 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i54_008 ,\u_img/inst_dob_i54_007 ,\u_img/inst_dob_i54_006 ,\u_img/inst_dob_i54_005 ,\u_img/inst_dob_i54_004 ,\u_img/inst_dob_i54_003 ,\u_img/inst_dob_i54_002 ,\u_img/inst_dob_i54_001 ,\u_img/inst_dob_i54_000 }));
  // address_offset=28672;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x003C"),
    //.WID("0x003C"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_028672_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n256 ,camera_addr[11:10]}),
    .csb({\and_vga_rdaddr[12]_v_o_al_n259 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i56_008 ,\u_img/inst_dob_i56_007 ,\u_img/inst_dob_i56_006 ,\u_img/inst_dob_i56_005 ,\u_img/inst_dob_i56_004 ,\u_img/inst_dob_i56_003 ,\u_img/inst_dob_i56_002 ,\u_img/inst_dob_i56_001 ,\u_img/inst_dob_i56_000 }));
  // address_offset=29696;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x003D"),
    //.WID("0x003D"),
    .CSA0("SIG"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_029696_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n256 ,camera_addr[11:10]}),
    .csb({\and_vga_rdaddr[12]_v_o_al_n259 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i58_008 ,\u_img/inst_dob_i58_007 ,\u_img/inst_dob_i58_006 ,\u_img/inst_dob_i58_005 ,\u_img/inst_dob_i58_004 ,\u_img/inst_dob_i58_003 ,\u_img/inst_dob_i58_002 ,\u_img/inst_dob_i58_001 ,\u_img/inst_dob_i58_000 }));
  // address_offset=30720;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x003E"),
    //.WID("0x003E"),
    .CSA0("INV"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_030720_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n256 ,camera_addr[11:10]}),
    .csb({\and_vga_rdaddr[12]_v_o_al_n259 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i60_008 ,\u_img/inst_dob_i60_007 ,\u_img/inst_dob_i60_006 ,\u_img/inst_dob_i60_005 ,\u_img/inst_dob_i60_004 ,\u_img/inst_dob_i60_003 ,\u_img/inst_dob_i60_002 ,\u_img/inst_dob_i60_001 ,\u_img/inst_dob_i60_000 }));
  // address_offset=31744;data_offset=0;depth=1024;width=9;num_section=1;width_per_section=9;section_size=16;working_depth=1024;working_width=9;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x003F"),
    //.WID("0x003F"),
    .CSA0("SIG"),
    .CSA1("SIG"),
    .CSA2("SIG"),
    .CSB0("SIG"),
    .CSB1("SIG"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .MODE("DP8K"),
    .OCEAMUX("0"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_031744_000  (
    .addra({camera_addr[9:0],3'b111}),
    .addrb({vga_rdaddr[9:0],3'b111}),
    .cea(camera_wrreq),
    .ceb(vga_rden),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_camera_addr[12]__o_al_n256 ,camera_addr[11:10]}),
    .csb({\and_vga_rdaddr[12]_v_o_al_n259 ,vga_rdaddr[11:10]}),
    .dia(camera_wrdat[8:0]),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .dob({\u_img/inst_dob_i62_008 ,\u_img/inst_dob_i62_007 ,\u_img/inst_dob_i62_006 ,\u_img/inst_dob_i62_005 ,\u_img/inst_dob_i62_004 ,\u_img/inst_dob_i62_003 ,\u_img/inst_dob_i62_002 ,\u_img/inst_dob_i62_001 ,\u_img/inst_dob_i62_000 }));
  // address_offset=32768;data_offset=0;depth=32;width=16;num_section=1;width_per_section=16;section_size=16;working_depth=512;working_width=18;address_step=1;bytes_in_per_section=1;
  EG_PHY_BRAM #(
    //.RID("0x0040"),
    //.WID("0x0040"),
    .CEAMUX("1"),
    .CEBMUX("1"),
    .CSA0("INV"),
    .CSA1("INV"),
    .CSA2("SIG"),
    .CSB0("INV"),
    .CSB1("INV"),
    .CSB2("SIG"),
    .DATA_WIDTH_A("18"),
    .DATA_WIDTH_B("18"),
    .MODE("PDPW8K"),
    .OCEAMUX("1"),
    .OCEBMUX("1"),
    .READBACK("OFF"),
    .REGMODE_A("OUTREG"),
    .REGMODE_B("OUTREG"),
    .RESETMODE("SYNC"),
    .RSTAMUX("INV"),
    .RSTBMUX("INV"),
    .WEAMUX("1"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    \u_img/inst_32800x16_sub_032768_000  (
    .addra({camera_addr[8:0],4'b1111}),
    .addrb({vga_rdaddr[8:0],4'b1111}),
    .clka(cam_pclk_pad),
    .clkb(clk_lcd),
    .csa({\and_Ncamera_addr[11]_o_and_camera_wrreq ,camera_addr[10:9]}),
    .csb({\and_Nvga_rdaddr[11]__o_and_vga_rden ,vga_rdaddr[10:9]}),
    .dia(camera_wrdat[8:0]),
    .dib({open_n7460,open_n7461,camera_wrdat[15:9]}),
    .rsta(cam_rst_pad),
    .rstb(cam_rst_pad),
    .doa({\u_img/inst_dob_i64_008 ,\u_img/inst_dob_i64_007 ,\u_img/inst_dob_i64_006 ,\u_img/inst_dob_i64_005 ,\u_img/inst_dob_i64_004 ,\u_img/inst_dob_i64_003 ,\u_img/inst_dob_i64_002 ,\u_img/inst_dob_i64_001 ,\u_img/inst_dob_i64_000 }),
    .dob({open_n7466,open_n7467,\u_img/inst_dob_i64_015 ,\u_img/inst_dob_i64_014 ,\u_img/inst_dob_i64_013 ,\u_img/inst_dob_i64_012 ,\u_img/inst_dob_i64_011 ,\u_img/inst_dob_i64_010 ,\u_img/inst_dob_i64_009 }));
  EG_PHY_GCLK \u_pll/bufg_feedback  (
    .clki(\u_pll/clk0_buf ),
    .clko(clk_lcd));  // al_ip/ip_pll.v(36)
  EG_PHY_PLL #(
    .CLKC0_CPHASE(19),
    .CLKC0_DIV(20),
    .CLKC0_DIV2_ENABLE("DISABLE"),
    .CLKC0_ENABLE("ENABLE"),
    .CLKC0_FPHASE(0),
    .CLKC1_CPHASE(41),
    .CLKC1_DIV(42),
    .CLKC1_DIV2_ENABLE("DISABLE"),
    .CLKC1_ENABLE("ENABLE"),
    .CLKC1_FPHASE(0),
    .CLKC2_CPHASE(125),
    .CLKC2_DIV(126),
    .CLKC2_DIV2_ENABLE("DISABLE"),
    .CLKC2_ENABLE("ENABLE"),
    .CLKC2_FPHASE(0),
    .CLKC3_CPHASE(1),
    .CLKC3_DIV(1),
    .CLKC3_DIV2_ENABLE("DISABLE"),
    .CLKC3_ENABLE("DISABLE"),
    .CLKC3_FPHASE(0),
    .CLKC4_CPHASE(1),
    .CLKC4_DIV(1),
    .CLKC4_DIV2_ENABLE("DISABLE"),
    .CLKC4_ENABLE("DISABLE"),
    .CLKC4_FPHASE(0),
    .DERIVE_PLL_CLOCKS("DISABLE"),
    .DPHASE_SOURCE("DISABLE"),
    .DYNCFG("DISABLE"),
    .FBCLK_DIV(17),
    .FEEDBK_MODE("NORMAL"),
    .FEEDBK_PATH("CLKC0_EXT"),
    .FIN("24.000"),
    .FREQ_LOCK_ACCURACY(2),
    .GEN_BASIC_CLOCK("DISABLE"),
    .GMC_GAIN(6),
    .GMC_TEST(14),
    .ICP_CURRENT(3),
    .IF_ESCLKSTSW("DISABLE"),
    .INTFB_WAKE("DISABLE"),
    .KVCO(6),
    .LPF_CAPACITOR(3),
    .LPF_RESISTOR(2),
    .NORESET("DISABLE"),
    .ODIV_MUXC0("DIV"),
    .ODIV_MUXC1("DIV"),
    .ODIV_MUXC2("DIV"),
    .ODIV_MUXC3("DIV"),
    .ODIV_MUXC4("DIV"),
    .PLLC2RST_ENA("DISABLE"),
    .PLLC34RST_ENA("DISABLE"),
    .PLLMRST_ENA("DISABLE"),
    .PLLRST_ENA("DISABLE"),
    .PLL_LOCK_MODE(0),
    .PREDIV_MUXC0("VCO"),
    .PREDIV_MUXC1("VCO"),
    .PREDIV_MUXC2("VCO"),
    .PREDIV_MUXC3("VCO"),
    .PREDIV_MUXC4("VCO"),
    .REFCLK_DIV(16),
    .REFCLK_SEL("INTERNAL"),
    .STDBY_ENABLE("DISABLE"),
    .STDBY_VCO_ENA("DISABLE"),
    .SYNC_ENABLE("DISABLE"),
    .VCO_NORESET("DISABLE"))
    \u_pll/pll_inst  (
    .daddr(6'b000000),
    .dclk(1'b0),
    .dcs(1'b0),
    .di(8'b00000000),
    .dwe(1'b0),
    .fbclk(clk_lcd),
    .psclk(1'b0),
    .psclksel(3'b000),
    .psdown(1'b0),
    .psstep(1'b0),
    .refclk(clk_24m_pad),
    .reset(1'b0),
    .stdby(1'b0),
    .clkc({open_n7468,open_n7469,clk_sccb,clk_cam,\u_pll/clk0_buf }));  // al_ip/ip_pll.v(67)
  \lcd_sync(IMG_Y=1)  u_vga_sync (
    .clk(clk_lcd),
    .rest_n(cam_rst_pad),
    .addr(vga_rdaddr),
    .img_ack(vga_rden),
    .lcd_clk(vga_clk_pad),
    .lcd_hsync(vga_hsync_pad),
    .lcd_vsync(vga_vsync_pad));  // sources/rtl/test_camera.v(102)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \vga_rdaddr_pipe_b1|vga_rdaddr_piped_pipe_b1  (
    .ce(vga_rden),
    .clk(clk_lcd),
    .mi({vga_rdaddr[10],vga_rdaddr_piped[1]}),
    .sr(cam_rst_pad_neg),
    .q({vga_rdaddr_piped[1],vga_rdaddr_piped_piped[1]}));
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \vga_rdaddr_pipe_b2|vga_rdaddr_piped_pipe_b2  (
    .ce(vga_rden),
    .clk(clk_lcd),
    .mi({vga_rdaddr[11],vga_rdaddr_piped[2]}),
    .sr(cam_rst_pad_neg),
    .q({vga_rdaddr_piped[2],vga_rdaddr_piped_piped[2]}));
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \vga_rdaddr_pipe_b3|vga_rdaddr_piped_pipe_b3  (
    .ce(vga_rden),
    .clk(clk_lcd),
    .mi({vga_rdaddr[12],vga_rdaddr_piped[3]}),
    .sr(cam_rst_pad_neg),
    .q({vga_rdaddr_piped[3],vga_rdaddr_piped_piped[3]}));
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \vga_rdaddr_pipe_b4|vga_rdaddr_piped_pipe_b4  (
    .ce(vga_rden),
    .clk(clk_lcd),
    .mi({vga_rdaddr[13],vga_rdaddr_piped[4]}),
    .sr(cam_rst_pad_neg),
    .q({vga_rdaddr_piped[4],vga_rdaddr_piped_piped[4]}));
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \vga_rdaddr_piped_pipe_b5|vga_rdaddr_pipe_b5  (
    .ce(vga_rden),
    .clk(clk_lcd),
    .mi({vga_rdaddr_piped[5],vga_rdaddr[14]}),
    .sr(cam_rst_pad_neg),
    .q({vga_rdaddr_piped_piped[5],vga_rdaddr_piped[5]}));
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \vga_rdaddr_piped_pipe_b6|vga_rdaddr_pipe_b6  (
    .ce(vga_rden),
    .clk(clk_lcd),
    .mi({vga_rdaddr_piped[6],vga_rdaddr[15]}),
    .sr(cam_rst_pad_neg),
    .q({vga_rdaddr_piped_piped[6],vga_rdaddr_piped[6]}));

endmodule 

module camera_init  // sources/rtl/camera_init.v(14)
  (
  clk,
  reset_n,
  sda_in,
  ready,
  scl,
  sda,
  sda_oe
  );

  input clk;  // sources/rtl/camera_init.v(15)
  input reset_n;  // sources/rtl/camera_init.v(16)
  input sda_in;  // sources/rtl/camera_init.v(20)
  output ready;  // sources/rtl/camera_init.v(17)
  output scl;  // sources/rtl/camera_init.v(21)
  output sda;  // sources/rtl/camera_init.v(19)
  output sda_oe;  // sources/rtl/camera_init.v(18)

  parameter REGS_TO_INIT = 178;
  // localparam CAMERA_IDLE = 18;
  // localparam CAMERA_INIT_1 = 11;
  // localparam CAMERA_INIT_2 = 12;
  // localparam CAMERA_INIT_3 = 13;
  // localparam CAMERA_INIT_4 = 14;
  // localparam CAMERA_INIT_5 = 15;
  // localparam CAMERA_INIT_6 = 16;
  // localparam CAMERA_INIT_7 = 17;
  // localparam CONTROL_REG = 3'b000;
  // localparam SLAVE_ADDRESS = 3'b001;
  // localparam SLAVE_DATA_1 = 3'b011;
  // localparam SLAVE_DATA_2 = 3'b100;
  // localparam SLAVE_REG_ADDRESS = 3'b010;
  wire [7:0] cnt;  // sources/rtl/camera_init.v(64)
  wire [7:0] counter;  // sources/rtl/camera_init.v(63)
  wire [7:0] data_in_bus;  // sources/rtl/camera_init.v(42)
  wire [8:0] divider2;  // sources/rtl/camera_init.v(67)
  wire [8:0] n0;
  wire [15:0] n184;
  wire [15:0] n185;
  wire [15:0] n187;
  wire [15:0] n196;
  wire [15:0] n198;
  wire [15:0] n200;
  wire [15:0] n201;
  wire [15:0] n203;
  wire [15:0] n204;
  wire [15:0] n206;
  wire [15:0] n207;
  wire [15:0] n209;
  wire [15:0] n212;
  wire [15:0] n213;
  wire [15:0] n214;
  wire [15:0] n215;
  wire [15:0] n219;
  wire [15:0] n223;
  wire [15:0] n225;
  wire [15:0] n240;
  wire [15:0] n244;
  wire [15:0] n256;
  wire [7:0] n371;
  wire [7:0] n372;
  wire [2:0] n384;
  wire [2:0] reg_address;  // sources/rtl/camera_init.v(43)
  wire [7:0] state_next;  // sources/rtl/camera_init.v(66)
  wire _al_u2836_o;
  wire _al_u2837_o;
  wire _al_u2840_o;
  wire _al_u2841_o;
  wire _al_u2842_o;
  wire _al_u2843_o;
  wire _al_u2852_o;
  wire _al_u2853_o;
  wire _al_u2861_o;
  wire _al_u2862_o;
  wire _al_u2864_o;
  wire _al_u2865_o;
  wire _al_u2866_o;
  wire _al_u2867_o;
  wire _al_u2869_o;
  wire _al_u2870_o;
  wire _al_u2871_o;
  wire _al_u2872_o;
  wire _al_u2873_o;
  wire _al_u2874_o;
  wire _al_u2876_o;
  wire _al_u2877_o;
  wire _al_u2878_o;
  wire _al_u2881_o;
  wire _al_u2883_o;
  wire _al_u2884_o;
  wire _al_u2885_o;
  wire _al_u2886_o;
  wire _al_u2887_o;
  wire _al_u2888_o;
  wire _al_u2889_o;
  wire _al_u2890_o;
  wire _al_u2892_o;
  wire _al_u2893_o;
  wire _al_u2894_o;
  wire _al_u2896_o;
  wire _al_u2897_o;
  wire _al_u2898_o;
  wire _al_u2900_o;
  wire _al_u2901_o;
  wire _al_u2902_o;
  wire _al_u2903_o;
  wire _al_u2905_o;
  wire _al_u2907_o;
  wire _al_u2908_o;
  wire _al_u2909_o;
  wire _al_u2910_o;
  wire _al_u2911_o;
  wire _al_u2912_o;
  wire _al_u2913_o;
  wire _al_u2914_o;
  wire _al_u2917_o;
  wire _al_u2918_o;
  wire _al_u2919_o;
  wire _al_u2921_o;
  wire _al_u2922_o;
  wire _al_u2923_o;
  wire _al_u2924_o;
  wire _al_u2925_o;
  wire _al_u2926_o;
  wire _al_u2927_o;
  wire _al_u2928_o;
  wire _al_u2929_o;
  wire _al_u2930_o;
  wire _al_u2931_o;
  wire _al_u2932_o;
  wire _al_u2934_o;
  wire _al_u2935_o;
  wire _al_u2938_o;
  wire _al_u2939_o;
  wire _al_u2940_o;
  wire _al_u2942_o;
  wire _al_u2944_o;
  wire _al_u2945_o;
  wire _al_u2946_o;
  wire _al_u2949_o;
  wire _al_u2950_o;
  wire _al_u2952_o;
  wire _al_u2955_o;
  wire _al_u2956_o;
  wire _al_u2957_o;
  wire _al_u2958_o;
  wire _al_u2959_o;
  wire _al_u2960_o;
  wire _al_u2961_o;
  wire _al_u2962_o;
  wire _al_u2965_o;
  wire _al_u2967_o;
  wire _al_u2968_o;
  wire _al_u2969_o;
  wire _al_u2970_o;
  wire _al_u2971_o;
  wire _al_u2972_o;
  wire _al_u2973_o;
  wire _al_u2974_o;
  wire _al_u2975_o;
  wire _al_u2976_o;
  wire _al_u2977_o;
  wire _al_u2978_o;
  wire _al_u2979_o;
  wire _al_u2980_o;
  wire _al_u2981_o;
  wire _al_u2982_o;
  wire _al_u2983_o;
  wire _al_u2984_o;
  wire _al_u2986_o;
  wire _al_u2987_o;
  wire _al_u2988_o;
  wire _al_u2989_o;
  wire _al_u2990_o;
  wire _al_u2992_o;
  wire _al_u2993_o;
  wire _al_u2994_o;
  wire _al_u2995_o;
  wire _al_u2996_o;
  wire _al_u2997_o;
  wire _al_u2998_o;
  wire _al_u2999_o;
  wire _al_u3001_o;
  wire _al_u3002_o;
  wire _al_u3003_o;
  wire _al_u3004_o;
  wire _al_u3005_o;
  wire _al_u3006_o;
  wire _al_u3007_o;
  wire _al_u3009_o;
  wire _al_u3010_o;
  wire _al_u3011_o;
  wire _al_u3012_o;
  wire _al_u3013_o;
  wire _al_u3014_o;
  wire _al_u3015_o;
  wire _al_u3017_o;
  wire _al_u3018_o;
  wire _al_u3019_o;
  wire _al_u3020_o;
  wire _al_u3021_o;
  wire _al_u3022_o;
  wire _al_u3024_o;
  wire _al_u3027_o;
  wire _al_u3028_o;
  wire _al_u3029_o;
  wire _al_u3030_o;
  wire _al_u3031_o;
  wire _al_u3032_o;
  wire _al_u3033_o;
  wire _al_u3034_o;
  wire _al_u3036_o;
  wire _al_u3038_o;
  wire _al_u3040_o;
  wire _al_u3041_o;
  wire _al_u3042_o;
  wire _al_u3043_o;
  wire _al_u3044_o;
  wire _al_u3045_o;
  wire _al_u3046_o;
  wire _al_u3048_o;
  wire _al_u3050_o;
  wire _al_u3051_o;
  wire _al_u3052_o;
  wire _al_u3053_o;
  wire _al_u3055_o;
  wire _al_u3057_o;
  wire _al_u3058_o;
  wire _al_u3059_o;
  wire _al_u3060_o;
  wire _al_u3061_o;
  wire _al_u3062_o;
  wire _al_u3063_o;
  wire _al_u3064_o;
  wire _al_u3065_o;
  wire _al_u3066_o;
  wire _al_u3067_o;
  wire _al_u3068_o;
  wire _al_u3069_o;
  wire _al_u3072_o;
  wire _al_u3073_o;
  wire _al_u3074_o;
  wire _al_u3075_o;
  wire _al_u3076_o;
  wire _al_u3077_o;
  wire _al_u3078_o;
  wire _al_u3079_o;
  wire _al_u3080_o;
  wire _al_u3081_o;
  wire _al_u3082_o;
  wire _al_u3083_o;
  wire _al_u3084_o;
  wire _al_u3085_o;
  wire _al_u3086_o;
  wire _al_u3088_o;
  wire _al_u3089_o;
  wire _al_u3090_o;
  wire _al_u3091_o;
  wire _al_u3092_o;
  wire _al_u3094_o;
  wire _al_u3095_o;
  wire _al_u3096_o;
  wire _al_u3097_o;
  wire _al_u3098_o;
  wire _al_u3099_o;
  wire _al_u3100_o;
  wire _al_u3102_o;
  wire _al_u3103_o;
  wire _al_u3104_o;
  wire _al_u3106_o;
  wire _al_u3107_o;
  wire _al_u3109_o;
  wire _al_u3110_o;
  wire _al_u3111_o;
  wire _al_u3112_o;
  wire _al_u3115_o;
  wire _al_u3121_o;
  wire _al_u3122_o;
  wire _al_u3123_o;
  wire _al_u3125_o;
  wire _al_u3127_o;
  wire _al_u3128_o;
  wire _al_u3129_o;
  wire _al_u3131_o;
  wire _al_u3132_o;
  wire _al_u3133_o;
  wire _al_u3134_o;
  wire _al_u3135_o;
  wire _al_u3136_o;
  wire _al_u3137_o;
  wire _al_u3139_o;
  wire _al_u3140_o;
  wire _al_u3142_o;
  wire _al_u3143_o;
  wire _al_u3144_o;
  wire _al_u3145_o;
  wire _al_u3147_o;
  wire _al_u3150_o;
  wire _al_u3151_o;
  wire _al_u3152_o;
  wire _al_u3153_o;
  wire _al_u3154_o;
  wire _al_u3155_o;
  wire _al_u3157_o;
  wire _al_u3160_o;
  wire _al_u3161_o;
  wire _al_u3163_o;
  wire _al_u3164_o;
  wire _al_u3165_o;
  wire _al_u3166_o;
  wire _al_u3167_o;
  wire _al_u3168_o;
  wire _al_u3169_o;
  wire _al_u3170_o;
  wire _al_u3171_o;
  wire _al_u3172_o;
  wire _al_u3173_o;
  wire _al_u3174_o;
  wire _al_u3175_o;
  wire _al_u3176_o;
  wire _al_u3177_o;
  wire _al_u3179_o;
  wire _al_u3180_o;
  wire _al_u3181_o;
  wire _al_u3182_o;
  wire _al_u3184_o;
  wire _al_u3185_o;
  wire _al_u3186_o;
  wire _al_u3188_o;
  wire _al_u3189_o;
  wire _al_u3190_o;
  wire _al_u3191_o;
  wire _al_u3192_o;
  wire _al_u3193_o;
  wire _al_u3194_o;
  wire _al_u3195_o;
  wire _al_u3196_o;
  wire _al_u3197_o;
  wire _al_u3198_o;
  wire _al_u3199_o;
  wire _al_u3200_o;
  wire _al_u3201_o;
  wire _al_u3202_o;
  wire _al_u3203_o;
  wire _al_u3204_o;
  wire _al_u3205_o;
  wire _al_u3206_o;
  wire _al_u3207_o;
  wire _al_u3208_o;
  wire _al_u3209_o;
  wire _al_u3210_o;
  wire _al_u3211_o;
  wire _al_u3212_o;
  wire _al_u3213_o;
  wire _al_u3214_o;
  wire _al_u3215_o;
  wire _al_u3216_o;
  wire _al_u3217_o;
  wire _al_u3219_o;
  wire _al_u3220_o;
  wire _al_u3221_o;
  wire _al_u3222_o;
  wire _al_u3223_o;
  wire _al_u3224_o;
  wire _al_u3225_o;
  wire _al_u3226_o;
  wire _al_u3227_o;
  wire _al_u3231_o;
  wire _al_u3235_o;
  wire _al_u3236_o;
  wire _al_u3237_o;
  wire _al_u3238_o;
  wire _al_u3240_o;
  wire _al_u3241_o;
  wire _al_u3242_o;
  wire _al_u3243_o;
  wire _al_u3244_o;
  wire _al_u3245_o;
  wire _al_u3246_o;
  wire _al_u3247_o;
  wire _al_u3248_o;
  wire _al_u3249_o;
  wire _al_u3250_o;
  wire _al_u3251_o;
  wire _al_u3252_o;
  wire _al_u3253_o;
  wire _al_u3254_o;
  wire _al_u3255_o;
  wire _al_u3256_o;
  wire _al_u3257_o;
  wire _al_u3258_o;
  wire _al_u3259_o;
  wire _al_u3260_o;
  wire _al_u3261_o;
  wire _al_u3262_o;
  wire _al_u3263_o;
  wire _al_u3264_o;
  wire _al_u3265_o;
  wire _al_u3266_o;
  wire _al_u3268_o;
  wire _al_u3269_o;
  wire _al_u3270_o;
  wire _al_u3271_o;
  wire _al_u3272_o;
  wire _al_u3273_o;
  wire _al_u3274_o;
  wire _al_u3275_o;
  wire _al_u3276_o;
  wire _al_u3277_o;
  wire _al_u3278_o;
  wire _al_u3279_o;
  wire _al_u3280_o;
  wire _al_u3281_o;
  wire _al_u3282_o;
  wire _al_u3283_o;
  wire _al_u3288_o;
  wire _al_u3290_o;
  wire _al_u3291_o;
  wire _al_u3292_o;
  wire _al_u3293_o;
  wire _al_u3296_o;
  wire _al_u3299_o;
  wire _al_u3300_o;
  wire _al_u3301_o;
  wire _al_u3302_o;
  wire _al_u3303_o;
  wire _al_u3306_o;
  wire _al_u3307_o;
  wire _al_u3308_o;
  wire _al_u3309_o;
  wire _al_u3310_o;
  wire _al_u3311_o;
  wire _al_u3312_o;
  wire _al_u3313_o;
  wire _al_u3314_o;
  wire _al_u3315_o;
  wire _al_u3317_o;
  wire _al_u3319_o;
  wire _al_u3320_o;
  wire _al_u3321_o;
  wire _al_u3322_o;
  wire _al_u3324_o;
  wire _al_u3327_o;
  wire _al_u3328_o;
  wire _al_u3329_o;
  wire _al_u3330_o;
  wire _al_u3332_o;
  wire _al_u3333_o;
  wire _al_u3334_o;
  wire _al_u3335_o;
  wire _al_u3336_o;
  wire _al_u3337_o;
  wire _al_u3338_o;
  wire _al_u3339_o;
  wire _al_u3340_o;
  wire _al_u3341_o;
  wire _al_u3342_o;
  wire _al_u3343_o;
  wire _al_u3344_o;
  wire _al_u3345_o;
  wire _al_u3346_o;
  wire _al_u3347_o;
  wire _al_u3348_o;
  wire _al_u3349_o;
  wire _al_u3350_o;
  wire _al_u3351_o;
  wire _al_u3352_o;
  wire _al_u3353_o;
  wire _al_u3355_o;
  wire _al_u3356_o;
  wire _al_u3358_o;
  wire _al_u3359_o;
  wire _al_u3360_o;
  wire _al_u3361_o;
  wire _al_u3362_o;
  wire _al_u3363_o;
  wire _al_u3364_o;
  wire _al_u3365_o;
  wire _al_u3366_o;
  wire _al_u3368_o;
  wire _al_u3369_o;
  wire _al_u3371_o;
  wire _al_u3372_o;
  wire _al_u3376_o;
  wire _al_u3377_o;
  wire _al_u3378_o;
  wire _al_u3379_o;
  wire _al_u3380_o;
  wire _al_u3381_o;
  wire _al_u3382_o;
  wire _al_u3383_o;
  wire _al_u3384_o;
  wire _al_u3385_o;
  wire _al_u3386_o;
  wire _al_u3388_o;
  wire _al_u3390_o;
  wire _al_u3391_o;
  wire _al_u3392_o;
  wire _al_u3393_o;
  wire _al_u3395_o;
  wire _al_u3396_o;
  wire _al_u3397_o;
  wire _al_u3398_o;
  wire _al_u3399_o;
  wire _al_u3400_o;
  wire _al_u3402_o;
  wire _al_u3403_o;
  wire _al_u3404_o;
  wire _al_u3405_o;
  wire _al_u3406_o;
  wire _al_u3407_o;
  wire _al_u3408_o;
  wire _al_u3409_o;
  wire _al_u3410_o;
  wire _al_u3411_o;
  wire _al_u3412_o;
  wire _al_u3413_o;
  wire _al_u3414_o;
  wire _al_u3415_o;
  wire _al_u3416_o;
  wire _al_u3417_o;
  wire _al_u3418_o;
  wire _al_u3419_o;
  wire _al_u3420_o;
  wire _al_u3421_o;
  wire _al_u3422_o;
  wire _al_u3424_o;
  wire _al_u3425_o;
  wire _al_u3426_o;
  wire _al_u3427_o;
  wire _al_u3428_o;
  wire _al_u3429_o;
  wire _al_u3430_o;
  wire _al_u3431_o;
  wire _al_u3432_o;
  wire _al_u3433_o;
  wire _al_u3434_o;
  wire _al_u3435_o;
  wire _al_u3436_o;
  wire _al_u3437_o;
  wire _al_u3438_o;
  wire _al_u3439_o;
  wire _al_u3440_o;
  wire _al_u3441_o;
  wire _al_u3442_o;
  wire _al_u3443_o;
  wire _al_u3444_o;
  wire _al_u3445_o;
  wire _al_u3446_o;
  wire _al_u3447_o;
  wire _al_u3448_o;
  wire _al_u3449_o;
  wire _al_u3450_o;
  wire _al_u3451_o;
  wire _al_u3452_o;
  wire _al_u3453_o;
  wire _al_u3454_o;
  wire _al_u3455_o;
  wire _al_u3456_o;
  wire _al_u3457_o;
  wire _al_u3458_o;
  wire _al_u3459_o;
  wire _al_u3462_o;
  wire _al_u3464_o;
  wire _al_u3465_o;
  wire _al_u3466_o;
  wire _al_u3467_o;
  wire _al_u3468_o;
  wire _al_u3469_o;
  wire _al_u3470_o;
  wire _al_u3471_o;
  wire _al_u3472_o;
  wire _al_u3473_o;
  wire _al_u3474_o;
  wire _al_u3475_o;
  wire _al_u3476_o;
  wire _al_u3477_o;
  wire _al_u3480_o;
  wire _al_u3481_o;
  wire _al_u3482_o;
  wire _al_u3484_o;
  wire _al_u3485_o;
  wire _al_u3486_o;
  wire _al_u3487_o;
  wire _al_u3488_o;
  wire _al_u3492_o;
  wire _al_u3495_o;
  wire _al_u3496_o;
  wire _al_u3497_o;
  wire _al_u3498_o;
  wire _al_u3499_o;
  wire _al_u3500_o;
  wire _al_u3501_o;
  wire _al_u3502_o;
  wire _al_u3503_o;
  wire _al_u3504_o;
  wire _al_u3505_o;
  wire _al_u3506_o;
  wire _al_u3507_o;
  wire _al_u3508_o;
  wire _al_u3510_o;
  wire _al_u3511_o;
  wire _al_u3513_o;
  wire _al_u3514_o;
  wire _al_u3515_o;
  wire _al_u3516_o;
  wire _al_u3517_o;
  wire _al_u3518_o;
  wire _al_u3519_o;
  wire _al_u3520_o;
  wire _al_u3521_o;
  wire _al_u3522_o;
  wire _al_u3523_o;
  wire _al_u3524_o;
  wire _al_u3525_o;
  wire _al_u3526_o;
  wire _al_u3527_o;
  wire _al_u3528_o;
  wire _al_u3529_o;
  wire _al_u3531_o;
  wire _al_u3532_o;
  wire _al_u3533_o;
  wire _al_u3534_o;
  wire _al_u3536_o;
  wire _al_u3537_o;
  wire _al_u3538_o;
  wire _al_u3539_o;
  wire _al_u3540_o;
  wire _al_u3541_o;
  wire _al_u3542_o;
  wire _al_u3543_o;
  wire _al_u3544_o;
  wire _al_u3545_o;
  wire _al_u3546_o;
  wire _al_u3547_o;
  wire _al_u3548_o;
  wire _al_u3549_o;
  wire _al_u3550_o;
  wire _al_u3551_o;
  wire _al_u3553_o;
  wire _al_u3554_o;
  wire _al_u3555_o;
  wire _al_u3556_o;
  wire _al_u3557_o;
  wire _al_u3559_o;
  wire _al_u3560_o;
  wire _al_u3563_o;
  wire _al_u3564_o;
  wire _al_u3565_o;
  wire _al_u3566_o;
  wire _al_u3567_o;
  wire _al_u3568_o;
  wire _al_u3569_o;
  wire _al_u3571_o;
  wire _al_u3572_o;
  wire _al_u3573_o;
  wire _al_u3574_o;
  wire _al_u3575_o;
  wire _al_u3576_o;
  wire _al_u3577_o;
  wire _al_u3578_o;
  wire _al_u3579_o;
  wire _al_u3580_o;
  wire _al_u3581_o;
  wire _al_u3582_o;
  wire _al_u3583_o;
  wire _al_u3584_o;
  wire _al_u3585_o;
  wire \add0/c3 ;
  wire \add0/c7 ;
  wire \add1/c3 ;
  wire \add1/c7 ;
  wire \add2/c1 ;
  wire \add2/c3 ;
  wire \add2/c5 ;
  wire \add2/c7 ;
  wire bus_write;  // sources/rtl/camera_init.v(44)
  wire mux103_b0_sel_is_2_o;
  wire mux103_b3_sel_is_0_o;
  wire mux104_b11_sel_is_2_o;
  wire mux107_b0_sel_is_2_o;
  wire mux111_b0_sel_is_2_o;
  wire mux115_b2_sel_is_2_o;
  wire mux119_b10_sel_is_2_o;
  wire mux119_b3_sel_is_0_o;
  wire mux119_b4_sel_is_2_o;
  wire mux121_b7_sel_is_2_o;
  wire mux122_b11_sel_is_2_o;
  wire mux123_b10_sel_is_2_o;
  wire mux124_b11_sel_is_2_o;
  wire mux12_b9_sel_is_2_o_neg_lutinv;
  wire mux130_b1_sel_is_2_o;
  wire mux130_b6_sel_is_2_o;
  wire mux132_b0_sel_is_0_o;
  wire mux132_b3_sel_is_2_o;
  wire mux135_b0_sel_is_2_o;
  wire mux135_b11_sel_is_0_o;
  wire mux137_b2_sel_is_2_o;
  wire mux137_b5_sel_is_2_o;
  wire mux139_b0_sel_is_2_o;
  wire mux140_b11_sel_is_2_o;
  wire mux140_b1_sel_is_2_o;
  wire mux140_b5_sel_is_0_o;
  wire mux141_b1_sel_is_2_o;
  wire mux144_b10_sel_is_2_o;
  wire mux144_b7_sel_is_2_o;
  wire mux145_b6_sel_is_2_o;
  wire mux147_b12_sel_is_2_o;
  wire mux148_b3_sel_is_2_o;
  wire mux149_b4_sel_is_2_o;
  wire mux14_b11_sel_is_2_o;
  wire mux153_b3_sel_is_2_o;
  wire mux156_b0_sel_is_2_o;
  wire mux158_b11_sel_is_0_o;
  wire mux159_b1_sel_is_2_o;
  wire mux159_b3_sel_is_2_o;
  wire mux159_b5_sel_is_2_o;
  wire mux15_b15_sel_is_2_o;
  wire mux166_b1_sel_is_2_o;
  wire mux169_b0_sel_is_2_o;
  wire mux16_b0_sel_is_2_o;
  wire mux16_b11_sel_is_2_o;
  wire mux16_b15_sel_is_2_o;
  wire mux16_b1_sel_is_0_o;
  wire mux16_b9_sel_is_2_o_neg_lutinv;
  wire mux170_b2_sel_is_2_o;
  wire mux174_b0_sel_is_0_o;
  wire mux181_b0_sel_is_2_o;
  wire mux19_b2_sel_is_0_o;
  wire mux21_b0_sel_is_0_o;
  wire mux21_b12_sel_is_2_o;
  wire mux24_b10_sel_is_2_o;
  wire mux31_b3_sel_is_2_o;
  wire mux33_b0_sel_is_2_o;
  wire mux37_b6_sel_is_2_o;
  wire mux38_b12_sel_is_2_o;
  wire mux38_b1_sel_is_2_o;
  wire mux42_b0_sel_is_2_o;
  wire mux47_b0_sel_is_2_o;
  wire mux47_b1_sel_is_2_o;
  wire mux49_b0_sel_is_2_o;
  wire mux49_b5_sel_is_0_o;
  wire mux52_b1_sel_is_2_o;
  wire mux5_b5_sel_is_2_o;
  wire mux60_b1_sel_is_2_o;
  wire mux61_b0_sel_is_2_o;
  wire mux63_b12_sel_is_2_o;
  wire mux63_b1_sel_is_2_o;
  wire mux63_b7_sel_is_2_o;
  wire mux67_b0_sel_is_2_o;
  wire mux68_b0_sel_is_2_o;
  wire mux68_b1_sel_is_2_o;
  wire mux68_b4_sel_is_2_o;
  wire mux75_b5_sel_is_2_o;
  wire mux75_b6_sel_is_2_o;
  wire mux83_b0_sel_is_2_o;
  wire mux83_b12_sel_is_2_o;
  wire mux83_b7_sel_is_2_o;
  wire mux84_b4_sel_is_2_o;
  wire mux85_b0_sel_is_2_o;
  wire mux87_b0_sel_is_2_o;
  wire mux94_b0_sel_is_2_o;
  wire mux94_b10_sel_is_0_o;
  wire mux97_b15_sel_is_2_o;
  wire mux97_b2_sel_is_2_o;
  wire n375_lutinv;
  wire n376_lutinv;
  wire n377_lutinv;
  wire n378_lutinv;
  wire n379_lutinv;
  wire n380;
  wire ready_out;  // sources/rtl/camera_init.v(45)
  wire sel1_b1_sel_o;  // sources/rtl/camera_init.v(388)
  wire success_out;  // sources/rtl/camera_init.v(46)

  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*~D)"),
    //.LUT1("(~D*C*~B*A)"),
    .INIT_LUT0(16'b0000000000000011),
    .INIT_LUT1(16'b0000000000100000),
    .MODE("LOGIC"))
    \_al_u2837|_al_u2836  (
    .a({_al_u2836_o,open_n0}),
    .b({state_next[3],1'b0}),
    .c({state_next[4],1'b0}),
    .d({1'b0,state_next[2]}),
    .f({_al_u2837_o,_al_u2836_o}));
  // sources/rtl/camera_init.v(265)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(~C*~B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u2838|ready_reg  (
    .b({state_next[0],state_next[0]}),
    .c({state_next[1],state_next[1]}),
    .clk(clk),
    .d({_al_u2837_o,_al_u2837_o}),
    .f({n380,open_n37}),
    .q({open_n41,ready}));  // sources/rtl/camera_init.v(265)
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B))"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b0011111100000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u2840|_al_u3197  (
    .b({open_n44,_al_u2840_o}),
    .c({counter[3],_al_u2969_o}),
    .d({counter[2],_al_u3196_o}),
    .f({_al_u2840_o,_al_u3197_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*A)"),
    //.LUTF1("(D*~C*B*A)"),
    //.LUTG0("(~D*~C*~B*A)"),
    //.LUTG1("(D*~C*B*A)"),
    .INIT_LUTF0(16'b0000000000000010),
    .INIT_LUTF1(16'b0000100000000000),
    .INIT_LUTG0(16'b0000000000000010),
    .INIT_LUTG1(16'b0000100000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2841|_al_u3022  (
    .a({counter[4],counter[4]}),
    .b({counter[5],counter[5]}),
    .c({counter[6],counter[6]}),
    .d({counter[7],counter[7]}),
    .f({_al_u2841_o,_al_u3022_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u2842|_al_u2938  (
    .b({_al_u2841_o,counter[0]}),
    .c({counter[1],counter[1]}),
    .d({_al_u2840_o,_al_u2840_o}),
    .f({_al_u2842_o,_al_u2938_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2855|_al_u3101  (
    .c({state_next[0],state_next[0]}),
    .d({sel1_b1_sel_o,sel1_b1_sel_o}),
    .f({n377_lutinv,n376_lutinv}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*B*A)"),
    //.LUTF1("(D*C*B*A)"),
    //.LUTG0("(~D*~C*B*A)"),
    //.LUTG1("(D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000001000),
    .INIT_LUTF1(16'b1000000000000000),
    .INIT_LUTG0(16'b0000000000001000),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2856|_al_u2853  (
    .a({_al_u2836_o,_al_u2852_o}),
    .b({_al_u2852_o,state_next[2]}),
    .c({state_next[0],1'b0}),
    .d({state_next[1],1'b0}),
    .f({n375_lutinv,_al_u2853_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(C*~B*D)"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2858|_al_u2863  (
    .b({state_next[0],state_next[0]}),
    .c({state_next[1],state_next[1]}),
    .d({_al_u2853_o,_al_u2853_o}),
    .f({n378_lutinv,n379_lutinv}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2861|_al_u2874  (
    .c(state_next[1:0]),
    .d({_al_u2837_o,_al_u2837_o}),
    .f({_al_u2861_o,_al_u2874_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*~D)"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000000000000011),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u2862|_al_u2866  (
    .b({_al_u2853_o,sel1_b1_sel_o}),
    .c({n375_lutinv,n375_lutinv}),
    .d({_al_u2861_o,n380}),
    .f({_al_u2862_o,_al_u2866_o}));
  // sources/rtl/camera_init.v(311)
  EG_PHY_LSLICE #(
    //.LUTF0("~(C*D)"),
    //.LUTF1("(~(D)*~(B)*~(C)+D*B*~(C)+~(D)*~(B)*C+D*~(B)*C+D*B*C)"),
    //.LUTG0("~(C*D)"),
    //.LUTG1("(~(D)*~(B)*~(C)+D*B*~(C)+~(D)*~(B)*C+D*~(B)*C+D*B*C)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000111111111111),
    .INIT_LUTF1(16'b1111110000110011),
    .INIT_LUTG0(16'b0000111111111111),
    .INIT_LUTG1(16'b1111110000110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u2865|reg5_b2  (
    .b({state_next[2],open_n241}),
    .c({ready_out,_al_u2867_o}),
    .clk(divider2[8]),
    .d({_al_u2864_o,_al_u2865_o}),
    .sr(reset_n),
    .f({_al_u2865_o,open_n259}),
    .q({open_n263,state_next[2]}));  // sources/rtl/camera_init.v(311)
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(D*~(~C*B))"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b1111001100000000),
    .MODE("LOGIC"))
    \_al_u2867|_al_u2869  (
    .b({n379_lutinv,n379_lutinv}),
    .c({success_out,success_out}),
    .d({_al_u2866_o,_al_u2843_o}),
    .f({_al_u2867_o,_al_u2869_o}));
  // sources/rtl/camera_init.v(389)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*~A)"),
    //.LUT1("(C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000000000001),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u2872|reg3_b4  (
    .a({open_n286,cnt[4]}),
    .b({open_n287,cnt[5]}),
    .c({_al_u2871_o,cnt[6]}),
    .ce(mux181_b0_sel_is_2_o),
    .clk(divider2[8]),
    .d({_al_u2870_o,cnt[7]}),
    .mi({open_n298,n371[4]}),
    .f({_al_u2872_o,_al_u2870_o}),
    .q({open_n303,cnt[4]}));  // sources/rtl/camera_init.v(389)
  // sources/rtl/camera_init.v(311)
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(D*~(~C*A)))"),
    //.LUTF1("(~(~D*B)*~(~C*A))"),
    //.LUTG0("~(B*~(D*~(~C*A)))"),
    //.LUTG1("(~(~D*B)*~(~C*A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111011100110011),
    .INIT_LUTF1(16'b1111010100110001),
    .INIT_LUTG0(16'b1111011100110011),
    .INIT_LUTG1(16'b1111010100110001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u2873|reg5_b0  (
    .a({_al_u2869_o,_al_u2864_o}),
    .b({_al_u2853_o,_al_u2873_o}),
    .c({_al_u2872_o,_al_u2874_o}),
    .clk(divider2[8]),
    .d({state_next[0],state_next[0]}),
    .sr(reset_n),
    .f({_al_u2873_o,open_n321}),
    .q({open_n325,state_next[0]}));  // sources/rtl/camera_init.v(311)
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*~(~B*A))"),
    //.LUT1("(~B*~(C*D))"),
    .INIT_LUT0(16'b1101000000000000),
    .INIT_LUT1(16'b0000001100110011),
    .MODE("LOGIC"))
    \_al_u2877|_al_u2876  (
    .a({open_n326,_al_u2843_o}),
    .b({n378_lutinv,_al_u2872_o}),
    .c({n379_lutinv,ready_out}),
    .d({_al_u2876_o,success_out}),
    .f({_al_u2877_o,_al_u2876_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(D*~(C*B))"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b0011111100000000),
    .MODE("LOGIC"))
    \_al_u2878|_al_u2852  (
    .b({_al_u2874_o,state_next[4]}),
    .c({ready_out,1'b0}),
    .d({_al_u2864_o,state_next[3]}),
    .f({_al_u2878_o,_al_u2852_o}));
  // sources/rtl/camera_init.v(311)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~C*B*~(D*~A))"),
    //.LUTF1("(~D*~(~C*B))"),
    //.LUTG0("~(~C*B*~(D*~A))"),
    //.LUTG1("(~D*~(~C*B))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111011111110011),
    .INIT_LUTF1(16'b0000000011110011),
    .INIT_LUTG0(16'b1111011111110011),
    .INIT_LUTG1(16'b0000000011110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u2881|reg5_b1  (
    .a({open_n369,_al_u2864_o}),
    .b({_al_u2874_o,_al_u2881_o}),
    .c({ready_out,_al_u2869_o}),
    .clk(divider2[8]),
    .d({n377_lutinv,state_next[1]}),
    .sr(reset_n),
    .f({_al_u2881_o,open_n387}),
    .q({open_n391,state_next[1]}));  // sources/rtl/camera_init.v(311)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u2884|_al_u2911  (
    .c({counter[3],counter[3]}),
    .d({counter[2],counter[2]}),
    .f({_al_u2884_o,_al_u2911_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*~D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000000000001111),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000000001111),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2885|_al_u2883  (
    .c({_al_u2884_o,counter[1]}),
    .d({_al_u2883_o,counter[0]}),
    .f({_al_u2885_o,_al_u2883_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*~A)"),
    //.LUTF1("(~D*C*~B*A)"),
    //.LUTG0("(~D*C*B*~A)"),
    //.LUTG1("(~D*C*~B*A)"),
    .INIT_LUTF0(16'b0000000001000000),
    .INIT_LUTF1(16'b0000000000100000),
    .INIT_LUTG0(16'b0000000001000000),
    .INIT_LUTG1(16'b0000000000100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2887|_al_u2958  (
    .a({counter[4],counter[4]}),
    .b({counter[5],counter[5]}),
    .c({counter[6],counter[6]}),
    .d({counter[7],counter[7]}),
    .f({_al_u2887_o,_al_u2958_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0011111100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u2890|_al_u3171  (
    .b({open_n470,_al_u3042_o}),
    .c({_al_u2887_o,_al_u2889_o}),
    .d({_al_u2889_o,_al_u3170_o}),
    .f({_al_u2890_o,_al_u3171_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u2891|_al_u2888  (
    .b({open_n493,_al_u2886_o}),
    .c({_al_u2890_o,_al_u2887_o}),
    .d({_al_u2888_o,_al_u2885_o}),
    .f({mux84_b4_sel_is_2_o,_al_u2888_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"))
    \_al_u2892|_al_u2896  (
    .c({counter[3],_al_u2892_o}),
    .d({counter[2],_al_u2883_o}),
    .f({_al_u2892_o,_al_u2896_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(C*~B*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2894|_al_u2886  (
    .b({counter[0],counter[0]}),
    .c({counter[1],counter[1]}),
    .d({_al_u2884_o,_al_u2884_o}),
    .f({_al_u2894_o,_al_u2886_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u2897|_al_u2893  (
    .b({counter[0],counter[0]}),
    .c({counter[1],counter[1]}),
    .d({_al_u2892_o,_al_u2892_o}),
    .f({_al_u2897_o,_al_u2893_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~(D*~(~C*~B)))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(A*~(D*~(~C*~B)))"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000001010101010),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000001010101010),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2899|_al_u2895  (
    .a({open_n586,mux84_b4_sel_is_2_o}),
    .b({open_n587,_al_u2893_o}),
    .c({_al_u2898_o,_al_u2894_o}),
    .d({mux85_b0_sel_is_2_o,_al_u2887_o}),
    .f({mux87_b0_sel_is_2_o,mux85_b0_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u2901|_al_u2900  (
    .c({_al_u2884_o,counter[1]}),
    .d({_al_u2900_o,counter[0]}),
    .f({_al_u2901_o,_al_u2900_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*B*A)"),
    //.LUT1("(D*~C*B*~A)"),
    .INIT_LUT0(16'b0000000000001000),
    .INIT_LUT1(16'b0000010000000000),
    .MODE("LOGIC"))
    \_al_u2903|_al_u2992  (
    .a({counter[4],counter[4]}),
    .b({counter[5],counter[5]}),
    .c({counter[6],counter[6]}),
    .d({counter[7],counter[7]}),
    .f({_al_u2903_o,_al_u2992_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~D*~(C*B))"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~D*~(C*B))"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000000000111111),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2906|_al_u2905  (
    .b({_al_u2886_o,_al_u2889_o}),
    .c({_al_u2903_o,_al_u2903_o}),
    .d({_al_u2905_o,_al_u2893_o}),
    .f({mux5_b5_sel_is_2_o,_al_u2905_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~C*B*A)"),
    //.LUT1("(~((~B*~A))*~(C)*~(D)+(~B*~A)*~(C)*~(D)+(~B*~A)*C*~(D)+~((~B*~A))*~(C)*D+~((~B*~A))*C*D+(~B*~A)*C*D)"),
    .INIT_LUT0(16'b0000100000000000),
    .INIT_LUT1(16'b1111111000011111),
    .MODE("LOGIC"))
    \_al_u2907|_al_u2889  (
    .a({counter[0],counter[0]}),
    .b({counter[1],counter[1]}),
    .c({counter[2],counter[2]}),
    .d({counter[3],counter[3]}),
    .f({_al_u2907_o,_al_u2889_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u2909|_al_u2908  (
    .b({mux5_b5_sel_is_2_o,open_n704}),
    .c({_al_u2908_o,_al_u2907_o}),
    .d({n184[0],_al_u2903_o}),
    .f({_al_u2909_o,_al_u2908_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2910|_al_u2931  (
    .c({_al_u2900_o,counter[1]}),
    .d({_al_u2840_o,_al_u2840_o}),
    .f({_al_u2910_o,_al_u2931_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*~D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000000000001111),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000000001111),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2912|_al_u2913  (
    .c({_al_u2883_o,_al_u2912_o}),
    .d({_al_u2911_o,_al_u2910_o}),
    .f({_al_u2912_o,_al_u2913_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*A*(D@C))"),
    //.LUTF1("(~B*~(C*~D))"),
    //.LUTG0("(B*A*(D@C))"),
    //.LUTG1("(~B*~(C*~D))"),
    .INIT_LUTF0(16'b0000100010000000),
    .INIT_LUTF1(16'b0011001100000011),
    .INIT_LUTG0(16'b0000100010000000),
    .INIT_LUTG1(16'b0011001100000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2915|_al_u2914  (
    .a({open_n781,_al_u2840_o}),
    .b({_al_u2914_o,_al_u2903_o}),
    .c({_al_u2903_o,counter[0]}),
    .d({_al_u2913_o,counter[1]}),
    .f({mux14_b11_sel_is_2_o,_al_u2914_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(~C*D))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1100000011001100),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u2916|_al_u2923  (
    .b({open_n808,_al_u2922_o}),
    .c({mux14_b11_sel_is_2_o,_al_u2917_o}),
    .d({_al_u2909_o,n196[6]}),
    .f({n196[6],_al_u2923_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(D*~C*~B*A)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(D*~C*~B*A)"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b0000001000000000),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b0000001000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2917|_al_u3042  (
    .a({counter[4],counter[4]}),
    .b({counter[5],counter[5]}),
    .c({counter[6],counter[6]}),
    .d({counter[7],counter[7]}),
    .f({_al_u2917_o,_al_u3042_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u2920|_al_u2919  (
    .c({_al_u2919_o,_al_u2917_o}),
    .d({_al_u2918_o,_al_u2889_o}),
    .f({mux21_b0_sel_is_0_o,_al_u2919_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(~C*A*~(D*B))"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(~C*A*~(D*B))"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0000001000001010),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0000001000001010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2926|_al_u2925  (
    .a({_al_u2923_o,open_n877}),
    .b({_al_u2924_o,_al_u2917_o}),
    .c({_al_u2925_o,counter[1]}),
    .d({counter[1],_al_u2840_o}),
    .f({_al_u2926_o,_al_u2925_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*B*~A)"),
    //.LUT1("(D*~C*~B*~A)"),
    .INIT_LUT0(16'b0000000000000100),
    .INIT_LUT1(16'b0000000100000000),
    .MODE("LOGIC"))
    \_al_u2927|_al_u3010  (
    .a({counter[4],counter[4]}),
    .b({counter[5],counter[5]}),
    .c({counter[6],counter[6]}),
    .d({counter[7],counter[7]}),
    .f({_al_u2927_o,_al_u3010_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u2930|_al_u2928  (
    .c({_al_u2929_o,_al_u2927_o}),
    .d({_al_u2928_o,_al_u2894_o}),
    .f({_al_u2930_o,_al_u2928_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*B))"),
    //.LUT1("(B*~(A*~(D)*~(C)+A*D*~(C)+~(A)*D*C+A*D*C))"),
    .INIT_LUT0(16'b1111001100000000),
    .INIT_LUT1(16'b0000010011000100),
    .MODE("LOGIC"))
    \_al_u2933|_al_u3187  (
    .a({_al_u2926_o,open_n946}),
    .b({_al_u2930_o,_al_u2932_o}),
    .c({_al_u2932_o,counter[0]}),
    .d({counter[0],_al_u2930_o}),
    .f({n215[6],mux33_b0_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u2936|_al_u2934  (
    .b({open_n969,_al_u2889_o}),
    .c({_al_u2935_o,_al_u2927_o}),
    .d({_al_u2934_o,_al_u2893_o}),
    .f({mux37_b6_sel_is_2_o,_al_u2934_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000000000001111),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u2937|_al_u3508  (
    .c({mux37_b6_sel_is_2_o,_al_u3391_o}),
    .d({n215[6],_al_u3507_o}),
    .f({n219[6],_al_u3508_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u2941|_al_u2940  (
    .c({_al_u2940_o,_al_u2927_o}),
    .d({_al_u2939_o,_al_u2931_o}),
    .f({mux47_b1_sel_is_2_o,_al_u2940_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~B*A*~(D*C))"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000001000100010),
    .MODE("LOGIC"))
    \_al_u2943|_al_u2942  (
    .a({mux47_b1_sel_is_2_o,open_n1038}),
    .b({_al_u2942_o,_al_u2911_o}),
    .c({_al_u2910_o,_al_u2927_o}),
    .d({_al_u2927_o,_al_u2896_o}),
    .f({mux47_b0_sel_is_2_o,_al_u2942_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*~B*~A)"),
    //.LUT1("(~D*C*B*A)"),
    .INIT_LUT0(16'b0000000000010000),
    .INIT_LUT1(16'b0000000010000000),
    .MODE("LOGIC"))
    \_al_u2944|_al_u2969  (
    .a({counter[4],counter[4]}),
    .b({counter[5],counter[5]}),
    .c({counter[6],counter[6]}),
    .d({counter[7],counter[7]}),
    .f({_al_u2944_o,_al_u2969_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2945|_al_u2950  (
    .c({_al_u2944_o,_al_u2944_o}),
    .d({_al_u2894_o,_al_u2889_o}),
    .f({_al_u2945_o,_al_u2950_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u2947|_al_u2946  (
    .c({_al_u2946_o,_al_u2944_o}),
    .d({_al_u2945_o,_al_u2901_o}),
    .f({mux49_b5_sel_is_0_o,_al_u2946_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u2948|_al_u2952  (
    .c({mux49_b5_sel_is_0_o,mux52_b1_sel_is_2_o}),
    .d({mux47_b0_sel_is_2_o,mux49_b0_sel_is_2_o}),
    .f({mux49_b0_sel_is_2_o,_al_u2952_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u2951|_al_u2949  (
    .b({open_n1157,_al_u2886_o}),
    .c({_al_u2950_o,_al_u2944_o}),
    .d({_al_u2949_o,_al_u2885_o}),
    .f({mux52_b1_sel_is_2_o,_al_u2949_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2954|_al_u2953  (
    .c({mux63_b12_sel_is_2_o,_al_u2944_o}),
    .d({n219[6],_al_u2952_o}),
    .f({n244[6],mux63_b12_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2957|_al_u2956  (
    .c({_al_u2896_o,counter[0]}),
    .d({_al_u2956_o,_al_u2955_o}),
    .f({_al_u2957_o,_al_u2956_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2959|_al_u3330  (
    .c({_al_u2958_o,_al_u3022_o}),
    .d({_al_u2957_o,_al_u2957_o}),
    .f({_al_u2959_o,_al_u3330_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2961|_al_u2955  (
    .c({counter[1],counter[1]}),
    .d({_al_u2911_o,_al_u2911_o}),
    .f({_al_u2961_o,_al_u2955_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u2963|_al_u2960  (
    .b({open_n1292,_al_u2958_o}),
    .c({_al_u2962_o,counter[0]}),
    .d({_al_u2960_o,_al_u2955_o}),
    .f({mux75_b5_sel_is_2_o,_al_u2960_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(C*~D)"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"))
    \_al_u2964|_al_u3233  (
    .b({open_n1315,mux63_b7_sel_is_2_o}),
    .c({mux75_b5_sel_is_2_o,mux67_b0_sel_is_2_o}),
    .d({_al_u2959_o,n223[7]}),
    .f({mux75_b6_sel_is_2_o,n256[7]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~D*~(C*B))"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~D*~(C*B))"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000000000111111),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2966|_al_u2965  (
    .b({_al_u2885_o,_al_u2894_o}),
    .c({_al_u2958_o,_al_u2958_o}),
    .d({_al_u2965_o,_al_u2886_o}),
    .f({mux67_b0_sel_is_2_o,_al_u2965_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2967|_al_u3542  (
    .b({mux75_b6_sel_is_2_o,open_n1364}),
    .c({mux67_b0_sel_is_2_o,_al_u2902_o}),
    .d({n244[6],_al_u3541_o}),
    .f({_al_u2967_o,_al_u3542_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*~B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2968|_al_u2902  (
    .b({_al_u2902_o,open_n1391}),
    .c({_al_u2967_o,_al_u2887_o}),
    .d({mux87_b0_sel_is_2_o,_al_u2901_o}),
    .f({_al_u2968_o,_al_u2902_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(~C*~B*~D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2973|_al_u2972  (
    .b({_al_u2971_o,_al_u2887_o}),
    .c({_al_u2972_o,counter[0]}),
    .d({_al_u2970_o,_al_u2931_o}),
    .f({_al_u2973_o,_al_u2972_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*(C@B))"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0011110000000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u2974|_al_u2986  (
    .b({counter[0],counter[0]}),
    .c({counter[1],counter[1]}),
    .d({_al_u2911_o,_al_u2911_o}),
    .f({_al_u2974_o,_al_u2986_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2978|_al_u2976  (
    .c({_al_u2977_o,_al_u2969_o}),
    .d({_al_u2976_o,_al_u2885_o}),
    .f({_al_u2978_o,_al_u2976_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(~D*C*~B*A)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(~D*C*~B*A)"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0000000000100000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0000000000100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2980|_al_u2979  (
    .a({_al_u2973_o,open_n1492}),
    .b({_al_u2975_o,_al_u2887_o}),
    .c({_al_u2978_o,counter[0]}),
    .d({_al_u2979_o,_al_u2931_o}),
    .f({_al_u2980_o,_al_u2979_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*~D)"),
    //.LUT1("(~C*~(B*D))"),
    .INIT_LUT0(16'b0000000000001100),
    .INIT_LUT1(16'b0000001100001111),
    .MODE("LOGIC"))
    \_al_u2981|_al_u3439  (
    .b({_al_u2980_o,_al_u2973_o}),
    .c({_al_u2976_o,_al_u2976_o}),
    .d({_al_u2968_o,_al_u3438_o}),
    .f({_al_u2981_o,_al_u3439_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B))"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b0011111100000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u2982|_al_u3255  (
    .b({open_n1541,_al_u2897_o}),
    .c({_al_u2893_o,_al_u3022_o}),
    .d({_al_u2897_o,_al_u3254_o}),
    .f({_al_u2982_o,_al_u3255_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*D))"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*~(~B*D))"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1100000011110000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1100000011110000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2985|_al_u2983  (
    .b({open_n1564,_al_u2889_o}),
    .c({_al_u2984_o,_al_u2969_o}),
    .d({_al_u2983_o,_al_u2982_o}),
    .f({mux103_b0_sel_is_2_o,_al_u2983_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*B*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*B*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001100),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2988|_al_u2987  (
    .b({mux103_b0_sel_is_2_o,open_n1591}),
    .c({_al_u2987_o,_al_u2969_o}),
    .d({_al_u2981_o,_al_u2986_o}),
    .f({_al_u2988_o,_al_u2987_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2991|_al_u2989  (
    .c({_al_u2990_o,_al_u2969_o}),
    .d({_al_u2989_o,_al_u2931_o}),
    .f({mux111_b0_sel_is_2_o,_al_u2989_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2994|_al_u2993  (
    .c({_al_u2993_o,_al_u2992_o}),
    .d({mux111_b0_sel_is_2_o,_al_u2901_o}),
    .f({_al_u2994_o,_al_u2993_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u2997|_al_u2995  (
    .c({_al_u2996_o,_al_u2992_o}),
    .d({_al_u2995_o,_al_u2886_o}),
    .f({_al_u2997_o,_al_u2995_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u2999|_al_u2998  (
    .c({_al_u2998_o,_al_u2992_o}),
    .d({_al_u2997_o,_al_u2885_o}),
    .f({_al_u2999_o,_al_u2998_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~D)"),
    //.LUT1("~(~C*~(D)*~(B)+~C*D*~(B)+~(~C)*D*B+~C*D*B)"),
    .INIT_LUT0(16'b0000000000001111),
    .INIT_LUT1(16'b0011000011111100),
    .MODE("LOGIC"))
    \_al_u3002|_al_u3001  (
    .b({mux115_b2_sel_is_2_o,open_n1726}),
    .c({_al_u3001_o,_al_u2995_o}),
    .d({_al_u2988_o,_al_u2998_o}),
    .f({_al_u3002_o,_al_u3001_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*B))"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000000000111111),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3005|_al_u3003  (
    .b({open_n1749,_al_u2889_o}),
    .c({_al_u3004_o,_al_u2992_o}),
    .d({_al_u3003_o,_al_u3002_o}),
    .f({_al_u3005_o,_al_u3003_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3007|_al_u3040  (
    .c({_al_u2992_o,_al_u3022_o}),
    .d({_al_u2974_o,_al_u2974_o}),
    .f({_al_u3007_o,_al_u3040_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3008|_al_u3006  (
    .c({_al_u3007_o,_al_u2992_o}),
    .d({_al_u3006_o,_al_u2955_o}),
    .f({mux122_b11_sel_is_2_o,_al_u3006_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3013|_al_u3012  (
    .b({open_n1820,_al_u2901_o}),
    .c({_al_u3012_o,_al_u3010_o}),
    .d({_al_u3011_o,_al_u2894_o}),
    .f({_al_u3013_o,_al_u3012_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3016|_al_u3015  (
    .b({_al_u3014_o,open_n1843}),
    .c({_al_u3015_o,_al_u2992_o}),
    .d({_al_u3013_o,_al_u2840_o}),
    .f({mux130_b6_sel_is_2_o,_al_u3015_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3018|_al_u3017  (
    .b({mux130_b6_sel_is_2_o,open_n1870}),
    .c({_al_u3017_o,_al_u3010_o}),
    .d({_al_u3009_o,_al_u2885_o}),
    .f({_al_u3018_o,_al_u3017_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*D))"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*~(~B*D))"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1100000011110000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1100000011110000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3019|_al_u3205  (
    .b({_al_u2955_o,_al_u2896_o}),
    .c({_al_u2896_o,_al_u3022_o}),
    .d({_al_u2982_o,_al_u2982_o}),
    .f({_al_u3019_o,_al_u3205_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3025|_al_u3024  (
    .b({open_n1919,_al_u3010_o}),
    .c({_al_u3024_o,counter[1]}),
    .d({mux144_b7_sel_is_2_o,_al_u2840_o}),
    .f({mux144_b10_sel_is_2_o,_al_u3024_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B))"),
    //.LUTF1("(~(D)*~(B)*~(C)+D*B*~(C)+~(D)*~(B)*C+~(D)*B*C+D*B*C)"),
    //.LUTG0("(D*~(C*B))"),
    //.LUTG1("(~(D)*~(B)*~(C)+D*B*~(C)+~(D)*~(B)*C+~(D)*B*C+D*B*C)"),
    .INIT_LUTF0(16'b0011111100000000),
    .INIT_LUTF1(16'b1100110011110011),
    .INIT_LUTG0(16'b0011111100000000),
    .INIT_LUTG1(16'b1100110011110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3028|_al_u3026  (
    .b({mux145_b6_sel_is_2_o,_al_u2894_o}),
    .c({_al_u3027_o,_al_u3022_o}),
    .d({_al_u3020_o,mux144_b10_sel_is_2_o}),
    .f({_al_u3028_o,mux145_b6_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B))"),
    //.LUT1("(D*~(C*~B))"),
    .INIT_LUT0(16'b0011111100000000),
    .INIT_LUT1(16'b1100111100000000),
    .MODE("LOGIC"))
    \_al_u3030|_al_u3029  (
    .b({_al_u2982_o,_al_u2885_o}),
    .c({_al_u3022_o,_al_u3022_o}),
    .d({_al_u3029_o,_al_u3028_o}),
    .f({_al_u3030_o,_al_u3029_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3035|_al_u3033  (
    .b({open_n1990,_al_u3022_o}),
    .c({_al_u3034_o,counter[0]}),
    .d({_al_u3033_o,_al_u2931_o}),
    .f({mux158_b11_sel_is_0_o,_al_u3033_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3037|_al_u3036  (
    .b({open_n2017,_al_u3022_o}),
    .c({_al_u3036_o,counter[0]}),
    .d({mux158_b11_sel_is_0_o,_al_u2931_o}),
    .f({mux159_b1_sel_is_2_o,_al_u3036_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3039|_al_u3038  (
    .c({_al_u3038_o,_al_u3022_o}),
    .d({mux159_b1_sel_is_2_o,_al_u2910_o}),
    .f({mux159_b3_sel_is_2_o,_al_u3038_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C)*~(B)+~D*C*~(B)+~(~D)*C*B+~D*C*B)"),
    //.LUT1("(~C*B*~D)"),
    .INIT_LUT0(16'b1100000011110011),
    .INIT_LUT1(16'b0000000000001100),
    .MODE("LOGIC"))
    \_al_u3041|_al_u3032  (
    .b({mux159_b3_sel_is_2_o,_al_u3031_o}),
    .c({_al_u3040_o,counter[0]}),
    .d({_al_u3032_o,_al_u3030_o}),
    .f({_al_u3041_o,_al_u3032_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3044|_al_u3043  (
    .c({_al_u3043_o,_al_u3042_o}),
    .d({_al_u3041_o,_al_u2894_o}),
    .f({_al_u3044_o,_al_u3043_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3047|_al_u3046  (
    .b({open_n2114,_al_u2897_o}),
    .c({_al_u3046_o,_al_u3042_o}),
    .d({_al_u3045_o,_al_u2896_o}),
    .f({mux169_b0_sel_is_2_o,_al_u3046_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3049|_al_u3048  (
    .c({_al_u3048_o,_al_u3042_o}),
    .d({mux169_b0_sel_is_2_o,_al_u2974_o}),
    .f({mux170_b2_sel_is_2_o,_al_u3048_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3051|_al_u3050  (
    .b({mux170_b2_sel_is_2_o,open_n2165}),
    .c({_al_u3050_o,_al_u3042_o}),
    .d({_al_u3044_o,_al_u2885_o}),
    .f({_al_u3051_o,_al_u3050_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3054|_al_u3053  (
    .b({_al_u3052_o,open_n2192}),
    .c({_al_u3053_o,_al_u2903_o}),
    .d({mux14_b11_sel_is_2_o,_al_u2931_o}),
    .f({mux15_b15_sel_is_2_o,_al_u3053_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3056|_al_u3055  (
    .c({_al_u3055_o,_al_u2917_o}),
    .d({mux15_b15_sel_is_2_o,_al_u2901_o}),
    .f({mux16_b15_sel_is_2_o,_al_u3055_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*A*~(~D*~C))"),
    //.LUT1("(~C*~B*~(~D*A))"),
    .INIT_LUT0(16'b1000100010000000),
    .INIT_LUT1(16'b0000001100000001),
    .MODE("LOGIC"))
    \_al_u3059|_al_u3058  (
    .a({_al_u2842_o,_al_u2884_o}),
    .b({_al_u3057_o,_al_u2903_o}),
    .c({_al_u3058_o,counter[0]}),
    .d({counter[0],counter[1]}),
    .f({_al_u3059_o,_al_u3058_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3060|_al_u2922  (
    .b({_al_u2922_o,open_n2263}),
    .c({_al_u3059_o,_al_u2921_o}),
    .d({mux16_b15_sel_is_2_o,mux21_b0_sel_is_0_o}),
    .f({_al_u3060_o,_al_u2922_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3061|_al_u2929  (
    .c({_al_u2929_o,_al_u2927_o}),
    .d({_al_u3060_o,_al_u2901_o}),
    .f({_al_u3061_o,_al_u2929_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3063|_al_u2935  (
    .c({_al_u2935_o,_al_u2927_o}),
    .d({_al_u3062_o,_al_u2885_o}),
    .f({_al_u3063_o,_al_u2935_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3065|_al_u3064  (
    .b({_al_u3063_o,open_n2346}),
    .c({_al_u3064_o,_al_u2927_o}),
    .d({_al_u3061_o,_al_u2897_o}),
    .f({_al_u3065_o,_al_u3064_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C*D))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000110011001100),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u3068|_al_u3066  (
    .b({_al_u3067_o,_al_u2887_o}),
    .c({_al_u2890_o,_al_u2907_o}),
    .d({_al_u3066_o,_al_u2913_o}),
    .f({_al_u3068_o,_al_u3066_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3070|_al_u3069  (
    .c({_al_u2979_o,_al_u2887_o}),
    .d({_al_u3069_o,_al_u2938_o}),
    .f({mux94_b10_sel_is_0_o,_al_u3069_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3072|_al_u3071  (
    .b({_al_u3068_o,open_n2419}),
    .c({mux97_b15_sel_is_2_o,mux94_b10_sel_is_0_o}),
    .d({_al_u3065_o,_al_u2973_o}),
    .f({_al_u3072_o,mux97_b15_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3073|_al_u3144  (
    .c({_al_u2983_o,mux103_b0_sel_is_2_o}),
    .d({_al_u3072_o,_al_u3143_o}),
    .f({_al_u3073_o,_al_u3144_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3074|_al_u3398  (
    .c({_al_u2969_o,_al_u3042_o}),
    .d({_al_u2913_o,_al_u2913_o}),
    .f({_al_u3074_o,_al_u3398_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3075|_al_u2990  (
    .c({_al_u2990_o,_al_u2969_o}),
    .d({_al_u3074_o,_al_u2938_o}),
    .f({_al_u3075_o,_al_u2990_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3078|_al_u3076  (
    .c({_al_u3077_o,_al_u2969_o}),
    .d({_al_u3076_o,_al_u2955_o}),
    .f({_al_u3078_o,_al_u3076_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3079|_al_u3085  (
    .b({_al_u3075_o,_al_u3082_o}),
    .c({_al_u3078_o,_al_u3084_o}),
    .d({_al_u3073_o,_al_u3079_o}),
    .f({_al_u3079_o,_al_u3085_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3080|_al_u2996  (
    .c({_al_u2996_o,_al_u2992_o}),
    .d({_al_u2993_o,_al_u2894_o}),
    .f({_al_u3080_o,_al_u2996_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(~C*B))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(D*~(~C*B))"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111001100000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111001100000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3081|_al_u3082  (
    .b({open_n2608,_al_u2989_o}),
    .c({_al_u2995_o,counter[0]}),
    .d({_al_u3080_o,_al_u3081_o}),
    .f({_al_u3081_o,_al_u3082_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3084|_al_u3083  (
    .c({_al_u3015_o,_al_u2992_o}),
    .d({_al_u3083_o,_al_u2961_o}),
    .f({_al_u3084_o,_al_u3083_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3087|_al_u3086  (
    .c({_al_u3086_o,_al_u3010_o}),
    .d({_al_u3017_o,_al_u2889_o}),
    .f({mux132_b0_sel_is_0_o,_al_u3086_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3088|_al_u3011  (
    .b({mux132_b0_sel_is_0_o,open_n2683}),
    .c({_al_u3011_o,_al_u3010_o}),
    .d({_al_u3085_o,_al_u2886_o}),
    .f({_al_u3088_o,_al_u3011_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3093|_al_u3092  (
    .c({_al_u3092_o,_al_u3010_o}),
    .d({_al_u3091_o,_al_u2896_o}),
    .f({mux135_b11_sel_is_0_o,_al_u3092_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*~B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3094|_al_u3090  (
    .b({_al_u3090_o,open_n2730}),
    .c({mux135_b11_sel_is_0_o,counter[0]}),
    .d({_al_u3088_o,_al_u3089_o}),
    .f({_al_u3094_o,_al_u3090_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u3097|_al_u3095  (
    .b({_al_u3095_o,_al_u2901_o}),
    .c({_al_u3096_o,_al_u3022_o}),
    .d({_al_u3094_o,_al_u2894_o}),
    .f({_al_u3097_o,_al_u3095_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3100|_al_u3099  (
    .c({_al_u3099_o,_al_u3042_o}),
    .d({_al_u3098_o,_al_u2938_o}),
    .f({_al_u3100_o,_al_u3099_o}));
  // sources/rtl/camera_init.v(389)
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C*D))"),
    //.LUT1("(~D*~(B*~(~C*A)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111001100110011),
    .INIT_LUT1(16'b0000000000111011),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u3103|reg1_b6  (
    .a({_al_u3100_o,open_n2805}),
    .b({n376_lutinv,_al_u3103_o}),
    .c({_al_u3102_o,_al_u3107_o}),
    .clk(divider2[8]),
    .d({n375_lutinv,_al_u3051_o}),
    .sr(reset_n),
    .f({_al_u3103_o,open_n2819}),
    .q({open_n2823,data_in_bus[6]}));  // sources/rtl/camera_init.v(389)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3104|_al_u3102  (
    .b({_al_u3042_o,_al_u3042_o}),
    .c({counter[0],counter[0]}),
    .d({_al_u2931_o,_al_u2931_o}),
    .f({_al_u3104_o,_al_u3102_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3105|_al_u3282  (
    .b({open_n2852,_al_u3048_o}),
    .c({_al_u3099_o,_al_u3099_o}),
    .d({_al_u3104_o,_al_u3281_o}),
    .f({mux174_b0_sel_is_0_o,_al_u3282_o}));
  // sources/rtl/camera_init.v(389)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~C*~D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("~(~C*~D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111111111110000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111111111110000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u3107|reg0_b0  (
    .c({n377_lutinv,n375_lutinv}),
    .clk(divider2[8]),
    .d({_al_u3106_o,n377_lutinv}),
    .sr(reset_n),
    .f({_al_u3107_o,open_n2894}),
    .q({open_n2898,reg_address[0]}));  // sources/rtl/camera_init.v(389)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*B))"),
    //.LUTF1("(D*~(~C*B))"),
    //.LUTG0("(~D*~(C*B))"),
    //.LUTG1("(D*~(~C*B))"),
    .INIT_LUTF0(16'b0000000000111111),
    .INIT_LUTF1(16'b1111001100000000),
    .INIT_LUTG0(16'b0000000000111111),
    .INIT_LUTG1(16'b1111001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3109|_al_u2904  (
    .b({_al_u2903_o,_al_u2901_o}),
    .c({counter[2],_al_u2903_o}),
    .d({n184[0],_al_u2843_o}),
    .f({_al_u3109_o,n184[0]}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3111|_al_u3110  (
    .c({_al_u3110_o,_al_u2903_o}),
    .d({_al_u3109_o,_al_u2897_o}),
    .f({_al_u3111_o,_al_u3110_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("(B*~(~C*~D))"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b1100110011000000),
    .MODE("LOGIC"))
    \_al_u3114|_al_u3113  (
    .b({mux16_b1_sel_is_0_o,_al_u3053_o}),
    .c({_al_u3053_o,counter[0]}),
    .d({_al_u3112_o,_al_u3055_o}),
    .f({n198[2],mux16_b1_sel_is_0_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3116|_al_u3115  (
    .c({_al_u3115_o,_al_u2917_o}),
    .d({_al_u2921_o,_al_u2886_o}),
    .f({mux19_b2_sel_is_0_o,_al_u3115_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3117|_al_u3371  (
    .c({mux19_b2_sel_is_0_o,mux19_b2_sel_is_0_o}),
    .d({n198[2],mux21_b0_sel_is_0_o}),
    .f({n212[2],_al_u3371_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3119|_al_u3118  (
    .b({open_n3025,_al_u3064_o}),
    .c({_al_u2930_o,_al_u2934_o}),
    .d({mux38_b12_sel_is_2_o,_al_u3063_o}),
    .f({mux38_b1_sel_is_2_o,mux38_b12_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(~D*~(B*A)))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000111100001000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3121|_al_u3120  (
    .a({open_n3050,n212[2]}),
    .b({open_n3051,mux38_b1_sel_is_2_o}),
    .c({mux47_b1_sel_is_2_o,_al_u2942_o}),
    .d({n225[2],_al_u3064_o}),
    .f({_al_u3121_o,n225[2]}));
  EG_PHY_MSLICE #(
    //.LUT0("(A*~(D*~(~C*~B)))"),
    //.LUT1("(D*~(C*~B))"),
    .INIT_LUT0(16'b0000001010101010),
    .INIT_LUT1(16'b1100111100000000),
    .MODE("LOGIC"))
    \_al_u3124|_al_u3230  (
    .a({open_n3072,mux60_b1_sel_is_2_o}),
    .b({_al_u3123_o,_al_u2931_o}),
    .c({_al_u2944_o,_al_u2938_o}),
    .d({mux52_b1_sel_is_2_o,_al_u2944_o}),
    .f({mux60_b1_sel_is_2_o,mux63_b1_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3125|_al_u3302  (
    .b({open_n3095,_al_u2945_o}),
    .c({_al_u2945_o,_al_u2940_o}),
    .d({mux60_b1_sel_is_2_o,_al_u3301_o}),
    .f({_al_u3125_o,_al_u3302_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*B))"),
    //.LUTF1("(~D*~(~C*~B))"),
    //.LUTG0("(~D*~(~C*B))"),
    //.LUTG1("(~D*~(~C*~B))"),
    .INIT_LUTF0(16'b0000000011110011),
    .INIT_LUTF1(16'b0000000011111100),
    .INIT_LUTG0(16'b0000000011110011),
    .INIT_LUTG1(16'b0000000011111100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3126|_al_u3122  (
    .b({_al_u3125_o,_al_u2940_o}),
    .c({_al_u2910_o,counter[0]}),
    .d({_al_u3122_o,_al_u3121_o}),
    .f({n240[2],_al_u3122_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(D*~(C*B))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0011111100000000),
    .MODE("LOGIC"))
    \_al_u3127|_al_u2939  (
    .b({_al_u2938_o,open_n3144}),
    .c({_al_u2944_o,_al_u2927_o}),
    .d({n240[2],_al_u2938_o}),
    .f({_al_u3127_o,_al_u2939_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~D*~(C*B))"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000000000111111),
    .MODE("LOGIC"))
    \_al_u3130|_al_u3129  (
    .b({_al_u2886_o,_al_u2889_o}),
    .c({_al_u2958_o,_al_u2958_o}),
    .d({_al_u3129_o,_al_u2885_o}),
    .f({mux68_b1_sel_is_2_o,_al_u3129_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(D*~(C*B))"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0011111100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0011111100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3131|_al_u3128  (
    .b({open_n3189,_al_u2901_o}),
    .c({mux68_b1_sel_is_2_o,_al_u2958_o}),
    .d({_al_u3128_o,_al_u3127_o}),
    .f({_al_u3131_o,_al_u3128_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B))"),
    //.LUTF1("(D*~(C*B))"),
    //.LUTG0("(D*~(C*B))"),
    //.LUTG1("(D*~(C*B))"),
    .INIT_LUTF0(16'b0011111100000000),
    .INIT_LUTF1(16'b0011111100000000),
    .INIT_LUTG0(16'b0011111100000000),
    .INIT_LUTG1(16'b0011111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3132|_al_u3133  (
    .b({_al_u2956_o,_al_u2912_o}),
    .c({_al_u2958_o,_al_u2958_o}),
    .d({_al_u3131_o,_al_u3132_o}),
    .f({_al_u3132_o,_al_u3133_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u3136|_al_u3135  (
    .b({_al_u3134_o,_al_u2958_o}),
    .c({_al_u3135_o,counter[1]}),
    .d({_al_u2902_o,_al_u2840_o}),
    .f({_al_u3136_o,_al_u3135_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(D*~(~C*~B))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111110000000000),
    .MODE("LOGIC"))
    \_al_u3137|_al_u3062  (
    .b({_al_u3136_o,open_n3264}),
    .c({_al_u2886_o,_al_u2927_o}),
    .d({_al_u3133_o,_al_u2886_o}),
    .f({_al_u3137_o,_al_u3062_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(A*~(D*~(~C*B)))"),
    //.LUT1("(C*~D)"),
    .INIT_LUT0(16'b0000100010101010),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"))
    \_al_u3139|_al_u3020  (
    .a({open_n3285,_al_u3018_o}),
    .b({open_n3286,_al_u3019_o}),
    .c({_al_u2887_o,_al_u2961_o}),
    .d({_al_u3019_o,_al_u3010_o}),
    .f({_al_u3139_o,_al_u3020_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*~B))"),
    //.LUTF1("(~D*C*~B*A)"),
    //.LUTG0("(D*~(C*~B))"),
    //.LUTG1("(~D*C*~B*A)"),
    .INIT_LUTF0(16'b1100111100000000),
    .INIT_LUTF1(16'b0000000000100000),
    .INIT_LUTG0(16'b1100111100000000),
    .INIT_LUTG1(16'b0000000000100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3141|_al_u3138  (
    .a({mux94_b0_sel_is_2_o,open_n3307}),
    .b({_al_u3139_o,_al_u2913_o}),
    .c({_al_u2973_o,_al_u2887_o}),
    .d({_al_u3140_o,mux94_b10_sel_is_0_o}),
    .f({mux97_b2_sel_is_2_o,mux94_b0_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*B))"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(~D*~(C*B))"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b0000000000111111),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b0000000000111111),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3143|_al_u3434  (
    .b({mux97_b2_sel_is_2_o,_al_u2886_o}),
    .c({_al_u3142_o,_al_u2958_o}),
    .d({_al_u3137_o,_al_u3142_o}),
    .f({_al_u3143_o,_al_u3434_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3146|_al_u3145  (
    .c({_al_u3004_o,_al_u2992_o}),
    .d({_al_u3145_o,_al_u2896_o}),
    .f({mux119_b3_sel_is_0_o,_al_u3145_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3148|_al_u3147  (
    .b({open_n3384,_al_u2889_o}),
    .c({_al_u3147_o,_al_u2992_o}),
    .d({mux119_b3_sel_is_0_o,_al_u2893_o}),
    .f({mux119_b10_sel_is_2_o,_al_u3147_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3152|_al_u3151  (
    .b({_al_u3150_o,open_n3407}),
    .c({_al_u3151_o,_al_u2969_o}),
    .d({_al_u3144_o,_al_u2912_o}),
    .f({_al_u3152_o,_al_u3151_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~D*~B*~(~C*~A))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000110010),
    .MODE("LOGIC"))
    \_al_u3153|_al_u3014  (
    .a({_al_u3152_o,open_n3428}),
    .b({_al_u3012_o,open_n3429}),
    .c({_al_u3014_o,_al_u2992_o}),
    .d({_al_u3015_o,_al_u2912_o}),
    .f({_al_u3153_o,_al_u3014_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3154|_al_u3163  (
    .a({open_n3450,_al_u3154_o}),
    .b({open_n3451,mux140_b1_sel_is_2_o}),
    .c({mux132_b0_sel_is_0_o,mux137_b2_sel_is_2_o}),
    .d({_al_u3153_o,mux148_b3_sel_is_2_o}),
    .f({_al_u3154_o,_al_u3163_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3156|_al_u3155  (
    .c({_al_u3155_o,_al_u3010_o}),
    .d({_al_u3027_o,_al_u2910_o}),
    .f({mux140_b5_sel_is_0_o,_al_u3155_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3158|_al_u3157  (
    .c({_al_u3157_o,_al_u3010_o}),
    .d({mux140_b5_sel_is_0_o,_al_u2974_o}),
    .f({mux140_b1_sel_is_2_o,_al_u3157_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3159|_al_u3089  (
    .c({_al_u3089_o,_al_u3010_o}),
    .d({mux135_b11_sel_is_0_o,_al_u2955_o}),
    .f({mux137_b2_sel_is_2_o,_al_u3089_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3162|_al_u3161  (
    .a({_al_u3160_o,open_n3560}),
    .b({_al_u3095_o,_al_u2889_o}),
    .c({_al_u3096_o,_al_u3022_o}),
    .d({_al_u3161_o,_al_u2885_o}),
    .f({mux148_b3_sel_is_2_o,_al_u3161_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3165|_al_u3164  (
    .c({_al_u3164_o,_al_u3042_o}),
    .d({_al_u3043_o,_al_u2901_o}),
    .f({_al_u3165_o,_al_u3164_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3167|_al_u3166  (
    .c({_al_u3166_o,_al_u3042_o}),
    .d({_al_u3165_o,_al_u2886_o}),
    .f({_al_u3167_o,_al_u3166_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(B*~(~C*~(~D*A)))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1100000011001000),
    .MODE("LOGIC"))
    \_al_u3170|_al_u3169  (
    .a({_al_u3163_o,open_n3641}),
    .b({_al_u3168_o,open_n3642}),
    .c({_al_u3169_o,_al_u3022_o}),
    .d({_al_u3022_o,_al_u2885_o}),
    .f({_al_u3170_o,_al_u3169_o}));
  // sources/rtl/camera_init.v(389)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~(D*~B)*~(C*A))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("~(~(D*~B)*~(C*A))"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1011001110100000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1011001110100000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u3172|reg1_b2  (
    .a({open_n3663,_al_u3172_o}),
    .b({open_n3664,_al_u3217_o}),
    .c({mux170_b2_sel_is_2_o,_al_u3107_o}),
    .clk(divider2[8]),
    .d({_al_u3171_o,n376_lutinv}),
    .sr(reset_n),
    .f({_al_u3172_o,open_n3682}),
    .q({open_n3686,data_in_bus[2]}));  // sources/rtl/camera_init.v(389)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(B*D))"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b0000001100001111),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u3176|_al_u3173  (
    .b({_al_u3174_o,_al_u2903_o}),
    .c({_al_u3175_o,_al_u2842_o}),
    .d({_al_u3173_o,_al_u2886_o}),
    .f({_al_u3176_o,_al_u3173_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*B*C*D+A*B*C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1100100010101010),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3179|_al_u3177  (
    .a({open_n3709,_al_u3176_o}),
    .b({open_n3710,_al_u2913_o}),
    .c({mux21_b12_sel_is_2_o,_al_u2986_o}),
    .d({_al_u3177_o,_al_u2903_o}),
    .f({_al_u3179_o,_al_u3177_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~(B*~D))"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~(B*~D))"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000011),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3180|_al_u2918  (
    .b({_al_u2922_o,open_n3733}),
    .c({_al_u2918_o,_al_u2917_o}),
    .d({_al_u3179_o,_al_u2893_o}),
    .f({_al_u3180_o,_al_u2918_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3183|_al_u3182  (
    .c({_al_u3182_o,_al_u2917_o}),
    .d({_al_u3181_o,_al_u2897_o}),
    .f({mux24_b10_sel_is_2_o,_al_u3182_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(B*~(A*~(D)*~(C)+A*D*~(C)+~(A)*D*C+A*D*C))"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(B*~(A*~(D)*~(C)+A*D*~(C)+~(A)*D*C+A*D*C))"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000010011000100),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000010011000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3184|_al_u2924  (
    .a({_al_u3180_o,open_n3786}),
    .b({mux24_b10_sel_is_2_o,open_n3787}),
    .c({_al_u2924_o,_al_u2917_o}),
    .d({_al_u2883_o,_al_u2911_o}),
    .f({_al_u3184_o,_al_u2924_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3186|_al_u3185  (
    .c({_al_u3185_o,_al_u2917_o}),
    .d({_al_u3184_o,_al_u2938_o}),
    .f({_al_u3186_o,_al_u3185_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3188|_al_u3338  (
    .c({mux33_b0_sel_is_2_o,_al_u3115_o}),
    .d({_al_u3186_o,_al_u3337_o}),
    .f({_al_u3188_o,_al_u3338_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*~B))"),
    //.LUTF1("(B*~(~C*~D))"),
    //.LUTG0("(D*~(C*~B))"),
    //.LUTG1("(B*~(~C*~D))"),
    .INIT_LUTF0(16'b1100111100000000),
    .INIT_LUTF1(16'b1100110011000000),
    .INIT_LUTG0(16'b1100111100000000),
    .INIT_LUTG1(16'b1100110011000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3190|_al_u3189  (
    .b({_al_u2952_o,_al_u2889_o}),
    .c({_al_u3064_o,_al_u2927_o}),
    .d({_al_u3189_o,_al_u3188_o}),
    .f({_al_u3190_o,_al_u3189_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3191|_al_u3376  (
    .c({_al_u3068_o,_al_u2929_o}),
    .d({_al_u3190_o,_al_u3063_o}),
    .f({_al_u3191_o,_al_u3376_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3192|_al_u2970  (
    .c({_al_u2970_o,_al_u2969_o}),
    .d({_al_u3191_o,_al_u2894_o}),
    .f({_al_u3192_o,_al_u2970_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3195|_al_u3194  (
    .c({_al_u3194_o,_al_u2969_o}),
    .d({_al_u2976_o,_al_u2889_o}),
    .f({_al_u3195_o,_al_u3194_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*~B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3196|_al_u3193  (
    .b({_al_u3193_o,open_n3972}),
    .c({_al_u3195_o,counter[0]}),
    .d({_al_u3192_o,_al_u3076_o}),
    .f({_al_u3196_o,_al_u3193_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C)*~(B)+~D*C*~(B)+~(~D)*C*B+~D*C*B)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~D*~(C)*~(B)+~D*C*~(B)+~(~D)*C*B+~D*C*B)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1100000011110011),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1100000011110011),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3198|_al_u3199  (
    .b({open_n3999,_al_u3006_o}),
    .c({_al_u3001_o,counter[0]}),
    .d({_al_u3197_o,_al_u3198_o}),
    .f({_al_u3198_o,_al_u3199_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*A*~(D*C))"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(B*A*~(D*C))"),
    //.LUTG1("(~C*~B*~D)"),
    .INIT_LUTF0(16'b0000100010001000),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b0000100010001000),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3201|_al_u3200  (
    .a({open_n4024,_al_u2840_o}),
    .b({_al_u3011_o,_al_u2992_o}),
    .c({_al_u3200_o,counter[0]}),
    .d({_al_u3199_o,counter[1]}),
    .f({_al_u3201_o,_al_u3200_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B))"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0011111100000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3203|_al_u3204  (
    .b({open_n4051,_al_u2911_o}),
    .c({_al_u3202_o,_al_u3010_o}),
    .d({_al_u3201_o,_al_u3203_o}),
    .f({_al_u3203_o,_al_u3204_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u3207|_al_u3206  (
    .b({_al_u3206_o,_al_u2894_o}),
    .c({_al_u3161_o,_al_u3022_o}),
    .d({_al_u3205_o,_al_u2886_o}),
    .f({_al_u3207_o,_al_u3206_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~((B*A)*~(D)*~(C)+(B*A)*D*~(C)+~((B*A))*D*C+(B*A)*D*C)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("~((B*A)*~(D)*~(C)+(B*A)*D*~(C)+~((B*A))*D*C+(B*A)*D*C)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b0000011111110111),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b0000011111110111),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3210|_al_u3208  (
    .a({open_n4094,_al_u3204_o}),
    .b({open_n4095,_al_u3207_o}),
    .c({_al_u3209_o,_al_u3031_o}),
    .d({_al_u3208_o,counter[0]}),
    .f({_al_u3210_o,_al_u3208_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3211|_al_u3034  (
    .c({_al_u3034_o,_al_u3022_o}),
    .d({_al_u3210_o,_al_u2938_o}),
    .f({_al_u3211_o,_al_u3034_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(~C*~D))"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(B*~(~C*~D))"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1100110011000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1100110011000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3213|_al_u3212  (
    .b({_al_u3036_o,_al_u3042_o}),
    .c({_al_u3212_o,_al_u2889_o}),
    .d({_al_u3211_o,_al_u2885_o}),
    .f({_al_u3213_o,_al_u3212_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3215|_al_u3214  (
    .c({_al_u3214_o,_al_u3042_o}),
    .d({_al_u3213_o,_al_u2897_o}),
    .f({_al_u3215_o,_al_u3214_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(~C*~B*A))"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(D*~(~C*~B*A))"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1111110100000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1111110100000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3217|_al_u3216  (
    .a({open_n4194,_al_u2913_o}),
    .b({_al_u3216_o,_al_u2938_o}),
    .c({_al_u3102_o,_al_u2986_o}),
    .d({_al_u3215_o,_al_u3042_o}),
    .f({_al_u3217_o,_al_u3216_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3220|_al_u3219  (
    .c({_al_u3219_o,_al_u2903_o}),
    .d({_al_u3110_o,_al_u2896_o}),
    .f({_al_u3220_o,_al_u3219_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(B*~(C*~D))"),
    //.LUT1("(~(D*~C)*~(~B*~A))"),
    .INIT_LUT0(16'b1100110000001100),
    .INIT_LUT1(16'b1110000011101110),
    .MODE("LOGIC"))
    \_al_u3223|_al_u3222  (
    .a({_al_u3221_o,open_n4247}),
    .b({_al_u3053_o,_al_u2917_o}),
    .c({_al_u3222_o,_al_u2907_o}),
    .d({_al_u2917_o,_al_u2911_o}),
    .f({_al_u3223_o,_al_u3222_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(B*~(~C*~D))"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(B*~(~C*~D))"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1100110011000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1100110011000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3224|_al_u2932  (
    .b({mux33_b0_sel_is_2_o,open_n4270}),
    .c({_al_u2932_o,_al_u2917_o}),
    .d({_al_u3223_o,_al_u2931_o}),
    .f({_al_u3224_o,_al_u2932_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3228|_al_u3227  (
    .b({open_n4297,_al_u2896_o}),
    .c({_al_u3227_o,_al_u2927_o}),
    .d({_al_u3226_o,_al_u2955_o}),
    .f({mux42_b0_sel_is_2_o,_al_u3227_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(B*~(~D*~A)))"),
    //.LUT1("(~D*~(~C*~B))"),
    .INIT_LUT0(16'b0000001100000111),
    .INIT_LUT1(16'b0000000011111100),
    .MODE("LOGIC"))
    \_al_u3229|_al_u3225  (
    .a({open_n4318,_al_u3224_o}),
    .b({mux42_b0_sel_is_2_o,mux38_b12_sel_is_2_o}),
    .c({_al_u2986_o,_al_u3064_o}),
    .d({_al_u3225_o,_al_u2928_o}),
    .f({n223[7],_al_u3225_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~D*C*B*A)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~D*C*B*A)"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000010000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000010000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3232|_al_u3231  (
    .a({mux63_b1_sel_is_2_o,open_n4339}),
    .b({mux49_b5_sel_is_0_o,open_n4340}),
    .c({mux47_b1_sel_is_2_o,_al_u2927_o}),
    .d({_al_u3231_o,_al_u2913_o}),
    .f({mux63_b7_sel_is_2_o,_al_u3231_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3234|_al_u3134  (
    .b({open_n4367,_al_u2894_o}),
    .c({_al_u3134_o,_al_u2887_o}),
    .d({_al_u3142_o,_al_u2886_o}),
    .f({mux83_b0_sel_is_2_o,_al_u3134_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3235|_al_u3238  (
    .c({counter[0],counter[0]}),
    .d({_al_u3135_o,_al_u3135_o}),
    .f({_al_u3235_o,_al_u3238_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3237|_al_u3236  (
    .b({open_n4414,_al_u2958_o}),
    .c({_al_u3236_o,counter[1]}),
    .d({_al_u3235_o,_al_u2840_o}),
    .f({_al_u3237_o,_al_u3236_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(~C*~B*A))"),
    //.LUTF1("(~D*~C*B*~A)"),
    //.LUTG0("(D*~(~C*~B*A))"),
    //.LUTG1("(~D*~C*B*~A)"),
    .INIT_LUTF0(16'b1111110100000000),
    .INIT_LUTF1(16'b0000000000000100),
    .INIT_LUTG0(16'b1111110100000000),
    .INIT_LUTG1(16'b0000000000000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3240|_al_u2975  (
    .a({_al_u3139_o,_al_u2913_o}),
    .b({mux83_b7_sel_is_2_o,_al_u2974_o}),
    .c({_al_u2975_o,_al_u2938_o}),
    .d({_al_u2890_o,_al_u2887_o}),
    .f({_al_u3240_o,_al_u2975_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(~B*~D))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*~(~B*~D))"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000111100001100),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000111100001100),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3241|_al_u3242  (
    .b({open_n4461,_al_u3069_o}),
    .c({_al_u3240_o,_al_u2979_o}),
    .d({n256[7],_al_u3241_o}),
    .f({_al_u3241_o,_al_u3242_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3244|_al_u2984  (
    .c({_al_u2984_o,_al_u2969_o}),
    .d({_al_u3193_o,_al_u2896_o}),
    .f({_al_u3244_o,_al_u2984_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*~B))"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(D*~(C*~B))"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b1100111100000000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b1100111100000000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3245|_al_u3243  (
    .b({open_n4516,_al_u2883_o}),
    .c({_al_u3244_o,_al_u2969_o}),
    .d({_al_u3243_o,_al_u3242_o}),
    .f({_al_u3245_o,_al_u3243_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3246|_al_u3000  (
    .c({_al_u2994_o,_al_u2999_o}),
    .d({_al_u3245_o,_al_u2994_o}),
    .f({_al_u3246_o,mux115_b2_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3247|_al_u3150  (
    .b({open_n4571,mux121_b7_sel_is_2_o}),
    .c({mux121_b7_sel_is_2_o,_al_u3083_o}),
    .d({_al_u3246_o,mux115_b2_sel_is_2_o}),
    .f({_al_u3247_o,_al_u3150_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(D*~(C*~B))"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(D*~(C*~B))"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b1100111100000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b1100111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3249|_al_u3248  (
    .b({_al_u3248_o,_al_u2992_o}),
    .c({_al_u3015_o,counter[0]}),
    .d({_al_u3247_o,_al_u2931_o}),
    .f({_al_u3249_o,_al_u3248_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1100111111000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3251|_al_u3250  (
    .b({open_n4624,_al_u2894_o}),
    .c({_al_u3017_o,_al_u3010_o}),
    .d({_al_u3250_o,_al_u3249_o}),
    .f({_al_u3251_o,_al_u3250_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u3253|_al_u3252  (
    .b({_al_u3252_o,open_n4647}),
    .c({_al_u3024_o,counter[0]}),
    .d({_al_u3251_o,_al_u3089_o}),
    .f({_al_u3253_o,_al_u3252_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(C*B))"),
    //.LUTF1("(~C*B*~D)"),
    //.LUTG0("(~D*~(C*B))"),
    //.LUTG1("(~C*B*~D)"),
    .INIT_LUTF0(16'b0000000000111111),
    .INIT_LUTF1(16'b0000000000001100),
    .INIT_LUTG0(16'b0000000000111111),
    .INIT_LUTG1(16'b0000000000001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3254|_al_u3023  (
    .b({mux144_b7_sel_is_2_o,_al_u2901_o}),
    .c({_al_u3206_o,_al_u3022_o}),
    .d({_al_u3253_o,_al_u3021_o}),
    .f({_al_u3254_o,mux144_b7_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3258|_al_u3209  (
    .c({_al_u3209_o,_al_u3022_o}),
    .d({_al_u3038_o,_al_u2912_o}),
    .f({_al_u3258_o,_al_u3209_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(~A*~(D)*~(B)+~A*D*~(B)+~(~A)*D*B+~A*D*B))"),
    //.LUT1("(B*~(C*~D))"),
    .INIT_LUT0(16'b0000001000001110),
    .INIT_LUT1(16'b1100110000001100),
    .MODE("LOGIC"))
    \_al_u3259|_al_u3257  (
    .a({open_n4718,_al_u3255_o}),
    .b({mux159_b1_sel_is_2_o,_al_u3031_o}),
    .c({_al_u3258_o,_al_u3256_o}),
    .d({_al_u3257_o,counter[0]}),
    .f({_al_u3259_o,_al_u3257_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3261|_al_u3558  (
    .b({_al_u3260_o,_al_u3214_o}),
    .c({_al_u3043_o,_al_u3334_o}),
    .d({_al_u3259_o,_al_u3260_o}),
    .f({_al_u3261_o,mux166_b1_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3262|_al_u3263  (
    .b({mux170_b2_sel_is_2_o,n377_lutinv}),
    .c({_al_u3099_o,_al_u3102_o}),
    .d({_al_u3261_o,_al_u3262_o}),
    .f({_al_u3262_o,_al_u3263_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~(A)*~(B)*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+~(A)*~(B)*C*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    //.LUT1("(~D*~C*B*A)"),
    .INIT_LUT0(16'b1111000100110001),
    .INIT_LUT1(16'b0000000000001000),
    .MODE("LOGIC"))
    \_al_u3266|_al_u3264  (
    .a({mux24_b10_sel_is_2_o,_al_u2932_o}),
    .b({_al_u3264_o,_al_u2924_o}),
    .c({_al_u3265_o,counter[0]}),
    .d({_al_u2925_o,counter[1]}),
    .f({_al_u3266_o,_al_u3264_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~D*~(C*B))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000111111),
    .MODE("LOGIC"))
    \_al_u3269|_al_u3268  (
    .b({_al_u2931_o,open_n4809}),
    .c({_al_u2944_o,_al_u2958_o}),
    .d({_al_u3268_o,_al_u2901_o}),
    .f({_al_u3269_o,_al_u3268_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(D*~(C*B))"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0011111100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0011111100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3270|_al_u3267  (
    .b({open_n4832,_al_u2894_o}),
    .c({_al_u3269_o,_al_u2958_o}),
    .d({mux68_b0_sel_is_2_o,mux68_b1_sel_is_2_o}),
    .f({_al_u3270_o,mux68_b0_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*(B@D))"),
    //.LUTF1("(B*~(~C*D))"),
    //.LUTG0("(~C*(B@D))"),
    //.LUTG1("(B*~(~C*D))"),
    .INIT_LUTF0(16'b0000001100001100),
    .INIT_LUTF1(16'b1100000011001100),
    .INIT_LUTG0(16'b0000001100001100),
    .INIT_LUTG1(16'b1100000011001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3274|_al_u3273  (
    .b({_al_u2944_o,counter[2]}),
    .c({_al_u3273_o,counter[3]}),
    .d({_al_u3019_o,counter[1]}),
    .f({_al_u3274_o,_al_u3273_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~(D*C*~B))"),
    //.LUTF1("(D*~C*B*A)"),
    //.LUTG0("(A*~(D*C*~B))"),
    //.LUTG1("(D*~C*B*A)"),
    .INIT_LUTF0(16'b1000101010101010),
    .INIT_LUTF1(16'b0000100000000000),
    .INIT_LUTG0(16'b1000101010101010),
    .INIT_LUTG1(16'b0000100000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3275|_al_u3178  (
    .a({_al_u2952_o,mux21_b0_sel_is_0_o}),
    .b({_al_u3272_o,_al_u2900_o}),
    .c({_al_u3274_o,_al_u2884_o}),
    .d({mux21_b12_sel_is_2_o,_al_u2917_o}),
    .f({_al_u3275_o,mux21_b12_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~(A)*~(B)*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*C*D+A*B*C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1010000110110001),
    .MODE("LOGIC"))
    \_al_u3276|_al_u2843  (
    .a({_al_u2842_o,open_n4907}),
    .b({_al_u3058_o,open_n4908}),
    .c({counter[0],counter[0]}),
    .d({_al_u3057_o,_al_u2842_o}),
    .f({_al_u3276_o,_al_u2843_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~(B*~(D*~C)))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(A*~(B*~(D*~C)))"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0010101000100010),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0010101000100010),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3277|_al_u3221  (
    .a({open_n4929,mux15_b15_sel_is_2_o}),
    .b({open_n4930,_al_u3220_o}),
    .c({_al_u3276_o,_al_u2843_o}),
    .d({_al_u3220_o,_al_u3059_o}),
    .f({_al_u3277_o,_al_u3221_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*A)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(~D*C*B*A)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b0000000010000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000000010000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3279|_al_u3278  (
    .a({open_n4955,_al_u3271_o}),
    .b({mux97_b15_sel_is_2_o,_al_u3275_o}),
    .c({_al_u2978_o,_al_u3277_o}),
    .d({_al_u3278_o,_al_u2902_o}),
    .f({_al_u3279_o,_al_u3278_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*B))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111001100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3281|_al_u3280  (
    .b({open_n4982,_al_u3076_o}),
    .c({_al_u3075_o,counter[0]}),
    .d({_al_u3280_o,_al_u3279_o}),
    .f({_al_u3281_o,_al_u3280_o}));
  // sources/rtl/camera_init.v(389)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~D*~(C*~B))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("~(~D*~(C*~B))"),
    //.LUTG1("(~C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111111100110000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111111100110000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u3283|reg1_b7  (
    .b({open_n5005,_al_u3283_o}),
    .c({_al_u3102_o,n376_lutinv}),
    .clk(divider2[8]),
    .d({_al_u3282_o,_al_u3263_o}),
    .sr(reset_n),
    .f({_al_u3283_o,open_n5023}),
    .q({open_n5027,data_in_bus[7]}));  // sources/rtl/camera_init.v(389)
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(D*~(~C*~B)))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~A*~(D*~(~C*~B)))"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000000101010101),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000000101010101),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3286|_al_u3285  (
    .a({open_n5028,_al_u2843_o}),
    .b({open_n5029,_al_u2894_o}),
    .c({_al_u3174_o,_al_u2901_o}),
    .d({n185[3],_al_u2903_o}),
    .f({n187[3],n185[3]}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3289|_al_u3288  (
    .c({_al_u3288_o,_al_u2903_o}),
    .d({mux16_b11_sel_is_2_o,_al_u2974_o}),
    .f({mux16_b0_sel_is_2_o,_al_u3288_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(B*~(~C*~(~D*A)))"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b1100000011001000),
    .MODE("LOGIC"))
    \_al_u3292|_al_u3290  (
    .a({n187[3],open_n5078}),
    .b({mux16_b0_sel_is_2_o,_al_u2903_o}),
    .c({_al_u3290_o,counter[0]}),
    .d({_al_u3291_o,_al_u2955_o}),
    .f({_al_u3292_o,_al_u3290_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(~C*~(~B*~D))"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(~C*~(~B*~D))"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b0000111100001100),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b0000111100001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3294|_al_u3293  (
    .b({_al_u3293_o,open_n5101}),
    .c({_al_u3115_o,counter[0]}),
    .d({_al_u3292_o,_al_u3053_o}),
    .f({n200[3],_al_u3293_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3295|_al_u3181  (
    .b({_al_u3181_o,open_n5128}),
    .c({_al_u2919_o,_al_u2917_o}),
    .d({n200[3],_al_u2957_o}),
    .f({n206[3],_al_u3181_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3297|_al_u3296  (
    .b({open_n5155,counter[0]}),
    .c({_al_u3296_o,counter[1]}),
    .d({n206[3],_al_u2924_o}),
    .f({n207[3],_al_u3296_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000000000001111),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3299|_al_u3298  (
    .c({mux31_b3_sel_is_2_o,_al_u3185_o}),
    .d({mux38_b1_sel_is_2_o,_al_u2932_o}),
    .f({_al_u3299_o,mux31_b3_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*~(B*A)))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~D*~(~C*~(B*A)))"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000000011111000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000000011111000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3301|_al_u3300  (
    .a({open_n5204,n207[3]}),
    .b({open_n5205,_al_u3299_o}),
    .c({_al_u3231_o,_al_u3064_o}),
    .d({_al_u3300_o,_al_u3227_o}),
    .f({_al_u3301_o,_al_u3300_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~A*~(D*~(~C*~B)))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000000101010101),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3305|_al_u3304  (
    .a({open_n5230,_al_u3274_o}),
    .b({open_n5231,_al_u2885_o}),
    .c({mux61_b0_sel_is_2_o,_al_u2889_o}),
    .d({_al_u3270_o,_al_u2944_o}),
    .f({mux68_b4_sel_is_2_o,mux61_b0_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~B*~(A*~(~D*~C)))"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~B*~(A*~(~D*~C)))"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0001000100010011),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0001000100010011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3306|_al_u3303  (
    .a({_al_u3302_o,open_n5252}),
    .b({_al_u2949_o,open_n5253}),
    .c({_al_u3303_o,_al_u2958_o}),
    .d({mux68_b4_sel_is_2_o,_al_u2889_o}),
    .f({_al_u3306_o,_al_u3303_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(C*~(~B*~D))"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b1111000011000000),
    .MODE("LOGIC"))
    \_al_u3308|_al_u3052  (
    .b({_al_u2986_o,_al_u2986_o}),
    .c({_al_u2958_o,_al_u2903_o}),
    .d({_al_u2956_o,_al_u2956_o}),
    .f({_al_u3308_o,_al_u3052_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~C*~B*~D)"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3309|_al_u3307  (
    .b({_al_u3307_o,open_n5302}),
    .c({_al_u3308_o,_al_u2958_o}),
    .d({_al_u3306_o,_al_u2982_o}),
    .f({_al_u3309_o,_al_u3307_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~B*~(~C*~D))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0011001100110000),
    .MODE("LOGIC"))
    \_al_u3311|_al_u3310  (
    .b({_al_u3310_o,open_n5329}),
    .c({_al_u2962_o,_al_u2958_o}),
    .d({_al_u3309_o,_al_u2938_o}),
    .f({_al_u3311_o,_al_u3310_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3312|_al_u3142  (
    .b({_al_u2902_o,open_n5352}),
    .c({_al_u3142_o,_al_u2887_o}),
    .d({_al_u3311_o,_al_u2885_o}),
    .f({_al_u3312_o,_al_u3142_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3313|_al_u3067  (
    .c({_al_u3067_o,_al_u2887_o}),
    .d({_al_u3312_o,_al_u2982_o}),
    .f({_al_u3313_o,_al_u3067_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3314|_al_u3123  (
    .b({_al_u2973_o,_al_u2982_o}),
    .c({_al_u2975_o,_al_u2907_o}),
    .d({_al_u3313_o,_al_u2913_o}),
    .f({_al_u3314_o,_al_u3123_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3315|_al_u3384  (
    .b({open_n5433,mux103_b3_sel_is_0_o}),
    .c({_al_u3195_o,_al_u3194_o}),
    .d({_al_u3314_o,_al_u3383_o}),
    .f({_al_u3315_o,_al_u3384_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3318|_al_u3317  (
    .c({_al_u3317_o,_al_u2969_o}),
    .d({_al_u2984_o,_al_u2897_o}),
    .f({mux103_b3_sel_is_0_o,_al_u3317_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~D)"),
    //.LUT1("(C*B*D)"),
    .INIT_LUT0(16'b0000000000001111),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"))
    \_al_u3319|_al_u3316  (
    .b({mux107_b0_sel_is_2_o,open_n5484}),
    .c({mux103_b3_sel_is_0_o,_al_u3151_o}),
    .d({_al_u3315_o,_al_u2987_o}),
    .f({_al_u3319_o,mux107_b0_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*~(B*A)))"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000000010001111),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3320|_al_u3321  (
    .a({open_n5505,_al_u3320_o}),
    .b({open_n5506,_al_u3082_o}),
    .c({_al_u2990_o,_al_u2997_o}),
    .d({_al_u3319_o,_al_u2998_o}),
    .f({_al_u3320_o,_al_u3321_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B))"),
    //.LUTF1("(D*~(C*B))"),
    //.LUTG0("(D*~(C*B))"),
    //.LUTG1("(D*~(C*B))"),
    .INIT_LUTF0(16'b0011111100000000),
    .INIT_LUTF1(16'b0011111100000000),
    .INIT_LUTG0(16'b0011111100000000),
    .INIT_LUTG1(16'b0011111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3323|_al_u3322  (
    .b({_al_u2938_o,_al_u2931_o}),
    .c({_al_u2992_o,_al_u2992_o}),
    .d({_al_u3322_o,_al_u3013_o}),
    .f({mux130_b1_sel_is_2_o,_al_u3322_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u3325|_al_u3324  (
    .b({_al_u3324_o,open_n5555}),
    .c({_al_u3014_o,_al_u2992_o}),
    .d({mux122_b11_sel_is_2_o,_al_u2910_o}),
    .f({mux124_b11_sel_is_2_o,_al_u3324_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3327|_al_u3326  (
    .a({open_n5576,mux130_b1_sel_is_2_o}),
    .b({open_n5577,mux124_b11_sel_is_2_o}),
    .c({mux132_b3_sel_is_2_o,mux119_b3_sel_is_0_o}),
    .d({_al_u3321_o,mux132_b0_sel_is_0_o}),
    .f({_al_u3327_o,mux132_b3_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3328|_al_u3027  (
    .b({mux137_b2_sel_is_2_o,open_n5604}),
    .c({_al_u3027_o,_al_u3010_o}),
    .d({_al_u3327_o,_al_u2912_o}),
    .f({_al_u3328_o,_al_u3027_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3329|_al_u3393  (
    .c({mux148_b3_sel_is_2_o,mux137_b2_sel_is_2_o}),
    .d({_al_u3328_o,_al_u3392_o}),
    .f({_al_u3329_o,_al_u3393_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3331|_al_u3031  (
    .c({_al_u3031_o,_al_u3022_o}),
    .d({_al_u3330_o,_al_u2955_o}),
    .f({mux153_b3_sel_is_2_o,_al_u3031_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3333|_al_u3332  (
    .b({open_n5675,mux159_b3_sel_is_2_o}),
    .c({_al_u3043_o,mux153_b3_sel_is_2_o}),
    .d({_al_u3332_o,_al_u3329_o}),
    .f({_al_u3333_o,_al_u3332_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~B*~(D*~C*A))"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~B*~(D*~C*A))"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0011000100110011),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0011000100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3335|_al_u3334  (
    .a({_al_u3333_o,open_n5700}),
    .b({_al_u3214_o,open_n5701}),
    .c({_al_u3334_o,_al_u3042_o}),
    .d({mux170_b2_sel_is_2_o,_al_u2893_o}),
    .f({_al_u3335_o,_al_u3334_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*B))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~D*~(~C*B))"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000000011110011),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000000011110011),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3337|_al_u3336  (
    .b({open_n5728,_al_u2842_o}),
    .c({_al_u3052_o,counter[0]}),
    .d({_al_u3336_o,_al_u2905_o}),
    .f({_al_u3337_o,_al_u3336_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(B*D))"),
    //.LUTF1("(B*~(~C*D))"),
    //.LUTG0("(C*~(B*D))"),
    //.LUTG1("(B*~(~C*D))"),
    .INIT_LUTF0(16'b0011000011110000),
    .INIT_LUTF1(16'b1100000011001100),
    .INIT_LUTG0(16'b0011000011110000),
    .INIT_LUTG1(16'b1100000011001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3340|_al_u3339  (
    .b({mux33_b0_sel_is_2_o,_al_u2917_o}),
    .c({_al_u2932_o,_al_u3338_o}),
    .d({_al_u3339_o,_al_u2910_o}),
    .f({_al_u3340_o,_al_u3339_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~A*~(D*C))"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(~B*~A*~(D*C))"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b0000000100010001),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000000100010001),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3342|_al_u3341  (
    .a({open_n5779,_al_u3340_o}),
    .b({_al_u3068_o,_al_u2928_o}),
    .c({mux94_b10_sel_is_0_o,_al_u2889_o}),
    .d({_al_u3341_o,_al_u2927_o}),
    .f({_al_u3342_o,_al_u3341_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3343|_al_u3346  (
    .c({_al_u2971_o,_al_u2994_o}),
    .d({_al_u3342_o,_al_u3345_o}),
    .f({_al_u3343_o,_al_u3346_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u3344|_al_u2977  (
    .b({_al_u2977_o,open_n5830}),
    .c({_al_u3194_o,_al_u2969_o}),
    .d({_al_u3343_o,_al_u2886_o}),
    .f({_al_u3344_o,_al_u2977_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3345|_al_u3572  (
    .c({_al_u3151_o,_al_u2990_o}),
    .d({_al_u3344_o,_al_u3571_o}),
    .f({_al_u3345_o,_al_u3572_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3348|_al_u3347  (
    .c({_al_u3347_o,_al_u2992_o}),
    .d({mux119_b3_sel_is_0_o,_al_u2893_o}),
    .f({_al_u3348_o,_al_u3347_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3350|_al_u3349  (
    .b({open_n5905,_al_u3348_o}),
    .c({_al_u3200_o,_al_u2995_o}),
    .d({_al_u3349_o,_al_u3346_o}),
    .f({_al_u3350_o,_al_u3349_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*~B))"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(D*~(C*~B))"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b1100111100000000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b1100111100000000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3352|_al_u3351  (
    .b({open_n5928,_al_u2894_o}),
    .c({mux132_b0_sel_is_0_o,_al_u3010_o}),
    .d({_al_u3351_o,_al_u3350_o}),
    .f({_al_u3352_o,_al_u3351_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3353|_al_u3412  (
    .c({mux135_b11_sel_is_0_o,_al_u3090_o}),
    .d({_al_u3352_o,_al_u3411_o}),
    .f({_al_u3353_o,_al_u3412_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3355|_al_u3354  (
    .c({mux140_b11_sel_is_2_o,_al_u3252_o}),
    .d({_al_u3353_o,mux140_b1_sel_is_2_o}),
    .f({_al_u3355_o,mux140_b11_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3356|_al_u3160  (
    .c({_al_u3160_o,_al_u3022_o}),
    .d({_al_u3169_o,_al_u2886_o}),
    .f({_al_u3356_o,_al_u3160_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3357|_al_u3511  (
    .c({_al_u3095_o,_al_u3022_o}),
    .d({_al_u3356_o,mux140_b5_sel_is_0_o}),
    .f({mux147_b12_sel_is_2_o,_al_u3511_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3359|_al_u3358  (
    .c({_al_u3358_o,counter[0]}),
    .d({mux147_b12_sel_is_2_o,_al_u3021_o}),
    .f({_al_u3359_o,_al_u3358_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(B*~(~C*D))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1100000011001100),
    .MODE("LOGIC"))
    \_al_u3360|_al_u3021  (
    .b({_al_u3359_o,open_n6079}),
    .c({_al_u3021_o,_al_u3010_o}),
    .d({_al_u3355_o,_al_u2931_o}),
    .f({_al_u3360_o,_al_u3021_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3362|_al_u3417  (
    .b({_al_u3165_o,_al_u3166_o}),
    .c({_al_u3036_o,_al_u3036_o}),
    .d({_al_u3361_o,_al_u3165_o}),
    .f({_al_u3362_o,_al_u3417_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3363|_al_u3361  (
    .c({_al_u3050_o,_al_u3038_o}),
    .d({_al_u3362_o,_al_u3360_o}),
    .f({_al_u3363_o,_al_u3361_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B))"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0011111100000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3365|_al_u3364  (
    .b({open_n6152,_al_u2896_o}),
    .c({_al_u3216_o,_al_u3042_o}),
    .d({_al_u3364_o,_al_u3363_o}),
    .f({_al_u3365_o,_al_u3364_o}));
  // sources/rtl/camera_init.v(389)
  EG_PHY_MSLICE #(
    //.LUT0("~(~B*~(C*~D))"),
    //.LUT1("(B*~(~C*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1100110011111100),
    .INIT_LUT1(16'b1100000011001100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u3366|reg1_b3  (
    .b({n376_lutinv,_al_u3366_o}),
    .c({_al_u3102_o,_al_u3107_o}),
    .clk(divider2[8]),
    .d({_al_u3365_o,_al_u3335_o}),
    .sr(reset_n),
    .f({_al_u3366_o,open_n6188}),
    .q({open_n6192,data_in_bus[3]}));  // sources/rtl/camera_init.v(389)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~(~D*~B*A))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100001101),
    .MODE("LOGIC"))
    \_al_u3369|_al_u3057  (
    .a({n185[3],open_n6193}),
    .b({_al_u3052_o,open_n6194}),
    .c({_al_u3288_o,_al_u2903_o}),
    .d({_al_u3057_o,_al_u2892_o}),
    .f({_al_u3369_o,_al_u3057_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~D*~(B*~A)))"),
    //.LUT1("~(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    .INIT_LUT0(16'b1111000001000000),
    .INIT_LUT1(16'b0000001111001111),
    .MODE("LOGIC"))
    \_al_u3372|_al_u3370  (
    .a({open_n6215,_al_u3369_o}),
    .b({_al_u3371_o,mux14_b11_sel_is_2_o}),
    .c({_al_u2918_o,mux16_b1_sel_is_0_o}),
    .d({n198[4],_al_u3053_o}),
    .f({_al_u3372_o,n198[4]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3373|_al_u3534  (
    .b({open_n6238,_al_u3264_o}),
    .c({_al_u3182_o,_al_u3182_o}),
    .d({_al_u3372_o,_al_u3533_o}),
    .f({n204[4],_al_u3534_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(A*~((D@C))*~(B)+A*(D@C)*~(B)+~(A)*(D@C)*B+A*(D@C)*B)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0010111011100010),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3375|_al_u3374  (
    .a({open_n6263,n204[4]}),
    .b({open_n6264,_al_u2924_o}),
    .c({mux31_b3_sel_is_2_o,counter[0]}),
    .d({n209[4],counter[1]}),
    .f({n213[4],n209[4]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(B*~(A*~(D*~C)))"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(B*~(A*~(D*~C)))"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0100110001000100),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0100110001000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3377|_al_u3226  (
    .a({n213[4],open_n6285}),
    .b({_al_u3376_o,open_n6286}),
    .c({_al_u3226_o,_al_u2927_o}),
    .d({_al_u2927_o,_al_u2974_o}),
    .f({_al_u3377_o,_al_u3226_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(~(~D*C)*~(B*~A))"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b1011101100001011),
    .MODE("LOGIC"))
    \_al_u3378|_al_u3368  (
    .a({_al_u3368_o,open_n6311}),
    .b({_al_u3377_o,_al_u2927_o}),
    .c({_al_u2944_o,counter[0]}),
    .d({_al_u2886_o,_al_u2931_o}),
    .f({_al_u3378_o,_al_u3368_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*B))"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b1111001100000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u3380|_al_u3379  (
    .b({_al_u2960_o,_al_u2958_o}),
    .c({_al_u3236_o,_al_u2893_o}),
    .d({_al_u3379_o,_al_u3378_o}),
    .f({_al_u3380_o,_al_u3379_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*B*A)"),
    //.LUT1("(B*~(~C*D))"),
    .INIT_LUT0(16'b0000000000001000),
    .INIT_LUT1(16'b1100000011001100),
    .MODE("LOGIC"))
    \_al_u3381|_al_u3239  (
    .a({open_n6354,mux83_b0_sel_is_2_o}),
    .b({mux84_b4_sel_is_2_o,_al_u3237_o}),
    .c({_al_u3238_o,_al_u2902_o}),
    .d({_al_u3380_o,_al_u3238_o}),
    .f({_al_u3381_o,mux83_b7_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~(~D*C*~B))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(A*~(~D*C*~B))"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1010101010001010),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1010101010001010),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3383|_al_u3382  (
    .a({open_n6375,_al_u3381_o}),
    .b({open_n6376,_al_u2893_o}),
    .c({_al_u2970_o,_al_u2887_o}),
    .d({_al_u3382_o,_al_u2884_o}),
    .f({_al_u3383_o,_al_u3382_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3387|_al_u3386  (
    .b({_al_u3348_o,_al_u2889_o}),
    .c({_al_u3386_o,_al_u2992_o}),
    .d({_al_u3082_o,_al_u2885_o}),
    .f({mux119_b4_sel_is_2_o,_al_u3386_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*~B))"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b1111110000000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3388|_al_u3385  (
    .b({mux119_b4_sel_is_2_o,_al_u3076_o}),
    .c({_al_u2990_o,mux107_b0_sel_is_2_o}),
    .d({_al_u3385_o,_al_u3384_o}),
    .f({_al_u3388_o,_al_u3385_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(~C*D))"),
    //.LUTF1("(~C*~(B*D))"),
    //.LUTG0("(~B*~(~C*D))"),
    //.LUTG1("(~C*~(B*D))"),
    .INIT_LUTF0(16'b0011000000110011),
    .INIT_LUTF1(16'b0000001100001111),
    .INIT_LUTG0(16'b0011000000110011),
    .INIT_LUTG1(16'b0000001100001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3390|_al_u3389  (
    .b({mux123_b10_sel_is_2_o,_al_u3083_o}),
    .c({_al_u3014_o,counter[0]}),
    .d({_al_u3388_o,_al_u3006_o}),
    .f({_al_u3390_o,mux123_b10_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*~D)"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000000011000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u3392|_al_u3391  (
    .b({_al_u3015_o,_al_u2884_o}),
    .c({_al_u3391_o,_al_u3010_o}),
    .d({_al_u3390_o,_al_u2900_o}),
    .f({_al_u3392_o,_al_u3391_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B))"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0011111100000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3395|_al_u3394  (
    .b({mux149_b4_sel_is_2_o,_al_u2893_o}),
    .c({_al_u3027_o,_al_u3022_o}),
    .d({_al_u3393_o,mux148_b3_sel_is_2_o}),
    .f({_al_u3395_o,mux149_b4_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(~D*~C*A))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(B*~(~D*~C*A))"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1100110011000100),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1100110011000100),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3396|_al_u3397  (
    .a({open_n6515,_al_u3396_o}),
    .b({open_n6516,_al_u3167_o}),
    .c({mux153_b3_sel_is_2_o,_al_u3036_o}),
    .d({_al_u3395_o,_al_u3042_o}),
    .f({_al_u3396_o,_al_u3397_o}));
  // sources/rtl/camera_init.v(389)
  EG_PHY_MSLICE #(
    //.LUT0("~(~(D*~B)*~(C*~A))"),
    //.LUT1("(~C*~B*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0111001101010000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u3400|reg1_b4  (
    .a({open_n6541,_al_u3400_o}),
    .b({_al_u3398_o,_al_u3422_o}),
    .c({_al_u3399_o,_al_u3107_o}),
    .clk(divider2[8]),
    .d({_al_u3397_o,n376_lutinv}),
    .sr(reset_n),
    .f({_al_u3400_o,open_n6555}),
    .q({open_n6559,data_in_bus[4]}));  // sources/rtl/camera_init.v(389)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(C*~B*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(C*~B*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b0011000000000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b0011000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3401|_al_u3272  (
    .b({_al_u2902_o,open_n6562}),
    .c({_al_u3272_o,_al_u2958_o}),
    .d({mux63_b12_sel_is_2_o,mux83_b0_sel_is_2_o}),
    .f({mux83_b12_sel_is_2_o,_al_u3272_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3402|_al_u3291  (
    .b({open_n6589,_al_u2896_o}),
    .c({_al_u3291_o,_al_u2903_o}),
    .d({_al_u3336_o,_al_u2955_o}),
    .f({_al_u3402_o,_al_u3291_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(C*B*D)"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"))
    \_al_u3403|_al_u3271  (
    .b({mux16_b0_sel_is_2_o,mux38_b1_sel_is_2_o}),
    .c({_al_u3402_o,_al_u3270_o}),
    .d({_al_u3266_o,_al_u3266_o}),
    .f({_al_u3403_o,_al_u3271_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(C@D)"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b0000111111110000),
    .MODE("LOGIC"))
    \_al_u3406|_al_u3405  (
    .b({open_n6638,_al_u3404_o}),
    .c({_al_u2973_o,_al_u3068_o}),
    .d({_al_u3405_o,mux83_b12_sel_is_2_o}),
    .f({_al_u3406_o,_al_u3405_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3407|_al_u3408  (
    .b({open_n6661,mux111_b0_sel_is_2_o}),
    .c({_al_u3244_o,_al_u3151_o}),
    .d({_al_u3406_o,_al_u3407_o}),
    .f({_al_u3407_o,_al_u3408_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("(~D*~(C*~B))"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b0000000011001111),
    .MODE("LOGIC"))
    \_al_u3410|_al_u3409  (
    .b({_al_u2995_o,_al_u2989_o}),
    .c({_al_u2992_o,counter[0]}),
    .d({_al_u3409_o,_al_u3408_o}),
    .f({_al_u3410_o,_al_u3409_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(~C*~(B*~D))"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b0000111100000011),
    .MODE("LOGIC"))
    \_al_u3411|_al_u3550  (
    .b({mux130_b1_sel_is_2_o,mux132_b0_sel_is_0_o}),
    .c({_al_u3011_o,_al_u3202_o}),
    .d({_al_u3410_o,mux130_b1_sel_is_2_o}),
    .f({_al_u3411_o,_al_u3550_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("~(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000001111001111),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000001111001111),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3413|_al_u3554  (
    .b({open_n6732,_al_u3359_o}),
    .c({_al_u3358_o,_al_u3169_o}),
    .d({_al_u3412_o,_al_u3553_o}),
    .f({_al_u3413_o,_al_u3554_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~((~C*A)*~(D)*~(B)+(~C*A)*D*~(B)+~((~C*A))*D*B+(~C*A)*D*B)"),
    //.LUTF1("(~C*B*~D)"),
    //.LUTG0("~((~C*A)*~(D)*~(B)+(~C*A)*D*~(B)+~((~C*A))*D*B+(~C*A)*D*B)"),
    //.LUTG1("(~C*B*~D)"),
    .INIT_LUTF0(16'b0011000111111101),
    .INIT_LUTF1(16'b0000000000001100),
    .INIT_LUTG0(16'b0011000111111101),
    .INIT_LUTG1(16'b0000000000001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3416|_al_u3415  (
    .a({open_n6757,_al_u3413_o}),
    .b({_al_u3258_o,_al_u3031_o}),
    .c({_al_u3034_o,_al_u3414_o}),
    .d({_al_u3415_o,counter[0]}),
    .f({_al_u3416_o,_al_u3415_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3418|_al_u3422  (
    .b({open_n6784,_al_u3106_o}),
    .c({_al_u3417_o,_al_u3421_o}),
    .d({_al_u3416_o,_al_u3420_o}),
    .f({_al_u3418_o,_al_u3422_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(B*~(~C*~D))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(B*~(~C*~D))"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1100110011000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1100110011000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3420|_al_u3419  (
    .b({open_n6811,_al_u3042_o}),
    .c({_al_u3419_o,_al_u2889_o}),
    .d({_al_u3418_o,_al_u2893_o}),
    .f({_al_u3420_o,_al_u3419_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3421|_al_u3045  (
    .c({_al_u3045_o,_al_u3042_o}),
    .d({_al_u3048_o,_al_u2955_o}),
    .f({_al_u3421_o,_al_u3045_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*B))"),
    //.LUTF1("(~C*B*~D)"),
    //.LUTG0("(~D*~(~C*B))"),
    //.LUTG1("(~C*B*~D)"),
    .INIT_LUTF0(16'b0000000011110011),
    .INIT_LUTF1(16'b0000000000001100),
    .INIT_LUTG0(16'b0000000011110011),
    .INIT_LUTG1(16'b0000000000001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3425|_al_u3424  (
    .b({_al_u3424_o,_al_u3058_o}),
    .c({_al_u3110_o,_al_u2900_o}),
    .d({_al_u3290_o,_al_u2842_o}),
    .f({_al_u3425_o,_al_u3424_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3427|_al_u3426  (
    .c({_al_u3426_o,_al_u2903_o}),
    .d({_al_u3425_o,_al_u2912_o}),
    .f({_al_u3427_o,_al_u3426_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*A*~(~D*~C))"),
    //.LUT1("(D*~(~C*B))"),
    .INIT_LUT0(16'b0010001000100000),
    .INIT_LUT1(16'b1111001100000000),
    .MODE("LOGIC"))
    \_al_u3429|_al_u3428  (
    .a({open_n6914,_al_u3427_o}),
    .b({_al_u3222_o,_al_u2921_o}),
    .c({counter[0],counter[0]}),
    .d({_al_u3428_o,_al_u3109_o}),
    .f({_al_u3429_o,_al_u3428_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3431|_al_u3430  (
    .b({open_n6937,_al_u2930_o}),
    .c({_al_u2935_o,_al_u2925_o}),
    .d({_al_u3430_o,_al_u3429_o}),
    .f({_al_u3431_o,_al_u3430_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(A*~(~B*~(~D*C)))"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(A*~(~B*~(~D*C)))"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1000100010101000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1000100010101000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3433|_al_u3432  (
    .a({_al_u3431_o,open_n6962}),
    .b({_al_u2950_o,open_n6963}),
    .c({mux83_b12_sel_is_2_o,_al_u2927_o}),
    .d({_al_u3432_o,_al_u2897_o}),
    .f({_al_u3433_o,_al_u3432_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(B*~(A*~(~D*C)))"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(B*~(A*~(~D*C)))"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0100010011000100),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0100010011000100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3435|_al_u2898  (
    .a({_al_u3433_o,open_n6988}),
    .b({_al_u3434_o,_al_u2897_o}),
    .c({_al_u2887_o,_al_u2887_o}),
    .d({_al_u2896_o,_al_u2896_o}),
    .f({_al_u3435_o,_al_u2898_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3436|_al_u3140  (
    .c({_al_u3140_o,_al_u2887_o}),
    .d({_al_u3435_o,_al_u2974_o}),
    .f({_al_u3436_o,_al_u3140_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3438|_al_u3437  (
    .b({_al_u2979_o,open_n7039}),
    .c({_al_u3437_o,_al_u2887_o}),
    .d({_al_u3436_o,_al_u2910_o}),
    .f({_al_u3438_o,_al_u3437_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3441|_al_u3440  (
    .c({_al_u3440_o,_al_u2969_o}),
    .d({_al_u3439_o,_al_u2893_o}),
    .f({_al_u3441_o,_al_u3440_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u3442|_al_u3077  (
    .b({_al_u2989_o,open_n7094}),
    .c({_al_u3077_o,_al_u2969_o}),
    .d({_al_u3075_o,_al_u2974_o}),
    .f({_al_u3442_o,_al_u3077_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3444|_al_u3443  (
    .b({open_n7117,_al_u3442_o}),
    .c({_al_u3001_o,_al_u2984_o}),
    .d({_al_u3443_o,_al_u3441_o}),
    .f({_al_u3444_o,_al_u3443_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(C*D))"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(~B*~(C*D))"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b0000001100110011),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b0000001100110011),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3446|_al_u3445  (
    .b({_al_u3445_o,_al_u3083_o}),
    .c({_al_u3004_o,counter[0]}),
    .d({_al_u3444_o,_al_u3006_o}),
    .f({_al_u3446_o,_al_u3445_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3447|_al_u3149  (
    .c({_al_u3248_o,_al_u3006_o}),
    .d({_al_u3446_o,mux119_b10_sel_is_2_o}),
    .f({_al_u3447_o,mux121_b7_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3449|_al_u3448  (
    .b({open_n7198,_al_u3092_o}),
    .c({_al_u3157_o,_al_u3086_o}),
    .d({_al_u3448_o,_al_u3447_o}),
    .f({_al_u3449_o,_al_u3448_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3450|_al_u3565  (
    .b({_al_u3358_o,open_n7225}),
    .c({_al_u3155_o,_al_u3564_o}),
    .d({_al_u3449_o,_al_u2910_o}),
    .f({_al_u3450_o,_al_u3565_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3453|_al_u3452  (
    .b({open_n7252,_al_u3258_o}),
    .c({_al_u3033_o,_al_u3031_o}),
    .d({_al_u3452_o,_al_u3451_o}),
    .f({_al_u3453_o,_al_u3452_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3455|_al_u3454  (
    .b({open_n7279,_al_u3166_o}),
    .c({_al_u3334_o,_al_u3164_o}),
    .d({_al_u3454_o,_al_u3453_o}),
    .f({_al_u3455_o,_al_u3454_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~(D*A)))"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*~(~B*~(D*A)))"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b1110000011000000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b1110000011000000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3457|_al_u3456  (
    .a({open_n7304,_al_u2955_o}),
    .b({_al_u3048_o,_al_u2896_o}),
    .c({_al_u3456_o,_al_u3042_o}),
    .d({_al_u3455_o,counter[0]}),
    .f({_al_u3457_o,_al_u3456_o}));
  // sources/rtl/camera_init.v(389)
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C*~(~D*A)))"),
    //.LUT1("(~C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111001101110011),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u3458|reg1_b0  (
    .a({open_n7329,_al_u3458_o}),
    .b({open_n7330,_al_u3488_o}),
    .c({_al_u3099_o,n376_lutinv}),
    .clk(divider2[8]),
    .d({_al_u3457_o,_al_u3102_o}),
    .sr(reset_n),
    .f({_al_u3458_o,open_n7344}),
    .q({open_n7348,data_in_bus[0]}));  // sources/rtl/camera_init.v(389)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~D*~(~C*B))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000011110011),
    .MODE("LOGIC"))
    \_al_u3459|_al_u3175  (
    .b({_al_u3175_o,open_n7351}),
    .c({_al_u3290_o,_al_u2903_o}),
    .d({_al_u3111_o,_al_u2955_o}),
    .f({_al_u3459_o,_al_u3175_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3461|_al_u3460  (
    .b({open_n7374,mux16_b0_sel_is_2_o}),
    .c({mux21_b0_sel_is_0_o,_al_u3115_o}),
    .d({n200[0],_al_u3459_o}),
    .f({n203[0],n200[0]}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(~D*~C*A))"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(~B*~(~D*~C*A))"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b0011001100110001),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0011001100110001),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3463|_al_u3462  (
    .a({open_n7399,n203[0]}),
    .b({open_n7400,_al_u2924_o}),
    .c({mux33_b0_sel_is_2_o,_al_u2925_o}),
    .d({_al_u3462_o,_al_u3222_o}),
    .f({n214[0],_al_u3462_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3465|_al_u3464  (
    .b({open_n7427,mux49_b0_sel_is_2_o}),
    .c({mux61_b0_sel_is_2_o,_al_u2934_o}),
    .d({_al_u3464_o,n214[0]}),
    .f({_al_u3465_o,_al_u3464_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3467|_al_u3466  (
    .b({mux68_b0_sel_is_2_o,open_n7450}),
    .c({_al_u3466_o,_al_u2958_o}),
    .d({_al_u3465_o,_al_u2897_o}),
    .f({_al_u3467_o,_al_u3466_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*~D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000000000001111),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000000000001111),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3468|_al_u3540  (
    .c({_al_u2960_o,_al_u3235_o}),
    .d({_al_u3467_o,_al_u3310_o}),
    .f({_al_u3468_o,_al_u3540_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u3470|_al_u3469  (
    .b({_al_u3469_o,_al_u2912_o}),
    .c({_al_u3238_o,_al_u2958_o}),
    .d({_al_u3468_o,_al_u2910_o}),
    .f({_al_u3470_o,_al_u3469_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3471|_al_u3451  (
    .c({mux87_b0_sel_is_2_o,_al_u3161_o}),
    .d({_al_u3470_o,_al_u3450_o}),
    .f({_al_u3471_o,_al_u3451_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(A*~(~D*~C*~B))"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(A*~(~D*~C*~B))"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b1010101010101000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1010101010101000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3473|_al_u3472  (
    .a({open_n7553,_al_u3471_o}),
    .b({mux103_b0_sel_is_2_o,_al_u3140_o}),
    .c({mux107_b0_sel_is_2_o,mux97_b2_sel_is_2_o}),
    .d({_al_u3472_o,_al_u2894_o}),
    .f({_al_u3473_o,_al_u3472_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3474|_al_u3475  (
    .b({open_n7580,_al_u2999_o}),
    .c({mux111_b0_sel_is_2_o,mux119_b3_sel_is_0_o}),
    .d({_al_u3473_o,_al_u3474_o}),
    .f({_al_u3474_o,_al_u3475_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~(~B*~A)*~(D)*~(C)+~(~B*~A)*D*~(C)+~(~(~B*~A))*D*C+~(~B*~A)*D*C)"),
    //.LUT1("~(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    .INIT_LUT0(16'b1111111000001110),
    .INIT_LUT1(16'b0000001111001111),
    .MODE("LOGIC"))
    \_al_u3477|_al_u3476  (
    .a({open_n7601,_al_u3475_o}),
    .b({mux130_b6_sel_is_2_o,_al_u3145_o}),
    .c({_al_u3011_o,_al_u3006_o}),
    .d({_al_u3476_o,counter[0]}),
    .f({_al_u3477_o,_al_u3476_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3478|_al_u3202  (
    .b({_al_u3202_o,open_n7624}),
    .c({_al_u3092_o,_al_u3010_o}),
    .d({mux132_b0_sel_is_0_o,_al_u2982_o}),
    .f({mux135_b0_sel_is_2_o,_al_u3202_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B))"),
    //.LUT1("(C*B*~D)"),
    .INIT_LUT0(16'b0011111100000000),
    .INIT_LUT1(16'b0000000011000000),
    .MODE("LOGIC"))
    \_al_u3480|_al_u3479  (
    .b({_al_u3359_o,_al_u2911_o}),
    .c({mux139_b0_sel_is_2_o,_al_u3010_o}),
    .d({_al_u3477_o,mux135_b0_sel_is_2_o}),
    .f({_al_u3480_o,mux139_b0_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~B*~(C*~D))"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~B*~(C*~D))"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0011001100000011),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0011001100000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3482|_al_u3481  (
    .b({_al_u3481_o,_al_u2892_o}),
    .c({_al_u3356_o,_al_u3022_o}),
    .d({_al_u3480_o,_al_u2956_o}),
    .f({_al_u3482_o,_al_u3481_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3483|_al_u3256  (
    .c({_al_u3256_o,_al_u3022_o}),
    .d({_al_u3038_o,_al_u2961_o}),
    .f({mux156_b0_sel_is_2_o,_al_u3256_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*~D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000000000110000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3484|_al_u3098  (
    .b({open_n7723,_al_u3033_o}),
    .c({mux156_b0_sel_is_2_o,_al_u3097_o}),
    .d({mux158_b11_sel_is_0_o,_al_u3048_o}),
    .f({_al_u3484_o,_al_u3098_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*~(B*A)))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~D*~(~C*~(B*A)))"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000000011111000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000011111000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3486|_al_u3485  (
    .a({open_n7744,_al_u3482_o}),
    .b({open_n7745,_al_u3484_o}),
    .c({_al_u3260_o,_al_u3033_o}),
    .d({_al_u3485_o,_al_u3036_o}),
    .f({_al_u3486_o,_al_u3485_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(C*B*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"))
    \_al_u3487|_al_u3106  (
    .b({mux169_b0_sel_is_2_o,open_n7772}),
    .c({mux174_b0_sel_is_0_o,_al_u3102_o}),
    .d({_al_u3486_o,mux174_b0_sel_is_0_o}),
    .f({_al_u3487_o,_al_u3106_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("~(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b0000001111001111),
    .MODE("LOGIC"))
    \_al_u3488|_al_u2864  (
    .b({n377_lutinv,n379_lutinv}),
    .c({n378_lutinv,ready_out}),
    .d({_al_u3487_o,_al_u2862_o}),
    .f({_al_u3488_o,_al_u2864_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(B*~(~C*~D))"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(B*~(~C*~D))"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b1100110011000000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b1100110011000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3490|_al_u3287  (
    .b({mux16_b11_sel_is_2_o,_al_u3055_o}),
    .c({_al_u2986_o,_al_u3053_o}),
    .d({_al_u2909_o,mux14_b11_sel_is_2_o}),
    .f({n198[5],mux16_b11_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*~D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*B*~D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000000000001100),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000000001100),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3491|_al_u3112  (
    .b({open_n7843,mux14_b11_sel_is_2_o}),
    .c({mux19_b2_sel_is_0_o,_al_u2908_o}),
    .d({n198[5],_al_u3111_o}),
    .f({n201[5],_al_u3112_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(~C*~B*D)"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000001100000000),
    .MODE("LOGIC"))
    \_al_u3493|_al_u3492  (
    .b({_al_u3181_o,open_n7870}),
    .c({_al_u3492_o,_al_u2917_o}),
    .d({n201[5],_al_u2982_o}),
    .f({n206[5],_al_u3492_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(B*D))"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000001100001111),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3494|_al_u3495  (
    .b({open_n7893,mux38_b1_sel_is_2_o}),
    .c({_al_u3296_o,_al_u3432_o}),
    .d({n206[5],n212[5]}),
    .f({n212[5],_al_u3495_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*~A)"),
    //.LUTF1("(~C*B*~D)"),
    //.LUTG0("(D*C*B*~A)"),
    //.LUTG1("(~C*B*~D)"),
    .INIT_LUTF0(16'b0100000000000000),
    .INIT_LUTF1(16'b0000000000001100),
    .INIT_LUTG0(16'b0100000000000000),
    .INIT_LUTG1(16'b0000000000001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3497|_al_u3496  (
    .a({open_n7914,_al_u3274_o}),
    .b({_al_u3496_o,mux49_b5_sel_is_0_o}),
    .c({_al_u2942_o,mux52_b1_sel_is_2_o}),
    .d({_al_u3495_o,_al_u3269_o}),
    .f({_al_u3497_o,_al_u3496_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*~D)"),
    //.LUT1("(~B*~(~C*~D))"),
    .INIT_LUT0(16'b0000000000001100),
    .INIT_LUT1(16'b0011001100110000),
    .MODE("LOGIC"))
    \_al_u3498|_al_u3567  (
    .b({_al_u2965_o,_al_u3496_o}),
    .c({_al_u3268_o,_al_u2965_o}),
    .d({_al_u3497_o,_al_u3566_o}),
    .f({_al_u3498_o,_al_u3567_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3500|_al_u3499  (
    .b({open_n7963,mux75_b5_sel_is_2_o}),
    .c({_al_u3238_o,_al_u3307_o}),
    .d({_al_u3499_o,_al_u3498_o}),
    .f({_al_u3500_o,_al_u3499_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .MODE("LOGIC"))
    _al_u3501 (
    .c({open_n7992,mux85_b0_sel_is_2_o}),
    .d({open_n7995,_al_u3500_o}),
    .f({open_n8009,_al_u3501_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3502|_al_u3503  (
    .b({mux97_b15_sel_is_2_o,_al_u3195_o}),
    .c({_al_u3066_o,_al_u3440_o}),
    .d({_al_u3501_o,_al_u3502_o}),
    .f({_al_u3502_o,_al_u3503_o}));
  EG_PHY_MSLICE #(
    //.LUT0("~(D*~(C)*~(B)+D*C*~(B)+~(D)*C*B+D*C*B)"),
    //.LUT1("(~C*B*~D)"),
    .INIT_LUT0(16'b0000110000111111),
    .INIT_LUT1(16'b0000000000001100),
    .MODE("LOGIC"))
    \_al_u3505|_al_u3504  (
    .b({mux111_b0_sel_is_2_o,_al_u3076_o}),
    .c({_al_u3151_o,counter[0]}),
    .d({_al_u3504_o,_al_u3503_o}),
    .f({_al_u3505_o,_al_u3504_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~(A*~(D*B)))"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~(A*~(D*B)))"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000110100000101),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000110100000101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3507|_al_u3506  (
    .a({_al_u3505_o,open_n8063}),
    .b({_al_u3080_o,open_n8064}),
    .c({_al_u3506_o,counter[0]}),
    .d({_al_u2992_o,_al_u2989_o}),
    .f({_al_u3507_o,_al_u3506_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*~D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000000000001111),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000000001111),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3510|_al_u3509  (
    .c({mux137_b5_sel_is_2_o,_al_u3092_o}),
    .d({_al_u3508_o,_al_u3089_o}),
    .f({_al_u3510_o,mux137_b5_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3512|_al_u3096  (
    .b({open_n8119,_al_u2938_o}),
    .c({_al_u3096_o,_al_u3010_o}),
    .d({_al_u3511_o,_al_u2931_o}),
    .f({mux159_b5_sel_is_2_o,_al_u3096_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(~C*~D)"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b0000000000001111),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b0000000000001111),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3513|_al_u3260  (
    .b({mux159_b5_sel_is_2_o,open_n8146}),
    .c({_al_u3212_o,_al_u3212_o}),
    .d({_al_u3510_o,_al_u3166_o}),
    .f({_al_u3513_o,_al_u3260_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3514|_al_u3526  (
    .c({_al_u3456_o,mux140_b11_sel_is_2_o}),
    .d({_al_u3513_o,_al_u3525_o}),
    .f({_al_u3514_o,_al_u3526_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(D*~(C*~B))"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b1100111100000000),
    .MODE("LOGIC"))
    \_al_u3515|_al_u3399  (
    .b({_al_u3399_o,open_n8201}),
    .c({_al_u3216_o,counter[0]}),
    .d({_al_u3514_o,_al_u3045_o}),
    .f({_al_u3515_o,_al_u3399_o}));
  // sources/rtl/camera_init.v(389)
  EG_PHY_MSLICE #(
    //.LUT0("~(~D*~A*~(C*~B))"),
    //.LUT1("(B*~(~A*~(D*C)))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111111110111010),
    .INIT_LUT1(16'b1100100010001000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u3516|reg1_b5  (
    .a({_al_u3515_o,_al_u3516_o}),
    .b({_al_u3107_o,_al_u3529_o}),
    .c({_al_u2910_o,n376_lutinv}),
    .clk(divider2[8]),
    .d({_al_u3042_o,n375_lutinv}),
    .sr(reset_n),
    .f({_al_u3516_o,open_n8235}),
    .q({open_n8239,data_in_bus[5]}));  // sources/rtl/camera_init.v(389)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3517|_al_u3174  (
    .c({_al_u3058_o,_al_u2903_o}),
    .d({_al_u3174_o,_al_u2893_o}),
    .f({_al_u3517_o,_al_u3174_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3518|_al_u3404  (
    .c({_al_u3517_o,_al_u2928_o}),
    .d({_al_u3266_o,_al_u3403_o}),
    .f({_al_u3518_o,_al_u3404_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3520|_al_u3519  (
    .b({open_n8290,_al_u2928_o}),
    .c({_al_u3068_o,_al_u2934_o}),
    .d({_al_u3519_o,_al_u3518_o}),
    .f({_al_u3520_o,_al_u3519_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*~D)"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(C*~B*~D)"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b0000000000110000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b0000000000110000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3522|_al_u3521  (
    .b({_al_u3075_o,_al_u2984_o}),
    .c({_al_u2989_o,_al_u3520_o}),
    .d({_al_u3521_o,_al_u3076_o}),
    .f({_al_u3522_o,_al_u3521_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3523|_al_u3548  (
    .c({_al_u3386_o,_al_u3386_o}),
    .d({_al_u3522_o,_al_u3547_o}),
    .f({_al_u3523_o,_al_u3548_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*B*A)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b1000000000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3525|_al_u3524  (
    .a({open_n8365,_al_u3523_o}),
    .b({open_n8366,_al_u3013_o}),
    .c({_al_u3092_o,_al_u3084_o}),
    .d({_al_u3524_o,mux132_b0_sel_is_0_o}),
    .f({_al_u3525_o,_al_u3524_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~(~B*~D))"),
    //.LUT1("(~D*~C*B*A)"),
    .INIT_LUT0(16'b1111000011000000),
    .INIT_LUT1(16'b0000000000001000),
    .MODE("LOGIC"))
    \_al_u3527|_al_u3414  (
    .a({_al_u3526_o,open_n8387}),
    .b({mux156_b0_sel_is_2_o,_al_u2897_o}),
    .c({_al_u3031_o,_al_u3022_o}),
    .d({_al_u3414_o,_al_u2896_o}),
    .f({_al_u3527_o,_al_u3414_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*~D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0000000000110000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3528|_al_u3529  (
    .b({_al_u3417_o,_al_u3102_o}),
    .c({_al_u3050_o,_al_u3528_o}),
    .d({_al_u3527_o,_al_u3216_o}),
    .f({_al_u3528_o,_al_u3529_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~(D)*~(B)*~(C)+D*~(B)*~(C)+D*B*~(C)+~(D)*~(B)*C+D*B*C)"),
    //.LUT1("(~D*~(~B*~(~C*~A)))"),
    .INIT_LUT0(16'b1100111100110011),
    .INIT_LUT1(16'b0000000011001101),
    .MODE("LOGIC"))
    \_al_u3531|_al_u3532  (
    .a({_al_u3109_o,open_n8430}),
    .b({_al_u3052_o,mux14_b11_sel_is_2_o}),
    .c({_al_u3219_o,_al_u3053_o}),
    .d({_al_u3288_o,_al_u3531_o}),
    .f({_al_u3531_o,_al_u3532_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~B*~(~C*~D))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0011001100110000),
    .MODE("LOGIC"))
    \_al_u3533|_al_u2921  (
    .b({_al_u2921_o,open_n8453}),
    .c({_al_u2917_o,_al_u2917_o}),
    .d({_al_u3532_o,_al_u2885_o}),
    .f({_al_u3533_o,_al_u2921_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*~D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0000000011000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3536|_al_u3535  (
    .b({mux47_b1_sel_is_2_o,mux38_b1_sel_is_2_o}),
    .c({_al_u2946_o,mux42_b0_sel_is_2_o}),
    .d({n223[1],_al_u3534_o}),
    .f({_al_u3536_o,n223[1]}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3537|_al_u3538  (
    .b({open_n8498,mux68_b1_sel_is_2_o}),
    .c({mux63_b1_sel_is_2_o,_al_u3466_o}),
    .d({_al_u3536_o,_al_u3537_o}),
    .f({_al_u3537_o,_al_u3538_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0011111100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3541|_al_u3539  (
    .b({open_n8521,_al_u2912_o}),
    .c({_al_u3540_o,_al_u2958_o}),
    .d({_al_u3539_o,_al_u3538_o}),
    .f({_al_u3541_o,_al_u3539_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3544|_al_u3543  (
    .b({open_n8544,_al_u3139_o}),
    .c({mux94_b0_sel_is_2_o,_al_u3142_o}),
    .d({_al_u3543_o,_al_u3542_o}),
    .f({_al_u3544_o,_al_u3543_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~B*A*~(~D*C))"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~B*A*~(~D*C))"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0010001000000010),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0010001000000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3545|_al_u2971  (
    .a({_al_u3544_o,open_n8565}),
    .b({_al_u2971_o,open_n8566}),
    .c({_al_u2969_o,_al_u2969_o}),
    .d({_al_u2981_o,_al_u2901_o}),
    .f({_al_u3545_o,_al_u2971_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~A*~(D*C))"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b0000000100010001),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u3547|_al_u3546  (
    .a({open_n8591,_al_u3545_o}),
    .b({open_n8592,_al_u3193_o}),
    .c({_al_u2996_o,mux107_b0_sel_is_2_o}),
    .d({_al_u3546_o,_al_u3074_o}),
    .f({_al_u3547_o,_al_u3546_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u3549|_al_u3004  (
    .b({mux124_b11_sel_is_2_o,open_n8615}),
    .c({_al_u3004_o,_al_u2992_o}),
    .d({_al_u3548_o,_al_u2897_o}),
    .f({_al_u3549_o,_al_u3004_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~D*~(B*~(~C*~A)))"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~D*~(B*~(~C*~A)))"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000110111),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000110111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3551|_al_u3091  (
    .a({_al_u3549_o,open_n8636}),
    .b({_al_u3550_o,open_n8637}),
    .c({_al_u3324_o,_al_u3010_o}),
    .d({_al_u3091_o,_al_u2897_o}),
    .f({_al_u3551_o,_al_u3091_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*B))"),
    //.LUT1("(B*~(~C*~(D*~A)))"),
    .INIT_LUT0(16'b0011111100000000),
    .INIT_LUT1(16'b1100010011000000),
    .MODE("LOGIC"))
    \_al_u3553|_al_u3552  (
    .a({_al_u3551_o,open_n8662}),
    .b({mux141_b1_sel_is_2_o,_al_u2938_o}),
    .c({_al_u3252_o,_al_u3010_o}),
    .d({mux137_b5_sel_is_2_o,mux140_b1_sel_is_2_o}),
    .f({_al_u3553_o,mux141_b1_sel_is_2_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~C*~B*~D)"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3556|_al_u3555  (
    .b({_al_u3330_o,_al_u2889_o}),
    .c({_al_u3555_o,_al_u3022_o}),
    .d({_al_u3554_o,_al_u2893_o}),
    .f({_al_u3556_o,_al_u3555_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3557|_al_u3583  (
    .c({mux159_b1_sel_is_2_o,_al_u3334_o}),
    .d({_al_u3556_o,_al_u3582_o}),
    .f({_al_u3557_o,_al_u3583_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*B))"),
    //.LUT1("(C*B*D)"),
    .INIT_LUT0(16'b0000000000111111),
    .INIT_LUT1(16'b1100000000000000),
    .MODE("LOGIC"))
    \_al_u3560|_al_u3559  (
    .b({mux166_b1_sel_is_2_o,_al_u3045_o}),
    .c({_al_u3559_o,counter[0]}),
    .d({_al_u3557_o,_al_u3048_o}),
    .f({_al_u3560_o,_al_u3559_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("~(B*~(C)*~(D)+B*C*~(D)+~(B)*C*D+B*C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000111100110011),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000111100110011),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3562|_al_u3561  (
    .b({open_n8757,_al_u3057_o}),
    .c({_al_u2914_o,_al_u2903_o}),
    .d({mux12_b9_sel_is_2_o_neg_lutinv,_al_u2986_o}),
    .f({mux16_b9_sel_is_2_o_neg_lutinv,mux12_b9_sel_is_2_o_neg_lutinv}));
  EG_PHY_MSLICE #(
    //.LUT0("(A*~(B*~(D*C)))"),
    //.LUT1("(D*~(~C*B))"),
    .INIT_LUT0(16'b1010001000100010),
    .INIT_LUT1(16'b1111001100000000),
    .MODE("LOGIC"))
    \_al_u3564|_al_u3563  (
    .a({open_n8782,_al_u3371_o}),
    .b({_al_u2917_o,mux16_b9_sel_is_2_o_neg_lutinv}),
    .c({_al_u2907_o,mux16_b1_sel_is_0_o}),
    .d({_al_u3563_o,_al_u2917_o}),
    .f({_al_u3564_o,_al_u3563_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(B*~(~D*~(~C*A)))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1100110000001000),
    .MODE("LOGIC"))
    \_al_u3566|_al_u3265  (
    .a({_al_u3565_o,open_n8803}),
    .b({mux37_b6_sel_is_2_o,open_n8804}),
    .c({_al_u3265_o,counter[0]}),
    .d({_al_u2927_o,_al_u2932_o}),
    .f({_al_u3566_o,_al_u3265_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*~D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000000000110000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3569|_al_u3568  (
    .b({open_n8827,_al_u2972_o}),
    .c({_al_u2976_o,_al_u3567_o}),
    .d({_al_u3568_o,_al_u2970_o}),
    .f({_al_u3569_o,_al_u3568_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(C*~B))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1100111100000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3571|_al_u3570  (
    .b({open_n8850,_al_u2982_o}),
    .c({mux104_b11_sel_is_2_o,_al_u2969_o}),
    .d({_al_u3569_o,_al_u3244_o}),
    .f({_al_u3571_o,mux104_b11_sel_is_2_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(~C*D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"))
    \_al_u3573|_al_u3574  (
    .b({open_n8873,_al_u3001_o}),
    .c({_al_u2993_o,_al_u3147_o}),
    .d({_al_u3572_o,_al_u3573_o}),
    .f({_al_u3573_o,_al_u3574_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*~B))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111110000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u3575|_al_u3009  (
    .b({open_n8896,mux122_b11_sel_is_2_o}),
    .c({mux122_b11_sel_is_2_o,_al_u2986_o}),
    .d({_al_u3574_o,_al_u3005_o}),
    .f({_al_u3575_o,_al_u3009_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*B))"),
    //.LUTF1("(~C*B*D)"),
    //.LUTG0("(D*~(C*B))"),
    //.LUTG1("(~C*B*D)"),
    .INIT_LUTF0(16'b0011111100000000),
    .INIT_LUTF1(16'b0000110000000000),
    .INIT_LUTG0(16'b0011111100000000),
    .INIT_LUTG1(16'b0000110000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3577|_al_u3576  (
    .b({mux137_b2_sel_is_2_o,_al_u2938_o}),
    .c({_al_u3017_o,_al_u2992_o}),
    .d({_al_u3576_o,_al_u3575_o}),
    .f({_al_u3577_o,_al_u3576_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(~C*D))"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(~B*~(~C*D))"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b0011000000110011),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b0011000000110011),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3579|_al_u3578  (
    .b({open_n8945,_al_u3090_o}),
    .c({_al_u3160_o,_al_u3096_o}),
    .d({_al_u3578_o,_al_u3577_o}),
    .f({_al_u3579_o,_al_u3578_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("~(A*~(B)*~((D*C))+A*B*~((D*C))+~(A)*B*(D*C)+A*B*(D*C))"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("~(A*~(B)*~((D*C))+A*B*~((D*C))+~(A)*B*(D*C)+A*B*(D*C))"),
    //.LUTG1("(~C*~B*~D)"),
    .INIT_LUTF0(16'b0011010101010101),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b0011010101010101),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3581|_al_u3580  (
    .a({open_n8970,_al_u3579_o}),
    .b({_al_u3040_o,_al_u2883_o}),
    .c({_al_u3031_o,_al_u2892_o}),
    .d({_al_u3580_o,_al_u3022_o}),
    .f({_al_u3581_o,_al_u3580_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u3582|_al_u3168  (
    .c({_al_u3168_o,_al_u3167_o}),
    .d({_al_u3581_o,mux159_b1_sel_is_2_o}),
    .f({_al_u3582_o,_al_u3168_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(D*~(C*B))"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0011111100000000),
    .MODE("LOGIC"))
    \_al_u3584|_al_u2962  (
    .b({_al_u2961_o,open_n9025}),
    .c({_al_u3042_o,_al_u2958_o}),
    .d({_al_u3583_o,_al_u2961_o}),
    .f({_al_u3584_o,_al_u2962_o}));
  // sources/rtl/camera_init.v(389)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~B*~(C*D))"),
    //.LUTF1("(C*~(B*D))"),
    //.LUTG0("~(~B*~(C*D))"),
    //.LUTG1("(C*~(B*D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111110011001100),
    .INIT_LUTF1(16'b0011000011110000),
    .INIT_LUTG0(16'b1111110011001100),
    .INIT_LUTG1(16'b0011000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u3585|reg1_b1  (
    .b({_al_u3106_o,_al_u3585_o}),
    .c({n376_lutinv,_al_u3107_o}),
    .clk(divider2[8]),
    .d({_al_u3584_o,_al_u3560_o}),
    .sr(reset_n),
    .f({_al_u3585_o,open_n9065}),
    .q({open_n9069,data_in_bus[1]}));  // sources/rtl/camera_init.v(389)
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u3590"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u3_al_u3591  (
    .a({divider2[5],divider2[3]}),
    .b({divider2[6],divider2[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c3 ),
    .f({n0[5],n0[3]}),
    .fco(\add0/c7 ),
    .fx({n0[6],n0[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u3590"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u7_al_u3592  (
    .a({open_n9088,divider2[7]}),
    .b({open_n9089,divider2[8]}),
    .c(2'b00),
    .d({open_n9092,1'b0}),
    .e({open_n9093,1'b0}),
    .fci(\add0/c7 ),
    .f({open_n9108,n0[7]}),
    .fx({open_n9110,n0[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u3590"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \add0/ucin_al_u3590  (
    .a({divider2[1],1'b0}),
    .b({divider2[2],divider2[0]}),
    .c(2'b00),
    .clk(clk),
    .d(2'b01),
    .e(2'b01),
    .mi(n0[1:0]),
    .f({n0[1],open_n9127}),
    .fco(\add0/c3 ),
    .fx({n0[2],n0[0]}),
    .q(divider2[1:0]));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u3593"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add1/u3_al_u3594  (
    .a({cnt[5],cnt[3]}),
    .b({cnt[6],cnt[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add1/c3 ),
    .f({n371[5],n371[3]}),
    .fco(\add1/c7 ),
    .fx({n371[6],n371[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u3593"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add1/u7_al_u3595  (
    .a({open_n9146,cnt[7]}),
    .c(2'b00),
    .d({open_n9151,1'b0}),
    .fci(\add1/c7 ),
    .f({open_n9168,n371[7]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u3593"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \add1/ucin_al_u3593  (
    .a({cnt[1],1'b0}),
    .b({cnt[2],cnt[0]}),
    .c(2'b00),
    .ce(mux181_b0_sel_is_2_o),
    .clk(divider2[8]),
    .d(2'b01),
    .e(2'b01),
    .mi(n371[2:1]),
    .f({n371[1],open_n9187}),
    .fco(\add1/c3 ),
    .fx({n371[2],n371[0]}),
    .q(cnt[2:1]));
  EG_PHY_MSLICE #(
    //.MACRO("add2/u0|add2/ucin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add2/u0|add2/ucin  (
    .a({counter[0],1'b0}),
    .b({1'b1,open_n9188}),
    .f({n372[0],open_n9208}),
    .fco(\add2/c1 ));
  EG_PHY_MSLICE #(
    //.MACRO("add2/u0|add2/ucin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add2/u2|add2/u1  (
    .a(counter[2:1]),
    .b(2'b00),
    .fci(\add2/c1 ),
    .f(n372[2:1]),
    .fco(\add2/c3 ));
  EG_PHY_MSLICE #(
    //.MACRO("add2/u0|add2/ucin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add2/u4|add2/u3  (
    .a(counter[4:3]),
    .b(2'b00),
    .fci(\add2/c3 ),
    .f(n372[4:3]),
    .fco(\add2/c5 ));
  EG_PHY_MSLICE #(
    //.MACRO("add2/u0|add2/ucin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add2/u6|add2/u5  (
    .a(counter[6:5]),
    .b(2'b00),
    .fci(\add2/c5 ),
    .f(n372[6:5]),
    .fco(\add2/c7 ));
  EG_PHY_MSLICE #(
    //.MACRO("add2/u0|add2/ucin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("ADD"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \add2/u7_al_u3596  (
    .a({open_n9279,counter[7]}),
    .b({open_n9280,1'b0}),
    .fci(\add2/c7 ),
    .f({open_n9299,n372[7]}));
  // sources/rtl/camera_init.v(389)
  // sources/rtl/camera_init.v(389)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("~(~C*~B*~D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("~(~C*~B*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b1111111111111100),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b1111111111111100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \bus_write_reg|reg0_b1  (
    .b({n378_lutinv,open_n9307}),
    .c({n375_lutinv,state_next[1]}),
    .clk(divider2[8]),
    .d({sel1_b1_sel_o,_al_u2853_o}),
    .sr(reset_n),
    .f({open_n9325,sel1_b1_sel_o}),
    .q({bus_write,reg_address[1]}));  // sources/rtl/camera_init.v(389)
  // sources/rtl/camera_init.v(389)
  // sources/rtl/camera_init.v(389)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*~D)"),
    //.LUT1("~(~C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111111111110000),
    .INIT_LUT1(16'b1111111111110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b1|reg2_b0  (
    .c(n372[1:0]),
    .ce(n380),
    .clk(divider2[8]),
    .d({_al_u2843_o,_al_u2843_o}),
    .sr(reset_n),
    .q(counter[1:0]));  // sources/rtl/camera_init.v(389)
  // sources/rtl/camera_init.v(389)
  // sources/rtl/camera_init.v(389)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b2|reg2_b7  (
    .c({n372[2],n372[7]}),
    .ce(n380),
    .clk(divider2[8]),
    .d({_al_u2843_o,_al_u2843_o}),
    .sr(reset_n),
    .q({counter[2],counter[7]}));  // sources/rtl/camera_init.v(389)
  // sources/rtl/camera_init.v(389)
  // sources/rtl/camera_init.v(389)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b3|reg2_b6  (
    .c({n372[3],n372[6]}),
    .ce(n380),
    .clk(divider2[8]),
    .d({_al_u2843_o,_al_u2843_o}),
    .sr(reset_n),
    .q({counter[3],counter[6]}));  // sources/rtl/camera_init.v(389)
  // sources/rtl/camera_init.v(389)
  // sources/rtl/camera_init.v(389)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b4|reg2_b5  (
    .c({n372[4],n372[5]}),
    .ce(n380),
    .clk(divider2[8]),
    .d({_al_u2843_o,_al_u2843_o}),
    .sr(reset_n),
    .q({counter[4],counter[5]}));  // sources/rtl/camera_init.v(389)
  // sources/rtl/camera_init.v(389)
  // sources/rtl/camera_init.v(389)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(~D*C*~B*~A)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(~D*C*~B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b0000000000010000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b0000000000010000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg3_b3|reg3_b0  (
    .a({cnt[0],open_n9417}),
    .b({cnt[1],_al_u2843_o}),
    .c({cnt[2],reset_n}),
    .ce(mux181_b0_sel_is_2_o),
    .clk(divider2[8]),
    .d({cnt[3],n380}),
    .mi({n371[3],n371[0]}),
    .f({_al_u2871_o,mux181_b0_sel_is_2_o}),
    .q({cnt[3],cnt[0]}));  // sources/rtl/camera_init.v(389)
  // sources/rtl/camera_init.v(389)
  // sources/rtl/camera_init.v(389)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg3_b5|reg3_b7  (
    .ce(mux181_b0_sel_is_2_o),
    .clk(divider2[8]),
    .mi({n371[5],n371[7]}),
    .q({cnt[5],cnt[7]}));  // sources/rtl/camera_init.v(389)
  EG_PHY_MSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    reg3_b6 (
    .ce(mux181_b0_sel_is_2_o),
    .clk(divider2[8]),
    .mi({open_n9478,n371[6]}),
    .q({open_n9485,cnt[6]}));  // sources/rtl/camera_init.v(389)
  // sources/rtl/camera_init.v(72)
  // sources/rtl/camera_init.v(72)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg4_b2|reg4_b8  (
    .clk(clk),
    .mi({n0[2],n0[8]}),
    .q({divider2[2],divider2[8]}));  // sources/rtl/camera_init.v(72)
  // sources/rtl/camera_init.v(72)
  // sources/rtl/camera_init.v(72)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg4_b3|reg4_b7  (
    .clk(clk),
    .mi({n0[3],n0[7]}),
    .q({divider2[3],divider2[7]}));  // sources/rtl/camera_init.v(72)
  // sources/rtl/camera_init.v(72)
  // sources/rtl/camera_init.v(72)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg4_b4|reg4_b6  (
    .clk(clk),
    .mi({n0[4],n0[6]}),
    .q({divider2[4],divider2[6]}));  // sources/rtl/camera_init.v(72)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    reg4_b5 (
    .clk(clk),
    .mi({open_n9592,n0[5]}),
    .q({open_n9599,divider2[5]}));  // sources/rtl/camera_init.v(72)
  // sources/rtl/camera_init.v(311)
  // sources/rtl/camera_init.v(311)
  EG_PHY_LSLICE #(
    //.LUTF0("~(B*~(C*~D))"),
    //.LUTF1("(B*~(~C*~D))"),
    //.LUTG0("~(B*~(C*~D))"),
    //.LUTG1("(B*~(~C*~D))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011001111110011),
    .INIT_LUTF1(16'b1100110011000000),
    .INIT_LUTG0(16'b0011001111110011),
    .INIT_LUTG1(16'b1100110011000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg5_b3|reg5_b4  (
    .b({_al_u2877_o,_al_u2877_o}),
    .c({_al_u2878_o,state_next[4]}),
    .clk(divider2[8]),
    .d({state_next[3],_al_u2878_o}),
    .sr(reset_n),
    .q({state_next[3],state_next[4]}));  // sources/rtl/camera_init.v(311)
  i2c_module u_i2c_write (
    .address({1'b0,reg_address[1:0]}),
    .clk(clk),
    .reset_n(reset_n),
    .sda_in(sda_in),
    .write(bus_write),
    .writedata(data_in_bus),
    .ready(ready_out),
    .scl_out(scl),
    .sda(sda),
    .sda_oe(sda_oe),
    .success_out(success_out));  // sources/rtl/camera_init.v(48)

endmodule 

module \lcd_sync(IMG_Y=1)   // sources/rtl/lcd_sync.v(14)
  (
  clk,
  rest_n,
  addr,
  hsync_cnt,
  img_ack,
  lcd_clk,
  lcd_de,
  lcd_hsync,
  lcd_pwm,
  lcd_vsync,
  vsync_cnt
  );

  input clk;  // sources/rtl/lcd_sync.v(23)
  input rest_n;  // sources/rtl/lcd_sync.v(24)
  output [15:0] addr;  // sources/rtl/lcd_sync.v(33)
  output [10:0] hsync_cnt;  // sources/rtl/lcd_sync.v(30)
  output img_ack;  // sources/rtl/lcd_sync.v(32)
  output lcd_clk;  // sources/rtl/lcd_sync.v(25)
  output lcd_de;  // sources/rtl/lcd_sync.v(29)
  output lcd_hsync;  // sources/rtl/lcd_sync.v(27)
  output lcd_pwm;  // sources/rtl/lcd_sync.v(26)
  output lcd_vsync;  // sources/rtl/lcd_sync.v(28)
  output [10:0] vsync_cnt;  // sources/rtl/lcd_sync.v(31)

  parameter IMG_H = 164;
  parameter IMG_W = 200;
  parameter IMG_X = 0;
  parameter IMG_Y = 1;
  // localparam TFT_H = 640;
  // localparam TFT_V = 480;
  // localparam TH = 800;
  // localparam THB = 160;
  // localparam TV = 525;
  // localparam TVB = 45;
  wire [10:0] n2;
  wire [11:0] n24;
  wire [12:0] n28;
  wire [6:0] n29;
  wire [10:0] n30;
  wire [39:0] n32;
  wire [10:0] n8;
  wire _al_u25_o;
  wire _al_u26_o;
  wire _al_u27_o;
  wire _al_u40_o;
  wire _al_u41_o;
  wire _al_u42_o;
  wire \add0/c3 ;
  wire \add0/c7 ;
  wire \add1/c3 ;
  wire \add1/c7 ;
  wire lt0_c1;
  wire lt0_c11;
  wire lt0_c3;
  wire lt0_c5;
  wire lt0_c7;
  wire lt0_c9;
  wire lt10_2_c1;
  wire lt10_2_c11;
  wire lt10_2_c3;
  wire lt10_2_c5;
  wire lt10_2_c7;
  wire lt10_2_c9;
  wire lt1_c1;
  wire lt1_c11;
  wire lt1_c3;
  wire lt1_c5;
  wire lt1_c7;
  wire lt1_c9;
  wire lt2_c1;
  wire lt2_c11;
  wire lt2_c3;
  wire lt2_c5;
  wire lt2_c7;
  wire lt2_c9;
  wire lt3_c1;
  wire lt3_c11;
  wire lt3_c3;
  wire lt3_c5;
  wire lt3_c7;
  wire lt3_c9;
  wire lt4_c1;
  wire lt4_c11;
  wire lt4_c3;
  wire lt4_c5;
  wire lt4_c7;
  wire lt4_c9;
  wire lt5_c1;
  wire lt5_c11;
  wire lt5_c3;
  wire lt5_c5;
  wire lt5_c7;
  wire lt5_c9;
  wire lt6_c1;
  wire lt6_c11;
  wire lt6_c3;
  wire lt6_c5;
  wire lt6_c7;
  wire lt6_c9;
  wire lt7_c1;
  wire lt7_c11;
  wire lt7_c3;
  wire lt7_c5;
  wire lt7_c7;
  wire lt7_c9;
  wire lt8_2_c1;
  wire lt8_2_c11;
  wire lt8_2_c3;
  wire lt8_2_c5;
  wire lt8_2_c7;
  wire lt8_2_c9;
  wire lt9_2_c1;
  wire lt9_2_c11;
  wire lt9_2_c3;
  wire lt9_2_c5;
  wire lt9_2_c7;
  wire lt9_2_c9;
  wire n11;
  wire n12;
  wire n13;
  wire n14;
  wire n15;
  wire n16;
  wire n18;
  wire n1_lutinv;
  wire n20;
  wire n22;
  wire n25;
  wire n26;
  wire n4_lutinv;
  wire \sub0/c3 ;
  wire \sub1/c11 ;
  wire \sub1/c3 ;
  wire \sub1/c7 ;
  wire \sub4_sub5/c3 ;
  wire \sub4_sub5/c7 ;
  wire \u2/c11 ;
  wire \u2/c3 ;
  wire \u2/c7 ;

  assign lcd_pwm = rest_n;
  // sources/rtl/lcd_sync.v(61)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*B*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*B*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u25|reg2_b9  (
    .b({hsync_cnt[8],open_n2}),
    .c({hsync_cnt[9],n2[9]}),
    .clk(clk),
    .d({hsync_cnt[7],n1_lutinv}),
    .sr(lcd_pwm),
    .f({_al_u25_o,open_n20}),
    .q({open_n24,hsync_cnt[9]}));  // sources/rtl/lcd_sync.v(61)
  // sources/rtl/lcd_sync.v(61)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~D*C*~B*~A)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~D*C*~B*~A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000000010000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000000010000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u26|reg2_b4  (
    .a({hsync_cnt[3],open_n25}),
    .b({hsync_cnt[4],open_n26}),
    .c({hsync_cnt[5],n2[4]}),
    .clk(clk),
    .d({hsync_cnt[6],n1_lutinv}),
    .sr(lcd_pwm),
    .f({_al_u26_o,open_n44}),
    .q({open_n48,hsync_cnt[4]}));  // sources/rtl/lcd_sync.v(61)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u28|_al_u6  (
    .b({_al_u26_o,open_n51}),
    .c({_al_u27_o,lcd_pwm}),
    .d({_al_u25_o,clk}),
    .f({n1_lutinv,lcd_clk}));
  // sources/rtl/lcd_sync.v(71)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    //.LUTF1("(C*~B*~D)"),
    //.LUTG0("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    //.LUTG1("(C*~B*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111010100100000),
    .INIT_LUTF1(16'b0000000000110000),
    .INIT_LUTG0(16'b0111010100100000),
    .INIT_LUTG1(16'b0000000000110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u40|reg0_b9  (
    .a({open_n76,n1_lutinv}),
    .b({vsync_cnt[8],n4_lutinv}),
    .c({vsync_cnt[9],n8[9]}),
    .clk(clk),
    .d({vsync_cnt[7],vsync_cnt[9]}),
    .sr(lcd_pwm),
    .f({_al_u40_o,open_n94}),
    .q({open_n98,vsync_cnt[9]}));  // sources/rtl/lcd_sync.v(71)
  // sources/rtl/lcd_sync.v(71)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    //.LUTF1("(~D*~C*~B*A)"),
    //.LUTG0("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    //.LUTG1("(~D*~C*~B*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111010100100000),
    .INIT_LUTF1(16'b0000000000000010),
    .INIT_LUTG0(16'b0111010100100000),
    .INIT_LUTG1(16'b0000000000000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \_al_u41|reg0_b6  (
    .a({vsync_cnt[3],n1_lutinv}),
    .b({vsync_cnt[4],n4_lutinv}),
    .c({vsync_cnt[5],n8[6]}),
    .clk(clk),
    .d({vsync_cnt[6],vsync_cnt[6]}),
    .sr(lcd_pwm),
    .f({_al_u41_o,open_n116}),
    .q({open_n120,vsync_cnt[6]}));  // sources/rtl/lcd_sync.v(71)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~C*~B*A)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(D*~C*~B*A)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b0000001000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000001000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u43|_al_u42  (
    .a({open_n121,vsync_cnt[0]}),
    .b({_al_u41_o,vsync_cnt[1]}),
    .c({_al_u42_o,vsync_cnt[10]}),
    .d({_al_u40_o,vsync_cnt[2]}),
    .f({n4_lutinv,_al_u42_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u4|_al_u7  (
    .a({open_n146,n15}),
    .b({open_n147,n16}),
    .c({n12,n18}),
    .d({n11,n20}),
    .f({lcd_hsync,lcd_de}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTG0("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .MODE("LOGIC"))
    _al_u5 (
    .c({open_n176,n14}),
    .d({open_n179,n13}),
    .f({open_n197,lcd_vsync}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*~B*~A)"),
    //.LUTF1("(D*C*B*A)"),
    //.LUTG0("(~D*~C*~B*~A)"),
    //.LUTG1("(D*C*B*A)"),
    .INIT_LUTF0(16'b0000000000000001),
    .INIT_LUTF1(16'b1000000000000000),
    .INIT_LUTG0(16'b0000000000000001),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u8|_al_u27  (
    .a({lcd_de,hsync_cnt[0]}),
    .b({n26,hsync_cnt[1]}),
    .c({n22,hsync_cnt[10]}),
    .d({n25,hsync_cnt[2]}),
    .f({img_ack,_al_u27_o}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u64"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u3_al_u65  (
    .a({hsync_cnt[5],hsync_cnt[3]}),
    .b({hsync_cnt[6],hsync_cnt[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c3 ),
    .f({n2[5],n2[3]}),
    .fco(\add0/c7 ),
    .fx({n2[6],n2[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u64"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u7_al_u66  (
    .a({hsync_cnt[9],hsync_cnt[7]}),
    .b({hsync_cnt[10],hsync_cnt[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c7 ),
    .f({n2[9],n2[7]}),
    .fx({n2[10],n2[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u64"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/ucin_al_u64  (
    .a({hsync_cnt[1],1'b0}),
    .b({hsync_cnt[2],hsync_cnt[0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({n2[1],open_n281}),
    .fco(\add0/c3 ),
    .fx({n2[2],n2[0]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u67"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add1/u3_al_u68  (
    .a({vsync_cnt[5],vsync_cnt[3]}),
    .b({vsync_cnt[6],vsync_cnt[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add1/c3 ),
    .f({n8[5],n8[3]}),
    .fco(\add1/c7 ),
    .fx({n8[6],n8[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u67"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add1/u7_al_u69  (
    .a({vsync_cnt[9],vsync_cnt[7]}),
    .b({vsync_cnt[10],vsync_cnt[8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add1/c7 ),
    .f({n8[9],n8[7]}),
    .fx({n8[10],n8[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("add1/ucin_al_u67"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add1/ucin_al_u67  (
    .a({vsync_cnt[1],1'b0}),
    .b({vsync_cnt[2],vsync_cnt[0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({n8[1],open_n338}),
    .fco(\add1/c3 ),
    .fx({n8[2],n8[0]}));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_0|lt0_cin  (
    .a(2'b01),
    .b({hsync_cnt[0],open_n341}),
    .fco(lt0_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_10|lt0_9  (
    .a(2'b00),
    .b(hsync_cnt[10:9]),
    .fci(lt0_c9),
    .fco(lt0_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_2|lt0_1  (
    .a(2'b00),
    .b(hsync_cnt[2:1]),
    .fci(lt0_c1),
    .fco(lt0_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_4|lt0_3  (
    .a(2'b10),
    .b(hsync_cnt[4:3]),
    .fci(lt0_c3),
    .fco(lt0_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_6|lt0_5  (
    .a(2'b00),
    .b(hsync_cnt[6:5]),
    .fci(lt0_c5),
    .fco(lt0_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt0_8|lt0_7  (
    .a(2'b00),
    .b(hsync_cnt[8:7]),
    .fci(lt0_c7),
    .fco(lt0_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt0_0|lt0_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt0_cout_al_u75 (
    .a({open_n487,1'b0}),
    .b({open_n488,1'b1}),
    .fci(lt0_c11),
    .f({open_n507,n11}));
  EG_PHY_MSLICE #(
    //.MACRO("lt10_2_0|lt10_2_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt10_2_0|lt10_2_cin  (
    .a({n24[0],1'b0}),
    .b({1'b1,open_n513}),
    .fco(lt10_2_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt10_2_0|lt10_2_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt10_2_10|lt10_2_9  (
    .a(n24[10:9]),
    .b(2'b00),
    .fci(lt10_2_c9),
    .fco(lt10_2_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt10_2_0|lt10_2_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt10_2_2|lt10_2_1  (
    .a(n24[2:1]),
    .b(2'b10),
    .fci(lt10_2_c1),
    .fco(lt10_2_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt10_2_0|lt10_2_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt10_2_4|lt10_2_3  (
    .a(n24[4:3]),
    .b(2'b00),
    .fci(lt10_2_c3),
    .fco(lt10_2_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt10_2_0|lt10_2_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt10_2_6|lt10_2_5  (
    .a(n24[6:5]),
    .b(2'b01),
    .fci(lt10_2_c5),
    .fco(lt10_2_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt10_2_0|lt10_2_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt10_2_8|lt10_2_7  (
    .a(n24[8:7]),
    .b(2'b01),
    .fci(lt10_2_c7),
    .fco(lt10_2_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt10_2_0|lt10_2_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt10_2_cout|lt10_2_11  (
    .a({1'b0,n24[11]}),
    .b(2'b10),
    .fci(lt10_2_c11),
    .f({n26,open_n677}));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_0|lt1_cin  (
    .a({hsync_cnt[0],1'b0}),
    .b({1'b0,open_n683}),
    .fco(lt1_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_10|lt1_9  (
    .a(hsync_cnt[10:9]),
    .b(2'b00),
    .fci(lt1_c9),
    .fco(lt1_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_2|lt1_1  (
    .a(hsync_cnt[2:1]),
    .b(2'b00),
    .fci(lt1_c1),
    .fco(lt1_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_4|lt1_3  (
    .a(hsync_cnt[4:3]),
    .b(2'b10),
    .fci(lt1_c3),
    .fco(lt1_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_6|lt1_5  (
    .a(hsync_cnt[6:5]),
    .b(2'b11),
    .fci(lt1_c5),
    .fco(lt1_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt1_8|lt1_7  (
    .a(hsync_cnt[8:7]),
    .b(2'b00),
    .fci(lt1_c7),
    .fco(lt1_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt1_0|lt1_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt1_cout_al_u76 (
    .a({open_n829,1'b0}),
    .b({open_n830,1'b1}),
    .fci(lt1_c11),
    .f({open_n849,n12}));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_0|lt2_cin  (
    .a(2'b01),
    .b({vsync_cnt[0],open_n855}),
    .fco(lt2_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_10|lt2_9  (
    .a(2'b00),
    .b(vsync_cnt[10:9]),
    .fci(lt2_c9),
    .fco(lt2_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_2|lt2_1  (
    .a(2'b01),
    .b(vsync_cnt[2:1]),
    .fci(lt2_c1),
    .fco(lt2_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_4|lt2_3  (
    .a(2'b01),
    .b(vsync_cnt[4:3]),
    .fci(lt2_c3),
    .fco(lt2_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_6|lt2_5  (
    .a(2'b00),
    .b(vsync_cnt[6:5]),
    .fci(lt2_c5),
    .fco(lt2_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt2_8|lt2_7  (
    .a(2'b00),
    .b(vsync_cnt[8:7]),
    .fci(lt2_c7),
    .fco(lt2_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt2_0|lt2_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt2_cout_al_u77 (
    .a({open_n1001,1'b0}),
    .b({open_n1002,1'b1}),
    .fci(lt2_c11),
    .f({open_n1021,n13}));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_0|lt3_cin  (
    .a({vsync_cnt[0],1'b0}),
    .b({1'b0,open_n1027}),
    .fco(lt3_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_10|lt3_9  (
    .a(vsync_cnt[10:9]),
    .b(2'b00),
    .fci(lt3_c9),
    .fco(lt3_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_2|lt3_1  (
    .a(vsync_cnt[2:1]),
    .b(2'b10),
    .fci(lt3_c1),
    .fco(lt3_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_4|lt3_3  (
    .a(vsync_cnt[4:3]),
    .b(2'b01),
    .fci(lt3_c3),
    .fco(lt3_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_6|lt3_5  (
    .a(vsync_cnt[6:5]),
    .b(2'b00),
    .fci(lt3_c5),
    .fco(lt3_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt3_8|lt3_7  (
    .a(vsync_cnt[8:7]),
    .b(2'b00),
    .fci(lt3_c7),
    .fco(lt3_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt3_0|lt3_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt3_cout_al_u78 (
    .a({open_n1173,1'b0}),
    .b({open_n1174,1'b1}),
    .fci(lt3_c11),
    .f({open_n1193,n14}));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_0|lt4_cin  (
    .a(2'b01),
    .b({hsync_cnt[0],open_n1199}),
    .fco(lt4_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_10|lt4_9  (
    .a(2'b00),
    .b(hsync_cnt[10:9]),
    .fci(lt4_c9),
    .fco(lt4_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_2|lt4_1  (
    .a(2'b00),
    .b(hsync_cnt[2:1]),
    .fci(lt4_c1),
    .fco(lt4_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_4|lt4_3  (
    .a(2'b00),
    .b(hsync_cnt[4:3]),
    .fci(lt4_c3),
    .fco(lt4_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_6|lt4_5  (
    .a(2'b01),
    .b(hsync_cnt[6:5]),
    .fci(lt4_c5),
    .fco(lt4_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt4_8|lt4_7  (
    .a(2'b01),
    .b(hsync_cnt[8:7]),
    .fci(lt4_c7),
    .fco(lt4_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt4_0|lt4_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt4_cout_al_u79 (
    .a({open_n1345,1'b0}),
    .b({open_n1346,1'b1}),
    .fci(lt4_c11),
    .f({open_n1365,n15}));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_0|lt5_cin  (
    .a({hsync_cnt[0],1'b1}),
    .b({1'b0,open_n1371}),
    .fco(lt5_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_10|lt5_9  (
    .a(hsync_cnt[10:9]),
    .b(2'b01),
    .fci(lt5_c9),
    .fco(lt5_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_2|lt5_1  (
    .a(hsync_cnt[2:1]),
    .b(2'b00),
    .fci(lt5_c1),
    .fco(lt5_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_4|lt5_3  (
    .a(hsync_cnt[4:3]),
    .b(2'b00),
    .fci(lt5_c3),
    .fco(lt5_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_6|lt5_5  (
    .a(hsync_cnt[6:5]),
    .b(2'b01),
    .fci(lt5_c5),
    .fco(lt5_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt5_8|lt5_7  (
    .a(hsync_cnt[8:7]),
    .b(2'b10),
    .fci(lt5_c7),
    .fco(lt5_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt5_0|lt5_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt5_cout_al_u80 (
    .a({open_n1517,1'b0}),
    .b({open_n1518,1'b1}),
    .fci(lt5_c11),
    .f({open_n1537,n16}));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_0|lt6_cin  (
    .a(2'b11),
    .b({vsync_cnt[0],open_n1543}),
    .fco(lt6_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_10|lt6_9  (
    .a(2'b00),
    .b(vsync_cnt[10:9]),
    .fci(lt6_c9),
    .fco(lt6_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_2|lt6_1  (
    .a(2'b10),
    .b(vsync_cnt[2:1]),
    .fci(lt6_c1),
    .fco(lt6_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_4|lt6_3  (
    .a(2'b01),
    .b(vsync_cnt[4:3]),
    .fci(lt6_c3),
    .fco(lt6_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_6|lt6_5  (
    .a(2'b01),
    .b(vsync_cnt[6:5]),
    .fci(lt6_c5),
    .fco(lt6_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt6_8|lt6_7  (
    .a(2'b00),
    .b(vsync_cnt[8:7]),
    .fci(lt6_c7),
    .fco(lt6_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt6_0|lt6_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt6_cout_al_u81 (
    .a({open_n1689,1'b0}),
    .b({open_n1690,1'b1}),
    .fci(lt6_c11),
    .f({open_n1709,n18}));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_0|lt7_cin  (
    .a({vsync_cnt[0],1'b0}),
    .b({1'b1,open_n1715}),
    .fco(lt7_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_10|lt7_9  (
    .a(vsync_cnt[10:9]),
    .b(2'b01),
    .fci(lt7_c9),
    .fco(lt7_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_2|lt7_1  (
    .a(vsync_cnt[2:1]),
    .b(2'b10),
    .fci(lt7_c1),
    .fco(lt7_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_4|lt7_3  (
    .a(vsync_cnt[4:3]),
    .b(2'b01),
    .fci(lt7_c3),
    .fco(lt7_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_6|lt7_5  (
    .a(vsync_cnt[6:5]),
    .b(2'b00),
    .fci(lt7_c5),
    .fco(lt7_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt7_8|lt7_7  (
    .a(vsync_cnt[8:7]),
    .b(2'b00),
    .fci(lt7_c7),
    .fco(lt7_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt7_0|lt7_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt7_cout_al_u82 (
    .a({open_n1861,1'b0}),
    .b({open_n1862,1'b1}),
    .fci(lt7_c11),
    .f({open_n1881,n20}));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_2_0|lt8_2_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_2_0|lt8_2_cin  (
    .a({hsync_cnt[0],1'b0}),
    .b({1'b0,open_n1887}),
    .fco(lt8_2_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_2_0|lt8_2_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_2_10|lt8_2_9  (
    .a(n29[5:4]),
    .b(2'b00),
    .fci(lt8_2_c9),
    .fco(lt8_2_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_2_0|lt8_2_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_2_2|lt8_2_1  (
    .a(hsync_cnt[2:1]),
    .b(2'b00),
    .fci(lt8_2_c1),
    .fco(lt8_2_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_2_0|lt8_2_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_2_4|lt8_2_3  (
    .a(hsync_cnt[4:3]),
    .b(2'b01),
    .fci(lt8_2_c3),
    .fco(lt8_2_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_2_0|lt8_2_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_2_6|lt8_2_5  (
    .a(n29[1:0]),
    .b(2'b10),
    .fci(lt8_2_c5),
    .fco(lt8_2_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_2_0|lt8_2_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_2_8|lt8_2_7  (
    .a(n29[3:2]),
    .b(2'b01),
    .fci(lt8_2_c7),
    .fco(lt8_2_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt8_2_0|lt8_2_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt8_2_cout|lt8_2_11  (
    .a({1'b0,n29[6]}),
    .b(2'b10),
    .fci(lt8_2_c11),
    .f({n22,open_n2051}));
  EG_PHY_MSLICE #(
    //.MACRO("lt9_2_0|lt9_2_cin"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt9_2_0|lt9_2_cin  (
    .a(2'b11),
    .b({n24[0],open_n2057}),
    .fco(lt9_2_c1));
  EG_PHY_MSLICE #(
    //.MACRO("lt9_2_0|lt9_2_cin"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt9_2_10|lt9_2_9  (
    .a(2'b00),
    .b(n24[10:9]),
    .fci(lt9_2_c9),
    .fco(lt9_2_c11));
  EG_PHY_MSLICE #(
    //.MACRO("lt9_2_0|lt9_2_cin"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt9_2_2|lt9_2_1  (
    .a(2'b00),
    .b(n24[2:1]),
    .fci(lt9_2_c1),
    .fco(lt9_2_c3));
  EG_PHY_MSLICE #(
    //.MACRO("lt9_2_0|lt9_2_cin"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt9_2_4|lt9_2_3  (
    .a(2'b00),
    .b(n24[4:3]),
    .fci(lt9_2_c3),
    .fco(lt9_2_c5));
  EG_PHY_MSLICE #(
    //.MACRO("lt9_2_0|lt9_2_cin"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt9_2_6|lt9_2_5  (
    .a(2'b00),
    .b(n24[6:5]),
    .fci(lt9_2_c5),
    .fco(lt9_2_c7));
  EG_PHY_MSLICE #(
    //.MACRO("lt9_2_0|lt9_2_cin"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt9_2_8|lt9_2_7  (
    .a(2'b00),
    .b(n24[8:7]),
    .fci(lt9_2_c7),
    .fco(lt9_2_c9));
  EG_PHY_MSLICE #(
    //.MACRO("lt9_2_0|lt9_2_cin"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    \lt9_2_cout|lt9_2_11  (
    .a(2'b00),
    .b({1'b1,n24[11]}),
    .fci(lt9_2_c11),
    .f({n25,open_n2221}));
  EG_PHY_MULT18 #(
    .INPUTREGA("DISABLE"),
    .INPUTREGB("DISABLE"),
    .MODE("MULT18X18C"),
    .OUTPUTREG("DISABLE"),
    .SIGNEDAMUX("0"),
    .SIGNEDBMUX("0"))
    mult0_ (
    .a({5'b00000,n30[10],n30,vsync_cnt[0]}),
    .b(18'b000000000000011001),
    .p({open_n2310,open_n2311,open_n2312,open_n2313,open_n2314,open_n2315,open_n2316,open_n2317,open_n2318,open_n2319,open_n2320,open_n2321,open_n2322,open_n2323,open_n2324,open_n2325,open_n2326,open_n2327,open_n2328,open_n2329,open_n2330,open_n2331,open_n2332,n32[15:3]}));
  // sources/rtl/lcd_sync.v(71)
  // sources/rtl/lcd_sync.v(71)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    //.LUTF1("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    //.LUTG0("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    //.LUTG1("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111010100100000),
    .INIT_LUTF1(16'b0111010100100000),
    .INIT_LUTG0(16'b0111010100100000),
    .INIT_LUTG1(16'b0111010100100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b0|reg0_b8  (
    .a({n1_lutinv,n1_lutinv}),
    .b({n4_lutinv,n4_lutinv}),
    .c({n8[0],n8[8]}),
    .clk(clk),
    .d({vsync_cnt[0],vsync_cnt[8]}),
    .sr(lcd_pwm),
    .q({vsync_cnt[0],vsync_cnt[8]}));  // sources/rtl/lcd_sync.v(71)
  // sources/rtl/lcd_sync.v(71)
  // sources/rtl/lcd_sync.v(71)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    //.LUTF1("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    //.LUTG0("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    //.LUTG1("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111010100100000),
    .INIT_LUTF1(16'b0111010100100000),
    .INIT_LUTG0(16'b0111010100100000),
    .INIT_LUTG1(16'b0111010100100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b10|reg0_b7  (
    .a({n1_lutinv,n1_lutinv}),
    .b({n4_lutinv,n4_lutinv}),
    .c({n8[10],n8[7]}),
    .clk(clk),
    .d({vsync_cnt[10],vsync_cnt[7]}),
    .sr(lcd_pwm),
    .q({vsync_cnt[10],vsync_cnt[7]}));  // sources/rtl/lcd_sync.v(71)
  // sources/rtl/lcd_sync.v(71)
  // sources/rtl/lcd_sync.v(71)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    //.LUTF1("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    //.LUTG0("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    //.LUTG1("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111010100100000),
    .INIT_LUTF1(16'b0111010100100000),
    .INIT_LUTG0(16'b0111010100100000),
    .INIT_LUTG1(16'b0111010100100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b1|reg0_b5  (
    .a({n1_lutinv,n1_lutinv}),
    .b({n4_lutinv,n4_lutinv}),
    .c({n8[1],n8[5]}),
    .clk(clk),
    .d({vsync_cnt[1],vsync_cnt[5]}),
    .sr(lcd_pwm),
    .q({vsync_cnt[1],vsync_cnt[5]}));  // sources/rtl/lcd_sync.v(71)
  // sources/rtl/lcd_sync.v(71)
  // sources/rtl/lcd_sync.v(71)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    //.LUTF1("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    //.LUTG0("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    //.LUTG1("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111010100100000),
    .INIT_LUTF1(16'b0111010100100000),
    .INIT_LUTG0(16'b0111010100100000),
    .INIT_LUTG1(16'b0111010100100000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg0_b2|reg0_b4  (
    .a({n1_lutinv,n1_lutinv}),
    .b({n4_lutinv,n4_lutinv}),
    .c({n8[2],n8[4]}),
    .clk(clk),
    .d({vsync_cnt[2],vsync_cnt[4]}),
    .sr(lcd_pwm),
    .q({vsync_cnt[2],vsync_cnt[4]}));  // sources/rtl/lcd_sync.v(71)
  // sources/rtl/lcd_sync.v(95)
  // sources/rtl/lcd_sync.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b10|reg1_b0  (
    .c({n28[7],hsync_cnt[0]}),
    .clk(clk),
    .d({img_ack,img_ack}),
    .sr(lcd_pwm),
    .q({addr[10],addr[0]}));  // sources/rtl/lcd_sync.v(95)
  // sources/rtl/lcd_sync.v(95)
  // sources/rtl/lcd_sync.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b11|reg1_b9  (
    .c({n28[8],n28[6]}),
    .clk(clk),
    .d({img_ack,img_ack}),
    .sr(lcd_pwm),
    .q({addr[11],addr[9]}));  // sources/rtl/lcd_sync.v(95)
  // sources/rtl/lcd_sync.v(95)
  // sources/rtl/lcd_sync.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b12|reg1_b8  (
    .c({n28[9],n28[5]}),
    .clk(clk),
    .d({img_ack,img_ack}),
    .sr(lcd_pwm),
    .q({addr[12],addr[8]}));  // sources/rtl/lcd_sync.v(95)
  // sources/rtl/lcd_sync.v(95)
  // sources/rtl/lcd_sync.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b13|reg1_b7  (
    .c({n28[10],n28[4]}),
    .clk(clk),
    .d({img_ack,img_ack}),
    .sr(lcd_pwm),
    .q({addr[13],addr[7]}));  // sources/rtl/lcd_sync.v(95)
  // sources/rtl/lcd_sync.v(95)
  // sources/rtl/lcd_sync.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b14|reg1_b6  (
    .c({n28[11],n28[3]}),
    .clk(clk),
    .d({img_ack,img_ack}),
    .sr(lcd_pwm),
    .q({addr[14],addr[6]}));  // sources/rtl/lcd_sync.v(95)
  // sources/rtl/lcd_sync.v(95)
  // sources/rtl/lcd_sync.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b15|reg1_b5  (
    .c({n28[12],n28[2]}),
    .clk(clk),
    .d({img_ack,img_ack}),
    .sr(lcd_pwm),
    .q({addr[15],addr[5]}));  // sources/rtl/lcd_sync.v(95)
  // sources/rtl/lcd_sync.v(61)
  // sources/rtl/lcd_sync.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b1|reg2_b1  (
    .c({hsync_cnt[1],n2[1]}),
    .clk(clk),
    .d({img_ack,n1_lutinv}),
    .sr(lcd_pwm),
    .q({addr[1],hsync_cnt[1]}));  // sources/rtl/lcd_sync.v(61)
  // sources/rtl/lcd_sync.v(61)
  // sources/rtl/lcd_sync.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b2|reg2_b2  (
    .c({hsync_cnt[2],n2[2]}),
    .clk(clk),
    .d({img_ack,n1_lutinv}),
    .sr(lcd_pwm),
    .q({addr[2],hsync_cnt[2]}));  // sources/rtl/lcd_sync.v(61)
  // sources/rtl/lcd_sync.v(95)
  // sources/rtl/lcd_sync.v(95)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg1_b3|reg1_b4  (
    .c({n28[0],n28[1]}),
    .clk(clk),
    .d({img_ack,img_ack}),
    .sr(lcd_pwm),
    .q({addr[3],addr[4]}));  // sources/rtl/lcd_sync.v(95)
  // sources/rtl/lcd_sync.v(71)
  // sources/rtl/lcd_sync.v(61)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(D*~((C*~B))*~(A)+D*(C*~B)*~(A)+~(D)*(C*~B)*A+D*(C*~B)*A)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111010100100000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0111010100100000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b0|reg0_b3  (
    .a({open_n2655,n1_lutinv}),
    .b({open_n2656,n4_lutinv}),
    .c({n2[0],n8[3]}),
    .clk(clk),
    .d({n1_lutinv,vsync_cnt[3]}),
    .sr(lcd_pwm),
    .q({hsync_cnt[0],vsync_cnt[3]}));  // sources/rtl/lcd_sync.v(71)
  // sources/rtl/lcd_sync.v(61)
  // sources/rtl/lcd_sync.v(61)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b10|reg2_b3  (
    .c({n2[10],n2[3]}),
    .clk(clk),
    .d({n1_lutinv,n1_lutinv}),
    .sr(lcd_pwm),
    .q({hsync_cnt[10],hsync_cnt[3]}));  // sources/rtl/lcd_sync.v(61)
  // sources/rtl/lcd_sync.v(61)
  // sources/rtl/lcd_sync.v(61)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b5|reg2_b8  (
    .c({n2[5],n2[8]}),
    .clk(clk),
    .d({n1_lutinv,n1_lutinv}),
    .sr(lcd_pwm),
    .q({hsync_cnt[5],hsync_cnt[8]}));  // sources/rtl/lcd_sync.v(61)
  // sources/rtl/lcd_sync.v(61)
  // sources/rtl/lcd_sync.v(61)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("INV"))
    \reg2_b6|reg2_b7  (
    .c({n2[6],n2[7]}),
    .clk(clk),
    .d({n1_lutinv,n1_lutinv}),
    .sr(lcd_pwm),
    .q({hsync_cnt[6],hsync_cnt[7]}));  // sources/rtl/lcd_sync.v(61)
  EG_PHY_LSLICE #(
    //.MACRO("sub0/ucin_al_u73"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \sub0/u3_al_u74  (
    .a({hsync_cnt[10],hsync_cnt[8]}),
    .b({open_n2757,hsync_cnt[9]}),
    .c(2'b11),
    .d(2'b00),
    .e({open_n2760,1'b0}),
    .fci(\sub0/c3 ),
    .f({n29[5],n29[3]}),
    .fx({n29[6],n29[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub0/ucin_al_u73"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h0005),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \sub0/ucin_al_u73  (
    .a({hsync_cnt[6],1'b0}),
    .b({hsync_cnt[7],hsync_cnt[5]}),
    .c(2'b11),
    .d(2'b01),
    .e(2'b11),
    .f({n29[1],open_n2795}),
    .fco(\sub0/c3 ),
    .fx({n29[2],n29[0]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub1/ucin_al_u60"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \sub1/u3_al_u61  (
    .a({vsync_cnt[5],vsync_cnt[3]}),
    .b({vsync_cnt[6],vsync_cnt[4]}),
    .c(2'b11),
    .d(2'b11),
    .e(2'b00),
    .fci(\sub1/c3 ),
    .f({n24[5],n24[3]}),
    .fco(\sub1/c7 ),
    .fx({n24[6],n24[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub1/ucin_al_u60"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \sub1/u7_al_u62  (
    .a({vsync_cnt[9],vsync_cnt[7]}),
    .b({vsync_cnt[10],vsync_cnt[8]}),
    .c(2'b11),
    .d(2'b00),
    .e(2'b00),
    .fci(\sub1/c7 ),
    .f({n24[9],n24[7]}),
    .fco(\sub1/c11 ),
    .fx({n24[10],n24[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub1/ucin_al_u60"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h0005),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \sub1/ucin_al_u60  (
    .a({vsync_cnt[1],1'b0}),
    .b({vsync_cnt[2],vsync_cnt[0]}),
    .c(2'b11),
    .d(2'b01),
    .e(2'b11),
    .f({n24[1],open_n2851}),
    .fco(\sub1/c3 ),
    .fx({n24[2],n24[0]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub1/ucin_al_u60"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \sub1/ucout_al_u63  (
    .c(2'b11),
    .fci(\sub1/c11 ),
    .f({open_n2878,n24[11]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub4_sub5/ucin_al_u70"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \sub4_sub5/u3_al_u71  (
    .a({vsync_cnt[6],vsync_cnt[4]}),
    .b({vsync_cnt[7],vsync_cnt[5]}),
    .c(2'b11),
    .d(2'b00),
    .e(2'b01),
    .fci(\sub4_sub5/c3 ),
    .f({n30[5],n30[3]}),
    .fco(\sub4_sub5/c7 ),
    .fx({n30[6],n30[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub4_sub5/ucin_al_u70"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \sub4_sub5/u7_al_u72  (
    .a({vsync_cnt[10],vsync_cnt[8]}),
    .b({open_n2902,vsync_cnt[9]}),
    .c(2'b11),
    .d(2'b00),
    .e({open_n2905,1'b0}),
    .fci(\sub4_sub5/c7 ),
    .f({n30[9],n30[7]}),
    .fx({n30[10],n30[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("sub4_sub5/ucin_al_u70"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h0005),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \sub4_sub5/ucin_al_u70  (
    .a({vsync_cnt[2],1'b0}),
    .b({vsync_cnt[3],vsync_cnt[1]}),
    .c(2'b11),
    .d(2'b11),
    .e(2'b11),
    .f({n30[1],open_n2940}),
    .fco(\sub4_sub5/c3 ),
    .fx({n30[2],n30[0]}));
  EG_PHY_LSLICE #(
    //.MACRO("u2/ucin_al_u56"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u2/u11_al_u59  (
    .a({open_n2943,n29[6]}),
    .b({open_n2944,n29[6]}),
    .c(2'b00),
    .d({open_n2947,n32[14]}),
    .e({open_n2948,n32[15]}),
    .fci(\u2/c11 ),
    .f({open_n2963,n28[11]}),
    .fx({open_n2965,n28[12]}));
  EG_PHY_LSLICE #(
    //.MACRO("u2/ucin_al_u56"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u2/u3_al_u57  (
    .a({n29[3],n29[1]}),
    .b({n29[4],n29[2]}),
    .c(2'b00),
    .d({n32[8],n32[6]}),
    .e({n32[9],n32[7]}),
    .fci(\u2/c3 ),
    .f({n28[5],n28[3]}),
    .fco(\u2/c7 ),
    .fx({n28[6],n28[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("u2/ucin_al_u56"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u2/u7_al_u58  (
    .a(n29[6:5]),
    .b({n29[6],n29[6]}),
    .c(2'b00),
    .d({n32[12],n32[10]}),
    .e({n32[13],n32[11]}),
    .fci(\u2/c7 ),
    .f({n28[9],n28[7]}),
    .fco(\u2/c11 ),
    .fx({n28[10],n28[8]}));
  EG_PHY_LSLICE #(
    //.MACRO("u2/ucin_al_u56"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u2/ucin_al_u56  (
    .a({hsync_cnt[4],1'b0}),
    .b({n29[0],hsync_cnt[3]}),
    .c(2'b00),
    .d({n32[4],1'b1}),
    .e({n32[5],n32[3]}),
    .f({n28[1],open_n3021}),
    .fco(\u2/c3 ),
    .fx({n28[2],n28[0]}));

endmodule 

module i2c_module  // sources/rtl/i2c_module.v(2)
  (
  address,
  clk,
  reset_n,
  sda_in,
  write,
  writedata,
  ready,
  scl_out,
  sda,
  sda_oe,
  success_out
  );

  input [2:0] address;  // sources/rtl/i2c_module.v(14)
  input clk;  // sources/rtl/i2c_module.v(3)
  input reset_n;  // sources/rtl/i2c_module.v(4)
  input sda_in;  // sources/rtl/i2c_module.v(7)
  input write;  // sources/rtl/i2c_module.v(13)
  input [7:0] writedata;  // sources/rtl/i2c_module.v(12)
  output ready;  // sources/rtl/i2c_module.v(16)
  output scl_out;  // sources/rtl/i2c_module.v(10)
  output sda;  // sources/rtl/i2c_module.v(8)
  output sda_oe;  // sources/rtl/i2c_module.v(6)
  output success_out;  // sources/rtl/i2c_module.v(17)

  // localparam STATE_ADDRESS_ACK = 10;
  // localparam STATE_ADDRESS_BIT_1 = 2;
  // localparam STATE_ADDRESS_BIT_2 = 3;
  // localparam STATE_ADDRESS_BIT_3 = 4;
  // localparam STATE_ADDRESS_BIT_4 = 5;
  // localparam STATE_ADDRESS_BIT_5 = 6;
  // localparam STATE_ADDRESS_BIT_6 = 7;
  // localparam STATE_ADDRESS_BIT_7 = 8;
  // localparam STATE_ADDRESS_BIT_8 = 9;
  // localparam STATE_ADDRESS_START = 1;
  // localparam STATE_ADDRESS_START_2 = 111;
  // localparam STATE_ADDRESS_START_3 = 112;
  // localparam STATE_DATA_ACK = 28;
  // localparam STATE_DATA_BIT_1 = 20;
  // localparam STATE_DATA_BIT_2 = 21;
  // localparam STATE_DATA_BIT_3 = 22;
  // localparam STATE_DATA_BIT_4 = 23;
  // localparam STATE_DATA_BIT_5 = 24;
  // localparam STATE_DATA_BIT_6 = 25;
  // localparam STATE_DATA_BIT_7 = 26;
  // localparam STATE_DATA_BIT_8 = 27;
  // localparam STATE_IDLE = 0;
  // localparam STATE_REG_ACK = 19;
  // localparam STATE_REG_BIT_1 = 11;
  // localparam STATE_REG_BIT_2 = 12;
  // localparam STATE_REG_BIT_3 = 13;
  // localparam STATE_REG_BIT_4 = 14;
  // localparam STATE_REG_BIT_5 = 15;
  // localparam STATE_REG_BIT_6 = 16;
  // localparam STATE_REG_BIT_7 = 17;
  // localparam STATE_REG_BIT_8 = 18;
  // localparam STATE_STOP = 29;
  // localparam STATE_STOP_1 = 30;
  // localparam STATE_STOP_2 = 31;
  // localparam STATE_TRANSIT_1 = 102;
  // localparam STATE_TRANSIT_2 = 192;
  wire [7:0] control_reg;  // sources/rtl/i2c_module.v(85)
  wire [7:0] divider2;  // sources/rtl/i2c_module.v(71)
  wire [7:0] n1;
  wire  \sel0_b0/B1 ;
  wire  \sel0_b0/B35 ;
  wire  \sel0_b1/B10 ;
  wire  \sel0_b1/B23 ;
  wire  \sel0_b2/B11 ;
  wire  \sel0_b2/B12 ;
  wire  \sel0_b2/B20 ;
  wire  \sel0_b2/B21 ;
  wire  \sel0_b2/B29 ;
  wire  \sel0_b2/B3 ;
  wire  \sel0_b2/B4 ;
  wire  \sel0_b3/B22 ;
  wire  \sel0_b3/B26 ;
  wire  \sel0_b3/B8 ;
  wire  \sel0_b4/B16 ;
  wire  \sel0_b4/B17 ;
  wire  \sel0_b4/B9 ;
  wire  \sel0_b5/B34 ;
  wire  \sel1/B33 ;
  wire  \sel5/B3 ;
  wire [7:0] slave_address;  // sources/rtl/i2c_module.v(86)
  wire [7:0] slave_data_1;  // sources/rtl/i2c_module.v(88)
  wire [7:0] slave_reg_address;  // sources/rtl/i2c_module.v(87)
  wire [7:0] state_next;  // sources/rtl/i2c_module.v(21)
  wire _al_u108_o;
  wire _al_u109_o;
  wire _al_u113_o;
  wire _al_u114_o;
  wire _al_u115_o;
  wire _al_u117_o;
  wire _al_u121_o;
  wire _al_u122_o;
  wire _al_u123_o;
  wire _al_u126_o;
  wire _al_u127_o;
  wire _al_u129_o;
  wire _al_u131_o;
  wire _al_u132_o;
  wire _al_u133_o;
  wire _al_u134_o;
  wire _al_u135_o;
  wire _al_u136_o;
  wire _al_u138_o;
  wire _al_u139_o;
  wire _al_u141_o;
  wire _al_u142_o;
  wire _al_u143_o;
  wire _al_u144_o;
  wire _al_u145_o;
  wire _al_u146_o;
  wire _al_u147_o;
  wire _al_u149_o;
  wire _al_u150_o;
  wire _al_u151_o;
  wire _al_u153_o;
  wire _al_u154_o;
  wire _al_u155_o;
  wire _al_u156_o;
  wire _al_u157_o;
  wire _al_u158_o;
  wire _al_u160_o;
  wire _al_u161_o;
  wire _al_u164_o;
  wire _al_u165_o;
  wire _al_u166_o;
  wire _al_u168_o;
  wire _al_u170_o;
  wire _al_u171_o;
  wire _al_u172_o;
  wire _al_u175_o;
  wire _al_u176_o;
  wire _al_u177_o;
  wire _al_u180_o;
  wire _al_u181_o;
  wire _al_u183_o;
  wire _al_u185_o;
  wire _al_u186_o;
  wire _al_u187_o;
  wire _al_u189_o;
  wire _al_u193_o;
  wire _al_u194_o;
  wire _al_u195_o;
  wire _al_u196_o;
  wire _al_u197_o;
  wire _al_u198_o;
  wire _al_u200_o;
  wire _al_u202_o;
  wire _al_u203_o;
  wire _al_u205_o;
  wire _al_u206_o;
  wire _al_u207_o;
  wire _al_u208_o;
  wire _al_u209_o;
  wire _al_u210_o;
  wire _al_u211_o;
  wire _al_u212_o;
  wire _al_u213_o;
  wire _al_u214_o;
  wire _al_u215_o;
  wire _al_u216_o;
  wire _al_u217_o;
  wire _al_u219_o;
  wire _al_u221_o;
  wire _al_u222_o;
  wire _al_u223_o;
  wire _al_u224_o;
  wire _al_u226_o;
  wire _al_u227_o;
  wire _al_u228_o;
  wire _al_u229_o;
  wire _al_u231_o;
  wire _al_u232_o;
  wire _al_u233_o;
  wire _al_u234_o;
  wire _al_u235_o;
  wire _al_u236_o;
  wire _al_u238_o;
  wire _al_u239_o;
  wire _al_u241_o;
  wire _al_u243_o;
  wire _al_u244_o;
  wire _al_u245_o;
  wire _al_u246_o;
  wire _al_u247_o;
  wire _al_u248_o;
  wire _al_u249_o;
  wire _al_u250_o;
  wire _al_u251_o;
  wire _al_u253_o;
  wire _al_u255_o;
  wire _al_u258_o;
  wire _al_u259_o;
  wire _al_u260_o;
  wire _al_u261_o;
  wire _al_u263_o;
  wire _al_u264_o;
  wire _al_u265_o;
  wire _al_u266_o;
  wire _al_u268_o;
  wire _al_u269_o;
  wire _al_u272_o;
  wire _al_u273_o;
  wire _al_u274_o;
  wire _al_u276_o;
  wire _al_u277_o;
  wire _al_u278_o;
  wire _al_u280_o;
  wire _al_u281_o;
  wire _al_u282_o;
  wire _al_u283_o;
  wire _al_u284_o;
  wire _al_u285_o;
  wire _al_u286_o;
  wire _al_u287_o;
  wire _al_u288_o;
  wire _al_u289_o;
  wire _al_u290_o;
  wire _al_u291_o;
  wire _al_u292_o;
  wire _al_u294_o;
  wire _al_u295_o;
  wire _al_u296_o;
  wire _al_u297_o;
  wire _al_u298_o;
  wire _al_u299_o;
  wire _al_u300_o;
  wire _al_u301_o;
  wire _al_u302_o;
  wire _al_u303_o;
  wire _al_u304_o;
  wire _al_u305_o;
  wire _al_u308_o;
  wire _al_u309_o;
  wire _al_u311_o;
  wire _al_u312_o;
  wire ack_ok;  // sources/rtl/i2c_module.v(143)
  wire \add0/c3 ;
  wire \add0/c7 ;
  wire mux4_b0_sel_is_3_o;
  wire mux5_b0_sel_is_3_o;
  wire mux6_b0_sel_is_3_o;
  wire mux7_b0_sel_is_3_o;
  wire mux9_b0_sel_is_0_o;
  wire n106_lutinv;
  wire n107_lutinv;
  wire n146_lutinv;
  wire n155_lutinv;
  wire n158_lutinv;
  wire n164_lutinv;
  wire n168_lutinv;
  wire n169_lutinv;
  wire n180_lutinv;
  wire n181_lutinv;
  wire n183_lutinv;
  wire n191_lutinv;
  wire n2;
  wire n28;
  wire n80_lutinv;
  wire n81_lutinv;
  wire n88_lutinv;
  wire n94_lutinv;
  wire scl_out_pad;  // sources/rtl/i2c_module.v(10)
  wire scl_output_enable;  // sources/rtl/i2c_module.v(120)
  wire scl_output_zero;  // sources/rtl/i2c_module.v(121)
  wire \sel0_b3/or_or_B13_B14_o_or_B_o_lutinv ;
  wire success;  // sources/rtl/i2c_module.v(141)

  EG_PHY_MSLICE #(
    //.LUT0("(~(A)*~(B)*~(C)*~(D)+~(A)*~(B)*C*~(D)+~(A)*B*C*~(D)+~(A)*~(B)*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    //.LUT1("(~D*~C*~B*~A)"),
    .INIT_LUT0(16'b1101000101010001),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"))
    \_al_u108|_al_u203  (
    .a({state_next[4],_al_u202_o}),
    .b({state_next[5],n28}),
    .c({state_next[6],state_next[4]}),
    .d({state_next[7],state_next[5]}),
    .f({_al_u108_o,_al_u203_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*~A)"),
    //.LUTF1("(~D*~C*~B*~A)"),
    //.LUTG0("(~D*C*B*~A)"),
    //.LUTG1("(~D*~C*~B*~A)"),
    .INIT_LUTF0(16'b0000000001000000),
    .INIT_LUTF1(16'b0000000000000001),
    .INIT_LUTG0(16'b0000000001000000),
    .INIT_LUTG1(16'b0000000000000001),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u109|_al_u138  (
    .a({state_next[0],state_next[0]}),
    .b({state_next[1],state_next[1]}),
    .c({state_next[2],state_next[2]}),
    .d({state_next[3],state_next[3]}),
    .f({_al_u109_o,_al_u138_o}));
  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*~D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*~B*~D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000000110000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000000110000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u111|reg1_b0  (
    .b({open_n46,address[0]}),
    .c({reset_n,write}),
    .ce(mux7_b0_sel_is_3_o),
    .clk(clk),
    .d({n146_lutinv,address[1]}),
    .mi({open_n50,writedata[0]}),
    .sr(mux9_b0_sel_is_0_o),
    .f({mux9_b0_sel_is_0_o,mux7_b0_sel_is_3_o}),
    .q({open_n65,control_reg[0]}));  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000111100000000),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000111100000000),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u114|_al_u250  (
    .c(state_next[1:0]),
    .d({state_next[0],n28}),
    .f({_al_u114_o,_al_u250_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u116|_al_u115  (
    .b({_al_u114_o,open_n96}),
    .c({_al_u115_o,state_next[3]}),
    .d({_al_u113_o,state_next[2]}),
    .f({\sel0_b2/B3 ,_al_u115_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*C*B*A)"),
    //.LUTF1("(~D*~C*~B*A)"),
    //.LUTG0("(D*C*B*A)"),
    //.LUTG1("(~D*~C*~B*A)"),
    .INIT_LUTF0(16'b1000000000000000),
    .INIT_LUTF1(16'b0000000000000010),
    .INIT_LUTG0(16'b1000000000000000),
    .INIT_LUTG1(16'b0000000000000010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u117|_al_u149  (
    .a({state_next[0],state_next[0]}),
    .b({state_next[1],state_next[1]}),
    .c({state_next[2],state_next[2]}),
    .d({state_next[3],state_next[3]}),
    .f({_al_u117_o,_al_u149_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~C*B*~A)"),
    //.LUTF1("(D*~C*B*~A)"),
    //.LUTG0("(~D*~C*B*~A)"),
    //.LUTG1("(D*~C*B*~A)"),
    .INIT_LUTF0(16'b0000000000000100),
    .INIT_LUTF1(16'b0000010000000000),
    .INIT_LUTG0(16'b0000000000000100),
    .INIT_LUTG1(16'b0000010000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u121|_al_u141  (
    .a({state_next[0],state_next[0]}),
    .b({state_next[1],state_next[1]}),
    .c({state_next[2],state_next[2]}),
    .d({state_next[3],state_next[3]}),
    .f({_al_u121_o,_al_u141_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*~B*A)"),
    //.LUT1("(~D*~C*B*A)"),
    .INIT_LUT0(16'b0000000000100000),
    .INIT_LUT1(16'b0000000000001000),
    .MODE("LOGIC"))
    \_al_u122|_al_u139  (
    .a({state_next[0],state_next[0]}),
    .b({state_next[1],state_next[1]}),
    .c({state_next[2],state_next[2]}),
    .d({state_next[3],state_next[3]}),
    .f({_al_u122_o,_al_u139_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*B*A)"),
    //.LUT1("(B*A*(D@C))"),
    .INIT_LUT0(16'b0000000000001000),
    .INIT_LUT1(16'b0000100010000000),
    .MODE("LOGIC"))
    \_al_u125|_al_u120  (
    .a({_al_u108_o,_al_u113_o}),
    .b({_al_u115_o,_al_u115_o}),
    .c({state_next[0],state_next[0]}),
    .d({state_next[1],state_next[1]}),
    .f({n88_lutinv,\sel0_b2/B4 }));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u128|_al_u127  (
    .b({_al_u126_o,open_n211}),
    .c({_al_u127_o,state_next[1]}),
    .d({_al_u108_o,state_next[0]}),
    .f({\sel0_b3/B22 ,_al_u127_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(~C*~D)"),
    //.LUTG1("(C*B*D)"),
    .INIT_LUTF0(16'b0000000000001111),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000000000001111),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u130|_al_u129  (
    .b({_al_u108_o,open_n238}),
    .c({_al_u115_o,state_next[1]}),
    .d({_al_u129_o,state_next[0]}),
    .f({\sel0_b2/B21 ,_al_u129_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*B*A)"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b1000000000000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u131|_al_u171  (
    .a({open_n263,_al_u131_o}),
    .b({\sel0_b3/B22 ,_al_u144_o}),
    .c({\sel0_b2/B21 ,_al_u151_o}),
    .d({n88_lutinv,_al_u170_o}),
    .f({_al_u131_o,_al_u171_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*C*~B*~A)"),
    //.LUT1("(D*~C*~B*~A)"),
    .INIT_LUT0(16'b0000000000010000),
    .INIT_LUT1(16'b0000000100000000),
    .MODE("LOGIC"))
    \_al_u132|_al_u136  (
    .a({state_next[0],state_next[0]}),
    .b({state_next[1],state_next[1]}),
    .c({state_next[2],state_next[2]}),
    .d({state_next[3],state_next[3]}),
    .f({_al_u132_o,_al_u136_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(A*~(~D*~C*~B))"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b1010101010101000),
    .MODE("LOGIC"))
    \_al_u135|_al_u134  (
    .a({_al_u108_o,open_n304}),
    .b({_al_u132_o,state_next[1]}),
    .c({_al_u133_o,state_next[3]}),
    .d({_al_u134_o,state_next[0]}),
    .f({_al_u135_o,_al_u134_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~C*~B*A)"),
    //.LUT1("(~D*C*B*A)"),
    .INIT_LUT0(16'b0000000000000010),
    .INIT_LUT1(16'b0000000010000000),
    .MODE("LOGIC"))
    \_al_u142|_al_u113  (
    .a({state_next[4],state_next[4]}),
    .b({state_next[5],state_next[5]}),
    .c({state_next[6],state_next[6]}),
    .d({state_next[7],state_next[7]}),
    .f({_al_u142_o,_al_u113_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*~B))"),
    //.LUT1("(D*~C*~B*~A)"),
    .INIT_LUT0(16'b1111110000000000),
    .INIT_LUT1(16'b0000000100000000),
    .MODE("LOGIC"))
    \_al_u144|_al_u140  (
    .a({_al_u135_o,open_n345}),
    .b({n80_lutinv,_al_u138_o}),
    .c({n81_lutinv,_al_u139_o}),
    .d({_al_u143_o,_al_u108_o}),
    .f({_al_u144_o,n81_lutinv}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*~A)"),
    //.LUTF1("(D*C*~B*~A)"),
    //.LUTG0("(~D*C*B*~A)"),
    //.LUTG1("(D*C*~B*~A)"),
    .INIT_LUTF0(16'b0000000001000000),
    .INIT_LUTF1(16'b0001000000000000),
    .INIT_LUTG0(16'b0000000001000000),
    .INIT_LUTG1(16'b0001000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u145|_al_u154  (
    .a({state_next[4],state_next[4]}),
    .b({state_next[5],state_next[5]}),
    .c({state_next[6],state_next[6]}),
    .d({state_next[7],state_next[7]}),
    .f({_al_u145_o,_al_u154_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u148|_al_u118  (
    .c({_al_u117_o,_al_u117_o}),
    .d({_al_u113_o,_al_u108_o}),
    .f({\sel0_b4/B16 ,\sel0_b0/B35 }));
  EG_PHY_LSLICE #(
    //.LUTF0("(~(C*B)*~(D*A))"),
    //.LUTF1("(D*~C*~B*A)"),
    //.LUTG0("(~(C*B)*~(D*A))"),
    //.LUTG1("(D*~C*~B*A)"),
    .INIT_LUTF0(16'b0001010100111111),
    .INIT_LUTF1(16'b0000001000000000),
    .INIT_LUTG0(16'b0001010100111111),
    .INIT_LUTG1(16'b0000001000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u151|_al_u150  (
    .a({_al_u146_o,_al_u108_o}),
    .b({_al_u147_o,_al_u113_o}),
    .c({\sel0_b4/B16 ,_al_u109_o}),
    .d({_al_u150_o,_al_u149_o}),
    .f({_al_u151_o,_al_u150_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u153|_al_u126  (
    .c({_al_u126_o,state_next[3]}),
    .d({_al_u113_o,state_next[2]}),
    .f({_al_u153_o,_al_u126_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~(D*C)*~(B*A))"),
    //.LUT1("(~(D*B)*~(C*A))"),
    .INIT_LUT0(16'b0000011101110111),
    .INIT_LUT1(16'b0001001101011111),
    .MODE("LOGIC"))
    \_al_u155|_al_u205  (
    .a({_al_u113_o,_al_u108_o}),
    .b({_al_u138_o,_al_u134_o}),
    .c({_al_u141_o,_al_u138_o}),
    .d({_al_u154_o,_al_u154_o}),
    .f({_al_u155_o,_al_u205_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*B))"),
    //.LUTF1("(C*~B*~D)"),
    //.LUTG0("(~D*~(~C*B))"),
    //.LUTG1("(C*~B*~D)"),
    .INIT_LUTF0(16'b0000000011110011),
    .INIT_LUTF1(16'b0000000000110000),
    .INIT_LUTG0(16'b0000000011110011),
    .INIT_LUTG1(16'b0000000000110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u156|_al_u212  (
    .b({_al_u153_o,\sel0_b4/B9 }),
    .c({_al_u155_o,n28}),
    .d({\sel0_b4/B9 ,\sel0_b2/B3 }),
    .f({_al_u156_o,_al_u212_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*C*~(B*A))"),
    //.LUT1("(D*C*B*A)"),
    .INIT_LUT0(16'b0111000000000000),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"))
    \_al_u157|_al_u161  (
    .a({_al_u131_o,_al_u157_o}),
    .b({_al_u144_o,_al_u160_o}),
    .c({_al_u151_o,n28}),
    .d({_al_u156_o,scl_output_zero}),
    .f({_al_u157_o,_al_u161_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*C*B*A)"),
    //.LUTF1("(D*C*B*~A)"),
    //.LUTG0("(~D*C*B*A)"),
    //.LUTG1("(D*C*B*~A)"),
    .INIT_LUTF0(16'b0000000010000000),
    .INIT_LUTF1(16'b0100000000000000),
    .INIT_LUTG0(16'b0000000010000000),
    .INIT_LUTG1(16'b0100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u158|_al_u133  (
    .a({state_next[0],state_next[0]}),
    .b({state_next[1],state_next[1]}),
    .c({state_next[2],state_next[2]}),
    .d({state_next[3],state_next[3]}),
    .f({_al_u158_o,_al_u133_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(~C*~B))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(D*~(~C*~B))"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111110000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111110000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u159|_al_u245  (
    .b({open_n558,_al_u158_o}),
    .c({_al_u158_o,_al_u141_o}),
    .d({_al_u113_o,_al_u108_o}),
    .f({n180_lutinv,_al_u245_o}));
  EG_PHY_PAD #(
    //.LOCATION("D16"),
    //.PCICLAMP("ON"),
    //.PULLMODE("PULLUP"),
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    _al_u16 (
    .do({open_n584,open_n585,open_n586,scl_out_pad}),
    .opad(scl_out));  // sources/rtl/i2c_module.v(10)
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(B)*~(D)+~C*B*~(D)+~(~C)*B*D+~C*B*D)"),
    //.LUTF1("(~C*~D)"),
    //.LUTG0("(~C*~(B)*~(D)+~C*B*~(D)+~(~C)*B*D+~C*B*D)"),
    //.LUTG1("(~C*~D)"),
    .INIT_LUTF0(16'b1100110000001111),
    .INIT_LUTF1(16'b0000000000001111),
    .INIT_LUTG0(16'b1100110000001111),
    .INIT_LUTG1(16'b0000000000001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u160|_al_u186  (
    .b({open_n602,n28}),
    .c({n180_lutinv,_al_u185_o}),
    .d({\sel0_b0/B35 ,\sel0_b0/B35 }),
    .f({_al_u160_o,_al_u186_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u162|_al_u199  (
    .c({_al_u149_o,_al_u149_o}),
    .d({_al_u113_o,_al_u108_o}),
    .f({n181_lutinv,n164_lutinv}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(~C*~D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000000000001111),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000000001111),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u163|_al_u196  (
    .c({_al_u154_o,\sel0_b5/B34 }),
    .d({_al_u149_o,\sel0_b2/B3 }),
    .f({\sel0_b5/B34 ,_al_u196_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~B*D)"),
    //.LUTF1("(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    //.LUTG0("(~C*~B*D)"),
    //.LUTG1("(C*~(B)*~(D)+C*B*~(D)+~(C)*B*D+C*B*D)"),
    .INIT_LUTF0(16'b0000001100000000),
    .INIT_LUTF1(16'b1100110011110000),
    .INIT_LUTG0(16'b0000001100000000),
    .INIT_LUTG1(16'b1100110011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u165|_al_u208  (
    .b({\sel0_b5/B34 ,\sel0_b2/B4 }),
    .c({scl_output_zero,_al_u153_o}),
    .d({_al_u164_o,_al_u207_o}),
    .f({_al_u165_o,_al_u208_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~(D*B)*~(C*A))"),
    //.LUT1("(~(D*C)*~(B*A))"),
    .INIT_LUT0(16'b0001001101011111),
    .INIT_LUT1(16'b0000011101110111),
    .MODE("LOGIC"))
    \_al_u168|_al_u123  (
    .a({_al_u108_o,_al_u108_o}),
    .b({_al_u121_o,_al_u113_o}),
    .c({_al_u138_o,_al_u121_o}),
    .d({_al_u154_o,_al_u122_o}),
    .f({_al_u168_o,_al_u123_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*~B))"),
    //.LUT1("(~D*C*~B*~A)"),
    .INIT_LUT0(16'b1111110000000000),
    .INIT_LUT1(16'b0000000000010000),
    .MODE("LOGIC"))
    \_al_u170|_al_u169  (
    .a({\sel0_b4/B9 ,open_n725}),
    .b({_al_u153_o,_al_u122_o}),
    .c({_al_u168_o,_al_u141_o}),
    .d({n94_lutinv,_al_u113_o}),
    .f({_al_u170_o,n94_lutinv}));
  // sources/rtl/i2c_module.v(167)
  EG_PHY_MSLICE #(
    //.LUT0("~(~(C*~B)*~(D*A))"),
    //.LUT1("(D*C*~(B*A))"),
    .CEMUX("CE"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1011101000110000),
    .INIT_LUT1(16'b0111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \_al_u172|success_out_reg  (
    .a({_al_u171_o,\sel0_b2/B3 }),
    .b({_al_u160_o,\sel0_b0/B35 }),
    .c({n28,success_out}),
    .ce(n28),
    .clk(divider2[7]),
    .d({success,success}),
    .f({_al_u172_o,open_n759}),
    .q({open_n763,success_out}));  // sources/rtl/i2c_module.v(167)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(A*~(C*~B)))"),
    //.LUTF1("(~C*B*~D)"),
    //.LUTG0("(D*~(A*~(C*~B)))"),
    //.LUTG1("(~C*B*~D)"),
    .INIT_LUTF0(16'b0111010100000000),
    .INIT_LUTF1(16'b0000000000001100),
    .INIT_LUTG0(16'b0111010100000000),
    .INIT_LUTG1(16'b0000000000001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u175|_al_u176  (
    .a({open_n764,_al_u164_o}),
    .b({_al_u123_o,_al_u175_o}),
    .c({n180_lutinv,n28}),
    .d({\sel0_b0/B35 ,scl_output_enable}),
    .f({_al_u175_o,_al_u176_o}));
  // sources/rtl/i2c_module.v(1066)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(~D*C)*~(B*A))"),
    //.LUTF1("(~A*~(B*~(~D*~C)))"),
    //.LUTG0("(~(~D*C)*~(B*A))"),
    //.LUTG1("(~A*~(B*~(~D*~C)))"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0111011100000111),
    .INIT_LUTF1(16'b0001000100010101),
    .INIT_LUTG0(16'b0111011100000111),
    .INIT_LUTG1(16'b0001000100010101),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \_al_u177|scl_output_enable_reg  (
    .a({_al_u176_o,_al_u177_o}),
    .b({\sel0_b2/B4 ,_al_u157_o}),
    .c({ack_ok,n28}),
    .clk(divider2[7]),
    .d({n28,scl_output_enable}),
    .sr(reset_n),
    .f({_al_u177_o,open_n806}),
    .q({open_n810,scl_output_enable}));  // sources/rtl/i2c_module.v(1066)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u179|_al_u270  (
    .b({open_n813,_al_u114_o}),
    .c({_al_u115_o,_al_u115_o}),
    .d({_al_u113_o,_al_u108_o}),
    .f({n191_lutinv,\sel0_b2/B20 }));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*B*D)"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b0000110000000000),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u180|_al_u256  (
    .b({open_n840,_al_u180_o}),
    .c({\sel0_b5/B34 ,\sel0_b0/B35 }),
    .d({n191_lutinv,_al_u171_o}),
    .f({_al_u180_o,n183_lutinv}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u181|_al_u229  (
    .c({_al_u180_o,_al_u180_o}),
    .d({_al_u171_o,n28}),
    .f({_al_u181_o,_al_u229_o}));
  // sources/rtl/i2c_module.v(510)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(D)*~((~B*~A))+C*D*~((~B*~A))+~(C)*D*(~B*~A)+C*D*(~B*~A))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*~(D)*~((~B*~A))+C*D*~((~B*~A))+~(C)*D*(~B*~A)+C*D*(~B*~A))"),
    //.LUTG1("(C*D)"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1111000111100000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000111100000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u183|reg5_b7  (
    .a({open_n889,_al_u181_o}),
    .b({open_n890,n28}),
    .c({ack_ok,state_next[7]}),
    .clk(divider2[7]),
    .d({n168_lutinv,_al_u183_o}),
    .sr(n2),
    .f({_al_u183_o,open_n908}),
    .q({open_n912,state_next[7]}));  // sources/rtl/i2c_module.v(510)
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(~C*B))"),
    //.LUT1("(~C*B*~D)"),
    .INIT_LUT0(16'b0000000011110011),
    .INIT_LUT1(16'b0000000000001100),
    .MODE("LOGIC"))
    \_al_u185|_al_u198  (
    .b({ack_ok,ack_ok}),
    .c({n28,n28}),
    .d({_al_u123_o,_al_u123_o}),
    .f({_al_u185_o,_al_u198_o}));
  // sources/rtl/i2c_module.v(510)
  EG_PHY_LSLICE #(
    //.LUTF0("~(D*~(B*~(~C*~A)))"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("~(D*~(B*~(~C*~A)))"),
    //.LUTG1("(C*~D)"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100100011111111),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b1100100011111111),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u187|reg5_b6  (
    .a({open_n935,_al_u181_o}),
    .b({open_n936,state_next[6]}),
    .c({_al_u186_o,n28}),
    .clk(divider2[7]),
    .d({\sel0_b5/B34 ,_al_u187_o}),
    .sr(n2),
    .f({_al_u187_o,open_n954}),
    .q({open_n958,state_next[6]}));  // sources/rtl/i2c_module.v(510)
  // sources/rtl/i2c_module.v(510)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(~D*~C*~A))"),
    //.LUT1("(~C*D)"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011001100110010),
    .INIT_LUT1(16'b0000111100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u189|reg5_b5  (
    .a({open_n959,_al_u181_o}),
    .b({open_n960,_al_u189_o}),
    .c({state_next[5],n28}),
    .clk(divider2[7]),
    .d({_al_u186_o,state_next[3]}),
    .sr(n2),
    .f({_al_u189_o,open_n974}),
    .q({open_n978,state_next[5]}));  // sources/rtl/i2c_module.v(510)
  EG_PHY_MSLICE #(
    //.LUT0("(~(D*C)*~(B*A))"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b0000011101110111),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u191|_al_u146  (
    .a({open_n979,_al_u113_o}),
    .b({open_n980,_al_u139_o}),
    .c({_al_u145_o,_al_u109_o}),
    .d({_al_u109_o,_al_u145_o}),
    .f({n169_lutinv,_al_u146_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u192|_al_u110  (
    .c({_al_u109_o,_al_u109_o}),
    .d({_al_u113_o,_al_u108_o}),
    .f({\sel0_b4/B17 ,n146_lutinv}));
  EG_PHY_MSLICE #(
    //.LUT0("(A*~(~D*~C*~B))"),
    //.LUT1("(~D*~C*~B*~A)"),
    .INIT_LUT0(16'b1010101010101000),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"))
    \_al_u194|_al_u193  (
    .a({n169_lutinv,_al_u113_o}),
    .b({_al_u147_o,_al_u117_o}),
    .c({\sel0_b4/B17 ,_al_u139_o}),
    .d({_al_u193_o,_al_u141_o}),
    .f({_al_u194_o,_al_u193_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(~D*~C*~B*A)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0000000000000010),
    .MODE("LOGIC"))
    \_al_u195|_al_u152  (
    .a({_al_u194_o,open_n1049}),
    .b({\sel0_b2/B4 ,open_n1050}),
    .c({\sel0_b4/B9 ,_al_u133_o}),
    .d({_al_u153_o,_al_u113_o}),
    .f({_al_u195_o,\sel0_b4/B9 }));
  // sources/rtl/i2c_module.v(510)
  EG_PHY_MSLICE #(
    //.LUT0("~(~C*~B*~(D*A))"),
    //.LUT1("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+~(A)*~(B)*C*D+A*~(B)*C*D+~(A)*B*C*D)"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111111011111100),
    .INIT_LUT1(16'b0111011100110101),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u197|reg5_b4  (
    .a({_al_u195_o,_al_u181_o}),
    .b({_al_u196_o,_al_u197_o}),
    .c({n28,_al_u203_o}),
    .clk(divider2[7]),
    .d({state_next[4],state_next[4]}),
    .sr(n2),
    .f({_al_u197_o,open_n1084}),
    .q({open_n1088,state_next[4]}));  // sources/rtl/i2c_module.v(510)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~(~B*~D))"),
    //.LUTF1("(~B*~(C*D))"),
    //.LUTG0("(C*~(~B*~D))"),
    //.LUTG1("(~B*~(C*D))"),
    .INIT_LUTF0(16'b1111000011000000),
    .INIT_LUTF1(16'b0000001100110011),
    .INIT_LUTG0(16'b1111000011000000),
    .INIT_LUTG1(16'b0000001100110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u200|_al_u210  (
    .b({n164_lutinv,n164_lutinv}),
    .c({n28,n28}),
    .d({n180_lutinv,n180_lutinv}),
    .f({_al_u200_o,_al_u210_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*B*D)"),
    //.LUTF1("(~C*B*~D)"),
    //.LUTG0("(~C*B*D)"),
    //.LUTG1("(~C*B*~D)"),
    .INIT_LUTF0(16'b0000110000000000),
    .INIT_LUTF1(16'b0000000000001100),
    .INIT_LUTG0(16'b0000110000000000),
    .INIT_LUTG1(16'b0000000000001100),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u202|_al_u201  (
    .b({_al_u200_o,_al_u149_o}),
    .c({\sel0_b0/B1 ,n28}),
    .d({_al_u198_o,_al_u113_o}),
    .f({_al_u202_o,\sel0_b0/B1 }));
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(C*~B))"),
    //.LUTF1("(~D*C*~B*~A)"),
    //.LUTG0("(D*~(C*~B))"),
    //.LUTG1("(~D*C*~B*~A)"),
    .INIT_LUTF0(16'b1100111100000000),
    .INIT_LUTF1(16'b0000000000010000),
    .INIT_LUTG0(16'b1100111100000000),
    .INIT_LUTG1(16'b0000000000010000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u207|_al_u206  (
    .a({n88_lutinv,open_n1141}),
    .b({\sel0_b2/B21 ,state_next[0]}),
    .c({_al_u205_o,state_next[1]}),
    .d({_al_u206_o,_al_u126_o}),
    .f({_al_u207_o,_al_u206_o}));
  // sources/rtl/i2c_module.v(510)
  EG_PHY_LSLICE #(
    //.LUTF0("~(C*~B*~(D*A))"),
    //.LUTF1("(~D*~(~C*B))"),
    //.LUTG0("~(C*~B*~(D*A))"),
    //.LUTG1("(~D*~(~C*B))"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1110111111001111),
    .INIT_LUTF1(16'b0000000011110011),
    .INIT_LUTG0(16'b1110111111001111),
    .INIT_LUTG1(16'b0000000011110011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u209|reg5_b3  (
    .a({open_n1166,_al_u181_o}),
    .b({n28,_al_u209_o}),
    .c({state_next[3],_al_u217_o}),
    .clk(divider2[7]),
    .d({_al_u208_o,state_next[3]}),
    .sr(n2),
    .f({_al_u209_o,open_n1184}),
    .q({open_n1188,state_next[3]}));  // sources/rtl/i2c_module.v(510)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(D*~(~C*~B))"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b1111110000000000),
    .MODE("LOGIC"))
    \_al_u213|_al_u214  (
    .b({_al_u117_o,open_n1191}),
    .c({_al_u133_o,n28}),
    .d({_al_u108_o,_al_u213_o}),
    .f({_al_u213_o,_al_u214_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~(~B*~D))"),
    //.LUTF1("(~C*~B*D)"),
    //.LUTG0("(~C*~(~B*~D))"),
    //.LUTG1("(~C*~B*D)"),
    .INIT_LUTF0(16'b0000111100001100),
    .INIT_LUTF1(16'b0000001100000000),
    .INIT_LUTG0(16'b0000111100001100),
    .INIT_LUTG1(16'b0000001100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u216|_al_u215  (
    .b({_al_u214_o,\sel0_b5/B34 }),
    .c({_al_u215_o,n28}),
    .d({_al_u212_o,n181_lutinv}),
    .f({_al_u216_o,_al_u215_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*B))"),
    //.LUT1("(C*~B*~D)"),
    .INIT_LUT0(16'b1111001100000000),
    .INIT_LUT1(16'b0000000000110000),
    .MODE("LOGIC"))
    \_al_u217|_al_u211  (
    .b({_al_u211_o,n28}),
    .c({_al_u216_o,state_next[3]}),
    .d({_al_u210_o,_al_u198_o}),
    .f({_al_u217_o,_al_u211_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~C*~D)"),
    //.LUTF1("(~C*D)"),
    //.LUTG0("(~C*~D)"),
    //.LUTG1("(~C*D)"),
    .INIT_LUTF0(16'b0000000000001111),
    .INIT_LUTF1(16'b0000111100000000),
    .INIT_LUTG0(16'b0000000000001111),
    .INIT_LUTG1(16'b0000111100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u219|_al_u260  (
    .c({_al_u147_o,_al_u133_o}),
    .d({_al_u146_o,_al_u117_o}),
    .f({_al_u219_o,_al_u260_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*~B))"),
    //.LUT1("(~D*~C*~B*~A)"),
    .INIT_LUT0(16'b1111110000000000),
    .INIT_LUT1(16'b0000000000000001),
    .MODE("LOGIC"))
    \_al_u221|_al_u137  (
    .a({\sel0_b0/B35 ,open_n1288}),
    .b({n158_lutinv,_al_u122_o}),
    .c({n80_lutinv,_al_u136_o}),
    .d({n81_lutinv,_al_u108_o}),
    .f({_al_u221_o,n80_lutinv}));
  EG_PHY_MSLICE #(
    //.LUT0("(~D*~(C*B))"),
    //.LUT1("(D*C*B*A)"),
    .INIT_LUT0(16'b0000000000111111),
    .INIT_LUT1(16'b1000000000000000),
    .MODE("LOGIC"))
    \_al_u224|_al_u223  (
    .a({_al_u131_o,open_n1309}),
    .b({_al_u219_o,_al_u222_o}),
    .c({_al_u221_o,_al_u113_o}),
    .d({_al_u223_o,\sel0_b2/B4 }),
    .f({_al_u224_o,_al_u223_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~A*~(~D*C*B))"),
    //.LUTF1("(C*~B*~D)"),
    //.LUTG0("(~A*~(~D*C*B))"),
    //.LUTG1("(C*~B*~D)"),
    .INIT_LUTF0(16'b0101010100010101),
    .INIT_LUTF1(16'b0000000000110000),
    .INIT_LUTG0(16'b0101010100010101),
    .INIT_LUTG1(16'b0000000000110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u227|_al_u226  (
    .a({open_n1330,\sel0_b2/B3 }),
    .b({_al_u215_o,n28}),
    .c({_al_u226_o,state_next[2]}),
    .d({\sel0_b3/or_or_B13_B14_o_or_B_o_lutinv ,state_next[0]}),
    .f({_al_u227_o,_al_u226_o}));
  // sources/rtl/i2c_module.v(510)
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(D*~(~C*~A)))"),
    //.LUT1("(B*~(~C*~D))"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111101100110011),
    .INIT_LUT1(16'b1100110011000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u228|reg5_b2  (
    .a({open_n1355,_al_u181_o}),
    .b({_al_u227_o,_al_u228_o}),
    .c({n28,_al_u229_o}),
    .clk(divider2[7]),
    .d({_al_u224_o,state_next[2]}),
    .sr(n2),
    .f({_al_u228_o,open_n1369}),
    .q({open_n1373,state_next[2]}));  // sources/rtl/i2c_module.v(510)
  EG_PHY_LSLICE #(
    //.LUTF0("(~(D*C)*~(B*A))"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(~(D*C)*~(B*A))"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b0000011101110111),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000011101110111),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u231|_al_u143  (
    .a({open_n1374,_al_u108_o}),
    .b({open_n1375,_al_u141_o}),
    .c({_al_u143_o,_al_u109_o}),
    .d({n81_lutinv,_al_u142_o}),
    .f({_al_u231_o,_al_u143_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~(D*C)*~(B*~A))"),
    //.LUT1("(~C*~D)"),
    .INIT_LUT0(16'b0000101110111011),
    .INIT_LUT1(16'b0000000000001111),
    .MODE("LOGIC"))
    \_al_u234|_al_u235  (
    .a({open_n1400,_al_u234_o}),
    .b({open_n1401,n28}),
    .c({n180_lutinv,_al_u108_o}),
    .d({\sel0_b2/B3 ,_al_u185_o}),
    .f({_al_u234_o,_al_u235_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*~B*A))"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(~D*~(~C*~B*A))"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b0000000011111101),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b0000000011111101),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u236|_al_u238  (
    .a({open_n1422,_al_u236_o}),
    .b({open_n1423,\sel0_b1/B10 }),
    .c({_al_u205_o,_al_u193_o}),
    .d({n88_lutinv,n28}),
    .f({_al_u236_o,_al_u238_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*B*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1100000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u237|_al_u277  (
    .b({open_n1450,_al_u138_o}),
    .c({_al_u138_o,_al_u276_o}),
    .d({_al_u113_o,_al_u108_o}),
    .f({\sel0_b1/B10 ,_al_u277_o}));
  // sources/rtl/i2c_module.v(510)
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C*~(~D*~A)))"),
    //.LUT1("(~D*~C*B*~A)"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111001110110011),
    .INIT_LUT1(16'b0000000000000100),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u239|reg5_b1  (
    .a({_al_u233_o,_al_u181_o}),
    .b({_al_u235_o,_al_u239_o}),
    .c({_al_u238_o,state_next[1]}),
    .clk(divider2[7]),
    .d({_al_u215_o,_al_u229_o}),
    .sr(n2),
    .f({_al_u239_o,open_n1484}),
    .q({open_n1488,state_next[1]}));  // sources/rtl/i2c_module.v(510)
  EG_PHY_MSLICE #(
    //.LUT0("(D*(C@B))"),
    //.LUT1("(~D*~(~C*B))"),
    .INIT_LUT0(16'b0011110000000000),
    .INIT_LUT1(16'b0000000011110011),
    .MODE("LOGIC"))
    \_al_u241|_al_u232  (
    .b({_al_u153_o,state_next[0]}),
    .c({state_next[0],state_next[1]}),
    .d({\sel0_b2/B4 ,_al_u153_o}),
    .f({_al_u241_o,_al_u232_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(~C*~B*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(~C*~B*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000000000011),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000000000011),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u243|_al_u242  (
    .b({\sel0_b3/B26 ,open_n1513}),
    .c({_al_u147_o,_al_u132_o}),
    .d({\sel0_b2/B21 ,_al_u108_o}),
    .f({_al_u243_o,\sel0_b3/B26 }));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~(~C*~B))"),
    //.LUT1("(~D*~C*B*~A)"),
    .INIT_LUT0(16'b1111110000000000),
    .INIT_LUT1(16'b0000000000000100),
    .MODE("LOGIC"))
    \_al_u246|_al_u244  (
    .a({\sel0_b4/B17 ,open_n1538}),
    .b({_al_u155_o,_al_u136_o}),
    .c({_al_u244_o,_al_u138_o}),
    .d({_al_u245_o,_al_u108_o}),
    .f({_al_u246_o,_al_u244_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(D*C*B*~A)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b0100000000000000),
    .MODE("LOGIC"))
    \_al_u247|_al_u275  (
    .a({_al_u198_o,open_n1559}),
    .b({_al_u241_o,open_n1560}),
    .c({_al_u243_o,_al_u154_o}),
    .d({_al_u246_o,_al_u138_o}),
    .f({_al_u247_o,\sel0_b1/B23 }));
  EG_PHY_MSLICE #(
    //.LUT0("(D*~C*~(~B*~A))"),
    //.LUT1("(~D*~(C*B))"),
    .INIT_LUT0(16'b0000111000000000),
    .INIT_LUT1(16'b0000000000111111),
    .MODE("LOGIC"))
    \_al_u249|_al_u248  (
    .a({open_n1581,n191_lutinv}),
    .b({n146_lutinv,\sel0_b5/B34 }),
    .c({control_reg[0],n28}),
    .d({_al_u248_o,state_next[0]}),
    .f({_al_u249_o,_al_u248_o}));
  // sources/rtl/i2c_module.v(510)
  EG_PHY_MSLICE #(
    //.LUT0("~(B*~(C*D))"),
    //.LUT1("(B*~(~C*~(~D*A)))"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111001100110011),
    .INIT_LUT1(16'b1100000011001000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u251|reg5_b0  (
    .a({_al_u247_o,open_n1602}),
    .b({_al_u249_o,_al_u251_o}),
    .c({_al_u250_o,state_next[0]}),
    .clk(divider2[7]),
    .d({_al_u229_o,_al_u181_o}),
    .sr(n2),
    .f({_al_u251_o,open_n1616}),
    .q({open_n1620,state_next[0]}));  // sources/rtl/i2c_module.v(510)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(D*~(~C*~B*A))"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(D*~(~C*~B*A))"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b1111110100000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b1111110100000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u255|_al_u254  (
    .a({_al_u171_o,open_n1621}),
    .b({\sel0_b0/B35 ,open_n1622}),
    .c({_al_u253_o,ready}),
    .d({n107_lutinv,n28}),
    .f({_al_u255_o,n107_lutinv}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000011110000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000011110000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u258|_al_u220  (
    .c({_al_u150_o,_al_u121_o}),
    .d({n80_lutinv,_al_u108_o}),
    .f({_al_u258_o,n158_lutinv}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(B*D))"),
    //.LUT1("(C*~B*D)"),
    .INIT_LUT0(16'b0000001100001111),
    .INIT_LUT1(16'b0011000000000000),
    .MODE("LOGIC"))
    \_al_u259|_al_u265  (
    .b({_al_u232_o,_al_u264_o}),
    .c({_al_u258_o,n28}),
    .d({_al_u219_o,_al_u259_o}),
    .f({_al_u259_o,_al_u265_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*D)"),
    //.LUT1("(C*B*~D)"),
    .INIT_LUT0(16'b0000111100000000),
    .INIT_LUT1(16'b0000000011000000),
    .MODE("LOGIC"))
    \_al_u261|_al_u253  (
    .b({_al_u168_o,open_n1699}),
    .c({_al_u260_o,state_next[0]}),
    .d({_al_u253_o,_al_u115_o}),
    .f({_al_u261_o,_al_u253_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u262|_al_u182  (
    .c({_al_u132_o,_al_u122_o}),
    .d({_al_u113_o,_al_u113_o}),
    .f({\sel0_b3/B8 ,n168_lutinv}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*D)"),
    //.LUT1("(~C*~B*~D)"),
    .INIT_LUT0(16'b0000001100000000),
    .INIT_LUT1(16'b0000000000000011),
    .MODE("LOGIC"))
    \_al_u263|_al_u225  (
    .b({\sel0_b3/B26 ,ack_ok}),
    .c({\sel0_b3/B8 ,n28}),
    .d({n168_lutinv,n168_lutinv}),
    .f({_al_u263_o,\sel0_b3/or_or_B13_B14_o_or_B_o_lutinv }));
  EG_PHY_LSLICE #(
    //.LUTF0("(~D*~(~C*~B*A))"),
    //.LUTF1("(D*C*B*A)"),
    //.LUTG0("(~D*~(~C*~B*A))"),
    //.LUTG1("(D*C*B*A)"),
    .INIT_LUTF0(16'b0000000011111101),
    .INIT_LUTF1(16'b1000000000000000),
    .INIT_LUTG0(16'b0000000011111101),
    .INIT_LUTG1(16'b1000000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u264|_al_u233  (
    .a({_al_u131_o,_al_u231_o}),
    .b({_al_u231_o,_al_u232_o}),
    .c({_al_u261_o,\sel0_b0/B35 }),
    .d({_al_u263_o,n28}),
    .f({_al_u264_o,_al_u233_o}));
  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u269|reg2_b7  (
    .c({_al_u142_o,slave_address[7]}),
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .d({_al_u268_o,n28}),
    .mi({open_n1797,writedata[7]}),
    .sr(n2),
    .f({_al_u269_o,_al_u268_o}),
    .q({open_n1812,slave_address[7]}));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(~(C*B)*~(D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0001010100111111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u274|reg3_b4  (
    .a({\sel0_b2/B20 ,open_n1813}),
    .b({\sel0_b2/B29 ,open_n1814}),
    .c({_al_u272_o,slave_reg_address[4]}),
    .ce(mux5_b0_sel_is_3_o),
    .clk(clk),
    .d({_al_u273_o,n28}),
    .mi({open_n1825,writedata[4]}),
    .sr(n2),
    .f({_al_u274_o,_al_u273_o}),
    .q({open_n1829,slave_reg_address[4]}));  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u279|_al_u271  (
    .c({_al_u139_o,_al_u139_o}),
    .d({_al_u113_o,_al_u108_o}),
    .f({\sel0_b2/B11 ,\sel0_b2/B29 }));
  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(~(D*B)*~(C*A))"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(~(D*B)*~(C*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0001001101011111),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0001001101011111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u282|reg4_b5  (
    .a({\sel0_b2/B11 ,open_n1854}),
    .b({\sel0_b1/B10 ,open_n1855}),
    .c({_al_u280_o,slave_data_1[5]}),
    .ce(mux4_b0_sel_is_3_o),
    .clk(clk),
    .d({_al_u281_o,n28}),
    .mi({open_n1859,writedata[5]}),
    .sr(n2),
    .f({_al_u282_o,_al_u280_o}),
    .q({open_n1874,slave_data_1[5]}));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(~B*~(D*~C*A))"),
    //.LUT1("(D*C*B*~A)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000100110011),
    .INIT_LUT1(16'b0100000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u283|reg3_b7  (
    .a({_al_u269_o,\sel0_b1/B23 }),
    .b({_al_u274_o,_al_u277_o}),
    .c({_al_u278_o,n28}),
    .ce(mux5_b0_sel_is_3_o),
    .clk(clk),
    .d({_al_u282_o,slave_reg_address[7]}),
    .mi({open_n1885,writedata[7]}),
    .sr(n2),
    .f({_al_u283_o,_al_u278_o}),
    .q({open_n1889,slave_reg_address[7]}));  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u285|_al_u284  (
    .c({_al_u284_o,slave_address[0]}),
    .d({\sel0_b3/B26 ,n28}),
    .f({_al_u285_o,_al_u284_o}));
  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("~((D*B)*~(A)*~(C)+(D*B)*A*~(C)+~((D*B))*A*C+(D*B)*A*C)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("~((D*B)*~(A)*~(C)+(D*B)*A*~(C)+~((D*B))*A*C+(D*B)*A*C)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b0101001101011111),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b0101001101011111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u288|reg3_b3  (
    .a({_al_u286_o,open_n1918}),
    .b({_al_u287_o,open_n1919}),
    .c({_al_u158_o,slave_reg_address[3]}),
    .ce(mux5_b0_sel_is_3_o),
    .clk(clk),
    .d({_al_u245_o,n28}),
    .mi({open_n1923,writedata[3]}),
    .sr(n2),
    .f({_al_u288_o,_al_u286_o}),
    .q({open_n1938,slave_reg_address[3]}));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(~(D*B)*~(C*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b0001001101011111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u291|reg4_b1  (
    .a({_al_u153_o,open_n1939}),
    .b({\sel0_b3/B8 ,n28}),
    .c({_al_u289_o,slave_data_1[1]}),
    .ce(mux4_b0_sel_is_3_o),
    .clk(clk),
    .d({_al_u290_o,_al_u114_o}),
    .mi({open_n1950,writedata[1]}),
    .sr(n2),
    .f({_al_u291_o,_al_u289_o}),
    .q({open_n1954,slave_data_1[1]}));  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*D)"),
    //.LUTF1("(C*B*~D)"),
    //.LUTG0("(C*D)"),
    //.LUTG1("(C*B*~D)"),
    .INIT_LUTF0(16'b1111000000000000),
    .INIT_LUTF1(16'b0000000011000000),
    .INIT_LUTG0(16'b1111000000000000),
    .INIT_LUTG1(16'b0000000011000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u292|_al_u222  (
    .b({_al_u288_o,open_n1957}),
    .c({_al_u291_o,_al_u127_o}),
    .d({_al_u285_o,_al_u126_o}),
    .f({_al_u292_o,_al_u222_o}));
  EG_PHY_MSLICE #(
    //.LUT0("(C*~B*D)"),
    //.LUT1("(~C*B*D)"),
    .INIT_LUT0(16'b0011000000000000),
    .INIT_LUT1(16'b0000110000000000),
    .MODE("LOGIC"))
    \_al_u294|_al_u293  (
    .b({_al_u292_o,n28}),
    .c({\sel1/B33 ,sda}),
    .d({_al_u283_o,\sel0_b5/B34 }),
    .f({_al_u294_o,\sel1/B33 }));
  EG_PHY_LSLICE #(
    //.LUTF0("(~B*~(~D*~(~C*~A)))"),
    //.LUTF1("(D*~(~B*~(~C*A)))"),
    //.LUTG0("(~B*~(~D*~(~C*~A)))"),
    //.LUTG1("(D*~(~B*~(~C*A)))"),
    .INIT_LUTF0(16'b0011001100000001),
    .INIT_LUTF1(16'b1100111000000000),
    .INIT_LUTG0(16'b0011001100000001),
    .INIT_LUTG1(16'b1100111000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u300|_al_u164  (
    .a({\sel0_b2/B3 ,\sel0_b2/B3 }),
    .b({n181_lutinv,n181_lutinv}),
    .c({n28,\sel0_b5/B34 }),
    .d({sda,n28}),
    .f({_al_u300_o,_al_u164_o}));
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u302|_al_u301  (
    .b({open_n2030,n28}),
    .c({_al_u301_o,slave_data_1[0]}),
    .d({_al_u153_o,_al_u121_o}),
    .f({_al_u302_o,_al_u301_o}));
  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(~(D*B)*~(C*A))"),
    //.LUT1("(C*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0001001101011111),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u306|reg2_b1  (
    .a({open_n2055,n155_lutinv}),
    .b({open_n2056,\sel0_b2/B12 }),
    .c({_al_u133_o,slave_address[1]}),
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .d({_al_u108_o,slave_data_1[6]}),
    .mi({open_n2067,writedata[1]}),
    .sr(n2),
    .f({n155_lutinv,_al_u308_o}),
    .q({open_n2071,slave_address[1]}));  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(D*~(~C*~B))"),
    //.LUTF1("(C*D)"),
    //.LUTG0("(D*~(~C*~B))"),
    //.LUTG1("(C*D)"),
    .INIT_LUTF0(16'b1111110000000000),
    .INIT_LUTF1(16'b1111000000000000),
    .INIT_LUTG0(16'b1111110000000000),
    .INIT_LUTG1(16'b1111000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"))
    \_al_u307|_al_u147  (
    .b({open_n2074,_al_u136_o}),
    .c({_al_u136_o,_al_u138_o}),
    .d({_al_u113_o,_al_u113_o}),
    .f({\sel0_b2/B12 ,_al_u147_o}));
  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(~(C*B)*~(D*A))"),
    //.LUT1("(~D*~(C*B*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0001010100111111),
    .INIT_LUT1(16'b0000000001111111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \_al_u309|reg3_b2  (
    .a({_al_u304_o,n169_lutinv}),
    .b({_al_u305_o,n164_lutinv}),
    .c({_al_u308_o,slave_reg_address[2]}),
    .ce(mux5_b0_sel_is_3_o),
    .clk(clk),
    .d({n28,slave_data_1[7]}),
    .mi({open_n2109,writedata[2]}),
    .sr(n2),
    .f({_al_u309_o,_al_u305_o}),
    .q({open_n2113,slave_reg_address[2]}));  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(C*D)"),
    //.LUT1("(C*D)"),
    .INIT_LUT0(16'b1111000000000000),
    .INIT_LUT1(16'b1111000000000000),
    .MODE("LOGIC"))
    \_al_u311|_al_u310  (
    .c({_al_u196_o,sda}),
    .d({n106_lutinv,n28}),
    .f({_al_u311_o,n106_lutinv}));
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~B*~(~D*~A))"),
    //.LUT1("(~D*~C*B*~A)"),
    .INIT_LUT0(16'b0000001100000010),
    .INIT_LUT1(16'b0000000000000100),
    .MODE("LOGIC"))
    \_al_u312|_al_u303  (
    .a({_al_u298_o,_al_u299_o}),
    .b({_al_u303_o,_al_u300_o}),
    .c({_al_u309_o,_al_u302_o}),
    .d({_al_u311_o,n28}),
    .f({_al_u312_o,_al_u303_o}));
  // sources/rtl/i2c_module.v(76)
  // sources/rtl/i2c_module.v(153)
  EG_PHY_MSLICE #(
    //.LUT0("(~D)"),
    //.LUT1("(D*~C*~(B*~A))"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011111111),
    .INIT_LUT1(16'b0000101100000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \ack_ok_reg|clk_div_reg  (
    .a({\sel0_b2/B4 ,open_n2158}),
    .b({_al_u123_o,open_n2159}),
    .c({sda_in,open_n2160}),
    .clk(divider2[7]),
    .d({n28,n28}),
    .q({ack_ok,n28}));  // sources/rtl/i2c_module.v(76)
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u317"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u3_al_u318  (
    .a({divider2[5],divider2[3]}),
    .b({divider2[6],divider2[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\add0/c3 ),
    .f({n1[5],n1[3]}),
    .fco(\add0/c7 ),
    .fx({n1[6],n1[4]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u317"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \add0/u7_al_u319  (
    .a({open_n2198,divider2[7]}),
    .c(2'b00),
    .d({open_n2203,1'b0}),
    .fci(\add0/c7 ),
    .f({open_n2220,n1[7]}));
  EG_PHY_LSLICE #(
    //.MACRO("add0/ucin_al_u317"),
    //.R_POSITION("X0Y0Z0"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \add0/ucin_al_u317  (
    .a({divider2[1],1'b0}),
    .b({divider2[2],divider2[0]}),
    .c(2'b00),
    .clk(clk),
    .d(2'b01),
    .e(2'b01),
    .mi(n1[1:0]),
    .f({n1[1],open_n2240}),
    .fco(\add0/c3 ),
    .fx({n1[2],n1[0]}),
    .q(divider2[1:0]));
  // sources/rtl/i2c_module.v(81)
  // sources/rtl/i2c_module.v(81)
  EG_PHY_MSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b2|reg0_b7  (
    .clk(clk),
    .mi({n1[2],n1[7]}),
    .q({divider2[2],divider2[7]}));  // sources/rtl/i2c_module.v(81)
  // sources/rtl/i2c_module.v(81)
  // sources/rtl/i2c_module.v(81)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b3|reg0_b6  (
    .clk(clk),
    .mi({n1[3],n1[6]}),
    .q({divider2[3],divider2[6]}));  // sources/rtl/i2c_module.v(81)
  // sources/rtl/i2c_module.v(81)
  // sources/rtl/i2c_module.v(81)
  EG_PHY_LSLICE #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \reg0_b4|reg0_b5  (
    .clk(clk),
    .mi({n1[4],n1[5]}),
    .q({divider2[4],divider2[5]}));  // sources/rtl/i2c_module.v(81)
  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*B*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011000000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg2_b0|reg2_b6  (
    .b({address[0],open_n2326}),
    .c({write,slave_address[6]}),
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .d({address[1],n28}),
    .mi({writedata[0],writedata[6]}),
    .sr(n2),
    .f({mux6_b0_sel_is_3_o,_al_u287_o}),
    .q({slave_address[0],slave_address[6]}));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(C*~D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0000000011110000),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg2_b2|reg2_b3  (
    .c({slave_address[2],slave_address[3]}),
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .d({n28,n28}),
    .mi({writedata[2],writedata[3]}),
    .sr(n2),
    .f({_al_u276_o,_al_u272_o}),
    .q({slave_address[2],slave_address[3]}));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*B*D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*B*D)"),
    //.LUTG1("(C*B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1100000000000000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b1100000000000000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg2_b4|reg2_b5  (
    .b({_al_u136_o,_al_u122_o}),
    .c({slave_address[4],slave_address[5]}),
    .ce(mux6_b0_sel_is_3_o),
    .clk(clk),
    .d({_al_u108_o,_al_u108_o}),
    .mi({writedata[4],writedata[5]}),
    .sr(n2),
    .f({_al_u296_o,_al_u295_o}),
    .q({slave_address[4],slave_address[5]}));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~B*D)"),
    //.LUTF1("(~D*~(C*B))"),
    //.LUTG0("(C*~B*D)"),
    //.LUTG1("(~D*~(C*B))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0011000000000000),
    .INIT_LUTF1(16'b0000000000111111),
    .INIT_LUTG0(16'b0011000000000000),
    .INIT_LUTG1(16'b0000000000111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg3_b1|reg3_b0  (
    .b({\sel0_b4/B17 ,address[0]}),
    .c({slave_reg_address[1],write}),
    .ce(mux5_b0_sel_is_3_o),
    .clk(clk),
    .d({n180_lutinv,address[1]}),
    .mi(writedata[1:0]),
    .sr(n2),
    .f({_al_u304_o,mux5_b0_sel_is_3_o}),
    .q(slave_reg_address[1:0]));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(~C*~(A*~(D*B)))"),
    //.LUT1("(~C*~B*~(D*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000110100000101),
    .INIT_LUT1(16'b0000000100000011),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg3_b6|reg3_b5  (
    .a({\sel0_b3/B22 ,_al_u297_o}),
    .b({_al_u295_o,\sel0_b2/B21 }),
    .c({_al_u296_o,n28}),
    .ce(mux5_b0_sel_is_3_o),
    .clk(clk),
    .d(slave_reg_address[6:5]),
    .mi(writedata[6:5]),
    .sr(n2),
    .f({_al_u297_o,_al_u298_o}),
    .q(slave_reg_address[6:5]));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(C*~D)"),
    //.LUTF1("(C*B*D)"),
    //.LUTG0("(C*~D)"),
    //.LUTG1("(C*B*D)"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011110000),
    .INIT_LUTF1(16'b1100000000000000),
    .INIT_LUTG0(16'b0000000011110000),
    .INIT_LUTG1(16'b1100000000000000),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg4_b0|reg4_b4  (
    .b({address[0],open_n2410}),
    .c({write,slave_data_1[4]}),
    .ce(mux4_b0_sel_is_3_o),
    .clk(clk),
    .d({address[1],n28}),
    .mi({writedata[0],writedata[4]}),
    .sr(n2),
    .f({mux4_b0_sel_is_3_o,_al_u281_o}),
    .q({slave_data_1[0],slave_data_1[4]}));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_MSLICE #(
    //.LUT0("(C*~D)"),
    //.LUT1("(~(D*B)*~(C*A))"),
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0000000011110000),
    .INIT_LUT1(16'b0001001101011111),
    .MODE("LOGIC"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg4_b3|reg4_b2  (
    .a({\sel0_b4/B16 ,open_n2428}),
    .b({\sel0_b4/B9 ,open_n2429}),
    .c({slave_reg_address[0],slave_data_1[2]}),
    .ce(mux4_b0_sel_is_3_o),
    .clk(clk),
    .d({slave_data_1[3],n28}),
    .mi(writedata[3:2]),
    .sr(n2),
    .f({_al_u299_o,_al_u290_o}),
    .q(slave_data_1[3:2]));  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REG0_REGSET("RESET"),
    .REG0_SD("MI"),
    .REG1_REGSET("RESET"),
    .REG1_SD("MI"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \reg4_b6|reg4_b7  (
    .ce(mux4_b0_sel_is_3_o),
    .clk(clk),
    .mi({writedata[6],writedata[7]}),
    .sr(n2),
    .q({slave_data_1[6],slave_data_1[7]}));  // sources/rtl/i2c_module.v(117)
  EG_PHY_LSLICE #(
    //.LUTF0("(~D)"),
    //.LUTF1("~(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    //.LUTG0("(~D)"),
    //.LUTG1("~(C*~(D)*~(B)+C*D*~(B)+~(C)*D*B+C*D*B)"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b0000000011111111),
    .INIT_LUTF1(16'b0000001111001111),
    .INIT_LUTG0(16'b0000000011111111),
    .INIT_LUTG1(16'b0000001111001111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \scl_out_reg|_al_u314  (
    .b({scl_output_enable,open_n2472}),
    .c({scl_output_zero,open_n2473}),
    .clk(divider2[7]),
    .d({scl_out_pad,reset_n}),
    .f({open_n2492,n2}),
    .q({scl_out_pad,open_n2496}));  // sources/rtl/i2c_module.v(137)
  EG_PHY_MSLICE #(
    //.LUT0("(~(~D*C)*~(B*~A))"),
    //.LUT1("~(~C*~B*~D)"),
    .CEMUX("INV"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1011101100001011),
    .INIT_LUT1(16'b1111111111111100),
    .MODE("LOGIC"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \scl_output_zero_reg|_al_u166  (
    .a({open_n2497,\sel0_b2/B4 }),
    .b({_al_u165_o,_al_u123_o}),
    .c({_al_u166_o,n28}),
    .ce(n2),
    .clk(divider2[7]),
    .d({_al_u161_o,scl_output_zero}),
    .f({open_n2511,_al_u166_o}),
    .q({scl_output_zero,open_n2515}));  // sources/rtl/i2c_module.v(1066)
  EG_PHY_MSLICE #(
    //.LUT0("(~(A)*~(B)*C*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+~(A)*~(B)*~(C)*D+~(A)*B*~(C)*D+~(A)*~(B)*C*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    //.LUT1("~(~C*~B*~D)"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b1111010111010000),
    .INIT_LUT1(16'b1111111111111100),
    .MODE("LOGIC"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \sda_oe_reg|_al_u266  (
    .a({open_n2516,_al_u196_o}),
    .b({_al_u265_o,n181_lutinv}),
    .c({_al_u266_o,sda_oe}),
    .clk(divider2[7]),
    .d({n183_lutinv,n28}),
    .sr(reset_n),
    .f({open_n2530,_al_u266_o}),
    .q({sda_oe,open_n2534}));  // sources/rtl/i2c_module.v(1066)
  // sources/rtl/i2c_module.v(1066)
  // sources/rtl/i2c_module.v(1066)
  EG_PHY_LSLICE #(
    //.LUTF0("~(~B*~A*~(D*~C))"),
    //.LUTF1("~(C*B*~D)"),
    //.LUTG0("~(~B*~A*~(D*~C))"),
    //.LUTG1("~(C*B*~D)"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1110111111101110),
    .INIT_LUTF1(16'b1111111100111111),
    .INIT_LUTG0(16'b1110111111101110),
    .INIT_LUTG1(16'b1111111100111111),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG0_REGSET("SET"),
    .REG0_SD("F"),
    .REG1_REGSET("SET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \sda_reg|ready_reg  (
    .a({open_n2535,_al_u255_o}),
    .b({_al_u294_o,n183_lutinv}),
    .c({_al_u312_o,_al_u164_o}),
    .clk(divider2[7]),
    .d({n183_lutinv,ready}),
    .sr(reset_n),
    .q({sda,ready}));  // sources/rtl/i2c_module.v(1066)
  EG_PHY_LSLICE #(
    //.LUTF0("(A*(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    //.LUTF1("~(~C*~A*~(D*~B))"),
    //.LUTG0("(A*(B*~(D)*~(C)+B*D*~(C)+~(B)*D*C+B*D*C))"),
    //.LUTG1("~(~C*~A*~(D*~B))"),
    .CEMUX("1"),
    .CLKMUX("INV"),
    .DFFMODE("FF"),
    .INIT_LUTF0(16'b1010100000001000),
    .INIT_LUTF1(16'b1111101111111010),
    .INIT_LUTG0(16'b1010100000001000),
    .INIT_LUTG1(16'b1111101111111010),
    .LSFMUX0("FUNC5"),
    .LSFMUX1("FUNC5"),
    .MODE("LOGIC"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("INV"))
    \success_reg|_al_u173  (
    .a({_al_u172_o,\sel0_b2/B4 }),
    .b({_al_u164_o,ack_ok}),
    .c({\sel5/B3 ,n28}),
    .clk(divider2[7]),
    .d({success,success}),
    .sr(reset_n),
    .f({open_n2575,\sel5/B3 }),
    .q({success,open_n2579}));  // sources/rtl/i2c_module.v(1066)

endmodule 

