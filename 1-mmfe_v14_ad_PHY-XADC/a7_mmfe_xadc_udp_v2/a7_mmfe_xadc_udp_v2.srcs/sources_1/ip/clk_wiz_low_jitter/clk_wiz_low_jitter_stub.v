// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4.1 (win64) Build 1149489 Thu Feb 19 16:23:09 MST 2015
// Date        : Thu Jul 16 16:06:34 2015
// Host        : lithe-ad-work running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               C:/export/uaphysics/atlas/muon/1-mmfe_v14_ca7-1-15/a7_mmfe_xadc_udp_v2/a7_mmfe_xadc_udp_v2.srcs/sources_1/ip/clk_wiz_low_jitter/clk_wiz_low_jitter_stub.v
// Design      : clk_wiz_low_jitter
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_low_jitter(clk_in1, clk_out1)
/* synthesis syn_black_box black_box_pad_pin="clk_in1,clk_out1" */;
  input clk_in1;
  output clk_out1;
endmodule
