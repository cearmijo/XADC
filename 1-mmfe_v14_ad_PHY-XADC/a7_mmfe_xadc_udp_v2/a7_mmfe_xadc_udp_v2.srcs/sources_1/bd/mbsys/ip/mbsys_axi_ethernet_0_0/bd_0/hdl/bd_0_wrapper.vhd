--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.4.1 (win64) Build 1149489 Thu Feb 19 16:23:09 MST 2015
--Date        : Mon Jun 15 20:20:21 2015
--Host        : PHYS-PC454-1 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target bd_0_wrapper.bd
--Design      : bd_0_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0_wrapper is
  port (
    axi_rxd_arstn : in STD_LOGIC;
    axi_rxs_arstn : in STD_LOGIC;
    axi_txc_arstn : in STD_LOGIC;
    axi_txd_arstn : in STD_LOGIC;
    axis_clk : in STD_LOGIC;
    gt0_pll0lock_out : out STD_LOGIC;
    gt0_pll0outclk_out : out STD_LOGIC;
    gt0_pll0outrefclk_out : out STD_LOGIC;
    gt0_pll0refclklost_out : out STD_LOGIC;
    gt0_pll1outclk_out : out STD_LOGIC;
    gt0_pll1outrefclk_out : out STD_LOGIC;
    gtref_clk_out : out STD_LOGIC;
    interrupt : out STD_LOGIC;
    m_axis_rxd_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_rxd_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_rxd_tlast : out STD_LOGIC;
    m_axis_rxd_tready : in STD_LOGIC;
    m_axis_rxd_tvalid : out STD_LOGIC;
    m_axis_rxs_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_rxs_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_rxs_tlast : out STD_LOGIC;
    m_axis_rxs_tready : in STD_LOGIC;
    m_axis_rxs_tvalid : out STD_LOGIC;
    mac_irq : out STD_LOGIC;
    mdio_mdc : out STD_LOGIC;
    mdio_mdio_io : inout STD_LOGIC;
    mgt_clk_clk_n : in STD_LOGIC;
    mgt_clk_clk_p : in STD_LOGIC;
    mmcm_locked_out : out STD_LOGIC;
    phy_rst_n : out STD_LOGIC;
    pma_reset_out : out STD_LOGIC;
    ref_clk : in STD_LOGIC;
    rxuserclk2_out : out STD_LOGIC;
    rxuserclk_out : out STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_arready : out STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_awready : out STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_lite_clk : in STD_LOGIC;
    s_axi_lite_resetn : in STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rready : in STD_LOGIC;
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wready : out STD_LOGIC;
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axis_txc_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_txc_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_txc_tlast : in STD_LOGIC;
    s_axis_txc_tready : out STD_LOGIC;
    s_axis_txc_tvalid : in STD_LOGIC;
    s_axis_txd_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_txd_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_txd_tlast : in STD_LOGIC;
    s_axis_txd_tready : out STD_LOGIC;
    s_axis_txd_tvalid : in STD_LOGIC;
    sgmii_rxn : in STD_LOGIC;
    sgmii_rxp : in STD_LOGIC;
    sgmii_txn : out STD_LOGIC;
    sgmii_txp : out STD_LOGIC;
    signal_detect : in STD_LOGIC;
    userclk2_out : out STD_LOGIC;
    userclk_out : out STD_LOGIC
  );
end bd_0_wrapper;

architecture STRUCTURE of bd_0_wrapper is
  component bd_0 is
  port (
    s_axi_araddr : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_arready : out STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_awready : out STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rready : in STD_LOGIC;
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wready : out STD_LOGIC;
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axis_txd_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_txd_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_txd_tlast : in STD_LOGIC;
    s_axis_txd_tready : out STD_LOGIC;
    s_axis_txd_tvalid : in STD_LOGIC;
    s_axis_txc_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_txc_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_txc_tlast : in STD_LOGIC;
    s_axis_txc_tready : out STD_LOGIC;
    s_axis_txc_tvalid : in STD_LOGIC;
    m_axis_rxd_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_rxd_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_rxd_tlast : out STD_LOGIC;
    m_axis_rxd_tready : in STD_LOGIC;
    m_axis_rxd_tvalid : out STD_LOGIC;
    m_axis_rxs_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_rxs_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_rxs_tlast : out STD_LOGIC;
    m_axis_rxs_tready : in STD_LOGIC;
    m_axis_rxs_tvalid : out STD_LOGIC;
    mdio_mdc : out STD_LOGIC;
    mdio_mdio_i : in STD_LOGIC;
    mdio_mdio_o : out STD_LOGIC;
    mdio_mdio_t : out STD_LOGIC;
    sgmii_rxn : in STD_LOGIC;
    sgmii_rxp : in STD_LOGIC;
    sgmii_txn : out STD_LOGIC;
    sgmii_txp : out STD_LOGIC;
    mgt_clk_clk_n : in STD_LOGIC;
    mgt_clk_clk_p : in STD_LOGIC;
    s_axi_lite_resetn : in STD_LOGIC;
    axi_rxs_arstn : in STD_LOGIC;
    axi_rxd_arstn : in STD_LOGIC;
    axi_txc_arstn : in STD_LOGIC;
    axi_txd_arstn : in STD_LOGIC;
    s_axi_lite_clk : in STD_LOGIC;
    axis_clk : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    mac_irq : out STD_LOGIC;
    phy_rst_n : out STD_LOGIC;
    signal_detect : in STD_LOGIC;
    ref_clk : in STD_LOGIC;
    gtref_clk_out : out STD_LOGIC;
    mmcm_locked_out : out STD_LOGIC;
    pma_reset_out : out STD_LOGIC;
    rxuserclk2_out : out STD_LOGIC;
    rxuserclk_out : out STD_LOGIC;
    userclk2_out : out STD_LOGIC;
    userclk_out : out STD_LOGIC;
    gt0_pll0outclk_out : out STD_LOGIC;
    gt0_pll0outrefclk_out : out STD_LOGIC;
    gt0_pll1outclk_out : out STD_LOGIC;
    gt0_pll1outrefclk_out : out STD_LOGIC;
    gt0_pll0lock_out : out STD_LOGIC;
    gt0_pll0refclklost_out : out STD_LOGIC
  );
  end component bd_0;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal mdio_mdio_i : STD_LOGIC;
  signal mdio_mdio_o : STD_LOGIC;
  signal mdio_mdio_t : STD_LOGIC;
begin
bd_0_i: component bd_0
    port map (
      axi_rxd_arstn => axi_rxd_arstn,
      axi_rxs_arstn => axi_rxs_arstn,
      axi_txc_arstn => axi_txc_arstn,
      axi_txd_arstn => axi_txd_arstn,
      axis_clk => axis_clk,
      gt0_pll0lock_out => gt0_pll0lock_out,
      gt0_pll0outclk_out => gt0_pll0outclk_out,
      gt0_pll0outrefclk_out => gt0_pll0outrefclk_out,
      gt0_pll0refclklost_out => gt0_pll0refclklost_out,
      gt0_pll1outclk_out => gt0_pll1outclk_out,
      gt0_pll1outrefclk_out => gt0_pll1outrefclk_out,
      gtref_clk_out => gtref_clk_out,
      interrupt => interrupt,
      m_axis_rxd_tdata(31 downto 0) => m_axis_rxd_tdata(31 downto 0),
      m_axis_rxd_tkeep(3 downto 0) => m_axis_rxd_tkeep(3 downto 0),
      m_axis_rxd_tlast => m_axis_rxd_tlast,
      m_axis_rxd_tready => m_axis_rxd_tready,
      m_axis_rxd_tvalid => m_axis_rxd_tvalid,
      m_axis_rxs_tdata(31 downto 0) => m_axis_rxs_tdata(31 downto 0),
      m_axis_rxs_tkeep(3 downto 0) => m_axis_rxs_tkeep(3 downto 0),
      m_axis_rxs_tlast => m_axis_rxs_tlast,
      m_axis_rxs_tready => m_axis_rxs_tready,
      m_axis_rxs_tvalid => m_axis_rxs_tvalid,
      mac_irq => mac_irq,
      mdio_mdc => mdio_mdc,
      mdio_mdio_i => mdio_mdio_i,
      mdio_mdio_o => mdio_mdio_o,
      mdio_mdio_t => mdio_mdio_t,
      mgt_clk_clk_n => mgt_clk_clk_n,
      mgt_clk_clk_p => mgt_clk_clk_p,
      mmcm_locked_out => mmcm_locked_out,
      phy_rst_n => phy_rst_n,
      pma_reset_out => pma_reset_out,
      ref_clk => ref_clk,
      rxuserclk2_out => rxuserclk2_out,
      rxuserclk_out => rxuserclk_out,
      s_axi_araddr(17 downto 0) => s_axi_araddr(17 downto 0),
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(17 downto 0) => s_axi_awaddr(17 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(1 downto 0) => s_axi_bresp(1 downto 0),
      s_axi_bvalid => s_axi_bvalid,
      s_axi_lite_clk => s_axi_lite_clk,
      s_axi_lite_resetn => s_axi_lite_resetn,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rresp(1 downto 0) => s_axi_rresp(1 downto 0),
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(31 downto 0) => s_axi_wdata(31 downto 0),
      s_axi_wready => s_axi_wready,
      s_axi_wstrb(3 downto 0) => s_axi_wstrb(3 downto 0),
      s_axi_wvalid => s_axi_wvalid,
      s_axis_txc_tdata(31 downto 0) => s_axis_txc_tdata(31 downto 0),
      s_axis_txc_tkeep(3 downto 0) => s_axis_txc_tkeep(3 downto 0),
      s_axis_txc_tlast => s_axis_txc_tlast,
      s_axis_txc_tready => s_axis_txc_tready,
      s_axis_txc_tvalid => s_axis_txc_tvalid,
      s_axis_txd_tdata(31 downto 0) => s_axis_txd_tdata(31 downto 0),
      s_axis_txd_tkeep(3 downto 0) => s_axis_txd_tkeep(3 downto 0),
      s_axis_txd_tlast => s_axis_txd_tlast,
      s_axis_txd_tready => s_axis_txd_tready,
      s_axis_txd_tvalid => s_axis_txd_tvalid,
      sgmii_rxn => sgmii_rxn,
      sgmii_rxp => sgmii_rxp,
      sgmii_txn => sgmii_txn,
      sgmii_txp => sgmii_txp,
      signal_detect => signal_detect,
      userclk2_out => userclk2_out,
      userclk_out => userclk_out
    );
mdio_mdio_iobuf: component IOBUF
    port map (
      I => mdio_mdio_o,
      IO => mdio_mdio_io,
      O => mdio_mdio_i,
      T => mdio_mdio_t
    );
end STRUCTURE;
