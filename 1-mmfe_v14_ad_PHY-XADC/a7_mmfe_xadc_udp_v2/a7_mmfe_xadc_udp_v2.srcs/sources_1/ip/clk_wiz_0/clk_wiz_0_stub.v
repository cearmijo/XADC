// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4.1 (win64) Build 1149489 Thu Feb 19 16:20:35 MST 2015
// Date        : Sat Jun 27 09:57:34 2015
// Host        : phys-pc458-4 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/kjohns/Documents/1-mmfe_v13/a7_mmfe_xadc_udp_v2/a7_mmfe_xadc_udp_v2.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_in1, clk_200_o, clk_160_o, clk_100_o, clk_50_o, clk_40_o, clk_20_o, clk_10_o)
/* synthesis syn_black_box black_box_pad_pin="clk_in1,clk_200_o,clk_160_o,clk_100_o,clk_50_o,clk_40_o,clk_20_o,clk_10_o" */;
  input clk_in1;
  output clk_200_o;
  output clk_160_o;
  output clk_100_o;
  output clk_50_o;
  output clk_40_o;
  output clk_20_o;
  output clk_10_o;
endmodule
