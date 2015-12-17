// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4.1 (win64) Build 1149489 Thu Feb 19 16:23:09 MST 2015
// Date        : Tue Jun 16 22:28:49 2015
// Host        : PHYS-PC454-1 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/kjohns/Documents/my-xilinx/1-mmfe_kj10-andy-b/a7_mmfe_xadc_udp_v2/a7_mmfe_xadc_udp_v2.srcs/sources_1/ip/ila_0/ila_0_stub.v
// Design      : ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2014.4.1" *)
module ila_0(clk, probe0, probe1, probe2, probe3, probe4, probe5, probe6, probe7, probe8, probe9, probe10, probe11, probe12)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[31:0],probe1[0:0],probe2[0:0],probe3[31:0],probe4[0:0],probe5[0:0],probe6[31:0],probe7[0:0],probe8[0:0],probe9[31:0],probe10[0:0],probe11[0:0],probe12[3:0]" */;
  input clk;
  input [31:0]probe0;
  input [0:0]probe1;
  input [0:0]probe2;
  input [31:0]probe3;
  input [0:0]probe4;
  input [0:0]probe5;
  input [31:0]probe6;
  input [0:0]probe7;
  input [0:0]probe8;
  input [31:0]probe9;
  input [0:0]probe10;
  input [0:0]probe11;
  input [3:0]probe12;
endmodule
