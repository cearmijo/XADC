--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.4.1 (win64) Build 1149489 Thu Feb 19 16:23:09 MST 2015
--Date        : Mon Jun 15 20:20:21 2015
--Host        : PHYS-PC454-1 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target bd_0.bd
--Design      : bd_0
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0 is
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
    mdio_mdio_i : in STD_LOGIC;
    mdio_mdio_o : out STD_LOGIC;
    mdio_mdio_t : out STD_LOGIC;
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
end bd_0;

architecture STRUCTURE of bd_0 is
  component bd_0_eth_buf_0 is
  port (
    INTERRUPT : out STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 17 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 17 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC;
    EMAC_CLIENT_AUTONEG_INT : in STD_LOGIC;
    EMAC_RESET_DONE_INT : in STD_LOGIC;
    EMAC_RX_DCM_LOCKED_INT : in STD_LOGIC;
    PCSPMA_STATUS_VECTOR : in STD_LOGIC_VECTOR ( 15 downto 0 );
    AXI_STR_TXD_ACLK : in STD_LOGIC;
    AXI_STR_TXD_ARESETN : in STD_LOGIC;
    AXI_STR_TXD_TVALID : in STD_LOGIC;
    AXI_STR_TXD_TREADY : out STD_LOGIC;
    AXI_STR_TXD_TLAST : in STD_LOGIC;
    AXI_STR_TXD_TKEEP : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_STR_TXD_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_STR_TXC_ACLK : in STD_LOGIC;
    AXI_STR_TXC_ARESETN : in STD_LOGIC;
    AXI_STR_TXC_TVALID : in STD_LOGIC;
    AXI_STR_TXC_TREADY : out STD_LOGIC;
    AXI_STR_TXC_TLAST : in STD_LOGIC;
    AXI_STR_TXC_TKEEP : in STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_STR_TXC_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_STR_RXD_ACLK : in STD_LOGIC;
    AXI_STR_RXD_ARESETN : in STD_LOGIC;
    AXI_STR_RXD_VALID : out STD_LOGIC;
    AXI_STR_RXD_READY : in STD_LOGIC;
    AXI_STR_RXD_LAST : out STD_LOGIC;
    AXI_STR_RXD_KEEP : out STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_STR_RXD_DATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_STR_RXS_ACLK : in STD_LOGIC;
    AXI_STR_RXS_ARESETN : in STD_LOGIC;
    AXI_STR_RXS_VALID : out STD_LOGIC;
    AXI_STR_RXS_READY : in STD_LOGIC;
    AXI_STR_RXS_LAST : out STD_LOGIC;
    AXI_STR_RXS_KEEP : out STD_LOGIC_VECTOR ( 3 downto 0 );
    AXI_STR_RXS_DATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pause_req : out STD_LOGIC;
    pause_val : out STD_LOGIC_VECTOR ( 16 to 31 );
    S_AXI_2TEMAC_AWADDR : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_2TEMAC_AWVALID : out STD_LOGIC;
    S_AXI_2TEMAC_AWREADY : in STD_LOGIC;
    S_AXI_2TEMAC_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_2TEMAC_WVALID : out STD_LOGIC;
    S_AXI_2TEMAC_WREADY : in STD_LOGIC;
    S_AXI_2TEMAC_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_2TEMAC_BVALID : in STD_LOGIC;
    S_AXI_2TEMAC_BREADY : out STD_LOGIC;
    S_AXI_2TEMAC_ARADDR : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXI_2TEMAC_ARVALID : out STD_LOGIC;
    S_AXI_2TEMAC_ARREADY : in STD_LOGIC;
    S_AXI_2TEMAC_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_2TEMAC_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_2TEMAC_RVALID : in STD_LOGIC;
    S_AXI_2TEMAC_RREADY : out STD_LOGIC;
    RX_CLK_ENABLE_IN : in STD_LOGIC;
    rx_statistics_vector : in STD_LOGIC_VECTOR ( 27 downto 0 );
    rx_statistics_valid : in STD_LOGIC;
    rx_mac_aclk : in STD_LOGIC;
    rx_reset : in STD_LOGIC;
    rx_axis_mac_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rx_axis_mac_tvalid : in STD_LOGIC;
    rx_axis_mac_tlast : in STD_LOGIC;
    rx_axis_mac_tuser : in STD_LOGIC;
    tx_ifg_delay : out STD_LOGIC_VECTOR ( 24 to 31 );
    tx_mac_aclk : in STD_LOGIC;
    tx_reset : in STD_LOGIC;
    tx_axis_mac_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_axis_mac_tvalid : out STD_LOGIC;
    tx_axis_mac_tlast : out STD_LOGIC;
    tx_axis_mac_tuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    tx_axis_mac_tready : in STD_LOGIC;
    speed_is_10_100 : in STD_LOGIC;
    RESET2PCSPMA : out STD_LOGIC;
    RESET2TEMACn : out STD_LOGIC;
    PHY_RST_N : out STD_LOGIC;
    mdio_i_top : in STD_LOGIC;
    mdio_o_top : out STD_LOGIC;
    mdio_t_top : out STD_LOGIC;
    mdc_top : out STD_LOGIC;
    mdio_t_pcspma : in STD_LOGIC;
    mdio_o_pcspma : in STD_LOGIC;
    mdio_i_temac : out STD_LOGIC;
    mdio_o_temac : in STD_LOGIC;
    mdio_t_temac : in STD_LOGIC;
    mdc_temac : in STD_LOGIC;
    GTX_CLK : in STD_LOGIC
  );
  end component bd_0_eth_buf_0;
  component bd_0_eth_mac_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_resetn : in STD_LOGIC;
    gtx_clk : in STD_LOGIC;
    glbl_rstn : in STD_LOGIC;
    rx_axi_rstn : in STD_LOGIC;
    tx_axi_rstn : in STD_LOGIC;
    rx_statistics_vector : out STD_LOGIC_VECTOR ( 27 downto 0 );
    rx_statistics_valid : out STD_LOGIC;
    rx_mac_aclk : out STD_LOGIC;
    rx_reset : out STD_LOGIC;
    rx_axis_filter_tuser : out STD_LOGIC_VECTOR ( 4 downto 0 );
    rx_axis_mac_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rx_axis_mac_tvalid : out STD_LOGIC;
    rx_axis_mac_tlast : out STD_LOGIC;
    rx_axis_mac_tuser : out STD_LOGIC;
    tx_ifg_delay : in STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_statistics_vector : out STD_LOGIC_VECTOR ( 31 downto 0 );
    tx_statistics_valid : out STD_LOGIC;
    tx_mac_aclk : out STD_LOGIC;
    tx_reset : out STD_LOGIC;
    tx_axis_mac_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    tx_axis_mac_tvalid : in STD_LOGIC;
    tx_axis_mac_tlast : in STD_LOGIC;
    tx_axis_mac_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    tx_axis_mac_tready : out STD_LOGIC;
    pause_req : in STD_LOGIC;
    pause_val : in STD_LOGIC_VECTOR ( 15 downto 0 );
    clk_enable : in STD_LOGIC;
    speedis100 : out STD_LOGIC;
    speedis10100 : out STD_LOGIC;
    gmii_txd : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_tx_en : out STD_LOGIC;
    gmii_tx_er : out STD_LOGIC;
    gmii_rxd : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_rx_dv : in STD_LOGIC;
    gmii_rx_er : in STD_LOGIC;
    mdio_i : in STD_LOGIC;
    mdio_t : out STD_LOGIC;
    mdio_o : out STD_LOGIC;
    mdc : out STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    mac_irq : out STD_LOGIC
  );
  end component bd_0_eth_mac_0;
  component bd_0_pcs_pma_0 is
  port (
    gtrefclk_p : in STD_LOGIC;
    gtrefclk_n : in STD_LOGIC;
    gtrefclk_out : out STD_LOGIC;
    txn : out STD_LOGIC;
    txp : out STD_LOGIC;
    rxn : in STD_LOGIC;
    rxp : in STD_LOGIC;
    independent_clock_bufg : in STD_LOGIC;
    userclk_out : out STD_LOGIC;
    userclk2_out : out STD_LOGIC;
    rxuserclk_out : out STD_LOGIC;
    rxuserclk2_out : out STD_LOGIC;
    resetdone : out STD_LOGIC;
    pma_reset_out : out STD_LOGIC;
    mmcm_locked_out : out STD_LOGIC;
    sgmii_clk_r : out STD_LOGIC;
    sgmii_clk_f : out STD_LOGIC;
    sgmii_clk_en : out STD_LOGIC;
    gmii_txd : in STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_tx_en : in STD_LOGIC;
    gmii_tx_er : in STD_LOGIC;
    gmii_rxd : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gmii_rx_dv : out STD_LOGIC;
    gmii_rx_er : out STD_LOGIC;
    gmii_isolate : out STD_LOGIC;
    mdc : in STD_LOGIC;
    mdio_i : in STD_LOGIC;
    mdio_o : out STD_LOGIC;
    ext_mdc : out STD_LOGIC;
    ext_mdio_i : in STD_LOGIC;
    mdio_t_in : in STD_LOGIC;
    ext_mdio_o : out STD_LOGIC;
    ext_mdio_t : out STD_LOGIC;
    mdio_t : out STD_LOGIC;
    configuration_vector : in STD_LOGIC_VECTOR ( 4 downto 0 );
    configuration_valid : in STD_LOGIC;
    an_interrupt : out STD_LOGIC;
    an_adv_config_vector : in STD_LOGIC_VECTOR ( 15 downto 0 );
    an_adv_config_val : in STD_LOGIC;
    an_restart_config : in STD_LOGIC;
    speed_is_10_100 : in STD_LOGIC;
    speed_is_100 : in STD_LOGIC;
    status_vector : out STD_LOGIC_VECTOR ( 15 downto 0 );
    reset : in STD_LOGIC;
    signal_detect : in STD_LOGIC;
    gt0_pll0outclk_out : out STD_LOGIC;
    gt0_pll0outrefclk_out : out STD_LOGIC;
    gt0_pll1outclk_out : out STD_LOGIC;
    gt0_pll1outrefclk_out : out STD_LOGIC;
    gt0_pll0lock_out : out STD_LOGIC;
    gt0_pll0refclklost_out : out STD_LOGIC
  );
  end component bd_0_pcs_pma_0;
  signal GND_1 : STD_LOGIC;
  signal VCC_1 : STD_LOGIC;
  signal axi_rxd_arstn_1 : STD_LOGIC;
  signal axi_rxs_arstn_1 : STD_LOGIC;
  signal axi_txc_arstn_1 : STD_LOGIC;
  signal axi_txd_arstn_1 : STD_LOGIC;
  signal axis_clk_1 : STD_LOGIC;
  signal eth_buf_AXI_STR_RXD_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal eth_buf_AXI_STR_RXD_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal eth_buf_AXI_STR_RXD_TLAST : STD_LOGIC;
  signal eth_buf_AXI_STR_RXD_TREADY : STD_LOGIC;
  signal eth_buf_AXI_STR_RXD_TVALID : STD_LOGIC;
  signal eth_buf_AXI_STR_RXS_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal eth_buf_AXI_STR_RXS_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal eth_buf_AXI_STR_RXS_TLAST : STD_LOGIC;
  signal eth_buf_AXI_STR_RXS_TREADY : STD_LOGIC;
  signal eth_buf_AXI_STR_RXS_TVALID : STD_LOGIC;
  signal eth_buf_INTERRUPT : STD_LOGIC;
  signal eth_buf_PHY_RST_N : STD_LOGIC;
  signal eth_buf_RESET2PCSPMA : STD_LOGIC;
  signal eth_buf_RESET2TEMACn : STD_LOGIC;
  signal eth_buf_S_AXI_2TEMAC_ARADDR : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal eth_buf_S_AXI_2TEMAC_ARREADY : STD_LOGIC;
  signal eth_buf_S_AXI_2TEMAC_ARVALID : STD_LOGIC;
  signal eth_buf_S_AXI_2TEMAC_AWADDR : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal eth_buf_S_AXI_2TEMAC_AWREADY : STD_LOGIC;
  signal eth_buf_S_AXI_2TEMAC_AWVALID : STD_LOGIC;
  signal eth_buf_S_AXI_2TEMAC_BREADY : STD_LOGIC;
  signal eth_buf_S_AXI_2TEMAC_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal eth_buf_S_AXI_2TEMAC_BVALID : STD_LOGIC;
  signal eth_buf_S_AXI_2TEMAC_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal eth_buf_S_AXI_2TEMAC_RREADY : STD_LOGIC;
  signal eth_buf_S_AXI_2TEMAC_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal eth_buf_S_AXI_2TEMAC_RVALID : STD_LOGIC;
  signal eth_buf_S_AXI_2TEMAC_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal eth_buf_S_AXI_2TEMAC_WREADY : STD_LOGIC;
  signal eth_buf_S_AXI_2TEMAC_WVALID : STD_LOGIC;
  signal eth_buf_TX_AXIS_MAC_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal eth_buf_TX_AXIS_MAC_TLAST : STD_LOGIC;
  signal eth_buf_TX_AXIS_MAC_TREADY : STD_LOGIC;
  signal eth_buf_TX_AXIS_MAC_TUSER : STD_LOGIC_VECTOR ( 0 to 0 );
  signal eth_buf_TX_AXIS_MAC_TVALID : STD_LOGIC;
  signal eth_buf_pause_req : STD_LOGIC;
  signal eth_buf_pause_val : STD_LOGIC_VECTOR ( 16 to 31 );
  signal eth_buf_tx_ifg_delay : STD_LOGIC_VECTOR ( 24 to 31 );
  signal eth_mac_gmii_RXD : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal eth_mac_gmii_RX_DV : STD_LOGIC;
  signal eth_mac_gmii_RX_ER : STD_LOGIC;
  signal eth_mac_gmii_TXD : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal eth_mac_gmii_TX_EN : STD_LOGIC;
  signal eth_mac_gmii_TX_ER : STD_LOGIC;
  signal eth_mac_m_axis_rx_TDATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal eth_mac_m_axis_rx_TLAST : STD_LOGIC;
  signal eth_mac_m_axis_rx_TUSER : STD_LOGIC;
  signal eth_mac_m_axis_rx_TVALID : STD_LOGIC;
  signal eth_mac_mac_irq : STD_LOGIC;
  signal eth_mac_mdc : STD_LOGIC;
  signal eth_mac_mdio_o : STD_LOGIC;
  signal eth_mac_mdio_t : STD_LOGIC;
  signal eth_mac_rx_mac_aclk : STD_LOGIC;
  signal eth_mac_rx_reset : STD_LOGIC;
  signal eth_mac_rx_statistics_valid : STD_LOGIC;
  signal eth_mac_rx_statistics_vector : STD_LOGIC_VECTOR ( 27 downto 0 );
  signal eth_mac_speedis100 : STD_LOGIC;
  signal eth_mac_speedis10100 : STD_LOGIC;
  signal eth_mac_tx_mac_aclk : STD_LOGIC;
  signal eth_mac_tx_reset : STD_LOGIC;
  signal mgt_clk_1_CLK_N : STD_LOGIC;
  signal mgt_clk_1_CLK_P : STD_LOGIC;
  signal pcs_pma_an_interrupt : STD_LOGIC;
  signal pcs_pma_ext_mdio_pcs_pma_MDC : STD_LOGIC;
  signal pcs_pma_ext_mdio_pcs_pma_MDIO_I : STD_LOGIC;
  signal pcs_pma_ext_mdio_pcs_pma_MDIO_O : STD_LOGIC;
  signal pcs_pma_ext_mdio_pcs_pma_MDIO_T : STD_LOGIC;
  signal pcs_pma_gt0_pll0lock_out : STD_LOGIC;
  signal pcs_pma_gt0_pll0outclk_out : STD_LOGIC;
  signal pcs_pma_gt0_pll0outrefclk_out : STD_LOGIC;
  signal pcs_pma_gt0_pll0refclklost_out : STD_LOGIC;
  signal pcs_pma_gt0_pll1outclk_out : STD_LOGIC;
  signal pcs_pma_gt0_pll1outrefclk_out : STD_LOGIC;
  signal pcs_pma_gtrefclk_out : STD_LOGIC;
  signal pcs_pma_mdio_o : STD_LOGIC;
  signal pcs_pma_mmcm_locked_out : STD_LOGIC;
  signal pcs_pma_pma_reset_out : STD_LOGIC;
  signal pcs_pma_resetdone : STD_LOGIC;
  signal pcs_pma_rxuserclk2_out : STD_LOGIC;
  signal pcs_pma_rxuserclk_out : STD_LOGIC;
  signal pcs_pma_sgmii_RXN : STD_LOGIC;
  signal pcs_pma_sgmii_RXP : STD_LOGIC;
  signal pcs_pma_sgmii_TXN : STD_LOGIC;
  signal pcs_pma_sgmii_TXP : STD_LOGIC;
  signal pcs_pma_sgmii_clk_en : STD_LOGIC;
  signal pcs_pma_status_vector : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal pcs_pma_userclk2_out : STD_LOGIC;
  signal pcs_pma_userclk_out : STD_LOGIC;
  signal ref_clk_1 : STD_LOGIC;
  signal s_axi_1_ARADDR : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal s_axi_1_ARREADY : STD_LOGIC;
  signal s_axi_1_ARVALID : STD_LOGIC;
  signal s_axi_1_AWADDR : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal s_axi_1_AWREADY : STD_LOGIC;
  signal s_axi_1_AWVALID : STD_LOGIC;
  signal s_axi_1_BREADY : STD_LOGIC;
  signal s_axi_1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s_axi_1_BVALID : STD_LOGIC;
  signal s_axi_1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s_axi_1_RREADY : STD_LOGIC;
  signal s_axi_1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s_axi_1_RVALID : STD_LOGIC;
  signal s_axi_1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s_axi_1_WREADY : STD_LOGIC;
  signal s_axi_1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s_axi_1_WVALID : STD_LOGIC;
  signal s_axi_lite_clk_1 : STD_LOGIC;
  signal s_axi_lite_resetn_1 : STD_LOGIC;
  signal s_axis_txc_1_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s_axis_txc_1_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s_axis_txc_1_TLAST : STD_LOGIC;
  signal s_axis_txc_1_TREADY : STD_LOGIC;
  signal s_axis_txc_1_TVALID : STD_LOGIC;
  signal s_axis_txd_1_TDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s_axis_txd_1_TKEEP : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s_axis_txd_1_TLAST : STD_LOGIC;
  signal s_axis_txd_1_TREADY : STD_LOGIC;
  signal s_axis_txd_1_TVALID : STD_LOGIC;
  signal signal_detect_1 : STD_LOGIC;
  signal NLW_eth_buf_mdc_top_UNCONNECTED : STD_LOGIC;
  signal NLW_eth_buf_mdio_i_temac_UNCONNECTED : STD_LOGIC;
  signal NLW_eth_buf_mdio_o_top_UNCONNECTED : STD_LOGIC;
  signal NLW_eth_buf_mdio_t_top_UNCONNECTED : STD_LOGIC;
  signal NLW_eth_mac_tx_statistics_valid_UNCONNECTED : STD_LOGIC;
  signal NLW_eth_mac_rx_axis_filter_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_eth_mac_tx_statistics_vector_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_pcs_pma_gmii_isolate_UNCONNECTED : STD_LOGIC;
  signal NLW_pcs_pma_mdio_t_UNCONNECTED : STD_LOGIC;
  signal NLW_pcs_pma_sgmii_clk_f_UNCONNECTED : STD_LOGIC;
  signal NLW_pcs_pma_sgmii_clk_r_UNCONNECTED : STD_LOGIC;
begin
  axi_rxd_arstn_1 <= axi_rxd_arstn;
  axi_rxs_arstn_1 <= axi_rxs_arstn;
  axi_txc_arstn_1 <= axi_txc_arstn;
  axi_txd_arstn_1 <= axi_txd_arstn;
  axis_clk_1 <= axis_clk;
  eth_buf_AXI_STR_RXD_TREADY <= m_axis_rxd_tready;
  eth_buf_AXI_STR_RXS_TREADY <= m_axis_rxs_tready;
  gt0_pll0lock_out <= pcs_pma_gt0_pll0lock_out;
  gt0_pll0outclk_out <= pcs_pma_gt0_pll0outclk_out;
  gt0_pll0outrefclk_out <= pcs_pma_gt0_pll0outrefclk_out;
  gt0_pll0refclklost_out <= pcs_pma_gt0_pll0refclklost_out;
  gt0_pll1outclk_out <= pcs_pma_gt0_pll1outclk_out;
  gt0_pll1outrefclk_out <= pcs_pma_gt0_pll1outrefclk_out;
  gtref_clk_out <= pcs_pma_gtrefclk_out;
  interrupt <= eth_buf_INTERRUPT;
  m_axis_rxd_tdata(31 downto 0) <= eth_buf_AXI_STR_RXD_TDATA(31 downto 0);
  m_axis_rxd_tkeep(3 downto 0) <= eth_buf_AXI_STR_RXD_TKEEP(3 downto 0);
  m_axis_rxd_tlast <= eth_buf_AXI_STR_RXD_TLAST;
  m_axis_rxd_tvalid <= eth_buf_AXI_STR_RXD_TVALID;
  m_axis_rxs_tdata(31 downto 0) <= eth_buf_AXI_STR_RXS_TDATA(31 downto 0);
  m_axis_rxs_tkeep(3 downto 0) <= eth_buf_AXI_STR_RXS_TKEEP(3 downto 0);
  m_axis_rxs_tlast <= eth_buf_AXI_STR_RXS_TLAST;
  m_axis_rxs_tvalid <= eth_buf_AXI_STR_RXS_TVALID;
  mac_irq <= eth_mac_mac_irq;
  mdio_mdc <= pcs_pma_ext_mdio_pcs_pma_MDC;
  mdio_mdio_o <= pcs_pma_ext_mdio_pcs_pma_MDIO_O;
  mdio_mdio_t <= pcs_pma_ext_mdio_pcs_pma_MDIO_T;
  mgt_clk_1_CLK_N <= mgt_clk_clk_n;
  mgt_clk_1_CLK_P <= mgt_clk_clk_p;
  mmcm_locked_out <= pcs_pma_mmcm_locked_out;
  pcs_pma_ext_mdio_pcs_pma_MDIO_I <= mdio_mdio_i;
  pcs_pma_sgmii_RXN <= sgmii_rxn;
  pcs_pma_sgmii_RXP <= sgmii_rxp;
  phy_rst_n <= eth_buf_PHY_RST_N;
  pma_reset_out <= pcs_pma_pma_reset_out;
  ref_clk_1 <= ref_clk;
  rxuserclk2_out <= pcs_pma_rxuserclk2_out;
  rxuserclk_out <= pcs_pma_rxuserclk_out;
  s_axi_1_ARADDR(17 downto 0) <= s_axi_araddr(17 downto 0);
  s_axi_1_ARVALID <= s_axi_arvalid;
  s_axi_1_AWADDR(17 downto 0) <= s_axi_awaddr(17 downto 0);
  s_axi_1_AWVALID <= s_axi_awvalid;
  s_axi_1_BREADY <= s_axi_bready;
  s_axi_1_RREADY <= s_axi_rready;
  s_axi_1_WDATA(31 downto 0) <= s_axi_wdata(31 downto 0);
  s_axi_1_WSTRB(3 downto 0) <= s_axi_wstrb(3 downto 0);
  s_axi_1_WVALID <= s_axi_wvalid;
  s_axi_arready <= s_axi_1_ARREADY;
  s_axi_awready <= s_axi_1_AWREADY;
  s_axi_bresp(1 downto 0) <= s_axi_1_BRESP(1 downto 0);
  s_axi_bvalid <= s_axi_1_BVALID;
  s_axi_lite_clk_1 <= s_axi_lite_clk;
  s_axi_lite_resetn_1 <= s_axi_lite_resetn;
  s_axi_rdata(31 downto 0) <= s_axi_1_RDATA(31 downto 0);
  s_axi_rresp(1 downto 0) <= s_axi_1_RRESP(1 downto 0);
  s_axi_rvalid <= s_axi_1_RVALID;
  s_axi_wready <= s_axi_1_WREADY;
  s_axis_txc_1_TDATA(31 downto 0) <= s_axis_txc_tdata(31 downto 0);
  s_axis_txc_1_TKEEP(3 downto 0) <= s_axis_txc_tkeep(3 downto 0);
  s_axis_txc_1_TLAST <= s_axis_txc_tlast;
  s_axis_txc_1_TVALID <= s_axis_txc_tvalid;
  s_axis_txc_tready <= s_axis_txc_1_TREADY;
  s_axis_txd_1_TDATA(31 downto 0) <= s_axis_txd_tdata(31 downto 0);
  s_axis_txd_1_TKEEP(3 downto 0) <= s_axis_txd_tkeep(3 downto 0);
  s_axis_txd_1_TLAST <= s_axis_txd_tlast;
  s_axis_txd_1_TVALID <= s_axis_txd_tvalid;
  s_axis_txd_tready <= s_axis_txd_1_TREADY;
  sgmii_txn <= pcs_pma_sgmii_TXN;
  sgmii_txp <= pcs_pma_sgmii_TXP;
  signal_detect_1 <= signal_detect;
  userclk2_out <= pcs_pma_userclk2_out;
  userclk_out <= pcs_pma_userclk_out;
GND: unisim.vcomponents.GND
    port map (
      G => GND_1
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => VCC_1
    );
eth_buf: component bd_0_eth_buf_0
    port map (
      AXI_STR_RXD_ACLK => axis_clk_1,
      AXI_STR_RXD_ARESETN => axi_rxd_arstn_1,
      AXI_STR_RXD_DATA(31 downto 0) => eth_buf_AXI_STR_RXD_TDATA(31 downto 0),
      AXI_STR_RXD_KEEP(3 downto 0) => eth_buf_AXI_STR_RXD_TKEEP(3 downto 0),
      AXI_STR_RXD_LAST => eth_buf_AXI_STR_RXD_TLAST,
      AXI_STR_RXD_READY => eth_buf_AXI_STR_RXD_TREADY,
      AXI_STR_RXD_VALID => eth_buf_AXI_STR_RXD_TVALID,
      AXI_STR_RXS_ACLK => axis_clk_1,
      AXI_STR_RXS_ARESETN => axi_rxs_arstn_1,
      AXI_STR_RXS_DATA(31 downto 0) => eth_buf_AXI_STR_RXS_TDATA(31 downto 0),
      AXI_STR_RXS_KEEP(3 downto 0) => eth_buf_AXI_STR_RXS_TKEEP(3 downto 0),
      AXI_STR_RXS_LAST => eth_buf_AXI_STR_RXS_TLAST,
      AXI_STR_RXS_READY => eth_buf_AXI_STR_RXS_TREADY,
      AXI_STR_RXS_VALID => eth_buf_AXI_STR_RXS_TVALID,
      AXI_STR_TXC_ACLK => axis_clk_1,
      AXI_STR_TXC_ARESETN => axi_txc_arstn_1,
      AXI_STR_TXC_TDATA(31 downto 0) => s_axis_txc_1_TDATA(31 downto 0),
      AXI_STR_TXC_TKEEP(3 downto 0) => s_axis_txc_1_TKEEP(3 downto 0),
      AXI_STR_TXC_TLAST => s_axis_txc_1_TLAST,
      AXI_STR_TXC_TREADY => s_axis_txc_1_TREADY,
      AXI_STR_TXC_TVALID => s_axis_txc_1_TVALID,
      AXI_STR_TXD_ACLK => axis_clk_1,
      AXI_STR_TXD_ARESETN => axi_txd_arstn_1,
      AXI_STR_TXD_TDATA(31 downto 0) => s_axis_txd_1_TDATA(31 downto 0),
      AXI_STR_TXD_TKEEP(3 downto 0) => s_axis_txd_1_TKEEP(3 downto 0),
      AXI_STR_TXD_TLAST => s_axis_txd_1_TLAST,
      AXI_STR_TXD_TREADY => s_axis_txd_1_TREADY,
      AXI_STR_TXD_TVALID => s_axis_txd_1_TVALID,
      EMAC_CLIENT_AUTONEG_INT => pcs_pma_an_interrupt,
      EMAC_RESET_DONE_INT => pcs_pma_resetdone,
      EMAC_RX_DCM_LOCKED_INT => pcs_pma_mmcm_locked_out,
      GTX_CLK => pcs_pma_userclk2_out,
      INTERRUPT => eth_buf_INTERRUPT,
      PCSPMA_STATUS_VECTOR(15 downto 0) => pcs_pma_status_vector(15 downto 0),
      PHY_RST_N => eth_buf_PHY_RST_N,
      RESET2PCSPMA => eth_buf_RESET2PCSPMA,
      RESET2TEMACn => eth_buf_RESET2TEMACn,
      RX_CLK_ENABLE_IN => pcs_pma_sgmii_clk_en,
      S_AXI_2TEMAC_ARADDR(11 downto 0) => eth_buf_S_AXI_2TEMAC_ARADDR(11 downto 0),
      S_AXI_2TEMAC_ARREADY => eth_buf_S_AXI_2TEMAC_ARREADY,
      S_AXI_2TEMAC_ARVALID => eth_buf_S_AXI_2TEMAC_ARVALID,
      S_AXI_2TEMAC_AWADDR(11 downto 0) => eth_buf_S_AXI_2TEMAC_AWADDR(11 downto 0),
      S_AXI_2TEMAC_AWREADY => eth_buf_S_AXI_2TEMAC_AWREADY,
      S_AXI_2TEMAC_AWVALID => eth_buf_S_AXI_2TEMAC_AWVALID,
      S_AXI_2TEMAC_BREADY => eth_buf_S_AXI_2TEMAC_BREADY,
      S_AXI_2TEMAC_BRESP(1 downto 0) => eth_buf_S_AXI_2TEMAC_BRESP(1 downto 0),
      S_AXI_2TEMAC_BVALID => eth_buf_S_AXI_2TEMAC_BVALID,
      S_AXI_2TEMAC_RDATA(31 downto 0) => eth_buf_S_AXI_2TEMAC_RDATA(31 downto 0),
      S_AXI_2TEMAC_RREADY => eth_buf_S_AXI_2TEMAC_RREADY,
      S_AXI_2TEMAC_RRESP(1 downto 0) => eth_buf_S_AXI_2TEMAC_RRESP(1 downto 0),
      S_AXI_2TEMAC_RVALID => eth_buf_S_AXI_2TEMAC_RVALID,
      S_AXI_2TEMAC_WDATA(31 downto 0) => eth_buf_S_AXI_2TEMAC_WDATA(31 downto 0),
      S_AXI_2TEMAC_WREADY => eth_buf_S_AXI_2TEMAC_WREADY,
      S_AXI_2TEMAC_WVALID => eth_buf_S_AXI_2TEMAC_WVALID,
      S_AXI_ACLK => s_axi_lite_clk_1,
      S_AXI_ARADDR(17 downto 0) => s_axi_1_ARADDR(17 downto 0),
      S_AXI_ARESETN => s_axi_lite_resetn_1,
      S_AXI_ARREADY => s_axi_1_ARREADY,
      S_AXI_ARVALID => s_axi_1_ARVALID,
      S_AXI_AWADDR(17 downto 0) => s_axi_1_AWADDR(17 downto 0),
      S_AXI_AWREADY => s_axi_1_AWREADY,
      S_AXI_AWVALID => s_axi_1_AWVALID,
      S_AXI_BREADY => s_axi_1_BREADY,
      S_AXI_BRESP(1 downto 0) => s_axi_1_BRESP(1 downto 0),
      S_AXI_BVALID => s_axi_1_BVALID,
      S_AXI_RDATA(31 downto 0) => s_axi_1_RDATA(31 downto 0),
      S_AXI_RREADY => s_axi_1_RREADY,
      S_AXI_RRESP(1 downto 0) => s_axi_1_RRESP(1 downto 0),
      S_AXI_RVALID => s_axi_1_RVALID,
      S_AXI_WDATA(31 downto 0) => s_axi_1_WDATA(31 downto 0),
      S_AXI_WREADY => s_axi_1_WREADY,
      S_AXI_WSTRB(3 downto 0) => s_axi_1_WSTRB(3 downto 0),
      S_AXI_WVALID => s_axi_1_WVALID,
      mdc_temac => VCC_1,
      mdc_top => NLW_eth_buf_mdc_top_UNCONNECTED,
      mdio_i_temac => NLW_eth_buf_mdio_i_temac_UNCONNECTED,
      mdio_i_top => VCC_1,
      mdio_o_pcspma => GND_1,
      mdio_o_temac => VCC_1,
      mdio_o_top => NLW_eth_buf_mdio_o_top_UNCONNECTED,
      mdio_t_pcspma => GND_1,
      mdio_t_temac => VCC_1,
      mdio_t_top => NLW_eth_buf_mdio_t_top_UNCONNECTED,
      pause_req => eth_buf_pause_req,
      pause_val(16 to 31) => eth_buf_pause_val(16 to 31),
      rx_axis_mac_tdata(7 downto 0) => eth_mac_m_axis_rx_TDATA(7 downto 0),
      rx_axis_mac_tlast => eth_mac_m_axis_rx_TLAST,
      rx_axis_mac_tuser => eth_mac_m_axis_rx_TUSER,
      rx_axis_mac_tvalid => eth_mac_m_axis_rx_TVALID,
      rx_mac_aclk => eth_mac_rx_mac_aclk,
      rx_reset => eth_mac_rx_reset,
      rx_statistics_valid => eth_mac_rx_statistics_valid,
      rx_statistics_vector(27 downto 0) => eth_mac_rx_statistics_vector(27 downto 0),
      speed_is_10_100 => eth_mac_speedis10100,
      tx_axis_mac_tdata(7 downto 0) => eth_buf_TX_AXIS_MAC_TDATA(7 downto 0),
      tx_axis_mac_tlast => eth_buf_TX_AXIS_MAC_TLAST,
      tx_axis_mac_tready => eth_buf_TX_AXIS_MAC_TREADY,
      tx_axis_mac_tuser(0) => eth_buf_TX_AXIS_MAC_TUSER(0),
      tx_axis_mac_tvalid => eth_buf_TX_AXIS_MAC_TVALID,
      tx_ifg_delay(24 to 31) => eth_buf_tx_ifg_delay(24 to 31),
      tx_mac_aclk => eth_mac_tx_mac_aclk,
      tx_reset => eth_mac_tx_reset
    );
eth_mac: component bd_0_eth_mac_0
    port map (
      clk_enable => pcs_pma_sgmii_clk_en,
      glbl_rstn => eth_buf_RESET2TEMACn,
      gmii_rx_dv => eth_mac_gmii_RX_DV,
      gmii_rx_er => eth_mac_gmii_RX_ER,
      gmii_rxd(7 downto 0) => eth_mac_gmii_RXD(7 downto 0),
      gmii_tx_en => eth_mac_gmii_TX_EN,
      gmii_tx_er => eth_mac_gmii_TX_ER,
      gmii_txd(7 downto 0) => eth_mac_gmii_TXD(7 downto 0),
      gtx_clk => pcs_pma_userclk2_out,
      mac_irq => eth_mac_mac_irq,
      mdc => eth_mac_mdc,
      mdio_i => pcs_pma_mdio_o,
      mdio_o => eth_mac_mdio_o,
      mdio_t => eth_mac_mdio_t,
      pause_req => eth_buf_pause_req,
      pause_val(15) => eth_buf_pause_val(16),
      pause_val(14) => eth_buf_pause_val(17),
      pause_val(13) => eth_buf_pause_val(18),
      pause_val(12) => eth_buf_pause_val(19),
      pause_val(11) => eth_buf_pause_val(20),
      pause_val(10) => eth_buf_pause_val(21),
      pause_val(9) => eth_buf_pause_val(22),
      pause_val(8) => eth_buf_pause_val(23),
      pause_val(7) => eth_buf_pause_val(24),
      pause_val(6) => eth_buf_pause_val(25),
      pause_val(5) => eth_buf_pause_val(26),
      pause_val(4) => eth_buf_pause_val(27),
      pause_val(3) => eth_buf_pause_val(28),
      pause_val(2) => eth_buf_pause_val(29),
      pause_val(1) => eth_buf_pause_val(30),
      pause_val(0) => eth_buf_pause_val(31),
      rx_axi_rstn => eth_buf_RESET2TEMACn,
      rx_axis_filter_tuser(4 downto 0) => NLW_eth_mac_rx_axis_filter_tuser_UNCONNECTED(4 downto 0),
      rx_axis_mac_tdata(7 downto 0) => eth_mac_m_axis_rx_TDATA(7 downto 0),
      rx_axis_mac_tlast => eth_mac_m_axis_rx_TLAST,
      rx_axis_mac_tuser => eth_mac_m_axis_rx_TUSER,
      rx_axis_mac_tvalid => eth_mac_m_axis_rx_TVALID,
      rx_mac_aclk => eth_mac_rx_mac_aclk,
      rx_reset => eth_mac_rx_reset,
      rx_statistics_valid => eth_mac_rx_statistics_valid,
      rx_statistics_vector(27 downto 0) => eth_mac_rx_statistics_vector(27 downto 0),
      s_axi_aclk => s_axi_lite_clk_1,
      s_axi_araddr(11 downto 0) => eth_buf_S_AXI_2TEMAC_ARADDR(11 downto 0),
      s_axi_arready => eth_buf_S_AXI_2TEMAC_ARREADY,
      s_axi_arvalid => eth_buf_S_AXI_2TEMAC_ARVALID,
      s_axi_awaddr(11 downto 0) => eth_buf_S_AXI_2TEMAC_AWADDR(11 downto 0),
      s_axi_awready => eth_buf_S_AXI_2TEMAC_AWREADY,
      s_axi_awvalid => eth_buf_S_AXI_2TEMAC_AWVALID,
      s_axi_bready => eth_buf_S_AXI_2TEMAC_BREADY,
      s_axi_bresp(1 downto 0) => eth_buf_S_AXI_2TEMAC_BRESP(1 downto 0),
      s_axi_bvalid => eth_buf_S_AXI_2TEMAC_BVALID,
      s_axi_rdata(31 downto 0) => eth_buf_S_AXI_2TEMAC_RDATA(31 downto 0),
      s_axi_resetn => s_axi_lite_resetn_1,
      s_axi_rready => eth_buf_S_AXI_2TEMAC_RREADY,
      s_axi_rresp(1 downto 0) => eth_buf_S_AXI_2TEMAC_RRESP(1 downto 0),
      s_axi_rvalid => eth_buf_S_AXI_2TEMAC_RVALID,
      s_axi_wdata(31 downto 0) => eth_buf_S_AXI_2TEMAC_WDATA(31 downto 0),
      s_axi_wready => eth_buf_S_AXI_2TEMAC_WREADY,
      s_axi_wvalid => eth_buf_S_AXI_2TEMAC_WVALID,
      speedis100 => eth_mac_speedis100,
      speedis10100 => eth_mac_speedis10100,
      tx_axi_rstn => eth_buf_RESET2TEMACn,
      tx_axis_mac_tdata(7 downto 0) => eth_buf_TX_AXIS_MAC_TDATA(7 downto 0),
      tx_axis_mac_tlast => eth_buf_TX_AXIS_MAC_TLAST,
      tx_axis_mac_tready => eth_buf_TX_AXIS_MAC_TREADY,
      tx_axis_mac_tuser(0) => eth_buf_TX_AXIS_MAC_TUSER(0),
      tx_axis_mac_tvalid => eth_buf_TX_AXIS_MAC_TVALID,
      tx_ifg_delay(7) => eth_buf_tx_ifg_delay(24),
      tx_ifg_delay(6) => eth_buf_tx_ifg_delay(25),
      tx_ifg_delay(5) => eth_buf_tx_ifg_delay(26),
      tx_ifg_delay(4) => eth_buf_tx_ifg_delay(27),
      tx_ifg_delay(3) => eth_buf_tx_ifg_delay(28),
      tx_ifg_delay(2) => eth_buf_tx_ifg_delay(29),
      tx_ifg_delay(1) => eth_buf_tx_ifg_delay(30),
      tx_ifg_delay(0) => eth_buf_tx_ifg_delay(31),
      tx_mac_aclk => eth_mac_tx_mac_aclk,
      tx_reset => eth_mac_tx_reset,
      tx_statistics_valid => NLW_eth_mac_tx_statistics_valid_UNCONNECTED,
      tx_statistics_vector(31 downto 0) => NLW_eth_mac_tx_statistics_vector_UNCONNECTED(31 downto 0)
    );
pcs_pma: component bd_0_pcs_pma_0
    port map (
      an_adv_config_val => GND_1,
      an_adv_config_vector(15) => GND_1,
      an_adv_config_vector(14) => GND_1,
      an_adv_config_vector(13) => GND_1,
      an_adv_config_vector(12) => GND_1,
      an_adv_config_vector(11) => GND_1,
      an_adv_config_vector(10) => GND_1,
      an_adv_config_vector(9) => GND_1,
      an_adv_config_vector(8) => GND_1,
      an_adv_config_vector(7) => GND_1,
      an_adv_config_vector(6) => GND_1,
      an_adv_config_vector(5) => GND_1,
      an_adv_config_vector(4) => GND_1,
      an_adv_config_vector(3) => GND_1,
      an_adv_config_vector(2) => GND_1,
      an_adv_config_vector(1) => GND_1,
      an_adv_config_vector(0) => GND_1,
      an_interrupt => pcs_pma_an_interrupt,
      an_restart_config => GND_1,
      configuration_valid => GND_1,
      configuration_vector(4) => GND_1,
      configuration_vector(3) => GND_1,
      configuration_vector(2) => GND_1,
      configuration_vector(1) => GND_1,
      configuration_vector(0) => GND_1,
      ext_mdc => pcs_pma_ext_mdio_pcs_pma_MDC,
      ext_mdio_i => pcs_pma_ext_mdio_pcs_pma_MDIO_I,
      ext_mdio_o => pcs_pma_ext_mdio_pcs_pma_MDIO_O,
      ext_mdio_t => pcs_pma_ext_mdio_pcs_pma_MDIO_T,
      gmii_isolate => NLW_pcs_pma_gmii_isolate_UNCONNECTED,
      gmii_rx_dv => eth_mac_gmii_RX_DV,
      gmii_rx_er => eth_mac_gmii_RX_ER,
      gmii_rxd(7 downto 0) => eth_mac_gmii_RXD(7 downto 0),
      gmii_tx_en => eth_mac_gmii_TX_EN,
      gmii_tx_er => eth_mac_gmii_TX_ER,
      gmii_txd(7 downto 0) => eth_mac_gmii_TXD(7 downto 0),
      gt0_pll0lock_out => pcs_pma_gt0_pll0lock_out,
      gt0_pll0outclk_out => pcs_pma_gt0_pll0outclk_out,
      gt0_pll0outrefclk_out => pcs_pma_gt0_pll0outrefclk_out,
      gt0_pll0refclklost_out => pcs_pma_gt0_pll0refclklost_out,
      gt0_pll1outclk_out => pcs_pma_gt0_pll1outclk_out,
      gt0_pll1outrefclk_out => pcs_pma_gt0_pll1outrefclk_out,
      gtrefclk_n => mgt_clk_1_CLK_N,
      gtrefclk_out => pcs_pma_gtrefclk_out,
      gtrefclk_p => mgt_clk_1_CLK_P,
      independent_clock_bufg => ref_clk_1,
      mdc => eth_mac_mdc,
      mdio_i => eth_mac_mdio_o,
      mdio_o => pcs_pma_mdio_o,
      mdio_t => NLW_pcs_pma_mdio_t_UNCONNECTED,
      mdio_t_in => eth_mac_mdio_t,
      mmcm_locked_out => pcs_pma_mmcm_locked_out,
      pma_reset_out => pcs_pma_pma_reset_out,
      reset => eth_buf_RESET2PCSPMA,
      resetdone => pcs_pma_resetdone,
      rxn => pcs_pma_sgmii_RXN,
      rxp => pcs_pma_sgmii_RXP,
      rxuserclk2_out => pcs_pma_rxuserclk2_out,
      rxuserclk_out => pcs_pma_rxuserclk_out,
      sgmii_clk_en => pcs_pma_sgmii_clk_en,
      sgmii_clk_f => NLW_pcs_pma_sgmii_clk_f_UNCONNECTED,
      sgmii_clk_r => NLW_pcs_pma_sgmii_clk_r_UNCONNECTED,
      signal_detect => signal_detect_1,
      speed_is_100 => eth_mac_speedis100,
      speed_is_10_100 => eth_mac_speedis10100,
      status_vector(15 downto 0) => pcs_pma_status_vector(15 downto 0),
      txn => pcs_pma_sgmii_TXN,
      txp => pcs_pma_sgmii_TXP,
      userclk2_out => pcs_pma_userclk2_out,
      userclk_out => pcs_pma_userclk_out
    );
end STRUCTURE;
