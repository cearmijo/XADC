-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.4.1 (win64) Build 1149489 Thu Feb 19 16:23:09 MST 2015
-- Date        : Thu Jul 16 16:06:34 2015
-- Host        : lithe-ad-work running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/export/uaphysics/atlas/muon/1-mmfe_v14_ca7-1-15/a7_mmfe_xadc_udp_v2/a7_mmfe_xadc_udp_v2.srcs/sources_1/ip/clk_wiz_low_jitter/clk_wiz_low_jitter_stub.vhdl
-- Design      : clk_wiz_low_jitter
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_low_jitter is
  Port ( 
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC
  );

end clk_wiz_low_jitter;

architecture stub of clk_wiz_low_jitter is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_in1,clk_out1";
begin
end;
