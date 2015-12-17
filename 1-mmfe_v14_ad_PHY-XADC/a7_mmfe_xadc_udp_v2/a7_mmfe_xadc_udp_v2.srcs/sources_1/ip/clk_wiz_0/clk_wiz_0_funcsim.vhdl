-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.4.1 (win64) Build 1149489 Thu Feb 19 16:20:35 MST 2015
-- Date        : Sat Jun 27 09:57:34 2015
-- Host        : phys-pc458-4 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               C:/Users/kjohns/Documents/1-mmfe_v13/a7_mmfe_xadc_udp_v2/a7_mmfe_xadc_udp_v2.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_funcsim.vhdl
-- Design      : clk_wiz_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tfbg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_wiz_0_clk_wiz_0_clk_wiz is
  port (
    clk_in1 : in STD_LOGIC;
    clk_200_o : out STD_LOGIC;
    clk_160_o : out STD_LOGIC;
    clk_100_o : out STD_LOGIC;
    clk_50_o : out STD_LOGIC;
    clk_40_o : out STD_LOGIC;
    clk_20_o : out STD_LOGIC;
    clk_10_o : out STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of clk_wiz_0_clk_wiz_0_clk_wiz : entity is "clk_wiz_0_clk_wiz";
end clk_wiz_0_clk_wiz_0_clk_wiz;

architecture STRUCTURE of clk_wiz_0_clk_wiz_0_clk_wiz is
  signal clk_100_o_clk_wiz_0 : STD_LOGIC;
  signal clk_10_o_clk_wiz_0 : STD_LOGIC;
  signal clk_160_o_clk_wiz_0 : STD_LOGIC;
  signal clk_200_o_clk_wiz_0 : STD_LOGIC;
  signal clk_20_o_clk_wiz_0 : STD_LOGIC;
  signal clk_40_o_clk_wiz_0 : STD_LOGIC;
  signal clk_50_o_clk_wiz_0 : STD_LOGIC;
  signal clkfbout_buf_clk_wiz_0 : STD_LOGIC;
  signal clkfbout_clk_wiz_0 : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_LOCKED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute box_type : string;
  attribute box_type of clkf_buf : label is "PRIMITIVE";
  attribute box_type of clkout1_buf : label is "PRIMITIVE";
  attribute box_type of clkout2_buf : label is "PRIMITIVE";
  attribute box_type of clkout3_buf : label is "PRIMITIVE";
  attribute box_type of clkout4_buf : label is "PRIMITIVE";
  attribute box_type of clkout5_buf : label is "PRIMITIVE";
  attribute box_type of clkout6_buf : label is "PRIMITIVE";
  attribute box_type of clkout7_buf : label is "PRIMITIVE";
  attribute box_type of mmcm_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
    port map (
      I => clkfbout_clk_wiz_0,
      O => clkfbout_buf_clk_wiz_0
    );
clkout1_buf: unisim.vcomponents.BUFG
    port map (
      I => clk_200_o_clk_wiz_0,
      O => clk_200_o
    );
clkout2_buf: unisim.vcomponents.BUFG
    port map (
      I => clk_160_o_clk_wiz_0,
      O => clk_160_o
    );
clkout3_buf: unisim.vcomponents.BUFG
    port map (
      I => clk_100_o_clk_wiz_0,
      O => clk_100_o
    );
clkout4_buf: unisim.vcomponents.BUFG
    port map (
      I => clk_50_o_clk_wiz_0,
      O => clk_50_o
    );
clkout5_buf: unisim.vcomponents.BUFG
    port map (
      I => clk_40_o_clk_wiz_0,
      O => clk_40_o
    );
clkout6_buf: unisim.vcomponents.BUFG
    port map (
      I => clk_20_o_clk_wiz_0,
      O => clk_20_o
    );
clkout7_buf: unisim.vcomponents.BUFG
    port map (
      I => clk_10_o_clk_wiz_0,
      O => clk_10_o
    );
mmcm_adv_inst: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "HIGH",
      CLKFBOUT_MULT_F => 2.000000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKIN1_PERIOD => 2.500000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 4.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => false,
      CLKOUT1_DIVIDE => 5,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => false,
      CLKOUT2_DIVIDE => 8,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => false,
      CLKOUT3_DIVIDE => 16,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_USE_FINE_PS => false,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 20,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => false,
      CLKOUT5_DIVIDE => 40,
      CLKOUT5_DUTY_CYCLE => 0.250000,
      CLKOUT5_PHASE => 45.000000,
      CLKOUT5_USE_FINE_PS => false,
      CLKOUT6_DIVIDE => 80,
      CLKOUT6_DUTY_CYCLE => 0.250000,
      CLKOUT6_PHASE => 45.000000,
      CLKOUT6_USE_FINE_PS => false,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 1,
      IS_CLKINSEL_INVERTED => '0',
      IS_PSEN_INVERTED => '0',
      IS_PSINCDEC_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.000000,
      REF_JITTER2 => 0.000000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => false
    )
    port map (
      CLKFBIN => clkfbout_buf_clk_wiz_0,
      CLKFBOUT => clkfbout_clk_wiz_0,
      CLKFBOUTB => NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => clk_in1,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => clk_200_o_clk_wiz_0,
      CLKOUT0B => NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => clk_160_o_clk_wiz_0,
      CLKOUT1B => NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => clk_100_o_clk_wiz_0,
      CLKOUT2B => NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => clk_50_o_clk_wiz_0,
      CLKOUT3B => NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => clk_40_o_clk_wiz_0,
      CLKOUT5 => clk_20_o_clk_wiz_0,
      CLKOUT6 => clk_10_o_clk_wiz_0,
      DADDR(6) => '0',
      DADDR(5) => '0',
      DADDR(4) => '0',
      DADDR(3) => '0',
      DADDR(2) => '0',
      DADDR(1) => '0',
      DADDR(0) => '0',
      DCLK => '0',
      DEN => '0',
      DI(15) => '0',
      DI(14) => '0',
      DI(13) => '0',
      DI(12) => '0',
      DI(11) => '0',
      DI(10) => '0',
      DI(9) => '0',
      DI(8) => '0',
      DI(7) => '0',
      DI(6) => '0',
      DI(5) => '0',
      DI(4) => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      DO(15 downto 0) => NLW_mmcm_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_mmcm_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => NLW_mmcm_adv_inst_LOCKED_UNCONNECTED,
      PSCLK => '0',
      PSDONE => NLW_mmcm_adv_inst_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_wiz_0 is
  port (
    clk_in1 : in STD_LOGIC;
    clk_200_o : out STD_LOGIC;
    clk_160_o : out STD_LOGIC;
    clk_100_o : out STD_LOGIC;
    clk_50_o : out STD_LOGIC;
    clk_40_o : out STD_LOGIC;
    clk_20_o : out STD_LOGIC;
    clk_10_o : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of clk_wiz_0 : entity is true;
  attribute core_generation_info : string;
  attribute core_generation_info of clk_wiz_0 : entity is "clk_wiz_0,clk_wiz_v5_1,{component_name=clk_wiz_0,use_phase_alignment=true,use_min_o_jitter=true,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,enable_axi=0,feedback_source=FDBK_AUTO,PRIMITIVE=MMCM,num_out_clk=7,clkin1_period=2.5,clkin2_period=10.0,use_power_down=false,use_reset=false,use_locked=false,use_inclk_stopped=false,feedback_type=SINGLE,CLOCK_MGR_TYPE=NA,manual_override=false}";
end clk_wiz_0;

architecture STRUCTURE of clk_wiz_0 is
begin
U0: entity work.clk_wiz_0_clk_wiz_0_clk_wiz
    port map (
      clk_100_o => clk_100_o,
      clk_10_o => clk_10_o,
      clk_160_o => clk_160_o,
      clk_200_o => clk_200_o,
      clk_20_o => clk_20_o,
      clk_40_o => clk_40_o,
      clk_50_o => clk_50_o,
      clk_in1 => clk_in1
    );
end STRUCTURE;
