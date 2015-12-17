-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.4.1 (win64) Build 1149489 Thu Feb 19 16:23:09 MST 2015
-- Date        : Thu Jun 25 17:34:54 2015
-- Host        : PHYS-PC454-1 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/kjohns/Documents/my-xilinx/1-mmfe_v11/a7_mmfe_xadc_udp_v2/a7_mmfe_xadc_udp_v2.srcs/sources_1/ip/clk_wiz_200_to_400/clk_wiz_200_to_400_stub.vhdl
-- Design      : clk_wiz_200_to_400
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_200_to_400 is
  Port ( 
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC;
    clk_out_400 : out STD_LOGIC
  );

end clk_wiz_200_to_400;

architecture stub of clk_wiz_200_to_400 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_in1_p,clk_in1_n,clk_out_400";
begin
end;
