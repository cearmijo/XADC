--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.4.1 (win64) Build 1149489 Thu Feb 19 16:23:09 MST 2015
--Date        : Thu Jul 16 15:23:13 2015
--Host        : lithe-ad-work running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target mbsys_wrapper.bd
--Design      : mbsys_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mbsys_wrapper is
  port (
    EXT_AXI_RESETN : out STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    EXT_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    EXT_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    EXT_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    EXT_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    EXT_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    EXT_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    EXT_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    EXT_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    EXT_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    Vaux0_v_n : in STD_LOGIC;
    Vaux0_v_p : in STD_LOGIC;
    Vaux10_v_n : in STD_LOGIC;
    Vaux10_v_p : in STD_LOGIC;
    Vaux11_v_n : in STD_LOGIC;
    Vaux11_v_p : in STD_LOGIC;
    Vaux1_v_n : in STD_LOGIC;
    Vaux1_v_p : in STD_LOGIC;
    Vaux2_v_n : in STD_LOGIC;
    Vaux2_v_p : in STD_LOGIC;
    Vaux3_v_n : in STD_LOGIC;
    Vaux3_v_p : in STD_LOGIC;
    Vaux8_v_n : in STD_LOGIC;
    Vaux8_v_p : in STD_LOGIC;
    Vaux9_v_n : in STD_LOGIC;
    Vaux9_v_p : in STD_LOGIC;
    Vp_Vn_v_n : in STD_LOGIC;
    Vp_Vn_v_p : in STD_LOGIC;
    diff_clock_rtl_clk_n : in STD_LOGIC;
    diff_clock_rtl_clk_p : in STD_LOGIC;
    ext_axi_clk : out STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    mdio_rtl_mdc : out STD_LOGIC;
    mdio_rtl_mdio_io : inout STD_LOGIC;
    mgtrefclk1 : in STD_LOGIC;
    reset_rtl : out STD_LOGIC;
    sgmii_rtl_rxn : in STD_LOGIC;
    sgmii_rtl_rxp : in STD_LOGIC;
    sgmii_rtl_txn : out STD_LOGIC;
    sgmii_rtl_txp : out STD_LOGIC
  );
end mbsys_wrapper;

architecture STRUCTURE of mbsys_wrapper is
  component mbsys is
  port (
    mdio_rtl_mdc : out STD_LOGIC;
    mdio_rtl_mdio_i : in STD_LOGIC;
    mdio_rtl_mdio_o : out STD_LOGIC;
    mdio_rtl_mdio_t : out STD_LOGIC;
    sgmii_rtl_rxn : in STD_LOGIC;
    sgmii_rtl_rxp : in STD_LOGIC;
    sgmii_rtl_txn : out STD_LOGIC;
    sgmii_rtl_txp : out STD_LOGIC;
    diff_clock_rtl_clk_n : in STD_LOGIC;
    diff_clock_rtl_clk_p : in STD_LOGIC;
    ext_axi_clk : out STD_LOGIC;
    EXT_AXI_RESETN : out STD_LOGIC_VECTOR ( 0 to 0 );
    mgtrefclk1 : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    reset_rtl : out STD_LOGIC;
    EXT_AXI_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    EXT_AXI_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    EXT_AXI_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    EXT_AXI_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    EXT_AXI_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    EXT_AXI_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    EXT_AXI_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    EXT_AXI_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    EXT_AXI_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    EXT_AXI_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    EXT_AXI_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    Vaux0_v_n : in STD_LOGIC;
    Vaux0_v_p : in STD_LOGIC;
    Vaux1_v_n : in STD_LOGIC;
    Vaux1_v_p : in STD_LOGIC;
    Vaux2_v_n : in STD_LOGIC;
    Vaux2_v_p : in STD_LOGIC;
    Vaux3_v_n : in STD_LOGIC;
    Vaux3_v_p : in STD_LOGIC;
    Vaux8_v_n : in STD_LOGIC;
    Vaux8_v_p : in STD_LOGIC;
    Vaux9_v_n : in STD_LOGIC;
    Vaux9_v_p : in STD_LOGIC;
    Vp_Vn_v_n : in STD_LOGIC;
    Vp_Vn_v_p : in STD_LOGIC;
    Vaux10_v_n : in STD_LOGIC;
    Vaux10_v_p : in STD_LOGIC;
    Vaux11_v_n : in STD_LOGIC;
    Vaux11_v_p : in STD_LOGIC
  );
  end component mbsys;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal mdio_rtl_mdio_i : STD_LOGIC;
  signal mdio_rtl_mdio_o : STD_LOGIC;
  signal mdio_rtl_mdio_t : STD_LOGIC;
begin
mbsys_i: component mbsys
    port map (
      EXT_AXI_RESETN(0) => EXT_AXI_RESETN(0),
      EXT_AXI_araddr(31 downto 0) => EXT_AXI_araddr(31 downto 0),
      EXT_AXI_arprot(2 downto 0) => EXT_AXI_arprot(2 downto 0),
      EXT_AXI_arready(0) => EXT_AXI_arready(0),
      EXT_AXI_arvalid(0) => EXT_AXI_arvalid(0),
      EXT_AXI_awaddr(31 downto 0) => EXT_AXI_awaddr(31 downto 0),
      EXT_AXI_awprot(2 downto 0) => EXT_AXI_awprot(2 downto 0),
      EXT_AXI_awready(0) => EXT_AXI_awready(0),
      EXT_AXI_awvalid(0) => EXT_AXI_awvalid(0),
      EXT_AXI_bready(0) => EXT_AXI_bready(0),
      EXT_AXI_bresp(1 downto 0) => EXT_AXI_bresp(1 downto 0),
      EXT_AXI_bvalid(0) => EXT_AXI_bvalid(0),
      EXT_AXI_rdata(31 downto 0) => EXT_AXI_rdata(31 downto 0),
      EXT_AXI_rready(0) => EXT_AXI_rready(0),
      EXT_AXI_rresp(1 downto 0) => EXT_AXI_rresp(1 downto 0),
      EXT_AXI_rvalid(0) => EXT_AXI_rvalid(0),
      EXT_AXI_wdata(31 downto 0) => EXT_AXI_wdata(31 downto 0),
      EXT_AXI_wready(0) => EXT_AXI_wready(0),
      EXT_AXI_wstrb(3 downto 0) => EXT_AXI_wstrb(3 downto 0),
      EXT_AXI_wvalid(0) => EXT_AXI_wvalid(0),
      Vaux0_v_n => Vaux0_v_n,
      Vaux0_v_p => Vaux0_v_p,
      Vaux10_v_n => Vaux10_v_n,
      Vaux10_v_p => Vaux10_v_p,
      Vaux11_v_n => Vaux11_v_n,
      Vaux11_v_p => Vaux11_v_p,
      Vaux1_v_n => Vaux1_v_n,
      Vaux1_v_p => Vaux1_v_p,
      Vaux2_v_n => Vaux2_v_n,
      Vaux2_v_p => Vaux2_v_p,
      Vaux3_v_n => Vaux3_v_n,
      Vaux3_v_p => Vaux3_v_p,
      Vaux8_v_n => Vaux8_v_n,
      Vaux8_v_p => Vaux8_v_p,
      Vaux9_v_n => Vaux9_v_n,
      Vaux9_v_p => Vaux9_v_p,
      Vp_Vn_v_n => Vp_Vn_v_n,
      Vp_Vn_v_p => Vp_Vn_v_p,
      diff_clock_rtl_clk_n => diff_clock_rtl_clk_n,
      diff_clock_rtl_clk_p => diff_clock_rtl_clk_p,
      ext_axi_clk => ext_axi_clk,
      ext_reset_in => ext_reset_in,
      mdio_rtl_mdc => mdio_rtl_mdc,
      mdio_rtl_mdio_i => mdio_rtl_mdio_i,
      mdio_rtl_mdio_o => mdio_rtl_mdio_o,
      mdio_rtl_mdio_t => mdio_rtl_mdio_t,
      mgtrefclk1 => mgtrefclk1,
      reset_rtl => reset_rtl,
      sgmii_rtl_rxn => sgmii_rtl_rxn,
      sgmii_rtl_rxp => sgmii_rtl_rxp,
      sgmii_rtl_txn => sgmii_rtl_txn,
      sgmii_rtl_txp => sgmii_rtl_txp
    );
mdio_rtl_mdio_iobuf: component IOBUF
    port map (
      I => mdio_rtl_mdio_o,
      IO => mdio_rtl_mdio_io,
      O => mdio_rtl_mdio_i,
      T => mdio_rtl_mdio_t
    );
end STRUCTURE;
