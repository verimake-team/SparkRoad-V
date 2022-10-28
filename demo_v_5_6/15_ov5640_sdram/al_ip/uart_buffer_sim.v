// Verilog netlist created by Tang Dynasty v5.6.59063
// Fri Oct 28 08:32:49 2022

`timescale 1ns / 1ps
module uart_buffer  // uart_buffer.v(14)
  (
  clk,
  di,
  re,
  rst,
  we,
  do,
  empty_flag,
  full_flag,
  rdusedw,
  wrusedw
  );

  input clk;  // uart_buffer.v(24)
  input [7:0] di;  // uart_buffer.v(23)
  input re;  // uart_buffer.v(25)
  input rst;  // uart_buffer.v(22)
  input we;  // uart_buffer.v(24)
  output [7:0] do;  // uart_buffer.v(27)
  output empty_flag;  // uart_buffer.v(28)
  output full_flag;  // uart_buffer.v(29)
  output [10:0] rdusedw;  // uart_buffer.v(30)
  output [10:0] wrusedw;  // uart_buffer.v(31)

  wire  _al_n1_syn_76;
  wire  _al_n1_syn_77;
  wire  _al_n1_syn_78;
  wire  _al_n1_syn_79;
  wire  logic_ramfifo_syn_798;
  wire  logic_ramfifo_syn_799;
  wire  logic_ramfifo_syn_801;
  wire  logic_ramfifo_syn_827;
  wire  logic_ramfifo_syn_828;
  wire  logic_ramfifo_syn_829;
  wire  logic_ramfifo_syn_830;
  wire  logic_ramfifo_syn_831;
  wire  logic_ramfifo_syn_856;
  wire  logic_ramfifo_syn_857;
  wire  logic_ramfifo_syn_858;
  wire  logic_ramfifo_syn_859;
  wire  logic_ramfifo_syn_860;
  wire  logic_ramfifo_syn_885;
  wire  logic_ramfifo_syn_886;
  wire  logic_ramfifo_syn_887;
  wire  logic_ramfifo_syn_888;
  wire  logic_ramfifo_syn_889;
  wire logic_ramfifo_syn_1;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_2;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_3;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_4;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_5;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_6;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_7;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_8;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_9;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_10;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_11;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_12;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_13;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_14;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_15;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_16;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_17;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_18;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_19;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_20;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_21;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_22;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_23;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_24;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_25;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_26;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_27;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_28;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_29;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_30;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_31;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_32;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_33;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_34;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_35;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_36;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_37;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_38;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_39;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_40;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_41;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_42;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_43;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_44;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_45;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_46;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_47;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_48;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_49;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_50;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_51;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_52;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_53;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_54;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_55;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_56;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_57;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_58;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_59;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_60;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_61;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_62;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_63;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_64;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_65;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_66;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_67;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_68;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_69;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_70;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_71;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_72;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_73;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_74;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_75;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_76;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_78;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_79;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_80;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_81;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_82;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_83;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_84;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_85;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_86;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_87;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_88;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_89;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_90;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_91;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_92;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_93;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_94;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_95;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_96;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_97;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_98;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_99;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_100;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_101;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_102;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_103;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_104;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_105;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_106;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_107;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_108;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_109;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_141;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_142;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_144;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_146;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_150;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_151;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_152;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_153;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_154;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_155;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_156;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_157;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_158;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_159;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_160;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_161;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_167;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_171;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_173;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_175;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_177;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_179;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_182;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_183;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_184;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_185;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_186;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_187;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_188;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_189;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_191;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_193;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_195;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_197;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_199;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_200;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_201;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_211;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_212;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_213;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_214;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_215;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_216;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_217;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_218;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_219;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_220;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_221;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_225;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_226;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_227;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_228;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_229;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_230;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_231;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_232;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_233;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_234;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_235;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_239;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_241;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_243;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_245;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_247;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_249;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_251;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_253;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_255;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_257;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_262;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_264;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_266;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_268;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_270;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_272;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_274;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_276;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_278;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_282;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_284;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_286;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_288;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_290;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_292;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_294;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_296;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_298;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_300;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_303;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_305;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_307;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_309;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_311;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_313;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_315;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_317;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_319;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_321;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_517;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_518;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_519;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_520;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_521;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_522;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_523;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_524;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_525;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_526;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_527;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_528;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_529;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_530;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_531;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_532;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_533;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_534;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_535;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_536;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_537;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_583;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_584;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_585;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_586;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_587;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_588;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_589;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_590;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_591;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_592;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_593;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_594;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_595;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_596;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_597;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_598;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_599;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_600;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_601;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_602;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_603;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_649;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_650;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_651;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_652;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_653;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_654;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_655;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_656;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_657;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_658;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_659;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_660;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_661;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_662;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_663;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_664;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_665;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_666;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_667;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_668;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_669;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_716;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_717;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_718;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_719;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_720;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_721;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_722;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_723;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_724;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_725;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_726;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_774;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_775;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_776;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_777;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_778;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_779;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_780;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_781;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_782;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_783;  // uart_buffer.v(39)
  wire logic_ramfifo_syn_784;  // uart_buffer.v(39)
  wire clk_syn_1;  // uart_buffer.v(24)
  wire clk_syn_2;  // uart_buffer.v(24)
  wire clk_syn_3;  // uart_buffer.v(24)
  wire clk_syn_4;  // uart_buffer.v(24)
  wire clk_syn_5;  // uart_buffer.v(24)
  wire clk_syn_6;  // uart_buffer.v(24)
  wire clk_syn_7;  // uart_buffer.v(24)
  wire clk_syn_8;  // uart_buffer.v(24)
  wire clk_syn_9;  // uart_buffer.v(24)
  wire clk_syn_10;  // uart_buffer.v(24)
  wire clk_syn_11;  // uart_buffer.v(24)
  wire clk_syn_12;  // uart_buffer.v(24)
  wire clk_syn_14;  // uart_buffer.v(24)
  wire clk_syn_16;  // uart_buffer.v(24)
  wire clk_syn_18;  // uart_buffer.v(24)
  wire clk_syn_20;  // uart_buffer.v(24)
  wire clk_syn_22;  // uart_buffer.v(24)
  wire clk_syn_24;  // uart_buffer.v(24)
  wire clk_syn_26;  // uart_buffer.v(24)
  wire clk_syn_28;  // uart_buffer.v(24)
  wire clk_syn_30;  // uart_buffer.v(24)
  wire clk_syn_32;  // uart_buffer.v(24)
  wire clk_syn_34;  // uart_buffer.v(24)
  wire clk_syn_40;  // uart_buffer.v(24)
  wire clk_syn_42;  // uart_buffer.v(24)
  wire clk_syn_44;  // uart_buffer.v(24)
  wire clk_syn_46;  // uart_buffer.v(24)
  wire clk_syn_48;  // uart_buffer.v(24)
  wire clk_syn_50;  // uart_buffer.v(24)
  wire clk_syn_52;  // uart_buffer.v(24)
  wire clk_syn_54;  // uart_buffer.v(24)
  wire clk_syn_56;  // uart_buffer.v(24)
  wire clk_syn_58;  // uart_buffer.v(24)
  wire clk_syn_60;  // uart_buffer.v(24)
  wire clk_syn_62;  // uart_buffer.v(24)
  wire clk_syn_64;  // uart_buffer.v(24)
  wire clk_syn_66;  // uart_buffer.v(24)
  wire clk_syn_68;  // uart_buffer.v(24)
  wire clk_syn_70;  // uart_buffer.v(24)
  wire clk_syn_72;  // uart_buffer.v(24)
  wire clk_syn_74;  // uart_buffer.v(24)
  wire clk_syn_76;  // uart_buffer.v(24)
  wire clk_syn_78;  // uart_buffer.v(24)
  wire clk_syn_80;  // uart_buffer.v(24)
  wire clk_syn_81;  // uart_buffer.v(24)
  wire clk_syn_82;  // uart_buffer.v(24)
  wire clk_syn_83;  // uart_buffer.v(24)
  wire clk_syn_84;  // uart_buffer.v(24)
  wire clk_syn_85;  // uart_buffer.v(24)
  wire clk_syn_86;  // uart_buffer.v(24)
  wire clk_syn_87;  // uart_buffer.v(24)
  wire clk_syn_88;  // uart_buffer.v(24)
  wire clk_syn_89;  // uart_buffer.v(24)
  wire clk_syn_90;  // uart_buffer.v(24)
  wire clk_syn_91;  // uart_buffer.v(24)
  wire clk_syn_92;  // uart_buffer.v(24)
  wire clk_syn_94;  // uart_buffer.v(24)
  wire clk_syn_95;  // uart_buffer.v(24)
  wire clk_syn_96;  // uart_buffer.v(24)
  wire clk_syn_97;  // uart_buffer.v(24)
  wire clk_syn_98;  // uart_buffer.v(24)
  wire clk_syn_99;  // uart_buffer.v(24)
  wire clk_syn_100;  // uart_buffer.v(24)
  wire clk_syn_101;  // uart_buffer.v(24)
  wire clk_syn_102;  // uart_buffer.v(24)
  wire clk_syn_103;  // uart_buffer.v(24)
  wire clk_syn_104;  // uart_buffer.v(24)
  wire clk_syn_105;  // uart_buffer.v(24)
  wire clk_syn_107;  // uart_buffer.v(24)
  wire clk_syn_109;  // uart_buffer.v(24)
  wire clk_syn_111;  // uart_buffer.v(24)
  wire clk_syn_113;  // uart_buffer.v(24)
  wire clk_syn_115;  // uart_buffer.v(24)
  wire clk_syn_117;  // uart_buffer.v(24)
  wire clk_syn_119;  // uart_buffer.v(24)
  wire clk_syn_121;  // uart_buffer.v(24)
  wire clk_syn_123;  // uart_buffer.v(24)
  wire clk_syn_125;  // uart_buffer.v(24)
  wire clk_syn_127;  // uart_buffer.v(24)
  wire clk_syn_133;  // uart_buffer.v(24)
  wire clk_syn_135;  // uart_buffer.v(24)
  wire clk_syn_137;  // uart_buffer.v(24)
  wire clk_syn_139;  // uart_buffer.v(24)
  wire clk_syn_141;  // uart_buffer.v(24)
  wire clk_syn_143;  // uart_buffer.v(24)
  wire clk_syn_145;  // uart_buffer.v(24)
  wire clk_syn_147;  // uart_buffer.v(24)
  wire clk_syn_149;  // uart_buffer.v(24)
  wire clk_syn_151;  // uart_buffer.v(24)
  wire clk_syn_153;  // uart_buffer.v(24)
  wire clk_syn_155;  // uart_buffer.v(24)
  wire clk_syn_157;  // uart_buffer.v(24)
  wire clk_syn_159;  // uart_buffer.v(24)
  wire clk_syn_161;  // uart_buffer.v(24)
  wire clk_syn_163;  // uart_buffer.v(24)
  wire clk_syn_165;  // uart_buffer.v(24)
  wire clk_syn_167;  // uart_buffer.v(24)
  wire clk_syn_169;  // uart_buffer.v(24)
  wire clk_syn_171;  // uart_buffer.v(24)
  wire clk_syn_173;  // uart_buffer.v(24)
  wire clk_syn_174;  // uart_buffer.v(24)
  wire clk_syn_175;  // uart_buffer.v(24)
  wire clk_syn_176;  // uart_buffer.v(24)
  wire clk_syn_177;  // uart_buffer.v(24)
  wire clk_syn_178;  // uart_buffer.v(24)
  wire clk_syn_179;  // uart_buffer.v(24)
  wire clk_syn_180;  // uart_buffer.v(24)
  wire clk_syn_181;  // uart_buffer.v(24)
  wire clk_syn_182;  // uart_buffer.v(24)
  wire clk_syn_183;  // uart_buffer.v(24)
  wire clk_syn_184;  // uart_buffer.v(24)
  wire clk_syn_185;  // uart_buffer.v(24)
  wire clk_syn_187;  // uart_buffer.v(24)
  wire clk_syn_188;  // uart_buffer.v(24)
  wire clk_syn_189;  // uart_buffer.v(24)
  wire clk_syn_190;  // uart_buffer.v(24)
  wire clk_syn_191;  // uart_buffer.v(24)
  wire clk_syn_192;  // uart_buffer.v(24)
  wire clk_syn_193;  // uart_buffer.v(24)
  wire clk_syn_194;  // uart_buffer.v(24)
  wire clk_syn_195;  // uart_buffer.v(24)
  wire clk_syn_196;  // uart_buffer.v(24)
  wire clk_syn_197;  // uart_buffer.v(24)
  wire clk_syn_198;  // uart_buffer.v(24)
  wire clk_syn_200;  // uart_buffer.v(24)
  wire clk_syn_202;  // uart_buffer.v(24)
  wire clk_syn_204;  // uart_buffer.v(24)
  wire clk_syn_206;  // uart_buffer.v(24)
  wire clk_syn_208;  // uart_buffer.v(24)
  wire clk_syn_210;  // uart_buffer.v(24)
  wire clk_syn_212;  // uart_buffer.v(24)
  wire clk_syn_214;  // uart_buffer.v(24)
  wire clk_syn_216;  // uart_buffer.v(24)
  wire clk_syn_218;  // uart_buffer.v(24)
  wire clk_syn_220;  // uart_buffer.v(24)
  wire clk_syn_226;  // uart_buffer.v(24)
  wire clk_syn_228;  // uart_buffer.v(24)
  wire clk_syn_230;  // uart_buffer.v(24)
  wire clk_syn_232;  // uart_buffer.v(24)
  wire clk_syn_234;  // uart_buffer.v(24)
  wire clk_syn_236;  // uart_buffer.v(24)
  wire clk_syn_238;  // uart_buffer.v(24)
  wire clk_syn_240;  // uart_buffer.v(24)
  wire clk_syn_242;  // uart_buffer.v(24)
  wire clk_syn_244;  // uart_buffer.v(24)
  wire clk_syn_246;  // uart_buffer.v(24)
  wire clk_syn_248;  // uart_buffer.v(24)
  wire clk_syn_250;  // uart_buffer.v(24)
  wire clk_syn_252;  // uart_buffer.v(24)
  wire clk_syn_254;  // uart_buffer.v(24)
  wire clk_syn_256;  // uart_buffer.v(24)
  wire clk_syn_258;  // uart_buffer.v(24)
  wire clk_syn_260;  // uart_buffer.v(24)
  wire clk_syn_262;  // uart_buffer.v(24)
  wire clk_syn_264;  // uart_buffer.v(24)
  wire clk_syn_266;  // uart_buffer.v(24)
  wire clk_syn_267;  // uart_buffer.v(24)
  wire clk_syn_268;  // uart_buffer.v(24)
  wire clk_syn_269;  // uart_buffer.v(24)
  wire clk_syn_270;  // uart_buffer.v(24)
  wire clk_syn_271;  // uart_buffer.v(24)
  wire clk_syn_272;  // uart_buffer.v(24)
  wire clk_syn_273;  // uart_buffer.v(24)
  wire clk_syn_274;  // uart_buffer.v(24)
  wire clk_syn_275;  // uart_buffer.v(24)
  wire clk_syn_276;  // uart_buffer.v(24)
  wire clk_syn_277;  // uart_buffer.v(24)
  wire clk_syn_278;  // uart_buffer.v(24)
  wire re_syn_2;  // uart_buffer.v(25)
  wire re_syn_3;  // uart_buffer.v(25)
  wire re_syn_4;  // uart_buffer.v(25)
  wire re_syn_5;  // uart_buffer.v(25)
  wire re_syn_9;  // uart_buffer.v(25)
  wire re_syn_10;  // uart_buffer.v(25)
  wire re_syn_11;  // uart_buffer.v(25)
  wire re_syn_17;  // uart_buffer.v(25)
  wire re_syn_20;  // uart_buffer.v(25)
  wire re_syn_21;  // uart_buffer.v(25)
  wire re_syn_22;  // uart_buffer.v(25)
  wire re_syn_23;  // uart_buffer.v(25)
  wire re_syn_24;  // uart_buffer.v(25)
  wire re_syn_25;  // uart_buffer.v(25)
  wire re_syn_26;  // uart_buffer.v(25)
  wire re_syn_27;  // uart_buffer.v(25)
  wire re_syn_36;  // uart_buffer.v(25)
  wire re_syn_37;  // uart_buffer.v(25)
  wire re_syn_38;  // uart_buffer.v(25)
  wire re_syn_39;  // uart_buffer.v(25)
  wire re_syn_40;  // uart_buffer.v(25)
  wire re_syn_41;  // uart_buffer.v(25)
  wire re_syn_42;  // uart_buffer.v(25)
  wire re_syn_43;  // uart_buffer.v(25)
  wire re_syn_44;  // uart_buffer.v(25)
  wire re_syn_45;  // uart_buffer.v(25)
  wire re_syn_46;  // uart_buffer.v(25)
  wire re_syn_47;  // uart_buffer.v(25)
  wire re_syn_48;  // uart_buffer.v(25)
  wire re_syn_49;  // uart_buffer.v(25)
  wire re_syn_50;  // uart_buffer.v(25)
  wire re_syn_51;  // uart_buffer.v(25)
  wire re_syn_52;  // uart_buffer.v(25)
  wire re_syn_53;  // uart_buffer.v(25)
  wire re_syn_54;  // uart_buffer.v(25)
  wire re_syn_55;  // uart_buffer.v(25)
  wire re_syn_56;  // uart_buffer.v(25)
  wire re_syn_57;  // uart_buffer.v(25)
  wire re_syn_58;  // uart_buffer.v(25)
  wire re_syn_59;  // uart_buffer.v(25)
  wire re_syn_60;  // uart_buffer.v(25)
  wire re_syn_61;  // uart_buffer.v(25)
  wire re_syn_62;  // uart_buffer.v(25)
  wire re_syn_63;  // uart_buffer.v(25)
  wire re_syn_64;  // uart_buffer.v(25)
  wire re_syn_65;  // uart_buffer.v(25)
  wire re_syn_66;  // uart_buffer.v(25)
  wire re_syn_67;  // uart_buffer.v(25)
  wire re_syn_68;  // uart_buffer.v(25)
  wire re_syn_69;  // uart_buffer.v(25)
  wire re_syn_70;  // uart_buffer.v(25)
  wire re_syn_71;  // uart_buffer.v(25)
  wire re_syn_72;  // uart_buffer.v(25)
  wire re_syn_73;  // uart_buffer.v(25)
  wire re_syn_74;  // uart_buffer.v(25)
  wire re_syn_75;  // uart_buffer.v(25)
  wire re_syn_76;  // uart_buffer.v(25)
  wire re_syn_77;  // uart_buffer.v(25)
  wire re_syn_78;  // uart_buffer.v(25)
  wire re_syn_79;  // uart_buffer.v(25)
  wire re_syn_80;  // uart_buffer.v(25)
  wire re_syn_81;  // uart_buffer.v(25)
  wire re_syn_82;  // uart_buffer.v(25)
  wire re_syn_83;  // uart_buffer.v(25)
  wire re_syn_84;  // uart_buffer.v(25)
  wire re_syn_85;  // uart_buffer.v(25)
  wire re_syn_86;  // uart_buffer.v(25)
  wire re_syn_87;  // uart_buffer.v(25)
  wire re_syn_88;  // uart_buffer.v(25)
  wire re_syn_89;  // uart_buffer.v(25)
  wire re_syn_90;  // uart_buffer.v(25)
  wire re_syn_91;  // uart_buffer.v(25)
  wire re_syn_92;  // uart_buffer.v(25)
  wire re_syn_93;  // uart_buffer.v(25)
  wire re_syn_94;  // uart_buffer.v(25)
  wire re_syn_95;  // uart_buffer.v(25)
  wire re_syn_96;  // uart_buffer.v(25)
  wire re_syn_97;  // uart_buffer.v(25)
  wire re_syn_98;  // uart_buffer.v(25)
  wire re_syn_99;  // uart_buffer.v(25)
  wire re_syn_100;  // uart_buffer.v(25)
  wire re_syn_101;  // uart_buffer.v(25)
  wire re_syn_102;  // uart_buffer.v(25)
  wire re_syn_103;  // uart_buffer.v(25)
  wire re_syn_104;  // uart_buffer.v(25)
  wire re_syn_105;  // uart_buffer.v(25)
  wire re_syn_106;  // uart_buffer.v(25)
  wire re_syn_107;  // uart_buffer.v(25)
  wire rst_syn_2;  // uart_buffer.v(22)
  wire rst_syn_4;  // uart_buffer.v(22)
  wire we_syn_2;  // uart_buffer.v(24)
  wire _al_n0_syn_2;
  wire _al_n0_syn_3;
  wire _al_n0_syn_4;
  wire _al_n0_syn_7;
  wire _al_n0_syn_10;
  wire _al_n0_syn_12;
  wire _al_n0_syn_14;
  wire _al_n0_syn_16;
  wire _al_n0_syn_18;
  wire _al_n0_syn_21;
  wire _al_n0_syn_25;
  wire _al_n0_syn_29;
  wire _al_n1_syn_4;
  wire _al_n1_syn_6;
  wire _al_n1_syn_8;
  wire _al_n1_syn_10;
  wire _al_n1_syn_12;
  wire _al_n1_syn_14;
  wire _al_n1_syn_16;
  wire _al_n1_syn_18;
  wire _al_n1_syn_20;
  wire _al_n1_syn_22;
  wire _al_n1_syn_28;
  wire _al_n1_syn_30;
  wire _al_n1_syn_32;
  wire _al_n1_syn_34;
  wire _al_n1_syn_36;
  wire _al_n1_syn_38;
  wire _al_n1_syn_40;
  wire _al_n1_syn_42;
  wire _al_n1_syn_44;
  wire _al_n1_syn_48;
  wire _al_n1_syn_50;
  wire _al_n1_syn_52;
  wire _al_n1_syn_54;
  wire _al_n1_syn_56;
  wire _al_n1_syn_58;
  wire _al_n1_syn_60;
  wire _al_n1_syn_62;
  wire _al_n1_syn_64;

  AL_MAP_LUT3 #(
    .EQN("(A*~B*~C)"),
    .INIT(8'b00000010))
    _al_n0_syn_112 (
    .a(re_syn_3),
    .b(re_syn_4),
    .c(re_syn_5),
    .o(_al_n0_syn_10));
  AL_MAP_LUT3 #(
    .EQN("(~A*B*~C)"),
    .INIT(8'b00000100))
    _al_n0_syn_113 (
    .a(re_syn_3),
    .b(re_syn_4),
    .c(re_syn_5),
    .o(_al_n0_syn_12));
  AL_MAP_LUT3 #(
    .EQN("(A*B*~C)"),
    .INIT(8'b00001000))
    _al_n0_syn_114 (
    .a(re_syn_3),
    .b(re_syn_4),
    .c(re_syn_5),
    .o(_al_n0_syn_14));
  AL_MAP_LUT3 #(
    .EQN("(~A*~B*C)"),
    .INIT(8'b00010000))
    _al_n0_syn_115 (
    .a(re_syn_3),
    .b(re_syn_4),
    .c(re_syn_5),
    .o(_al_n0_syn_16));
  AL_MAP_LUT2 #(
    .EQN("(~A*~B)"),
    .INIT(4'b0001))
    _al_n0_syn_116 (
    .a(logic_ramfifo_syn_175),
    .b(logic_ramfifo_syn_195),
    .o(_al_n0_syn_3));
  AL_MAP_LUT2 #(
    .EQN("(A*~B)"),
    .INIT(4'b0010))
    _al_n0_syn_117 (
    .a(logic_ramfifo_syn_175),
    .b(logic_ramfifo_syn_195),
    .o(_al_n0_syn_4));
  AL_MUX _al_n0_syn_135 (
    .i0(1'b0),
    .i1(1'b0),
    .sel(logic_ramfifo_syn_195),
    .o(_al_n0_syn_2));
  AL_MUX _al_n0_syn_147 (
    .i0(re_syn_17),
    .i1(1'b0),
    .sel(logic_ramfifo_syn_197),
    .o(_al_n0_syn_7));
  AL_MUX _al_n0_syn_152 (
    .i0(re_syn_20),
    .i1(logic_ramfifo_syn_182),
    .sel(_al_n0_syn_18),
    .o(re_syn_36));
  AL_MUX _al_n0_syn_157 (
    .i0(re_syn_21),
    .i1(logic_ramfifo_syn_183),
    .sel(_al_n0_syn_18),
    .o(re_syn_37));
  AL_MUX _al_n0_syn_162 (
    .i0(re_syn_22),
    .i1(logic_ramfifo_syn_184),
    .sel(_al_n0_syn_18),
    .o(re_syn_38));
  AL_MUX _al_n0_syn_167 (
    .i0(re_syn_23),
    .i1(logic_ramfifo_syn_185),
    .sel(_al_n0_syn_18),
    .o(re_syn_39));
  and _al_n0_syn_17 (_al_n0_syn_18, _al_n0_syn_16, re_syn_17);
  AL_MUX _al_n0_syn_172 (
    .i0(re_syn_24),
    .i1(logic_ramfifo_syn_186),
    .sel(_al_n0_syn_18),
    .o(re_syn_40));
  AL_MUX _al_n0_syn_177 (
    .i0(re_syn_25),
    .i1(logic_ramfifo_syn_187),
    .sel(_al_n0_syn_18),
    .o(re_syn_41));
  AL_MUX _al_n0_syn_182 (
    .i0(re_syn_26),
    .i1(logic_ramfifo_syn_188),
    .sel(_al_n0_syn_18),
    .o(re_syn_42));
  AL_MUX _al_n0_syn_187 (
    .i0(re_syn_27),
    .i1(logic_ramfifo_syn_189),
    .sel(_al_n0_syn_18),
    .o(re_syn_43));
  AL_MUX _al_n0_syn_192 (
    .i0(re_syn_36),
    .i1(1'b0),
    .sel(_al_n0_syn_21),
    .o(re_syn_44));
  AL_MUX _al_n0_syn_197 (
    .i0(re_syn_37),
    .i1(1'b0),
    .sel(_al_n0_syn_21),
    .o(re_syn_45));
  and _al_n0_syn_20 (_al_n0_syn_21, _al_n0_syn_16, re_syn_2);
  AL_MUX _al_n0_syn_202 (
    .i0(re_syn_38),
    .i1(1'b0),
    .sel(_al_n0_syn_21),
    .o(re_syn_46));
  AL_MUX _al_n0_syn_207 (
    .i0(re_syn_39),
    .i1(1'b0),
    .sel(_al_n0_syn_21),
    .o(re_syn_47));
  AL_MUX _al_n0_syn_212 (
    .i0(re_syn_40),
    .i1(1'b0),
    .sel(_al_n0_syn_21),
    .o(re_syn_48));
  AL_MUX _al_n0_syn_217 (
    .i0(re_syn_41),
    .i1(1'b0),
    .sel(_al_n0_syn_21),
    .o(re_syn_49));
  AL_MUX _al_n0_syn_222 (
    .i0(re_syn_42),
    .i1(1'b0),
    .sel(_al_n0_syn_21),
    .o(re_syn_50));
  AL_MUX _al_n0_syn_227 (
    .i0(re_syn_43),
    .i1(1'b0),
    .sel(_al_n0_syn_21),
    .o(re_syn_51));
  AL_MUX _al_n0_syn_232 (
    .i0(do[0]),
    .i1(logic_ramfifo_syn_182),
    .sel(_al_n0_syn_21),
    .o(re_syn_52));
  AL_MUX _al_n0_syn_237 (
    .i0(do[1]),
    .i1(logic_ramfifo_syn_183),
    .sel(_al_n0_syn_21),
    .o(re_syn_53));
  and _al_n0_syn_24 (_al_n0_syn_25, _al_n0_syn_14, re_syn_2);
  AL_MUX _al_n0_syn_242 (
    .i0(do[2]),
    .i1(logic_ramfifo_syn_184),
    .sel(_al_n0_syn_21),
    .o(re_syn_54));
  AL_MUX _al_n0_syn_247 (
    .i0(do[3]),
    .i1(logic_ramfifo_syn_185),
    .sel(_al_n0_syn_21),
    .o(re_syn_55));
  AL_MUX _al_n0_syn_252 (
    .i0(do[4]),
    .i1(logic_ramfifo_syn_186),
    .sel(_al_n0_syn_21),
    .o(re_syn_56));
  AL_MUX _al_n0_syn_257 (
    .i0(do[5]),
    .i1(logic_ramfifo_syn_187),
    .sel(_al_n0_syn_21),
    .o(re_syn_57));
  AL_MUX _al_n0_syn_262 (
    .i0(do[6]),
    .i1(logic_ramfifo_syn_188),
    .sel(_al_n0_syn_21),
    .o(re_syn_58));
  AL_MUX _al_n0_syn_267 (
    .i0(do[7]),
    .i1(logic_ramfifo_syn_189),
    .sel(_al_n0_syn_21),
    .o(re_syn_59));
  AL_MUX _al_n0_syn_272 (
    .i0(re_syn_44),
    .i1(logic_ramfifo_syn_182),
    .sel(_al_n0_syn_25),
    .o(re_syn_60));
  AL_MUX _al_n0_syn_277 (
    .i0(re_syn_45),
    .i1(logic_ramfifo_syn_183),
    .sel(_al_n0_syn_25),
    .o(re_syn_61));
  and _al_n0_syn_28 (_al_n0_syn_29, _al_n0_syn_12, logic_ramfifo_syn_175);
  AL_MUX _al_n0_syn_282 (
    .i0(re_syn_46),
    .i1(logic_ramfifo_syn_184),
    .sel(_al_n0_syn_25),
    .o(re_syn_62));
  AL_MUX _al_n0_syn_287 (
    .i0(re_syn_47),
    .i1(logic_ramfifo_syn_185),
    .sel(_al_n0_syn_25),
    .o(re_syn_63));
  AL_MUX _al_n0_syn_292 (
    .i0(re_syn_48),
    .i1(logic_ramfifo_syn_186),
    .sel(_al_n0_syn_25),
    .o(re_syn_64));
  AL_MUX _al_n0_syn_297 (
    .i0(re_syn_49),
    .i1(logic_ramfifo_syn_187),
    .sel(_al_n0_syn_25),
    .o(re_syn_65));
  AL_MUX _al_n0_syn_302 (
    .i0(re_syn_50),
    .i1(logic_ramfifo_syn_188),
    .sel(_al_n0_syn_25),
    .o(re_syn_66));
  AL_MUX _al_n0_syn_307 (
    .i0(re_syn_51),
    .i1(logic_ramfifo_syn_189),
    .sel(_al_n0_syn_25),
    .o(re_syn_67));
  AL_MUX _al_n0_syn_312 (
    .i0(re_syn_52),
    .i1(re_syn_20),
    .sel(_al_n0_syn_25),
    .o(re_syn_68));
  AL_MUX _al_n0_syn_317 (
    .i0(re_syn_53),
    .i1(re_syn_21),
    .sel(_al_n0_syn_25),
    .o(re_syn_69));
  AL_MUX _al_n0_syn_322 (
    .i0(re_syn_54),
    .i1(re_syn_22),
    .sel(_al_n0_syn_25),
    .o(re_syn_70));
  AL_MUX _al_n0_syn_327 (
    .i0(re_syn_55),
    .i1(re_syn_23),
    .sel(_al_n0_syn_25),
    .o(re_syn_71));
  AL_MUX _al_n0_syn_332 (
    .i0(re_syn_56),
    .i1(re_syn_24),
    .sel(_al_n0_syn_25),
    .o(re_syn_72));
  AL_MUX _al_n0_syn_337 (
    .i0(re_syn_57),
    .i1(re_syn_25),
    .sel(_al_n0_syn_25),
    .o(re_syn_73));
  AL_MUX _al_n0_syn_342 (
    .i0(re_syn_58),
    .i1(re_syn_26),
    .sel(_al_n0_syn_25),
    .o(re_syn_74));
  AL_MUX _al_n0_syn_347 (
    .i0(re_syn_59),
    .i1(re_syn_27),
    .sel(_al_n0_syn_25),
    .o(re_syn_75));
  AL_MUX _al_n0_syn_352 (
    .i0(re_syn_60),
    .i1(logic_ramfifo_syn_182),
    .sel(_al_n0_syn_29),
    .o(re_syn_76));
  AL_MUX _al_n0_syn_357 (
    .i0(re_syn_61),
    .i1(logic_ramfifo_syn_183),
    .sel(_al_n0_syn_29),
    .o(re_syn_77));
  AL_MUX _al_n0_syn_362 (
    .i0(re_syn_62),
    .i1(logic_ramfifo_syn_184),
    .sel(_al_n0_syn_29),
    .o(re_syn_78));
  AL_MUX _al_n0_syn_367 (
    .i0(re_syn_63),
    .i1(logic_ramfifo_syn_185),
    .sel(_al_n0_syn_29),
    .o(re_syn_79));
  AL_MUX _al_n0_syn_372 (
    .i0(re_syn_64),
    .i1(logic_ramfifo_syn_186),
    .sel(_al_n0_syn_29),
    .o(re_syn_80));
  AL_MUX _al_n0_syn_377 (
    .i0(re_syn_65),
    .i1(logic_ramfifo_syn_187),
    .sel(_al_n0_syn_29),
    .o(re_syn_81));
  AL_MUX _al_n0_syn_382 (
    .i0(re_syn_66),
    .i1(logic_ramfifo_syn_188),
    .sel(_al_n0_syn_29),
    .o(re_syn_82));
  AL_MUX _al_n0_syn_387 (
    .i0(re_syn_67),
    .i1(logic_ramfifo_syn_189),
    .sel(_al_n0_syn_29),
    .o(re_syn_83));
  AL_MUX _al_n0_syn_392 (
    .i0(re_syn_68),
    .i1(do[0]),
    .sel(_al_n0_syn_29),
    .o(re_syn_84));
  AL_MUX _al_n0_syn_397 (
    .i0(re_syn_69),
    .i1(do[1]),
    .sel(_al_n0_syn_29),
    .o(re_syn_85));
  AL_MUX _al_n0_syn_402 (
    .i0(re_syn_70),
    .i1(do[2]),
    .sel(_al_n0_syn_29),
    .o(re_syn_86));
  AL_MUX _al_n0_syn_407 (
    .i0(re_syn_71),
    .i1(do[3]),
    .sel(_al_n0_syn_29),
    .o(re_syn_87));
  AL_MUX _al_n0_syn_412 (
    .i0(re_syn_72),
    .i1(do[4]),
    .sel(_al_n0_syn_29),
    .o(re_syn_88));
  AL_MUX _al_n0_syn_417 (
    .i0(re_syn_73),
    .i1(do[5]),
    .sel(_al_n0_syn_29),
    .o(re_syn_89));
  AL_MUX _al_n0_syn_422 (
    .i0(re_syn_74),
    .i1(do[6]),
    .sel(_al_n0_syn_29),
    .o(re_syn_90));
  AL_MUX _al_n0_syn_427 (
    .i0(re_syn_75),
    .i1(do[7]),
    .sel(_al_n0_syn_29),
    .o(re_syn_91));
  AL_MUX _al_n0_syn_432 (
    .i0(re_syn_76),
    .i1(1'b0),
    .sel(_al_n0_syn_10),
    .o(re_syn_92));
  AL_MUX _al_n0_syn_437 (
    .i0(re_syn_77),
    .i1(1'b0),
    .sel(_al_n0_syn_10),
    .o(re_syn_93));
  AL_MUX _al_n0_syn_442 (
    .i0(re_syn_78),
    .i1(1'b0),
    .sel(_al_n0_syn_10),
    .o(re_syn_94));
  AL_MUX _al_n0_syn_447 (
    .i0(re_syn_79),
    .i1(1'b0),
    .sel(_al_n0_syn_10),
    .o(re_syn_95));
  AL_MUX _al_n0_syn_452 (
    .i0(re_syn_80),
    .i1(1'b0),
    .sel(_al_n0_syn_10),
    .o(re_syn_96));
  AL_MUX _al_n0_syn_457 (
    .i0(re_syn_81),
    .i1(1'b0),
    .sel(_al_n0_syn_10),
    .o(re_syn_97));
  AL_MUX _al_n0_syn_462 (
    .i0(re_syn_82),
    .i1(1'b0),
    .sel(_al_n0_syn_10),
    .o(re_syn_98));
  AL_MUX _al_n0_syn_467 (
    .i0(re_syn_83),
    .i1(1'b0),
    .sel(_al_n0_syn_10),
    .o(re_syn_99));
  AL_MUX _al_n0_syn_472 (
    .i0(re_syn_84),
    .i1(logic_ramfifo_syn_182),
    .sel(_al_n0_syn_10),
    .o(re_syn_100));
  AL_MUX _al_n0_syn_477 (
    .i0(re_syn_85),
    .i1(logic_ramfifo_syn_183),
    .sel(_al_n0_syn_10),
    .o(re_syn_101));
  AL_MUX _al_n0_syn_482 (
    .i0(re_syn_86),
    .i1(logic_ramfifo_syn_184),
    .sel(_al_n0_syn_10),
    .o(re_syn_102));
  AL_MUX _al_n0_syn_487 (
    .i0(re_syn_87),
    .i1(logic_ramfifo_syn_185),
    .sel(_al_n0_syn_10),
    .o(re_syn_103));
  AL_MUX _al_n0_syn_492 (
    .i0(re_syn_88),
    .i1(logic_ramfifo_syn_186),
    .sel(_al_n0_syn_10),
    .o(re_syn_104));
  AL_MUX _al_n0_syn_497 (
    .i0(re_syn_89),
    .i1(logic_ramfifo_syn_187),
    .sel(_al_n0_syn_10),
    .o(re_syn_105));
  AL_MUX _al_n0_syn_502 (
    .i0(re_syn_90),
    .i1(logic_ramfifo_syn_188),
    .sel(_al_n0_syn_10),
    .o(re_syn_106));
  AL_MUX _al_n0_syn_507 (
    .i0(re_syn_91),
    .i1(logic_ramfifo_syn_189),
    .sel(_al_n0_syn_10),
    .o(re_syn_107));
  and _al_n1_syn_11 (_al_n1_syn_12, _al_n1_syn_10, clk_syn_26);
  and _al_n1_syn_13 (_al_n1_syn_14, _al_n1_syn_12, clk_syn_28);
  and _al_n1_syn_15 (_al_n1_syn_16, _al_n1_syn_14, clk_syn_30);
  and _al_n1_syn_17 (_al_n1_syn_18, _al_n1_syn_16, clk_syn_32);
  and _al_n1_syn_19 (_al_n1_syn_20, _al_n1_syn_18, clk_syn_34);
  AL_DFF_X _al_n1_syn_24 (
    .ar(1'b0),
    .as(rst_syn_4),
    .clk(clk),
    .d(_al_n1_syn_22),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_141));
  and _al_n1_syn_27 (_al_n1_syn_28, clk_syn_109, clk_syn_111);
  and _al_n1_syn_29 (_al_n1_syn_30, _al_n1_syn_28, clk_syn_113);
  and _al_n1_syn_3 (_al_n1_syn_4, clk_syn_16, clk_syn_18);
  and _al_n1_syn_31 (_al_n1_syn_32, _al_n1_syn_30, clk_syn_115);
  and _al_n1_syn_33 (_al_n1_syn_34, _al_n1_syn_32, clk_syn_117);
  and _al_n1_syn_35 (_al_n1_syn_36, _al_n1_syn_34, clk_syn_119);
  and _al_n1_syn_37 (_al_n1_syn_38, _al_n1_syn_36, clk_syn_121);
  and _al_n1_syn_39 (_al_n1_syn_40, _al_n1_syn_38, clk_syn_123);
  and _al_n1_syn_41 (_al_n1_syn_42, _al_n1_syn_40, clk_syn_125);
  and _al_n1_syn_43 (_al_n1_syn_44, _al_n1_syn_42, clk_syn_127);
  and _al_n1_syn_47 (_al_n1_syn_48, clk_syn_202, clk_syn_204);
  and _al_n1_syn_49 (_al_n1_syn_50, _al_n1_syn_48, clk_syn_206);
  and _al_n1_syn_5 (_al_n1_syn_6, _al_n1_syn_4, clk_syn_20);
  and _al_n1_syn_51 (_al_n1_syn_52, _al_n1_syn_50, clk_syn_208);
  and _al_n1_syn_53 (_al_n1_syn_54, _al_n1_syn_52, clk_syn_210);
  and _al_n1_syn_55 (_al_n1_syn_56, _al_n1_syn_54, clk_syn_212);
  and _al_n1_syn_57 (_al_n1_syn_58, _al_n1_syn_56, clk_syn_214);
  and _al_n1_syn_59 (_al_n1_syn_60, _al_n1_syn_58, clk_syn_216);
  and _al_n1_syn_61 (_al_n1_syn_62, _al_n1_syn_60, clk_syn_218);
  and _al_n1_syn_63 (_al_n1_syn_64, _al_n1_syn_62, clk_syn_220);
  AL_MUX _al_n1_syn_69 (
    .i0(_al_n1_syn_76),
    .i1(_al_n1_syn_77),
    .sel(re_syn_5),
    .o(_al_n1_syn_22));
  and _al_n1_syn_7 (_al_n1_syn_8, _al_n1_syn_6, clk_syn_22);
  AL_MUX _al_n1_syn_70 (
    .i0(_al_n1_syn_78),
    .i1(_al_n1_syn_79),
    .sel(re_syn_4),
    .o(_al_n1_syn_76));
  AL_MUX _al_n1_syn_71 (
    .i0(1'b0),
    .i1(1'b0),
    .sel(re_syn_4),
    .o(_al_n1_syn_77));
  AL_MUX _al_n1_syn_72 (
    .i0(1'b1),
    .i1(logic_ramfifo_syn_195),
    .sel(re_syn_3),
    .o(_al_n1_syn_78));
  AL_MUX _al_n1_syn_73 (
    .i0(re_syn_2),
    .i1(1'b0),
    .sel(re_syn_3),
    .o(_al_n1_syn_79));
  and _al_n1_syn_9 (_al_n1_syn_10, _al_n1_syn_8, clk_syn_24);
  or clk_syn_106 (clk_syn_107, clk_syn_105, clk_syn_104);  // uart_buffer.v(24)
  not clk_syn_108 (clk_syn_109, clk_syn_94);  // uart_buffer.v(24)
  not clk_syn_110 (clk_syn_111, clk_syn_95);  // uart_buffer.v(24)
  not clk_syn_112 (clk_syn_113, clk_syn_96);  // uart_buffer.v(24)
  not clk_syn_114 (clk_syn_115, clk_syn_97);  // uart_buffer.v(24)
  not clk_syn_116 (clk_syn_117, clk_syn_98);  // uart_buffer.v(24)
  not clk_syn_118 (clk_syn_119, clk_syn_99);  // uart_buffer.v(24)
  not clk_syn_120 (clk_syn_121, clk_syn_100);  // uart_buffer.v(24)
  not clk_syn_122 (clk_syn_123, clk_syn_101);  // uart_buffer.v(24)
  not clk_syn_124 (clk_syn_125, clk_syn_102);  // uart_buffer.v(24)
  not clk_syn_126 (clk_syn_127, clk_syn_103);  // uart_buffer.v(24)
  or clk_syn_13 (clk_syn_14, clk_syn_12, clk_syn_11);  // uart_buffer.v(24)
  xor clk_syn_132 (clk_syn_133, clk_syn_95, clk_syn_94);  // uart_buffer.v(24)
  and clk_syn_134 (clk_syn_135, clk_syn_95, clk_syn_109);  // uart_buffer.v(24)
  xor clk_syn_136 (clk_syn_137, clk_syn_96, clk_syn_135);  // uart_buffer.v(24)
  and clk_syn_138 (clk_syn_139, clk_syn_96, _al_n1_syn_28);  // uart_buffer.v(24)
  xor clk_syn_140 (clk_syn_141, clk_syn_97, clk_syn_139);  // uart_buffer.v(24)
  and clk_syn_142 (clk_syn_143, clk_syn_97, _al_n1_syn_30);  // uart_buffer.v(24)
  xor clk_syn_144 (clk_syn_145, clk_syn_98, clk_syn_143);  // uart_buffer.v(24)
  and clk_syn_146 (clk_syn_147, clk_syn_98, _al_n1_syn_32);  // uart_buffer.v(24)
  xor clk_syn_148 (clk_syn_149, clk_syn_99, clk_syn_147);  // uart_buffer.v(24)
  not clk_syn_15 (clk_syn_16, clk_syn_1);  // uart_buffer.v(24)
  and clk_syn_150 (clk_syn_151, clk_syn_99, _al_n1_syn_34);  // uart_buffer.v(24)
  xor clk_syn_152 (clk_syn_153, clk_syn_100, clk_syn_151);  // uart_buffer.v(24)
  and clk_syn_154 (clk_syn_155, clk_syn_100, _al_n1_syn_36);  // uart_buffer.v(24)
  xor clk_syn_156 (clk_syn_157, clk_syn_101, clk_syn_155);  // uart_buffer.v(24)
  and clk_syn_158 (clk_syn_159, clk_syn_101, _al_n1_syn_38);  // uart_buffer.v(24)
  xor clk_syn_160 (clk_syn_161, clk_syn_102, clk_syn_159);  // uart_buffer.v(24)
  and clk_syn_162 (clk_syn_163, clk_syn_102, _al_n1_syn_40);  // uart_buffer.v(24)
  xor clk_syn_164 (clk_syn_165, clk_syn_103, clk_syn_163);  // uart_buffer.v(24)
  and clk_syn_166 (clk_syn_167, clk_syn_103, _al_n1_syn_42);  // uart_buffer.v(24)
  xor clk_syn_168 (clk_syn_169, clk_syn_104, clk_syn_167);  // uart_buffer.v(24)
  not clk_syn_17 (clk_syn_18, clk_syn_2);  // uart_buffer.v(24)
  and clk_syn_170 (clk_syn_171, clk_syn_107, _al_n1_syn_44);  // uart_buffer.v(24)
  xor clk_syn_172 (clk_syn_173, clk_syn_105, clk_syn_171);  // uart_buffer.v(24)
  not clk_syn_19 (clk_syn_20, clk_syn_3);  // uart_buffer.v(24)
  or clk_syn_199 (clk_syn_200, clk_syn_198, clk_syn_197);  // uart_buffer.v(24)
  not clk_syn_201 (clk_syn_202, clk_syn_187);  // uart_buffer.v(24)
  not clk_syn_203 (clk_syn_204, clk_syn_188);  // uart_buffer.v(24)
  not clk_syn_205 (clk_syn_206, clk_syn_189);  // uart_buffer.v(24)
  not clk_syn_207 (clk_syn_208, clk_syn_190);  // uart_buffer.v(24)
  not clk_syn_209 (clk_syn_210, clk_syn_191);  // uart_buffer.v(24)
  not clk_syn_21 (clk_syn_22, clk_syn_4);  // uart_buffer.v(24)
  not clk_syn_211 (clk_syn_212, clk_syn_192);  // uart_buffer.v(24)
  not clk_syn_213 (clk_syn_214, clk_syn_193);  // uart_buffer.v(24)
  not clk_syn_215 (clk_syn_216, clk_syn_194);  // uart_buffer.v(24)
  not clk_syn_217 (clk_syn_218, clk_syn_195);  // uart_buffer.v(24)
  not clk_syn_219 (clk_syn_220, clk_syn_196);  // uart_buffer.v(24)
  xor clk_syn_225 (clk_syn_226, clk_syn_188, clk_syn_187);  // uart_buffer.v(24)
  and clk_syn_227 (clk_syn_228, clk_syn_188, clk_syn_202);  // uart_buffer.v(24)
  xor clk_syn_229 (clk_syn_230, clk_syn_189, clk_syn_228);  // uart_buffer.v(24)
  not clk_syn_23 (clk_syn_24, clk_syn_5);  // uart_buffer.v(24)
  and clk_syn_231 (clk_syn_232, clk_syn_189, _al_n1_syn_48);  // uart_buffer.v(24)
  xor clk_syn_233 (clk_syn_234, clk_syn_190, clk_syn_232);  // uart_buffer.v(24)
  and clk_syn_235 (clk_syn_236, clk_syn_190, _al_n1_syn_50);  // uart_buffer.v(24)
  xor clk_syn_237 (clk_syn_238, clk_syn_191, clk_syn_236);  // uart_buffer.v(24)
  and clk_syn_239 (clk_syn_240, clk_syn_191, _al_n1_syn_52);  // uart_buffer.v(24)
  xor clk_syn_241 (clk_syn_242, clk_syn_192, clk_syn_240);  // uart_buffer.v(24)
  and clk_syn_243 (clk_syn_244, clk_syn_192, _al_n1_syn_54);  // uart_buffer.v(24)
  xor clk_syn_245 (clk_syn_246, clk_syn_193, clk_syn_244);  // uart_buffer.v(24)
  and clk_syn_247 (clk_syn_248, clk_syn_193, _al_n1_syn_56);  // uart_buffer.v(24)
  xor clk_syn_249 (clk_syn_250, clk_syn_194, clk_syn_248);  // uart_buffer.v(24)
  not clk_syn_25 (clk_syn_26, clk_syn_6);  // uart_buffer.v(24)
  and clk_syn_251 (clk_syn_252, clk_syn_194, _al_n1_syn_58);  // uart_buffer.v(24)
  xor clk_syn_253 (clk_syn_254, clk_syn_195, clk_syn_252);  // uart_buffer.v(24)
  and clk_syn_255 (clk_syn_256, clk_syn_195, _al_n1_syn_60);  // uart_buffer.v(24)
  xor clk_syn_257 (clk_syn_258, clk_syn_196, clk_syn_256);  // uart_buffer.v(24)
  and clk_syn_259 (clk_syn_260, clk_syn_196, _al_n1_syn_62);  // uart_buffer.v(24)
  xor clk_syn_261 (clk_syn_262, clk_syn_197, clk_syn_260);  // uart_buffer.v(24)
  and clk_syn_263 (clk_syn_264, clk_syn_200, _al_n1_syn_64);  // uart_buffer.v(24)
  xor clk_syn_265 (clk_syn_266, clk_syn_198, clk_syn_264);  // uart_buffer.v(24)
  not clk_syn_27 (clk_syn_28, clk_syn_7);  // uart_buffer.v(24)
  AL_DFF_X clk_syn_280 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_81),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_1));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_281 (
    .ar(1'b0),
    .as(rst),
    .clk(clk),
    .d(clk_syn_82),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_2));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_282 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_83),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_3));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_283 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_84),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_4));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_284 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_85),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_5));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_285 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_86),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_6));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_286 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_87),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_7));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_287 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_88),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_8));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_288 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_89),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_9));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_289 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_90),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_10));  // uart_buffer.v(24)
  not clk_syn_29 (clk_syn_30, clk_syn_8);  // uart_buffer.v(24)
  AL_DFF_X clk_syn_290 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_91),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_11));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_291 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_92),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_12));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_292 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_174),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_94));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_293 (
    .ar(1'b0),
    .as(rst),
    .clk(clk),
    .d(clk_syn_175),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_95));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_294 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_176),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_96));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_295 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_177),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_97));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_296 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_178),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_98));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_297 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_179),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_99));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_298 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_180),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_100));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_299 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_181),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_101));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_300 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_182),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_102));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_301 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_183),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_103));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_302 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_184),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_104));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_303 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_185),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_105));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_304 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_267),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_187));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_305 (
    .ar(1'b0),
    .as(rst),
    .clk(clk),
    .d(clk_syn_268),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_188));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_306 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_269),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_189));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_307 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_270),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_190));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_308 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_271),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_191));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_309 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_272),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_192));  // uart_buffer.v(24)
  not clk_syn_31 (clk_syn_32, clk_syn_9);  // uart_buffer.v(24)
  AL_DFF_X clk_syn_310 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_273),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_193));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_311 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_274),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_194));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_312 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_275),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_195));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_313 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_276),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_196));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_314 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_277),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_197));  // uart_buffer.v(24)
  AL_DFF_X clk_syn_315 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(clk_syn_278),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(clk_syn_198));  // uart_buffer.v(24)
  not clk_syn_33 (clk_syn_34, clk_syn_10);  // uart_buffer.v(24)
  xor clk_syn_39 (clk_syn_40, clk_syn_2, clk_syn_1);  // uart_buffer.v(24)
  and clk_syn_41 (clk_syn_42, clk_syn_2, clk_syn_16);  // uart_buffer.v(24)
  xor clk_syn_43 (clk_syn_44, clk_syn_3, clk_syn_42);  // uart_buffer.v(24)
  and clk_syn_45 (clk_syn_46, clk_syn_3, _al_n1_syn_4);  // uart_buffer.v(24)
  xor clk_syn_47 (clk_syn_48, clk_syn_4, clk_syn_46);  // uart_buffer.v(24)
  and clk_syn_49 (clk_syn_50, clk_syn_4, _al_n1_syn_6);  // uart_buffer.v(24)
  xor clk_syn_51 (clk_syn_52, clk_syn_5, clk_syn_50);  // uart_buffer.v(24)
  and clk_syn_53 (clk_syn_54, clk_syn_5, _al_n1_syn_8);  // uart_buffer.v(24)
  xor clk_syn_55 (clk_syn_56, clk_syn_6, clk_syn_54);  // uart_buffer.v(24)
  and clk_syn_57 (clk_syn_58, clk_syn_6, _al_n1_syn_10);  // uart_buffer.v(24)
  xor clk_syn_59 (clk_syn_60, clk_syn_7, clk_syn_58);  // uart_buffer.v(24)
  and clk_syn_61 (clk_syn_62, clk_syn_7, _al_n1_syn_12);  // uart_buffer.v(24)
  xor clk_syn_63 (clk_syn_64, clk_syn_8, clk_syn_62);  // uart_buffer.v(24)
  and clk_syn_65 (clk_syn_66, clk_syn_8, _al_n1_syn_14);  // uart_buffer.v(24)
  xor clk_syn_67 (clk_syn_68, clk_syn_9, clk_syn_66);  // uart_buffer.v(24)
  and clk_syn_69 (clk_syn_70, clk_syn_9, _al_n1_syn_16);  // uart_buffer.v(24)
  xor clk_syn_71 (clk_syn_72, clk_syn_10, clk_syn_70);  // uart_buffer.v(24)
  and clk_syn_73 (clk_syn_74, clk_syn_10, _al_n1_syn_18);  // uart_buffer.v(24)
  xor clk_syn_75 (clk_syn_76, clk_syn_11, clk_syn_74);  // uart_buffer.v(24)
  and clk_syn_77 (clk_syn_78, clk_syn_14, _al_n1_syn_20);  // uart_buffer.v(24)
  xor clk_syn_79 (clk_syn_80, clk_syn_12, clk_syn_78);  // uart_buffer.v(24)
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  AL_MUX logic_ramfifo_syn_1003 (
    .i0(logic_ramfifo_syn_42),
    .i1(clk_syn_196),
    .sel(logic_ramfifo_syn_177),
    .o(logic_ramfifo_syn_233));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_1008 (
    .i0(logic_ramfifo_syn_43),
    .i1(clk_syn_197),
    .sel(logic_ramfifo_syn_177),
    .o(logic_ramfifo_syn_234));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_1013 (
    .i0(logic_ramfifo_syn_44),
    .i1(clk_syn_198),
    .sel(logic_ramfifo_syn_177),
    .o(logic_ramfifo_syn_235));  // uart_buffer.v(39)
  not logic_ramfifo_syn_143 (logic_ramfifo_syn_144, logic_ramfifo_syn_54);  // uart_buffer.v(39)
  not logic_ramfifo_syn_145 (logic_ramfifo_syn_146, logic_ramfifo_syn_55);  // uart_buffer.v(39)
  not logic_ramfifo_syn_149 (logic_ramfifo_syn_150, full_flag);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_166 (logic_ramfifo_syn_167, logic_ramfifo_syn_11, logic_ramfifo_syn_10);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_170 (logic_ramfifo_syn_171, logic_ramfifo_syn_44, logic_ramfifo_syn_43);  // uart_buffer.v(39)
  not logic_ramfifo_syn_174 (logic_ramfifo_syn_175, logic_ramfifo_syn_173);  // uart_buffer.v(39)
  and logic_ramfifo_syn_176 (logic_ramfifo_syn_177, logic_ramfifo_syn_142, logic_ramfifo_syn_175);  // uart_buffer.v(39)
  or logic_ramfifo_syn_180 (empty_flag, logic_ramfifo_syn_179, logic_ramfifo_syn_141);  // uart_buffer.v(39)
  not logic_ramfifo_syn_190 (logic_ramfifo_syn_191, empty_flag);  // uart_buffer.v(39)
  not logic_ramfifo_syn_192 (logic_ramfifo_syn_193, logic_ramfifo_syn_175);  // uart_buffer.v(39)
  and logic_ramfifo_syn_194 (logic_ramfifo_syn_195, logic_ramfifo_syn_193, re_syn_2);  // uart_buffer.v(39)
  and logic_ramfifo_syn_196 (logic_ramfifo_syn_197, logic_ramfifo_syn_175, re_syn_17);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_238 (logic_ramfifo_syn_239, logic_ramfifo_syn_55, logic_ramfifo_syn_54);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_240 (logic_ramfifo_syn_241, logic_ramfifo_syn_239, logic_ramfifo_syn_53);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_242 (logic_ramfifo_syn_243, logic_ramfifo_syn_241, logic_ramfifo_syn_52);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_244 (logic_ramfifo_syn_245, logic_ramfifo_syn_243, logic_ramfifo_syn_51);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_246 (logic_ramfifo_syn_247, logic_ramfifo_syn_245, logic_ramfifo_syn_50);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_248 (logic_ramfifo_syn_249, logic_ramfifo_syn_247, logic_ramfifo_syn_49);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_250 (logic_ramfifo_syn_251, logic_ramfifo_syn_249, logic_ramfifo_syn_48);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_252 (logic_ramfifo_syn_253, logic_ramfifo_syn_251, logic_ramfifo_syn_47);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_254 (logic_ramfifo_syn_255, logic_ramfifo_syn_253, logic_ramfifo_syn_46);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_256 (logic_ramfifo_syn_257, logic_ramfifo_syn_255, logic_ramfifo_syn_45);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_261 (logic_ramfifo_syn_262, logic_ramfifo_syn_167, logic_ramfifo_syn_9);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_263 (logic_ramfifo_syn_264, logic_ramfifo_syn_262, logic_ramfifo_syn_8);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_265 (logic_ramfifo_syn_266, logic_ramfifo_syn_264, logic_ramfifo_syn_7);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_267 (logic_ramfifo_syn_268, logic_ramfifo_syn_266, logic_ramfifo_syn_6);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_269 (logic_ramfifo_syn_270, logic_ramfifo_syn_268, logic_ramfifo_syn_5);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_271 (logic_ramfifo_syn_272, logic_ramfifo_syn_270, logic_ramfifo_syn_4);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_273 (logic_ramfifo_syn_274, logic_ramfifo_syn_272, logic_ramfifo_syn_3);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_275 (logic_ramfifo_syn_276, logic_ramfifo_syn_274, logic_ramfifo_syn_2);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_277 (logic_ramfifo_syn_278, logic_ramfifo_syn_276, logic_ramfifo_syn_1);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_281 (logic_ramfifo_syn_282, logic_ramfifo_syn_88, logic_ramfifo_syn_87);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_283 (logic_ramfifo_syn_284, logic_ramfifo_syn_282, logic_ramfifo_syn_86);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_285 (logic_ramfifo_syn_286, logic_ramfifo_syn_284, logic_ramfifo_syn_85);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_287 (logic_ramfifo_syn_288, logic_ramfifo_syn_286, logic_ramfifo_syn_84);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_289 (logic_ramfifo_syn_290, logic_ramfifo_syn_288, logic_ramfifo_syn_83);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_291 (logic_ramfifo_syn_292, logic_ramfifo_syn_290, logic_ramfifo_syn_82);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_293 (logic_ramfifo_syn_294, logic_ramfifo_syn_292, logic_ramfifo_syn_81);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_295 (logic_ramfifo_syn_296, logic_ramfifo_syn_294, logic_ramfifo_syn_80);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_297 (logic_ramfifo_syn_298, logic_ramfifo_syn_296, logic_ramfifo_syn_79);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_299 (logic_ramfifo_syn_300, logic_ramfifo_syn_298, logic_ramfifo_syn_78);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_302 (logic_ramfifo_syn_303, logic_ramfifo_syn_33, logic_ramfifo_syn_32);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_304 (logic_ramfifo_syn_305, logic_ramfifo_syn_303, logic_ramfifo_syn_31);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_306 (logic_ramfifo_syn_307, logic_ramfifo_syn_305, logic_ramfifo_syn_30);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_308 (logic_ramfifo_syn_309, logic_ramfifo_syn_307, logic_ramfifo_syn_29);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_310 (logic_ramfifo_syn_311, logic_ramfifo_syn_309, logic_ramfifo_syn_28);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_312 (logic_ramfifo_syn_313, logic_ramfifo_syn_311, logic_ramfifo_syn_27);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_314 (logic_ramfifo_syn_315, logic_ramfifo_syn_313, logic_ramfifo_syn_26);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_316 (logic_ramfifo_syn_317, logic_ramfifo_syn_315, logic_ramfifo_syn_25);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_318 (logic_ramfifo_syn_319, logic_ramfifo_syn_317, logic_ramfifo_syn_24);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_320 (logic_ramfifo_syn_321, logic_ramfifo_syn_319, logic_ramfifo_syn_23);  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_350 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_151),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_1));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_351 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_152),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_2));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_352 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_153),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_3));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_353 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_154),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_4));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_354 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_155),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_5));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_355 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_156),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_6));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_356 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_157),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_7));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_357 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_158),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_8));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_358 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_159),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_9));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_359 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_160),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_10));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_360 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_161),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_11));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_361 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_1),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_12));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_362 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_2),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_13));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_363 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_3),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_14));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_364 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_4),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_15));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_365 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_5),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_16));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_366 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_6),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_17));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_367 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_7),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_18));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_368 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_8),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_19));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_369 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_9),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_20));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_370 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_10),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_21));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_371 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_11),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_22));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_372 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_199),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(re_syn_3));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_373 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_200),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(re_syn_4));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_374 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_201),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(re_syn_5));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_375 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_211),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_23));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_376 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_212),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_24));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_377 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_213),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_25));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_378 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_214),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_26));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_379 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_215),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_27));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_380 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_216),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_28));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_381 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_217),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_29));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_382 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_218),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_30));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_383 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_219),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_31));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_384 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_220),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_32));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_385 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_221),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_33));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_386 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_225),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_34));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_387 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_226),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_35));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_388 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_227),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_36));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_389 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_228),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_37));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_390 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_229),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_38));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_391 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_230),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_39));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_392 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_231),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_40));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_393 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_232),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_41));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_394 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_233),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_42));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_395 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_234),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_43));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_396 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_235),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_44));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_397 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_23),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_45));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_398 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_24),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_46));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_399 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_25),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_47));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_400 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_26),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_48));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_401 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_27),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_49));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_402 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_28),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_50));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_403 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_29),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_51));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_404 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_30),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_52));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_405 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_31),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_53));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_406 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_32),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_54));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_407 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_33),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_55));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_408 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_257),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_56));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_409 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_255),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_57));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_410 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_253),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_58));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_411 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_251),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_59));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_412 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_249),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_60));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_413 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_247),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_61));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_414 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_245),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_62));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_415 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_243),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_63));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_416 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_241),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_64));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_417 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_239),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_65));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_418 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_55),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_66));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_419 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_278),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_67));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_420 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_276),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_68));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_421 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_274),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_69));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_422 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_272),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_70));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_423 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_270),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_71));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_424 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_268),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_72));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_425 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_266),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_73));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_426 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_264),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_74));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_427 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_262),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_75));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_428 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_167),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_76));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_430 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_12),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_78));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_431 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_13),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_79));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_432 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_14),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_80));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_433 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_15),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_81));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_434 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_16),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_82));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_435 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_17),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_83));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_436 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_18),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_84));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_437 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_19),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_85));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_438 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_20),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_86));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_439 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_21),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_87));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_440 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_22),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_88));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_441 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_300),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_89));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_442 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_298),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_90));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_443 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_296),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_91));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_444 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_294),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_92));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_445 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_292),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_93));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_446 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_290),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_94));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_447 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_288),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_95));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_448 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_286),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_96));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_449 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_284),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_97));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_450 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_282),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_98));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_451 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_88),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_99));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_452 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_321),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_100));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_453 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_319),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_101));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_454 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_317),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_102));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_455 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_315),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_103));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_456 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_313),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_104));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_457 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_311),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_105));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_458 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_309),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_106));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_459 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_307),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_107));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_460 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_305),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_108));  // uart_buffer.v(39)
  AL_DFF_X logic_ramfifo_syn_461 (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(logic_ramfifo_syn_303),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(logic_ramfifo_syn_109));  // uart_buffer.v(39)
  // address_offset=0;data_offset=0;depth=1024;width=8;num_section=1;width_per_section=8;section_size=8;working_depth=1024;working_width=9;working_numbyte=1;mode_ecc=0;address_step=1;bytes_in_per_section=1;
  // logic_ramfifo_syn_323_1024x8
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CSA0("1"),
    .CSA1("1"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("DP8K"),
    .OCEAMUX("1"),
    .OCEBMUX("1"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    logic_ramfifo_syn_463 (
    .addra({logic_ramfifo_syn_167,logic_ramfifo_syn_9,logic_ramfifo_syn_8,logic_ramfifo_syn_7,logic_ramfifo_syn_6,logic_ramfifo_syn_5,logic_ramfifo_syn_4,logic_ramfifo_syn_3,logic_ramfifo_syn_2,logic_ramfifo_syn_1,3'b111}),
    .addrb({logic_ramfifo_syn_171,logic_ramfifo_syn_42,logic_ramfifo_syn_41,logic_ramfifo_syn_40,logic_ramfifo_syn_39,logic_ramfifo_syn_38,logic_ramfifo_syn_37,logic_ramfifo_syn_36,logic_ramfifo_syn_35,logic_ramfifo_syn_34,3'b111}),
    .ceb(logic_ramfifo_syn_177),
    .clka(clk),
    .clkb(clk),
    .dia({open_n54,di}),
    .rsta(rst),
    .rstb(rst),
    .wea(we_syn_2),
    .dob({open_n76,logic_ramfifo_syn_189,logic_ramfifo_syn_188,logic_ramfifo_syn_187,logic_ramfifo_syn_186,logic_ramfifo_syn_185,logic_ramfifo_syn_184,logic_ramfifo_syn_183,logic_ramfifo_syn_182}));  // uart_buffer.v(39)
  not logic_ramfifo_syn_472 (full_flag, logic_ramfifo_syn_537);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_473 (logic_ramfifo_syn_517, logic_ramfifo_syn_1, logic_ramfifo_syn_45);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_474 (logic_ramfifo_syn_518, logic_ramfifo_syn_2, logic_ramfifo_syn_46);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_475 (logic_ramfifo_syn_519, logic_ramfifo_syn_3, logic_ramfifo_syn_47);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_476 (logic_ramfifo_syn_520, logic_ramfifo_syn_4, logic_ramfifo_syn_48);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_477 (logic_ramfifo_syn_521, logic_ramfifo_syn_5, logic_ramfifo_syn_49);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_478 (logic_ramfifo_syn_522, logic_ramfifo_syn_6, logic_ramfifo_syn_50);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_479 (logic_ramfifo_syn_523, logic_ramfifo_syn_7, logic_ramfifo_syn_51);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_480 (logic_ramfifo_syn_524, logic_ramfifo_syn_8, logic_ramfifo_syn_52);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_481 (logic_ramfifo_syn_525, logic_ramfifo_syn_9, logic_ramfifo_syn_53);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_482 (logic_ramfifo_syn_526, logic_ramfifo_syn_10, logic_ramfifo_syn_144);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_483 (logic_ramfifo_syn_527, logic_ramfifo_syn_11, logic_ramfifo_syn_146);  // uart_buffer.v(39)
  or logic_ramfifo_syn_484 (logic_ramfifo_syn_528, logic_ramfifo_syn_517, logic_ramfifo_syn_518);  // uart_buffer.v(39)
  or logic_ramfifo_syn_485 (logic_ramfifo_syn_529, logic_ramfifo_syn_520, logic_ramfifo_syn_521);  // uart_buffer.v(39)
  or logic_ramfifo_syn_486 (logic_ramfifo_syn_530, logic_ramfifo_syn_519, logic_ramfifo_syn_529);  // uart_buffer.v(39)
  or logic_ramfifo_syn_487 (logic_ramfifo_syn_531, logic_ramfifo_syn_528, logic_ramfifo_syn_530);  // uart_buffer.v(39)
  or logic_ramfifo_syn_488 (logic_ramfifo_syn_532, logic_ramfifo_syn_523, logic_ramfifo_syn_524);  // uart_buffer.v(39)
  or logic_ramfifo_syn_489 (logic_ramfifo_syn_533, logic_ramfifo_syn_522, logic_ramfifo_syn_532);  // uart_buffer.v(39)
  or logic_ramfifo_syn_490 (logic_ramfifo_syn_534, logic_ramfifo_syn_526, logic_ramfifo_syn_527);  // uart_buffer.v(39)
  or logic_ramfifo_syn_491 (logic_ramfifo_syn_535, logic_ramfifo_syn_525, logic_ramfifo_syn_534);  // uart_buffer.v(39)
  or logic_ramfifo_syn_492 (logic_ramfifo_syn_536, logic_ramfifo_syn_533, logic_ramfifo_syn_535);  // uart_buffer.v(39)
  or logic_ramfifo_syn_493 (logic_ramfifo_syn_537, logic_ramfifo_syn_531, logic_ramfifo_syn_536);  // uart_buffer.v(39)
  not logic_ramfifo_syn_538 (logic_ramfifo_syn_173, logic_ramfifo_syn_603);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_539 (logic_ramfifo_syn_583, logic_ramfifo_syn_78, logic_ramfifo_syn_34);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_540 (logic_ramfifo_syn_584, logic_ramfifo_syn_79, logic_ramfifo_syn_35);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_541 (logic_ramfifo_syn_585, logic_ramfifo_syn_80, logic_ramfifo_syn_36);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_542 (logic_ramfifo_syn_586, logic_ramfifo_syn_81, logic_ramfifo_syn_37);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_543 (logic_ramfifo_syn_587, logic_ramfifo_syn_82, logic_ramfifo_syn_38);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_544 (logic_ramfifo_syn_588, logic_ramfifo_syn_83, logic_ramfifo_syn_39);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_545 (logic_ramfifo_syn_589, logic_ramfifo_syn_84, logic_ramfifo_syn_40);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_546 (logic_ramfifo_syn_590, logic_ramfifo_syn_85, logic_ramfifo_syn_41);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_547 (logic_ramfifo_syn_591, logic_ramfifo_syn_86, logic_ramfifo_syn_42);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_548 (logic_ramfifo_syn_592, logic_ramfifo_syn_87, logic_ramfifo_syn_43);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_549 (logic_ramfifo_syn_593, logic_ramfifo_syn_88, logic_ramfifo_syn_44);  // uart_buffer.v(39)
  or logic_ramfifo_syn_550 (logic_ramfifo_syn_594, logic_ramfifo_syn_583, logic_ramfifo_syn_584);  // uart_buffer.v(39)
  or logic_ramfifo_syn_551 (logic_ramfifo_syn_595, logic_ramfifo_syn_586, logic_ramfifo_syn_587);  // uart_buffer.v(39)
  or logic_ramfifo_syn_552 (logic_ramfifo_syn_596, logic_ramfifo_syn_585, logic_ramfifo_syn_595);  // uart_buffer.v(39)
  or logic_ramfifo_syn_553 (logic_ramfifo_syn_597, logic_ramfifo_syn_594, logic_ramfifo_syn_596);  // uart_buffer.v(39)
  or logic_ramfifo_syn_554 (logic_ramfifo_syn_598, logic_ramfifo_syn_589, logic_ramfifo_syn_590);  // uart_buffer.v(39)
  or logic_ramfifo_syn_555 (logic_ramfifo_syn_599, logic_ramfifo_syn_588, logic_ramfifo_syn_598);  // uart_buffer.v(39)
  or logic_ramfifo_syn_556 (logic_ramfifo_syn_600, logic_ramfifo_syn_592, logic_ramfifo_syn_593);  // uart_buffer.v(39)
  or logic_ramfifo_syn_557 (logic_ramfifo_syn_601, logic_ramfifo_syn_591, logic_ramfifo_syn_600);  // uart_buffer.v(39)
  or logic_ramfifo_syn_558 (logic_ramfifo_syn_602, logic_ramfifo_syn_599, logic_ramfifo_syn_601);  // uart_buffer.v(39)
  or logic_ramfifo_syn_559 (logic_ramfifo_syn_603, logic_ramfifo_syn_597, logic_ramfifo_syn_602);  // uart_buffer.v(39)
  not logic_ramfifo_syn_604 (logic_ramfifo_syn_179, logic_ramfifo_syn_669);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_605 (logic_ramfifo_syn_649, logic_ramfifo_syn_78, logic_ramfifo_syn_23);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_606 (logic_ramfifo_syn_650, logic_ramfifo_syn_79, logic_ramfifo_syn_24);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_607 (logic_ramfifo_syn_651, logic_ramfifo_syn_80, logic_ramfifo_syn_25);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_608 (logic_ramfifo_syn_652, logic_ramfifo_syn_81, logic_ramfifo_syn_26);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_609 (logic_ramfifo_syn_653, logic_ramfifo_syn_82, logic_ramfifo_syn_27);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_610 (logic_ramfifo_syn_654, logic_ramfifo_syn_83, logic_ramfifo_syn_28);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_611 (logic_ramfifo_syn_655, logic_ramfifo_syn_84, logic_ramfifo_syn_29);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_612 (logic_ramfifo_syn_656, logic_ramfifo_syn_85, logic_ramfifo_syn_30);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_613 (logic_ramfifo_syn_657, logic_ramfifo_syn_86, logic_ramfifo_syn_31);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_614 (logic_ramfifo_syn_658, logic_ramfifo_syn_87, logic_ramfifo_syn_32);  // uart_buffer.v(39)
  xor logic_ramfifo_syn_615 (logic_ramfifo_syn_659, logic_ramfifo_syn_88, logic_ramfifo_syn_33);  // uart_buffer.v(39)
  or logic_ramfifo_syn_616 (logic_ramfifo_syn_660, logic_ramfifo_syn_649, logic_ramfifo_syn_650);  // uart_buffer.v(39)
  or logic_ramfifo_syn_617 (logic_ramfifo_syn_661, logic_ramfifo_syn_652, logic_ramfifo_syn_653);  // uart_buffer.v(39)
  or logic_ramfifo_syn_618 (logic_ramfifo_syn_662, logic_ramfifo_syn_651, logic_ramfifo_syn_661);  // uart_buffer.v(39)
  or logic_ramfifo_syn_619 (logic_ramfifo_syn_663, logic_ramfifo_syn_660, logic_ramfifo_syn_662);  // uart_buffer.v(39)
  or logic_ramfifo_syn_620 (logic_ramfifo_syn_664, logic_ramfifo_syn_655, logic_ramfifo_syn_656);  // uart_buffer.v(39)
  or logic_ramfifo_syn_621 (logic_ramfifo_syn_665, logic_ramfifo_syn_654, logic_ramfifo_syn_664);  // uart_buffer.v(39)
  or logic_ramfifo_syn_622 (logic_ramfifo_syn_666, logic_ramfifo_syn_658, logic_ramfifo_syn_659);  // uart_buffer.v(39)
  or logic_ramfifo_syn_623 (logic_ramfifo_syn_667, logic_ramfifo_syn_657, logic_ramfifo_syn_666);  // uart_buffer.v(39)
  or logic_ramfifo_syn_624 (logic_ramfifo_syn_668, logic_ramfifo_syn_665, logic_ramfifo_syn_667);  // uart_buffer.v(39)
  or logic_ramfifo_syn_625 (logic_ramfifo_syn_669, logic_ramfifo_syn_663, logic_ramfifo_syn_668);  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    logic_ramfifo_syn_670 (
    .a(1'b0),
    .o({logic_ramfifo_syn_716,open_n79}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_671 (
    .a(logic_ramfifo_syn_67),
    .b(logic_ramfifo_syn_56),
    .c(logic_ramfifo_syn_716),
    .o({logic_ramfifo_syn_717,wrusedw[0]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_672 (
    .a(logic_ramfifo_syn_68),
    .b(logic_ramfifo_syn_57),
    .c(logic_ramfifo_syn_717),
    .o({logic_ramfifo_syn_718,wrusedw[1]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_673 (
    .a(logic_ramfifo_syn_69),
    .b(logic_ramfifo_syn_58),
    .c(logic_ramfifo_syn_718),
    .o({logic_ramfifo_syn_719,wrusedw[2]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_674 (
    .a(logic_ramfifo_syn_70),
    .b(logic_ramfifo_syn_59),
    .c(logic_ramfifo_syn_719),
    .o({logic_ramfifo_syn_720,wrusedw[3]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_675 (
    .a(logic_ramfifo_syn_71),
    .b(logic_ramfifo_syn_60),
    .c(logic_ramfifo_syn_720),
    .o({logic_ramfifo_syn_721,wrusedw[4]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_676 (
    .a(logic_ramfifo_syn_72),
    .b(logic_ramfifo_syn_61),
    .c(logic_ramfifo_syn_721),
    .o({logic_ramfifo_syn_722,wrusedw[5]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_677 (
    .a(logic_ramfifo_syn_73),
    .b(logic_ramfifo_syn_62),
    .c(logic_ramfifo_syn_722),
    .o({logic_ramfifo_syn_723,wrusedw[6]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_678 (
    .a(logic_ramfifo_syn_74),
    .b(logic_ramfifo_syn_63),
    .c(logic_ramfifo_syn_723),
    .o({logic_ramfifo_syn_724,wrusedw[7]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_679 (
    .a(logic_ramfifo_syn_75),
    .b(logic_ramfifo_syn_64),
    .c(logic_ramfifo_syn_724),
    .o({logic_ramfifo_syn_725,wrusedw[8]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_680 (
    .a(logic_ramfifo_syn_76),
    .b(logic_ramfifo_syn_65),
    .c(logic_ramfifo_syn_725),
    .o({logic_ramfifo_syn_726,wrusedw[9]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_681 (
    .a(logic_ramfifo_syn_22),
    .b(logic_ramfifo_syn_66),
    .c(logic_ramfifo_syn_726),
    .o({open_n80,wrusedw[10]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB_CARRY"))
    logic_ramfifo_syn_728 (
    .a(1'b0),
    .o({logic_ramfifo_syn_774,open_n83}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_729 (
    .a(logic_ramfifo_syn_89),
    .b(logic_ramfifo_syn_100),
    .c(logic_ramfifo_syn_774),
    .o({logic_ramfifo_syn_775,rdusedw[0]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_730 (
    .a(logic_ramfifo_syn_90),
    .b(logic_ramfifo_syn_101),
    .c(logic_ramfifo_syn_775),
    .o({logic_ramfifo_syn_776,rdusedw[1]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_731 (
    .a(logic_ramfifo_syn_91),
    .b(logic_ramfifo_syn_102),
    .c(logic_ramfifo_syn_776),
    .o({logic_ramfifo_syn_777,rdusedw[2]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_732 (
    .a(logic_ramfifo_syn_92),
    .b(logic_ramfifo_syn_103),
    .c(logic_ramfifo_syn_777),
    .o({logic_ramfifo_syn_778,rdusedw[3]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_733 (
    .a(logic_ramfifo_syn_93),
    .b(logic_ramfifo_syn_104),
    .c(logic_ramfifo_syn_778),
    .o({logic_ramfifo_syn_779,rdusedw[4]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_734 (
    .a(logic_ramfifo_syn_94),
    .b(logic_ramfifo_syn_105),
    .c(logic_ramfifo_syn_779),
    .o({logic_ramfifo_syn_780,rdusedw[5]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_735 (
    .a(logic_ramfifo_syn_95),
    .b(logic_ramfifo_syn_106),
    .c(logic_ramfifo_syn_780),
    .o({logic_ramfifo_syn_781,rdusedw[6]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_736 (
    .a(logic_ramfifo_syn_96),
    .b(logic_ramfifo_syn_107),
    .c(logic_ramfifo_syn_781),
    .o({logic_ramfifo_syn_782,rdusedw[7]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_737 (
    .a(logic_ramfifo_syn_97),
    .b(logic_ramfifo_syn_108),
    .c(logic_ramfifo_syn_782),
    .o({logic_ramfifo_syn_783,rdusedw[8]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_738 (
    .a(logic_ramfifo_syn_98),
    .b(logic_ramfifo_syn_109),
    .c(logic_ramfifo_syn_783),
    .o({logic_ramfifo_syn_784,rdusedw[9]}));  // uart_buffer.v(39)
  AL_MAP_ADDER #(
    .ALUTYPE("SUB"))
    logic_ramfifo_syn_739 (
    .a(logic_ramfifo_syn_99),
    .b(logic_ramfifo_syn_55),
    .c(logic_ramfifo_syn_784),
    .o({open_n84,rdusedw[10]}));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_791 (
    .i0(logic_ramfifo_syn_798),
    .i1(logic_ramfifo_syn_799),
    .sel(re_syn_5),
    .o(logic_ramfifo_syn_142));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_792 (
    .i0(logic_ramfifo_syn_175),
    .i1(logic_ramfifo_syn_801),
    .sel(re_syn_4),
    .o(logic_ramfifo_syn_798));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_793 (
    .i0(_al_n1_syn_79),
    .i1(1'b0),
    .sel(re_syn_4),
    .o(logic_ramfifo_syn_799));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_795 (
    .i0(logic_ramfifo_syn_197),
    .i1(re_syn_2),
    .sel(re_syn_3),
    .o(logic_ramfifo_syn_801));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_820 (
    .i0(logic_ramfifo_syn_827),
    .i1(logic_ramfifo_syn_828),
    .sel(re_syn_5),
    .o(logic_ramfifo_syn_199));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_821 (
    .i0(logic_ramfifo_syn_829),
    .i1(logic_ramfifo_syn_830),
    .sel(re_syn_4),
    .o(logic_ramfifo_syn_827));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_822 (
    .i0(logic_ramfifo_syn_831),
    .i1(1'b0),
    .sel(re_syn_4),
    .o(logic_ramfifo_syn_828));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_823 (
    .i0(logic_ramfifo_syn_175),
    .i1(_al_n0_syn_2),
    .sel(re_syn_3),
    .o(logic_ramfifo_syn_829));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_824 (
    .i0(1'b0),
    .i1(re_syn_9),
    .sel(re_syn_3),
    .o(logic_ramfifo_syn_830));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_825 (
    .i0(re_syn_9),
    .i1(1'b0),
    .sel(re_syn_3),
    .o(logic_ramfifo_syn_831));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_849 (
    .i0(logic_ramfifo_syn_856),
    .i1(logic_ramfifo_syn_857),
    .sel(re_syn_5),
    .o(logic_ramfifo_syn_200));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_850 (
    .i0(logic_ramfifo_syn_858),
    .i1(logic_ramfifo_syn_859),
    .sel(re_syn_4),
    .o(logic_ramfifo_syn_856));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_851 (
    .i0(logic_ramfifo_syn_860),
    .i1(1'b0),
    .sel(re_syn_4),
    .o(logic_ramfifo_syn_857));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_852 (
    .i0(1'b0),
    .i1(_al_n0_syn_3),
    .sel(re_syn_3),
    .o(logic_ramfifo_syn_858));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_853 (
    .i0(_al_n0_syn_7),
    .i1(re_syn_10),
    .sel(re_syn_3),
    .o(logic_ramfifo_syn_859));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_854 (
    .i0(re_syn_10),
    .i1(1'b0),
    .sel(re_syn_3),
    .o(logic_ramfifo_syn_860));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_878 (
    .i0(logic_ramfifo_syn_885),
    .i1(logic_ramfifo_syn_886),
    .sel(re_syn_5),
    .o(logic_ramfifo_syn_201));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_879 (
    .i0(logic_ramfifo_syn_887),
    .i1(logic_ramfifo_syn_888),
    .sel(re_syn_4),
    .o(logic_ramfifo_syn_885));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_880 (
    .i0(logic_ramfifo_syn_889),
    .i1(1'b0),
    .sel(re_syn_4),
    .o(logic_ramfifo_syn_886));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_881 (
    .i0(1'b0),
    .i1(_al_n0_syn_4),
    .sel(re_syn_3),
    .o(logic_ramfifo_syn_887));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_882 (
    .i0(logic_ramfifo_syn_197),
    .i1(re_syn_11),
    .sel(re_syn_3),
    .o(logic_ramfifo_syn_888));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_883 (
    .i0(re_syn_11),
    .i1(1'b0),
    .sel(re_syn_3),
    .o(logic_ramfifo_syn_889));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_903 (
    .i0(clk_syn_187),
    .i1(clk_syn_202),
    .sel(logic_ramfifo_syn_177),
    .o(clk_syn_267));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_908 (
    .i0(clk_syn_188),
    .i1(clk_syn_226),
    .sel(logic_ramfifo_syn_177),
    .o(clk_syn_268));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_913 (
    .i0(clk_syn_189),
    .i1(clk_syn_230),
    .sel(logic_ramfifo_syn_177),
    .o(clk_syn_269));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_918 (
    .i0(clk_syn_190),
    .i1(clk_syn_234),
    .sel(logic_ramfifo_syn_177),
    .o(clk_syn_270));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_923 (
    .i0(clk_syn_191),
    .i1(clk_syn_238),
    .sel(logic_ramfifo_syn_177),
    .o(clk_syn_271));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_928 (
    .i0(clk_syn_192),
    .i1(clk_syn_242),
    .sel(logic_ramfifo_syn_177),
    .o(clk_syn_272));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_933 (
    .i0(clk_syn_193),
    .i1(clk_syn_246),
    .sel(logic_ramfifo_syn_177),
    .o(clk_syn_273));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_938 (
    .i0(clk_syn_194),
    .i1(clk_syn_250),
    .sel(logic_ramfifo_syn_177),
    .o(clk_syn_274));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_943 (
    .i0(clk_syn_195),
    .i1(clk_syn_254),
    .sel(logic_ramfifo_syn_177),
    .o(clk_syn_275));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_948 (
    .i0(clk_syn_196),
    .i1(clk_syn_258),
    .sel(logic_ramfifo_syn_177),
    .o(clk_syn_276));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_953 (
    .i0(clk_syn_197),
    .i1(clk_syn_262),
    .sel(logic_ramfifo_syn_177),
    .o(clk_syn_277));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_958 (
    .i0(clk_syn_198),
    .i1(clk_syn_266),
    .sel(logic_ramfifo_syn_177),
    .o(clk_syn_278));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_963 (
    .i0(logic_ramfifo_syn_34),
    .i1(clk_syn_188),
    .sel(logic_ramfifo_syn_177),
    .o(logic_ramfifo_syn_225));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_968 (
    .i0(logic_ramfifo_syn_35),
    .i1(clk_syn_189),
    .sel(logic_ramfifo_syn_177),
    .o(logic_ramfifo_syn_226));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_973 (
    .i0(logic_ramfifo_syn_36),
    .i1(clk_syn_190),
    .sel(logic_ramfifo_syn_177),
    .o(logic_ramfifo_syn_227));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_978 (
    .i0(logic_ramfifo_syn_37),
    .i1(clk_syn_191),
    .sel(logic_ramfifo_syn_177),
    .o(logic_ramfifo_syn_228));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_983 (
    .i0(logic_ramfifo_syn_38),
    .i1(clk_syn_192),
    .sel(logic_ramfifo_syn_177),
    .o(logic_ramfifo_syn_229));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_988 (
    .i0(logic_ramfifo_syn_39),
    .i1(clk_syn_193),
    .sel(logic_ramfifo_syn_177),
    .o(logic_ramfifo_syn_230));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_993 (
    .i0(logic_ramfifo_syn_40),
    .i1(clk_syn_194),
    .sel(logic_ramfifo_syn_177),
    .o(logic_ramfifo_syn_231));  // uart_buffer.v(39)
  AL_MUX logic_ramfifo_syn_998 (
    .i0(logic_ramfifo_syn_41),
    .i1(clk_syn_195),
    .sel(logic_ramfifo_syn_177),
    .o(logic_ramfifo_syn_232));  // uart_buffer.v(39)
  and re_syn_1 (re_syn_2, re, logic_ramfifo_syn_191);  // uart_buffer.v(25)
  AL_DFF_X re_syn_141 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(re_syn_92),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(re_syn_20));  // uart_buffer.v(25)
  AL_DFF_X re_syn_142 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(re_syn_93),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(re_syn_21));  // uart_buffer.v(25)
  AL_DFF_X re_syn_143 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(re_syn_94),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(re_syn_22));  // uart_buffer.v(25)
  AL_DFF_X re_syn_144 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(re_syn_95),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(re_syn_23));  // uart_buffer.v(25)
  AL_DFF_X re_syn_145 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(re_syn_96),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(re_syn_24));  // uart_buffer.v(25)
  AL_DFF_X re_syn_146 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(re_syn_97),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(re_syn_25));  // uart_buffer.v(25)
  AL_DFF_X re_syn_147 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(re_syn_98),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(re_syn_26));  // uart_buffer.v(25)
  AL_DFF_X re_syn_148 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(re_syn_99),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(re_syn_27));  // uart_buffer.v(25)
  AL_DFF_X re_syn_149 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(re_syn_100),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(do[0]));  // uart_buffer.v(25)
  AL_DFF_X re_syn_150 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(re_syn_101),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(do[1]));  // uart_buffer.v(25)
  AL_DFF_X re_syn_151 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(re_syn_102),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(do[2]));  // uart_buffer.v(25)
  AL_DFF_X re_syn_152 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(re_syn_103),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(do[3]));  // uart_buffer.v(25)
  AL_DFF_X re_syn_153 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(re_syn_104),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(do[4]));  // uart_buffer.v(25)
  AL_DFF_X re_syn_154 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(re_syn_105),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(do[5]));  // uart_buffer.v(25)
  AL_DFF_X re_syn_155 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(re_syn_106),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(do[6]));  // uart_buffer.v(25)
  AL_DFF_X re_syn_156 (
    .ar(rst_syn_4),
    .as(1'b0),
    .clk(clk),
    .d(re_syn_107),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(do[7]));  // uart_buffer.v(25)
  not re_syn_16 (re_syn_17, re_syn_2);  // uart_buffer.v(25)
  AL_MUX re_syn_161 (
    .i0(re_syn_17),
    .i1(1'b0),
    .sel(logic_ramfifo_syn_195),
    .o(re_syn_9));  // uart_buffer.v(25)
  AL_MUX re_syn_166 (
    .i0(re_syn_17),
    .i1(1'b1),
    .sel(logic_ramfifo_syn_195),
    .o(re_syn_10));  // uart_buffer.v(25)
  AL_MUX re_syn_171 (
    .i0(re_syn_2),
    .i1(1'b0),
    .sel(logic_ramfifo_syn_195),
    .o(re_syn_11));  // uart_buffer.v(25)
  AL_MUX re_syn_176 (
    .i0(clk_syn_94),
    .i1(clk_syn_109),
    .sel(re_syn_2),
    .o(clk_syn_174));  // uart_buffer.v(25)
  AL_MUX re_syn_181 (
    .i0(clk_syn_95),
    .i1(clk_syn_133),
    .sel(re_syn_2),
    .o(clk_syn_175));  // uart_buffer.v(25)
  AL_MUX re_syn_186 (
    .i0(clk_syn_96),
    .i1(clk_syn_137),
    .sel(re_syn_2),
    .o(clk_syn_176));  // uart_buffer.v(25)
  AL_MUX re_syn_191 (
    .i0(clk_syn_97),
    .i1(clk_syn_141),
    .sel(re_syn_2),
    .o(clk_syn_177));  // uart_buffer.v(25)
  AL_MUX re_syn_196 (
    .i0(clk_syn_98),
    .i1(clk_syn_145),
    .sel(re_syn_2),
    .o(clk_syn_178));  // uart_buffer.v(25)
  AL_MUX re_syn_201 (
    .i0(clk_syn_99),
    .i1(clk_syn_149),
    .sel(re_syn_2),
    .o(clk_syn_179));  // uart_buffer.v(25)
  AL_MUX re_syn_206 (
    .i0(clk_syn_100),
    .i1(clk_syn_153),
    .sel(re_syn_2),
    .o(clk_syn_180));  // uart_buffer.v(25)
  AL_MUX re_syn_211 (
    .i0(clk_syn_101),
    .i1(clk_syn_157),
    .sel(re_syn_2),
    .o(clk_syn_181));  // uart_buffer.v(25)
  AL_MUX re_syn_216 (
    .i0(clk_syn_102),
    .i1(clk_syn_161),
    .sel(re_syn_2),
    .o(clk_syn_182));  // uart_buffer.v(25)
  AL_MUX re_syn_221 (
    .i0(clk_syn_103),
    .i1(clk_syn_165),
    .sel(re_syn_2),
    .o(clk_syn_183));  // uart_buffer.v(25)
  AL_MUX re_syn_226 (
    .i0(clk_syn_104),
    .i1(clk_syn_169),
    .sel(re_syn_2),
    .o(clk_syn_184));  // uart_buffer.v(25)
  AL_MUX re_syn_231 (
    .i0(clk_syn_105),
    .i1(clk_syn_173),
    .sel(re_syn_2),
    .o(clk_syn_185));  // uart_buffer.v(25)
  AL_MUX re_syn_236 (
    .i0(logic_ramfifo_syn_23),
    .i1(clk_syn_95),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_211));  // uart_buffer.v(25)
  AL_MUX re_syn_241 (
    .i0(logic_ramfifo_syn_24),
    .i1(clk_syn_96),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_212));  // uart_buffer.v(25)
  AL_MUX re_syn_246 (
    .i0(logic_ramfifo_syn_25),
    .i1(clk_syn_97),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_213));  // uart_buffer.v(25)
  AL_MUX re_syn_251 (
    .i0(logic_ramfifo_syn_26),
    .i1(clk_syn_98),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_214));  // uart_buffer.v(25)
  AL_MUX re_syn_256 (
    .i0(logic_ramfifo_syn_27),
    .i1(clk_syn_99),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_215));  // uart_buffer.v(25)
  AL_MUX re_syn_261 (
    .i0(logic_ramfifo_syn_28),
    .i1(clk_syn_100),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_216));  // uart_buffer.v(25)
  AL_MUX re_syn_266 (
    .i0(logic_ramfifo_syn_29),
    .i1(clk_syn_101),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_217));  // uart_buffer.v(25)
  AL_MUX re_syn_271 (
    .i0(logic_ramfifo_syn_30),
    .i1(clk_syn_102),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_218));  // uart_buffer.v(25)
  AL_MUX re_syn_276 (
    .i0(logic_ramfifo_syn_31),
    .i1(clk_syn_103),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_219));  // uart_buffer.v(25)
  AL_MUX re_syn_281 (
    .i0(logic_ramfifo_syn_32),
    .i1(clk_syn_104),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_220));  // uart_buffer.v(25)
  AL_MUX re_syn_286 (
    .i0(logic_ramfifo_syn_33),
    .i1(clk_syn_105),
    .sel(re_syn_2),
    .o(logic_ramfifo_syn_221));  // uart_buffer.v(25)
  not rst_syn_1 (rst_syn_2, rst);  // uart_buffer.v(22)
  not rst_syn_3 (rst_syn_4, rst_syn_2);  // uart_buffer.v(22)
  and we_syn_1 (we_syn_2, we, logic_ramfifo_syn_150);  // uart_buffer.v(24)
  AL_MUX we_syn_103 (
    .i0(logic_ramfifo_syn_4),
    .i1(clk_syn_5),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_154));  // uart_buffer.v(24)
  AL_MUX we_syn_108 (
    .i0(logic_ramfifo_syn_5),
    .i1(clk_syn_6),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_155));  // uart_buffer.v(24)
  AL_MUX we_syn_113 (
    .i0(logic_ramfifo_syn_6),
    .i1(clk_syn_7),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_156));  // uart_buffer.v(24)
  AL_MUX we_syn_118 (
    .i0(logic_ramfifo_syn_7),
    .i1(clk_syn_8),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_157));  // uart_buffer.v(24)
  AL_MUX we_syn_123 (
    .i0(logic_ramfifo_syn_8),
    .i1(clk_syn_9),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_158));  // uart_buffer.v(24)
  AL_MUX we_syn_128 (
    .i0(logic_ramfifo_syn_9),
    .i1(clk_syn_10),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_159));  // uart_buffer.v(24)
  AL_MUX we_syn_133 (
    .i0(logic_ramfifo_syn_10),
    .i1(clk_syn_11),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_160));  // uart_buffer.v(24)
  AL_MUX we_syn_138 (
    .i0(logic_ramfifo_syn_11),
    .i1(clk_syn_12),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_161));  // uart_buffer.v(24)
  AL_MUX we_syn_28 (
    .i0(clk_syn_1),
    .i1(clk_syn_16),
    .sel(we_syn_2),
    .o(clk_syn_81));  // uart_buffer.v(24)
  AL_MUX we_syn_33 (
    .i0(clk_syn_2),
    .i1(clk_syn_40),
    .sel(we_syn_2),
    .o(clk_syn_82));  // uart_buffer.v(24)
  AL_MUX we_syn_38 (
    .i0(clk_syn_3),
    .i1(clk_syn_44),
    .sel(we_syn_2),
    .o(clk_syn_83));  // uart_buffer.v(24)
  AL_MUX we_syn_43 (
    .i0(clk_syn_4),
    .i1(clk_syn_48),
    .sel(we_syn_2),
    .o(clk_syn_84));  // uart_buffer.v(24)
  AL_MUX we_syn_48 (
    .i0(clk_syn_5),
    .i1(clk_syn_52),
    .sel(we_syn_2),
    .o(clk_syn_85));  // uart_buffer.v(24)
  AL_MUX we_syn_53 (
    .i0(clk_syn_6),
    .i1(clk_syn_56),
    .sel(we_syn_2),
    .o(clk_syn_86));  // uart_buffer.v(24)
  AL_MUX we_syn_58 (
    .i0(clk_syn_7),
    .i1(clk_syn_60),
    .sel(we_syn_2),
    .o(clk_syn_87));  // uart_buffer.v(24)
  AL_MUX we_syn_63 (
    .i0(clk_syn_8),
    .i1(clk_syn_64),
    .sel(we_syn_2),
    .o(clk_syn_88));  // uart_buffer.v(24)
  AL_MUX we_syn_68 (
    .i0(clk_syn_9),
    .i1(clk_syn_68),
    .sel(we_syn_2),
    .o(clk_syn_89));  // uart_buffer.v(24)
  AL_MUX we_syn_73 (
    .i0(clk_syn_10),
    .i1(clk_syn_72),
    .sel(we_syn_2),
    .o(clk_syn_90));  // uart_buffer.v(24)
  AL_MUX we_syn_78 (
    .i0(clk_syn_11),
    .i1(clk_syn_76),
    .sel(we_syn_2),
    .o(clk_syn_91));  // uart_buffer.v(24)
  AL_MUX we_syn_83 (
    .i0(clk_syn_12),
    .i1(clk_syn_80),
    .sel(we_syn_2),
    .o(clk_syn_92));  // uart_buffer.v(24)
  AL_MUX we_syn_88 (
    .i0(logic_ramfifo_syn_1),
    .i1(clk_syn_2),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_151));  // uart_buffer.v(24)
  AL_MUX we_syn_93 (
    .i0(logic_ramfifo_syn_2),
    .i1(clk_syn_3),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_152));  // uart_buffer.v(24)
  AL_MUX we_syn_98 (
    .i0(logic_ramfifo_syn_3),
    .i1(clk_syn_4),
    .sel(we_syn_2),
    .o(logic_ramfifo_syn_153));  // uart_buffer.v(24)

endmodule 

