--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.4.1 (win64) Build 1149489 Thu Feb 19 16:23:09 MST 2015
--Date        : Wed Mar 11 13:50:06 2015
--Host        : lithe-ad-work running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target mbsys_wrapper.bd
--Design      : mbsys_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity toplevel is
  port (
		
   -- LED's
   LED_BANK_13     : out std_logic;
   LED_BANK_14     : out std_logic;
   LED_BANK_15     : out std_logic;
   LED_BANK_16     : out std_logic;
   LED_BANK_34     : out std_logic;
   LED_BANK_35     : out std_logic;
   
    -- External pins
    -- these are 2.5V
    EXTERNAL_3_P   : out std_logic;  
    EXTERNAL_3_N   : out std_logic;  
    EXTERNAL_2_P   : out std_logic;  
    EXTERNAL_2_N   : out std_logic;  
    EXTERNAL_1_P   : out std_logic;  
    EXTERNAL_1_N   : out std_logic; 
    -- except external_0 pins are 1.2V        
    EXTERNAL_0_P   : out std_logic; 
    EXTERNAL_0_N   : out std_logic;   
    
    -- External trigger input
    EXTERNAL_TRIGGER_HDMI : in STD_LOGIC;

   -- Clocks
   -- 200 MHz system clock
   MGTREFCLK1P : in STD_LOGIC;
   MGTREFCLK1N : in STD_LOGIC;
   -- 125 MHz ethernet clock
   MGTREFCLK0P : in STD_LOGIC;
   MGTREFCLK0N : in STD_LOGIC;  
   -- 200.0359MHz from bank 14
   X_2V5_DIFF_CLK_P    : in std_logic;
   X_2V5_DIFF_CLK_N    : in std_logic;  

   -- MDIO interaface 
    ENET_MDIO       : inout STD_LOGIC;
    ENET_MDC        : out STD_LOGIC;
    ENET_PHY_INT    : in STD_LOGIC;
    ENET_RST_N      : out STD_LOGIC;

   -- SGMII
    sgmii_rtl_rxn : in STD_LOGIC;
    sgmii_rtl_rxp : in STD_LOGIC;
    sgmii_rtl_txn : out STD_LOGIC;
    sgmii_rtl_txp : out STD_LOGIC;
    
    -- Analog Mux ports 
    MuxAddr0 : out STD_LOGIC;
    MuxAddr1 : out STD_LOGIC;
    MuxAddr2 : out STD_LOGIC;
    MuxAddr3_p : out STD_LOGIC;
    MuxAddr3_n : out STD_LOGIC;
    
    -- XADC Ports
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
    -- vmm signals
    -- signals are as seen by vmm
    -- ckbc is the bc clock TO the vmm
    -- do is the data FROM the vmm
    
    DI_1_P, DI_1_N : OUT STD_LOGIC;
    DI_2_P, DI_2_N : OUT STD_LOGIC;
    DI_3_P, DI_3_N : OUT STD_LOGIC;
    DI_4_P, DI_4_N : OUT STD_LOGIC;
    DI_5_P, DI_5_N : OUT STD_LOGIC;
    DI_6_P, DI_6_N : OUT STD_LOGIC;
    DI_7_P, DI_7_N : OUT STD_LOGIC;
    DI_8_P, DI_8_N : OUT STD_LOGIC;
    
    DATA0_1_P, DATA0_1_N : IN STD_LOGIC;
    DATA0_2_P, DATA0_2_N : IN STD_LOGIC;
    DATA0_3_P, DATA0_3_N : IN STD_LOGIC;
    DATA0_4_P, DATA0_4_N : IN STD_LOGIC;
    DATA0_5_P, DATA0_5_N : IN STD_LOGIC;
    DATA0_6_P, DATA0_6_N : IN STD_LOGIC;
    DATA0_7_P, DATA0_7_N : IN STD_LOGIC;
    DATA0_8_P, DATA0_8_N : IN STD_LOGIC;
    
    DATA1_1_P, DATA1_1_N : IN STD_LOGIC;
    DATA1_2_P, DATA1_2_N : IN STD_LOGIC;
    DATA1_3_P, DATA1_3_N : IN STD_LOGIC;
    DATA1_4_P, DATA1_4_N : IN STD_LOGIC;
    DATA1_5_P, DATA1_5_N : IN STD_LOGIC;
    DATA1_6_P, DATA1_6_N : IN STD_LOGIC;
    DATA1_7_P, DATA1_7_N : IN STD_LOGIC;
    DATA1_8_P, DATA1_8_N : IN STD_LOGIC;
    
    DO_1_P, DO_1_N : IN STD_LOGIC;
    DO_2_P, DO_2_N : IN STD_LOGIC; 
    DO_3_P, DO_3_N : IN STD_LOGIC;
    DO_4_P, DO_4_N : IN STD_LOGIC; 
    DO_5_P, DO_5_N : IN STD_LOGIC;
    DO_6_P, DO_6_N : IN STD_LOGIC; 
    DO_7_P, DO_7_N : IN STD_LOGIC;
    DO_8_P, DO_8_N : IN STD_LOGIC; 
    
    WEN_1_P, WEN_1_N : OUT STD_LOGIC;
    WEN_2_P, WEN_2_N : OUT STD_LOGIC;
    WEN_3_P, WEN_3_N : OUT STD_LOGIC;
    WEN_4_P, WEN_4_N : OUT STD_LOGIC;
    WEN_5_P, WEN_5_N : OUT STD_LOGIC;
    WEN_6_P, WEN_6_N : OUT STD_LOGIC;
    WEN_7_P, WEN_7_N : OUT STD_LOGIC;
    WEN_8_P, WEN_8_N : OUT STD_LOGIC;

    ENA_1_P, ENA_1_N : OUT STD_LOGIC;
    ENA_2_P, ENA_2_N : OUT STD_LOGIC;
    ENA_3_P, ENA_3_N : OUT STD_LOGIC;
    ENA_4_P, ENA_4_N : OUT STD_LOGIC;
    ENA_5_P, ENA_5_N : OUT STD_LOGIC;
    ENA_6_P, ENA_6_N : OUT STD_LOGIC;
    ENA_7_P, ENA_7_N : OUT STD_LOGIC;
    ENA_8_P, ENA_8_N : OUT STD_LOGIC;

    CKTK_1_P, CKTK_1_N  : OUT STD_LOGIC;
    CKTK_2_P, CKTK_2_N  : OUT STD_LOGIC;
    CKTK_3_P, CKTK_3_N  : OUT STD_LOGIC;
    CKTK_4_P, CKTK_4_N  : OUT STD_LOGIC;
    CKTK_5_P, CKTK_5_N  : OUT STD_LOGIC;
    CKTK_6_P, CKTK_6_N  : OUT STD_LOGIC;
    CKTK_7_P, CKTK_7_N  : OUT STD_LOGIC;
    CKTK_8_P, CKTK_8_N  : OUT STD_LOGIC;

    CKTP_1_P, CKTP_1_N : OUT STD_LOGIC;
    CKTP_2_P, CKTP_2_N : OUT STD_LOGIC;
    CKTP_3_P, CKTP_3_N : OUT STD_LOGIC;
    CKTP_4_P, CKTP_4_N : OUT STD_LOGIC;
    CKTP_5_P, CKTP_5_N : OUT STD_LOGIC;
    CKTP_6_P, CKTP_6_N : OUT STD_LOGIC;
    CKTP_7_P, CKTP_7_N : OUT STD_LOGIC;
    CKTP_8_P, CKTP_8_N : OUT STD_LOGIC;

    CKBC_1_P, CKBC_1_N : OUT STD_LOGIC;
    CKBC_2_P, CKBC_2_N : OUT STD_LOGIC;
    CKBC_3_P, CKBC_3_N : OUT STD_LOGIC;
    CKBC_4_P, CKBC_4_N : OUT STD_LOGIC;
    CKBC_5_P, CKBC_5_N : OUT STD_LOGIC;
    CKBC_6_P, CKBC_6_N : OUT STD_LOGIC;
    CKBC_7_P, CKBC_7_N : OUT STD_LOGIC;
    CKBC_8_P, CKBC_8_N : OUT STD_LOGIC;

    CKDT_1_P, CKDT_1_N : OUT STD_LOGIC;
    CKDT_2_P, CKDT_2_N : OUT STD_LOGIC;
    CKDT_3_P, CKDT_3_N : OUT STD_LOGIC;
    CKDT_4_P, CKDT_4_N : OUT STD_LOGIC;
    CKDT_5_P, CKDT_5_N : OUT STD_LOGIC;
    CKDT_6_P, CKDT_6_N : OUT STD_LOGIC;
    CKDT_7_P, CKDT_7_N : OUT STD_LOGIC;
    CKDT_8_P, CKDT_8_N : OUT STD_LOGIC;

    CKART_1_P, CKART_1_N : OUT STD_LOGIC;
    CKART_2_P, CKART_2_N : OUT STD_LOGIC;
    CKART_3_P, CKART_3_N : OUT STD_LOGIC;
    CKART_4_P, CKART_4_N : OUT STD_LOGIC;
    CKART_5_P, CKART_5_N : OUT STD_LOGIC;
    CKART_6_P, CKART_6_N : OUT STD_LOGIC;
    CKART_7_P, CKART_7_N : OUT STD_LOGIC;
    CKART_8_P, CKART_8_N : OUT STD_LOGIC;

    TKO_8_P, TKO_8_N   : IN STD_LOGIC;
    SETB_8_P, SETB_8_N : IN STD_LOGIC;
    TKI_1_P, TKI_1_N   : OUT STD_LOGIC;
    SETT_1_P, SETT_1_N : IN STD_LOGIC
       
  );
end toplevel;

  architecture STRUCTURE of toplevel is

  attribute dont_touch : string;

  component mbsys is
  port (
    mgtrefclk1 : in STD_LOGIC;  -- 
      
    diff_clock_rtl_clk_n : in STD_LOGIC;
    diff_clock_rtl_clk_p : in STD_LOGIC;
    --ref_clk_125_p : in STD_LOGIC;
    --ref_clk_125_n  : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;  -- Active LOW!!!
    mdio_rtl_mdc : out STD_LOGIC;
    mdio_rtl_mdio_i : in STD_LOGIC;
    mdio_rtl_mdio_o : out STD_LOGIC;
    mdio_rtl_mdio_t : out STD_LOGIC;
    sgmii_rtl_rxn : in STD_LOGIC;
    sgmii_rtl_rxp : in STD_LOGIC;
    sgmii_rtl_txn : out STD_LOGIC;
    sgmii_rtl_txp : out STD_LOGIC;
    
    reset_rtl : out STD_LOGIC;
    
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
    
--    gpio_rtl_tri_i : in STD_LOGIC_VECTOR ( 31 downto 0 );
--    gpio_rtl_tri_o : out STD_LOGIC_VECTOR ( 31 downto 0 );
--    gpio_rtl_tri_t : out STD_LOGIC_VECTOR ( 31 downto 0 );    
    
    EXT_AXI_RESETN : out STD_LOGIC_VECTOR ( 0 to 0 );
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
    ext_axi_clk : out STD_LOGIC
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
    -- kjohns components are here
component clk_wiz_0
    port
     (-- Clock in ports
      clk_in1            : in     std_logic;
      -- Clock out ports
      clk_200_o          : out    std_logic;
      clk_160_o          : out    std_logic;
      clk_100_o          : out    std_logic;
      clk_50_o           : out    std_logic;
      clk_40_o           : out    std_logic;
      clk_20_o           : out    std_logic;
      clk_10_o           : out    std_logic      
     );
    end component;
    
    ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
    ATTRIBUTE SYN_BLACK_BOX OF clk_wiz_0 : COMPONENT IS TRUE;
    
    
    ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
    ATTRIBUTE BLACK_BOX_PAD_PIN OF clk_wiz_0 : COMPONENT IS "clk_in1,clk_200_o,clk_160_o,clk_100_o,clk_50_o,clk_40_o,clk_20_o,clk_10_o";    

component clk_wiz_200_to_400
port
 (-- Clock in ports
  clk_in1_p         : in     std_logic;
  clk_in1_n         : in     std_logic;
  -- Clock out ports
  clk_out_400          : out    std_logic
 );
end component;

--ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
ATTRIBUTE SYN_BLACK_BOX OF clk_wiz_200_to_400 : COMPONENT IS TRUE;


--ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
ATTRIBUTE BLACK_BOX_PAD_PIN OF clk_wiz_200_to_400 : COMPONENT IS "clk_in1_p,clk_in1_n,clk_out_400";

component clk_wiz_low_jitter
port
 (-- Clock in ports
  clk_in1           : in     std_logic;
  -- Clock out ports
  clk_out1          : out    std_logic
 );
end component;

--ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
ATTRIBUTE SYN_BLACK_BOX OF clk_wiz_low_jitter : COMPONENT IS TRUE;


--ATTRIBUTE BLACK_BOX_PAD_PIN : STRING;
ATTRIBUTE BLACK_BOX_PAD_PIN OF clk_wiz_low_jitter : COMPONENT IS "clk_in1,clk_out1";

COMPONENT ila_1
  
  PORT (
      clk : IN STD_LOGIC;
  
      probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
      probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
      probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
      probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
      probe4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
      probe5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
      probe6 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
      probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
      probe8 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
      probe9 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
      probe10 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
      probe11 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
      probe12 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
      probe13 : IN STD_LOGIC_VECTOR(15 DOWNTO 0); 
      probe14 : IN STD_LOGIC_VECTOR(37 DOWNTO 0);
      probe15 : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
  END COMPONENT  ;  

component external_trigger is

    Port ( clk_40MHz                : in STD_LOGIC;
           reset_for_bc_counters    : in STD_LOGIC;
           ext_trigger_in           : in STD_LOGIC;
           ext_trigger_pulse        : out STD_LOGIC;
           busy_from_ext_trigger    : out STD_LOGIC;
           bcid_counter             : buffer unsigned (11 downto 0);
           bcid_captured            : out unsigned (11 downto 0);
           bcid_corrected           : out unsigned (11 downto 0);
           turn_counter             : buffer unsigned (15 downto 0);
           turn_captured            : out unsigned (15 downto 0)
       );
       
end component;

component vmm_cfg is
  port
  (
  clk_ila				    : in 	STD_LOGIC ;
  clk200				    : in 	STD_LOGIC;
  vmm_clk_200               : in     STD_LOGIC; 
      
  clk100                    : in    STD_LOGIC;
  vmm_clk_100               : in     STD_LOGIC;  

  reset                     : in    STD_LOGIC ;

  cfg_bit_in                : in    std_logic ;
  cfg_bit_out               : out   std_logic ;

  vmm_ena                   : out   std_logic ;
  vmm_wen                   : out   std_logic ;
      
  vmm_ckdt_en               : out   std_logic ;
  vmm_ckdt                  : in    std_logic ;
  
  vmm_ckart_en              : out   std_logic ;
  vmm_ckart                 : in    std_logic ;
  
  vmm_cktk_en		        : out   std_logic ;
  vmm_cktk                  : in    std_logic ; 
  
  vmm_cktp_en               : out   std_logic ;
  vmm_cktp                  : in    std_logic ; 
  
  vmm_ckbc_en               : out std_logic ;
  vmm_ckbc                  : in std_logic ; 
   
  vmm_data1                 : in    std_logic;
  vmm_data0                 : in    std_logic;
  vmm_art                   : in    std_logic;
  wr_en                     : buffer   std_logic;
  din                       : buffer   std_logic_vector(31 DOWNTO 0);
  dt_cntr_intg0_i           : out   integer ;
  dt_cntr_intg1_i           : out   integer ;
  vmm_data_buf_i            : out   std_logic_vector(37 downto 0) ;
  
  vmm_2cfg                  : out   std_logic_vector(2 downto 0) ;
  vmm_2display              : out   std_logic_vector(2 downto 0) ;
  mmfeID                    : out   std_logic_vector(3 downto 0) ;
  
  LEDx                       : out   std_logic_vector( 2 downto 0);
  testX                      : in    std_logic;
  axi_reg_4 : in STD_LOGIC_VECTOR(31 downto 0);  
  axi_reg_5       ,axi_reg_6       ,axi_reg_7       ,axi_reg_8       ,axi_reg_9 :  in STD_LOGIC_VECTOR(31 downto 0);    
  axi_reg_10      ,axi_reg_11      ,axi_reg_12      ,axi_reg_13      ,axi_reg_14 : in STD_LOGIC_VECTOR(31 downto 0);  
  axi_reg_15      ,axi_reg_16      ,axi_reg_17      ,axi_reg_18      ,axi_reg_19 : in STD_LOGIC_VECTOR(31 downto 0);    
  axi_reg_20      ,axi_reg_21      ,axi_reg_22      ,axi_reg_23      ,axi_reg_24 : in STD_LOGIC_VECTOR(31 downto 0);  
  axi_reg_25      ,axi_reg_26      ,axi_reg_27      ,axi_reg_28      ,axi_reg_29 : in STD_LOGIC_VECTOR(31 downto 0); 
  axi_reg_30      ,axi_reg_31      ,axi_reg_32      ,axi_reg_33      ,axi_reg_34 : in STD_LOGIC_VECTOR(31 downto 0);  
  axi_reg_35      ,axi_reg_36      ,axi_reg_37      ,axi_reg_38      ,axi_reg_39 : in STD_LOGIC_VECTOR(31 downto 0);
  axi_reg_40      ,axi_reg_41      ,axi_reg_42      ,axi_reg_43      ,axi_reg_44 : in STD_LOGIC_VECTOR(31 downto 0);  
  axi_reg_45      ,axi_reg_46      ,axi_reg_47      ,axi_reg_48      ,axi_reg_49 : in STD_LOGIC_VECTOR(31 downto 0); 
  axi_reg_50      ,axi_reg_51      ,axi_reg_52      ,axi_reg_53      ,axi_reg_54 : in STD_LOGIC_VECTOR(31 downto 0);

   
  vmm_cfg_sel : in STD_LOGIC_VECTOR(31 downto 0);
  
    axi_clk : in std_logic;
    axi_pop_vmm1 : in std_logic;                              -- Pop (WE)
    axi_rdata_ls_vmm1 : out std_logic_vector(31 downto 0);    -- Data port for reading
    axi_rdata_rcnt_vmm1 : out std_logic_vector(31 downto 0)  -- how many values are in the FIFO?  
  );
  
  end component ;

-- Andy uses this
-- COMPONENT ila_0
--      PORT (
--          clk : IN STD_LOGIC;
--          probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
--          probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
--          probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
--          probe3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
--          probe4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
--          probe5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
--          probe6 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
--          probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
--          probe8 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
--          probe9 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
--          probe10 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
--          probe11 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--          probe12 : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
--      );
--      END COMPONENT  ;
 
  signal mgtrefclk1 : std_logic;
  signal clk_400_noclean : std_logic;
  signal clk_400_clean : std_logic; 
  
  signal mdio_rtl_mdio_io : STD_LOGIC;
  signal mdio_rtl_mdio_i : STD_LOGIC;
  signal mdio_rtl_mdio_o : STD_LOGIC;
  signal mdio_rtl_mdio_t : STD_LOGIC;
  signal mdio_rtl_mdc  : STD_LOGIC;
  
  signal reset_rtl : std_logic;
  
  -- kjohns signals here begin
  -- other signals
  --signal count		:	std_logic_vector( 28 downto 0);
  signal count1     :   std_logic_vector( 31 downto 0);
  signal LED        :   std_logic_vector( 5 downto 0);
  signal LEDx       :   std_logic_vector( 2 downto 0);
  signal vmm_sel    :   std_logic_vector( 2 downto 0);
  signal display_sel   :    std_logic;

  signal  temp      :   std_logic;

-- general vmm signals
  signal  vmm_di      : std_logic ;
  signal  vmm_di_en_vec  : std_logic_vector ( 7 downto 0); -- := (others=>'0') ;
  signal  vmm_di_r_vec   : std_logic_vector ( 7 downto 0); -- := (others=>'0') ;
  signal  vmm_do      : std_logic ;
  
  signal  vmm_wen     : std_logic;
  signal  vmm_wen_en  : std_logic ;
  signal  vmm_wen_R   : std_logic ;
  signal  vmm_ena     : std_logic;
  signal  vmm_ena_en  : std_logic ;
  signal  vmm_ena_R   : std_logic ;

  signal  vmm_data0   : std_logic; 
  signal  vmm_data1   : std_logic;

  signal fifo_wr_en_i : std_logic;
  signal din_i : std_logic_vector(31 DOWNTO 0);
  signal dt_cntr_intg0_i  : integer ;
  signal dt_cntr_intg1_i  : integer ;
  signal vmm_data_buf_i   : std_logic_vector(37 downto 0) ;

  signal  clk_ila         : std_logic;
  signal  clk_200         : std_logic;
  signal  clk_160         : std_logic;
  signal  clk_100         : std_logic;
  signal  clk_50          : std_logic;
  signal  clk_40          : std_logic;
  signal  clk_20          : std_logic;
  signal  clk_10          : std_logic;

--  signal  rst_status_next : std_logic; -- charlie
  signal  vmm_global_reset  : std_logic := '0'; -- charlie
  signal  count1_next     : std_logic_vector(31 downto 0) := x"00000000"; -- charlie  
  signal  count1_rst      : std_logic := '0'; -- charlie 
  signal  count1_max      : std_logic := '0'; -- charlie
  signal  vmm_2cfg_i       : STD_LOGIC_VECTOR( 2 DOWNTO 0); -- charlie
  signal  vmm_2display_i   : STD_LOGIC_VECTOR( 2 DOWNTO 0); -- charlie
  signal  mmfeID_i         : STD_LOGIC_VECTOR( 3 DOWNTO 0); -- charlie
  
  signal clk_dt_period_cnt       : STD_LOGIC_VECTOR( 15 DOWNTO 0) := x"0010";
  signal clk_dt_dutycycle_cnt    : STD_LOGIC_VECTOR( 15 DOWNTO 0) := x"0008";
  signal clk_bc_period_cnt       : STD_LOGIC_VECTOR( 15 DOWNTO 0) := x"0004";
  signal clk_bc_dutycycle_cnt    : STD_LOGIC_VECTOR( 15 DOWNTO 0) := x"0002";
-- kjohns changed these from 1F3F (7999) and 0F9F (3999) to 3e80 (16000) and 1f40 (8000)
  signal clk_tp_period_cnt       : STD_LOGIC_VECTOR( 15 DOWNTO 0) := x"3E80";
  signal clk_tp_dutycycle_cnt    : STD_LOGIC_VECTOR( 15 DOWNTO 0) := x"1F40";
  signal counter_for_cktp_done   : STD_LOGIC_VECTOR( 15 DOWNTO 0) := x"0000";
  signal cktp_done               : std_logic := '0';
  signal clk_tk_period_cnt       : STD_LOGIC_VECTOR( 15 DOWNTO 0) := x"0013";
  signal clk_tk_dutycycle_cnt    : STD_LOGIC_VECTOR( 15 DOWNTO 0) := x"0003";
  --  clk_tk_dutycycle_cnt needs to be 3 or 4 for data0/data1 readout    
  --signal clk_bc_period_cnt       : STD_LOGIC_VECTOR( 15 DOWNTO 0);
  --signal clk_bc_dutycycle_cnt    : STD_LOGIC_VECTOR( 15 DOWNTO 0);
  --signal clk_tp_period_cnt       : STD_LOGIC_VECTOR( 15 DOWNTO 0);
  --signal clk_tp_dutycycle_cnt    : STD_LOGIC_VECTOR( 15 DOWNTO 0);
  --signal clk_tk_period_cnt       : STD_LOGIC_VECTOR( 15 DOWNTO 0);
  --signal clk_tk_dutycycle_cnt    : STD_LOGIC_VECTOR( 15 DOWNTO 0);
    
  signal  clk_art_X     : std_logic;
  signal  vmm_art       : std_logic;
  signal  vmm_ckart     : std_logic;
  signal  vmm_ckart_en  : std_logic;
  signal  vmm_ckart_r   : std_logic; 
  signal  vmm_clk_int   : std_logic;

  signal  vmm_cktk        : std_logic;
  signal  vmm_cktk_r_vec  : std_logic_vector ( 7 downto 0) := (others=>'0');
  signal  vmm_cktk_en     : std_logic;
  signal  vmm_cktk_en_i   : std_logic; 
  signal  vmm_cktk_en_vec : STD_LOGIC_vector ( 7 downto 0) := (others=>'0');  
  signal  vmm_cktk_sync   : std_logic; 
  signal  clk_tk_X        : std_logic;
  signal  clk_tk_enable   : std_logic ;
  signal  clk_tk_sync     : std_logic ;
  signal  clk_tk_cntr     : std_logic_vector ( 15 downto 0) := (others=>'0');
  signal  clk_tk_out      : std_logic ;
  signal  testX           : std_logic := '0';

  signal  vmm_cktp        : std_logic ; 
  signal  vmm_cktp_en     : std_logic ; 
  signal  vmm_cktp_sync   : std_logic ;
  signal  vmm_cktp_r      : std_logic ;   
  signal  clk_tp_X        : std_logic ;
  signal  clk_tp_enable   : std_logic ;
  signal  clk_tp_sync     : std_logic ;
  signal  clk_tp_cntr     : std_logic_vector ( 15 downto 0) := (others=>'0');
  signal  clk_tp_out      : std_logic ;
  
  signal  vmm_ckbc        : std_logic; 
  signal  vmm_ckbc_en     : std_logic; 
  signal  vmm_ckbc_sync   : std_logic;
  signal  vmm_ckbc_R      : std_logic; 
  signal  clk_bc_X        : std_logic ;
  signal  clk_bc_enable   : std_logic ;
  signal  clk_bc_sync     : std_logic ;
  signal  clk_bc_cntr     : std_logic_vector ( 15 downto 0) := (others=>'0');
  signal  clk_bc_out      : std_logic ;

  signal  vmm_ckdt        : STD_LOGIC ;
  signal  vmm_ckdt_kj     : std_logic ;
  signal  counter_kj      : std_logic_vector (7 downto 0) := (others=>'0');
  signal  vmm_ckdt_en_vec     : std_logic_vector ( 7 downto 0) := (others=>'0'); 
  signal  vmm_ckdt_en_i   : std_logic ;
  signal  vmm_ckdt_sync   : STD_LOGIC ;
  signal  vmm_ckdt_r_vec  : std_logic_vector ( 7 downto 0) := (others=>'0'); 
--  signal  vmm_ckdt_r0     : std_logic ;
--  signal  vmm_ckdt_r1     : std_logic ;
--  signal  vmm_ckdt_r2     : std_logic ;
--  signal  vmm_ckdt_r3     : std_logic ;
--  signal  vmm_ckdt_r4     : std_logic ;
--  signal  vmm_ckdt_r5     : std_logic ;
--  signal  vmm_ckdt_r6     : std_logic ;
--  signal  vmm_ckdt_r7     : std_logic ;
--  signal  clk_dt_X 	    : std_logic ;
  signal  clk_dt_enable 	: std_logic ;
  signal  clk_dt_sync 	: std_logic ;
  signal  clk_dt_cntr 	: std_logic_vector ( 15 downto 0) := (others=>'0');
  signal  clk_dt_out 	    : std_logic ;
   
  signal clk_X_1          : std_logic;
  signal clk_X_2          : std_logic; 

  signal scopeD7          : std_logic;
  signal scopeD6          : std_logic;
  signal scopeD5          : std_logic;
  signal scopeD4          : std_logic;
  signal scopeD3          : std_logic;
  signal scopeD2          : std_logic;
  signal scopeD1          : std_logic;
  signal scopeD0          : std_logic;
  signal scopeD7_i          : std_logic;
  signal scopeD6_i          : std_logic;
  signal scopeD5_i          : std_logic;
  signal scopeD4_i          : std_logic;
  signal scopeD3_i          : std_logic;
  signal scopeD2_i          : std_logic;
  signal scopeD1_i          : std_logic;
  signal scopeD0_i          : std_logic;  
  
  signal scope_CE         : std_logic_vector ( 7 downto 0) := (others=>'1');
  signal scope_R          : std_logic_vector ( 7 downto 0) := (others=>'0');
  
  signal reset_out   : std_logic;
  signal reset       : std_logic;
  signal count1p     : std_logic;

  signal logic_dump   : std_logic;
  
  signal probe0_out_i : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal probe1_out_i : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal probe2_out_i : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal probe3_out_i : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal probe4_out_i : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal probe5_out_i : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal probe6_out_i : STD_LOGIC_VECTOR(0 DOWNTO 0);          
  signal probe7_out_i : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal probe8_out_i : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal probe9_out_i : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal probe10_out_i : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal probe11_out_i : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal probe12_out_i : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal probe13_out_i : STD_LOGIC_VECTOR(15 DOWNTO 0); 
  signal probe14_out_i : STD_LOGIC_VECTOR(37 DOWNTO 0);
  signal probe15_out_i : STD_LOGIC_VECTOR(31 DOWNTO 0);
       
  attribute mark_debug : string;
  attribute mark_debug of vmm_wen : signal is "true";
  attribute mark_debug of vmm_ena : signal is "true";
  attribute mark_debug of vmm_ckbc : signal is "true";
  attribute mark_debug of vmm_ckbc_en : signal is "true";
  attribute mark_debug of vmm_cktp : signal is "true";
  attribute mark_debug of cktp_done : signal is "true";
  attribute mark_debug of vmm_cktk : signal is "true";
  attribute mark_debug of vmm_cktk_en_i : signal is "true";
  attribute mark_debug of vmm_ckdt : signal is "true";
  attribute mark_debug of vmm_ckdt_en_i : signal is "true";
  attribute mark_debug of fifo_wr_en_i : signal is "true";
  attribute mark_debug of vmm_data0 : signal is "true";
  attribute mark_debug of vmm_data1 : signal is "true";
  attribute mark_debug of dt_cntr_intg0_i : signal is "true";
  attribute mark_debug of dt_cntr_intg1_i : signal is "true";
  attribute mark_debug of din_i : signal is "true";
  attribute mark_debug of vmm_data_buf_i : signal is "true";
  attribute keep : string;
  attribute keep of vmm_wen : signal is "true";
  attribute keep of vmm_ena : signal is "true";
  attribute keep of vmm_ckbc : signal is "true";
  attribute keep of vmm_ckbc_en : signal is "true";
  attribute keep of vmm_cktp : signal is "true";
  attribute keep of cktp_done : signal is "true";
  attribute keep of vmm_cktk : signal is "true";
  attribute keep of vmm_cktk_en_i : signal is "true";
  attribute keep of vmm_ckdt : signal is "true";
  attribute keep of vmm_ckdt_en_i : signal is "true";
  attribute keep of fifo_wr_en_i : signal is "true";
  attribute keep of vmm_data0 : signal is "true";
  attribute keep of vmm_data1 : signal is "true";
  attribute keep of dt_cntr_intg0_i : signal is "true";
  attribute keep of dt_cntr_intg1_i : signal is "true";
  attribute keep of din_i : signal is "true";
  attribute keep of vmm_data_buf_i : signal is "true";
  attribute keep of clk_400_clean : signal is "true";
  attribute keep of clk_200 :  signal is "true";

  -- external trigger signals
  signal external_trigger_in     : std_logic;
  signal external_trigger_deb    : std_logic; 
  signal external_trigger_pulse_i     : std_logic;
  signal busy_from_external_trigger_i : std_logic;
  signal bcid_counter_i          : unsigned (11 downto 0);
  signal bcid_captured_i         : unsigned (11 downto 0);
  signal bcid_corrected_i        : unsigned (11 downto 0);
  signal turn_counter_i          : unsigned (15 downto 0);
  signal turn_captured_i         : unsigned (15 downto 0);
  signal Q1, Q2, Q3              : std_logic;
    
  -- vmm signals
  signal  vmm_di_1 	  : std_logic;
  signal  vmm_do_1    : std_logic;
  signal  vmm_wen_1   : std_logic;
  signal  vmm_ena_1   : std_logic;
  signal  vmm_cktk_1  : std_logic; 
  signal  vmm_cktp_1  : std_logic; 
  signal  vmm_ckbc_1  : std_logic; 
  signal  vmm_data0_1 : std_logic; 
  signal  vmm_data1_1 : std_logic; 
  signal  vmm_art_1   : std_logic;
  signal  vmm_ckdt_1  : std_logic;  
  signal  vmm_ckart_1 : std_logic;

  signal  vmm_di_2 	  : std_logic;
  signal  vmm_do_2    : std_logic;
  signal  vmm_wen_2   : std_logic;
  signal  vmm_ena_2   : std_logic;
  signal  vmm_cktk_2  : std_logic; 
  signal  vmm_cktp_2  : std_logic; 
  signal  vmm_ckbc_2  : std_logic; 
  signal  vmm_data0_2 : std_logic; 
  signal  vmm_data1_2 : std_logic; 
  signal  vmm_art_2   : std_logic;
  signal  vmm_ckdt_2  : std_logic;  
  signal  vmm_ckart_2 : std_logic;
  
  signal  vmm_di_3 	  : std_logic;
  signal  vmm_do_3    : std_logic;
  signal  vmm_wen_3   : std_logic;
  signal  vmm_ena_3   : std_logic;
  signal  vmm_cktk_3  : std_logic; 
  signal  vmm_cktp_3  : std_logic; 
  signal  vmm_ckbc_3  : std_logic; 
  signal  vmm_data0_3 : std_logic; 
  signal  vmm_data1_3 : std_logic; 
  signal  vmm_art_3   : std_logic;
  signal  vmm_ckdt_3  : std_logic;  
  signal  vmm_ckart_3 : std_logic;
  
  signal  vmm_di_4 	  : std_logic;
  signal  vmm_do_4    : std_logic;
  signal  vmm_wen_4   : std_logic;
  signal  vmm_ena_4   : std_logic;
  signal  vmm_cktk_4  : std_logic; 
  signal  vmm_cktp_4  : std_logic; 
  signal  vmm_ckbc_4  : std_logic; 
  signal  vmm_data0_4 : std_logic; 
  signal  vmm_data1_4 : std_logic; 
  signal  vmm_art_4   : std_logic;
  signal  vmm_ckdt_4  : std_logic;  
  signal  vmm_ckart_4 : std_logic;
  
  signal  vmm_di_5 	  : std_logic;
  signal  vmm_do_5    : std_logic;
  signal  vmm_wen_5   : std_logic;
  signal  vmm_ena_5   : std_logic;
  signal  vmm_cktk_5  : std_logic; 
  signal  vmm_cktp_5  : std_logic; 
  signal  vmm_ckbc_5  : std_logic; 
  signal  vmm_data0_5 : std_logic; 
  signal  vmm_data1_5 : std_logic; 
  signal  vmm_art_5   : std_logic;
  signal  vmm_ckdt_5  : std_logic;  
  signal  vmm_ckart_5 : std_logic;

  signal  vmm_di_6 	  : std_logic;
  signal  vmm_do_6    : std_logic;
  signal  vmm_wen_6   : std_logic;
  signal  vmm_ena_6   : std_logic;
  signal  vmm_cktk_6  : std_logic; 
  signal  vmm_cktp_6  : std_logic; 
  signal  vmm_ckbc_6  : std_logic; 
  signal  vmm_data0_6 : std_logic; 
  signal  vmm_data1_6 : std_logic; 
  signal  vmm_art_6   : std_logic;
  signal  vmm_ckdt_6  : std_logic;  
  signal  vmm_ckart_6 : std_logic;  
  
  signal  vmm_di_7 	  : std_logic;
  signal  vmm_do_7    : std_logic;
  signal  vmm_wen_7   : std_logic;
  signal  vmm_ena_7   : std_logic;
  signal  vmm_cktk_7  : std_logic; 
  signal  vmm_cktp_7  : std_logic; 
  signal  vmm_ckbc_7  : std_logic; 
  signal  vmm_data0_7 : std_logic; 
  signal  vmm_data1_7 : std_logic; 
  signal  vmm_art_7   : std_logic;
  signal  vmm_ckdt_7  : std_logic;  
  signal  vmm_ckart_7 : std_logic;
  
  signal  vmm_di_8 	  : std_logic;
  signal  vmm_do_8    : std_logic;
  signal  vmm_wen_8   : std_logic;
  signal  vmm_ena_8   : std_logic;
  signal  vmm_cktk_8  : std_logic; 
  signal  vmm_cktp_8  : std_logic; 
  signal  vmm_ckbc_8  : std_logic; 
  signal  vmm_data0_8 : std_logic; 
  signal  vmm_data1_8 : std_logic; 
  signal  vmm_art_8   : std_logic;
  signal  vmm_ckdt_8  : std_logic;  
  signal  vmm_ckart_8 : std_logic;
  
  signal  vmm_tko     : STD_LOGIC;
  signal  vmm_setb    : STD_LOGIC;
  signal  vmm_tki     : STD_LOGIC;
  signal  vmm_tki_i   : STD_LOGIC;
  signal  vmm_tki_en  : STD_LOGIC;    
  signal  vmm_sett    : STD_LOGIC;
  -- kjohns signals here end
  
  
  --signal  gpio_i : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  --signal  gpio_o : STD_LOGIC_VECTOR ( 31 downto 0 );   
  --signal  gpio_t : STD_LOGIC_VECTOR ( 31 downto 0 );
   
  signal  EXT_AXI_araddr  : STD_LOGIC_VECTOR ( 31 downto 0 );  
  signal  EXT_AXI_arready : STD_LOGIC;  -->> in
  signal  EXT_AXI_arvalid : STD_LOGIC;  --<< out
  signal  EXT_AXI_arprot  : STD_LOGIC_VECTOR ( 2 downto 0 );
  
  signal  EXT_AXI_awaddr  : STD_LOGIC_VECTOR ( 31 downto 0 );  
  signal  EXT_AXI_awready : STD_LOGIC;  -->> in
  signal  EXT_AXI_awvalid : STD_LOGIC;  --<< out
  signal  EXT_AXI_awprot  : STD_LOGIC_VECTOR ( 2 downto 0 );
   
   signal  EXT_AXI_rdata  : STD_LOGIC_VECTOR ( 31 downto 0 );  
   signal  EXT_AXI_rready : STD_LOGIC;  --<< out
   signal  EXT_AXI_rvalid : STD_LOGIC;  -->> in
   signal  EXT_AXI_rvalid_z : STD_LOGIC_VECTOR ( 2 downto 0 );  -- used to delay  rvalid response
   
   signal   EXT_AXI_wdata  : STD_LOGIC_VECTOR ( 31 downto 0 );
   signal   EXT_AXI_wready : STD_LOGIC; -->> in
   signal   EXT_AXI_wvalid : STD_LOGIC; --<< out  
   signal   EXT_AXI_wstrb  : STD_LOGIC_VECTOR ( 3 downto 0 );
   signal   EXT_AXI_wdata_v : STD_LOGIC_VECTOR ( 31 downto 0 );
   
   attribute dont_touch of EXT_AXI_araddr: signal is "true"; 
   attribute dont_touch of EXT_AXI_arready: signal is "true"; 
   attribute dont_touch of EXT_AXI_arvalid: signal is "true"; 
   attribute dont_touch of EXT_AXI_arprot: signal is "true"; 
   
   attribute dont_touch of EXT_AXI_awaddr: signal is "true"; 
   attribute dont_touch of EXT_AXI_awready: signal is "true"; 
   attribute dont_touch of EXT_AXI_awvalid: signal is "true"; 
   attribute dont_touch of EXT_AXI_awprot: signal is "true";    
      
   attribute dont_touch of EXT_AXI_rdata: signal is "true"; 
   attribute dont_touch of EXT_AXI_rready: signal is "true"; 
   attribute dont_touch of EXT_AXI_rvalid: signal is "true"; 
  
   attribute dont_touch of EXT_AXI_wdata: signal is "true"; 
   attribute dont_touch of EXT_AXI_wready: signal is "true"; 
   attribute dont_touch of EXT_AXI_wvalid: signal is "true"; 
   attribute dont_touch of EXT_AXI_wstrb: signal is "true";    
  
   signal axi_addr_muxed : STD_LOGIC_VECTOR ( 15 downto 0 );  
   signal axi_addr_read : STD_LOGIC_VECTOR ( 15 downto 0 ); 
   signal axi_addr_write : STD_LOGIC_VECTOR ( 15 downto 0 ); 
   
   signal  EXT_AXI_CLK  : STD_LOGIC; --<< out  
   signal  EXT_AXI_RESETN : STD_LOGIC; --<< out  
--  
   signal axi_we_axi_reg_0,axi_we_axi_reg_1,axi_we_axi_reg_2,axi_we_axi_reg_3,axi_we_axi_reg_4 : STD_LOGIC;  
   signal axi_we_axi_reg_5,axi_we_axi_reg_6,axi_we_axi_reg_7,axi_we_axi_reg_8,axi_we_axi_reg_9 : STD_LOGIC;
   signal axi_we_axi_reg_10,axi_we_axi_reg_11,axi_we_axi_reg_12,axi_we_axi_reg_13,axi_we_axi_reg_14 : STD_LOGIC;  
   signal axi_we_axi_reg_15,axi_we_axi_reg_16,axi_we_axi_reg_17,axi_we_axi_reg_18,axi_we_axi_reg_19 : STD_LOGIC;
   signal axi_we_axi_reg_20,axi_we_axi_reg_21,axi_we_axi_reg_22,axi_we_axi_reg_23,axi_we_axi_reg_24 : STD_LOGIC;  
   signal axi_we_axi_reg_25,axi_we_axi_reg_26,axi_we_axi_reg_27,axi_we_axi_reg_28,axi_we_axi_reg_29 : STD_LOGIC;
   signal axi_we_axi_reg_30,axi_we_axi_reg_31,axi_we_axi_reg_32,axi_we_axi_reg_33,axi_we_axi_reg_34 : STD_LOGIC;  
   signal axi_we_axi_reg_35,axi_we_axi_reg_36,axi_we_axi_reg_37,axi_we_axi_reg_38,axi_we_axi_reg_39 : STD_LOGIC;
   signal axi_we_axi_reg_40,axi_we_axi_reg_41,axi_we_axi_reg_42,axi_we_axi_reg_43,axi_we_axi_reg_44 : STD_LOGIC;  
   signal axi_we_axi_reg_45,axi_we_axi_reg_46,axi_we_axi_reg_47,axi_we_axi_reg_48,axi_we_axi_reg_49 : STD_LOGIC;
   signal axi_we_axi_reg_50,axi_we_axi_reg_51,axi_we_axi_reg_52,axi_we_axi_reg_53,axi_we_axi_reg_54 : STD_LOGIC;  
   signal axi_we_axi_reg_55,axi_we_axi_reg_56,axi_we_axi_reg_57,axi_we_axi_reg_58,axi_we_axi_reg_59 : STD_LOGIC;
   signal axi_we_axi_reg_60,axi_we_axi_reg_61,axi_we_axi_reg_62,axi_we_axi_reg_63,axi_we_axi_reg_64 : STD_LOGIC;  
   signal axi_we_axi_reg_65,axi_we_axi_reg_66,axi_we_axi_reg_67,axi_we_axi_reg_68,axi_we_axi_reg_69 : STD_LOGIC;
   signal axi_we_axi_reg_70,axi_we_axi_reg_71,axi_we_axi_reg_72,axi_we_axi_reg_73,axi_we_axi_reg_74 : STD_LOGIC;  
   signal axi_we_axi_reg_75,axi_we_axi_reg_76,axi_we_axi_reg_77,axi_we_axi_reg_78,axi_we_axi_reg_79 : STD_LOGIC;
   signal axi_we_axi_reg_amux : STD_LOGIC;
   
   signal axi_reg_0       ,axi_reg_1       ,axi_reg_2       ,axi_reg_3       ,axi_reg_4 : STD_LOGIC_VECTOR(31 downto 0);  
   signal axi_reg_5       ,axi_reg_6       ,axi_reg_7       ,axi_reg_8       ,axi_reg_9 : STD_LOGIC_VECTOR(31 downto 0);    
   signal axi_reg_10      ,axi_reg_11      ,axi_reg_12      ,axi_reg_13      ,axi_reg_14 : STD_LOGIC_VECTOR(31 downto 0);  
   signal axi_reg_15      ,axi_reg_16      ,axi_reg_17      ,axi_reg_18      ,axi_reg_19 : STD_LOGIC_VECTOR(31 downto 0);    
   signal axi_reg_20      ,axi_reg_21      ,axi_reg_22      ,axi_reg_23      ,axi_reg_24 : STD_LOGIC_VECTOR(31 downto 0);  
   signal axi_reg_25      ,axi_reg_26      ,axi_reg_27      ,axi_reg_28      ,axi_reg_29 : STD_LOGIC_VECTOR(31 downto 0); 
   signal axi_reg_30      ,axi_reg_31      ,axi_reg_32      ,axi_reg_33      ,axi_reg_34 : STD_LOGIC_VECTOR(31 downto 0);  
   signal axi_reg_35      ,axi_reg_36      ,axi_reg_37      ,axi_reg_38      ,axi_reg_39 : STD_LOGIC_VECTOR(31 downto 0);
   signal axi_reg_40      ,axi_reg_41      ,axi_reg_42      ,axi_reg_43      ,axi_reg_44 : STD_LOGIC_VECTOR(31 downto 0);  
   signal axi_reg_45      ,axi_reg_46      ,axi_reg_47      ,axi_reg_48      ,axi_reg_49 : STD_LOGIC_VECTOR(31 downto 0); 
   signal axi_reg_50      ,axi_reg_51      ,axi_reg_52      ,axi_reg_53      ,axi_reg_54 : STD_LOGIC_VECTOR(31 downto 0);  
   signal axi_reg_55      ,axi_reg_56      ,axi_reg_57      ,axi_reg_58      ,axi_reg_59 : STD_LOGIC_VECTOR(31 downto 0);
   signal axi_reg_60      ,axi_reg_61      ,axi_reg_62      ,axi_reg_63      ,axi_reg_64 : STD_LOGIC_VECTOR(31 downto 0);  
   signal axi_reg_65      ,axi_reg_66      ,axi_reg_67      ,axi_reg_68      ,axi_reg_69 : STD_LOGIC_VECTOR(31 downto 0); 
   signal axi_reg_70      ,axi_reg_71      ,axi_reg_72      ,axi_reg_73      ,axi_reg_74 : STD_LOGIC_VECTOR(31 downto 0);  
   signal axi_reg_75      ,axi_reg_76      ,axi_reg_77      ,axi_reg_78      ,axi_reg_79 : STD_LOGIC_VECTOR(31 downto 0);

  
   signal axi_reg_amux : STD_LOGIC_VECTOR(3 downto 0);
   -- Created two, but only used one
   signal axi_pop_vmm1,axi_pop_vmm2            : STD_LOGIC;
   signal axi_rdata_ls_vmm1,axi_rdata_ls_vmm2  : STD_LOGIC_VECTOR(31 downto 0);
   signal axi_rdata_rcnt_vmm1,axi_rdata_rcnt_vmm2 : STD_LOGIC_VECTOR(31 downto 0);

begin
mbsys_i: component mbsys
    port map (
      EXT_AXI_CLK => EXT_AXI_CLK,
      EXT_AXI_RESETN(0) => EXT_AXI_RESETN,
      EXT_AXI_araddr => EXT_AXI_araddr,
      EXT_AXI_arprot => EXT_AXI_arprot,
      EXT_AXI_arready(0) => EXT_AXI_arready,
      EXT_AXI_arvalid (0)=> EXT_AXI_arvalid,
      EXT_AXI_awaddr => EXT_AXI_awaddr,
      EXT_AXI_awprot => EXT_AXI_awprot,
      EXT_AXI_awready(0) => EXT_AXI_awready,
      EXT_AXI_awvalid(0) => EXT_AXI_awvalid,
      EXT_AXI_bready => open,
      EXT_AXI_bresp => "00",
      EXT_AXI_bvalid(0) => '1',
      EXT_AXI_rdata=> EXT_AXI_rdata(31 downto 0),
      EXT_AXI_rready(0) => EXT_AXI_rready,
      EXT_AXI_rresp => "00",
      EXT_AXI_rvalid(0) => EXT_AXI_rvalid,
      EXT_AXI_wdata => EXT_AXI_wdata(31 downto 0),
      EXT_AXI_wready(0) => EXT_AXI_wready,
      EXT_AXI_wstrb => EXT_AXI_wstrb,
      EXT_AXI_wvalid(0) => EXT_AXI_wvalid,
      
      Vaux0_v_n => Vaux0_v_n,
      Vaux0_v_p => Vaux0_v_p,
      Vaux1_v_n => Vaux1_v_n,
      Vaux1_v_p => Vaux1_v_p,
      Vaux2_v_n => Vaux2_v_n,
      Vaux2_v_p => Vaux2_v_p,
      Vaux3_v_n => Vaux3_v_n,
      Vaux3_v_p => Vaux3_v_p,

      Vaux8_v_n => Vaux8_v_n,
      Vaux8_v_p => Vaux8_v_p,
      Vaux9_v_n => Vaux9_v_n,
      Vaux9_v_p =>  Vaux9_v_p,
      Vaux10_v_n => Vaux10_v_n,
      Vaux10_v_p => Vaux10_v_p,
      Vaux11_v_n => Vaux11_v_n,
      Vaux11_v_p => Vaux11_v_p,      
      
      Vp_Vn_v_n => Vp_Vn_v_n,
      Vp_Vn_v_p => Vp_Vn_v_p,       
      
--     gpio_rtl_tri_i  => open, --gpio_i,
--      gpio_rtl_tri_o => gpio_o,
--      gpio_rtl_tri_t => gpio_t,   

--      mgtrefclk1 => mgtrefclk1,
      mgtrefclk1 => clk_200, 
           
      diff_clock_rtl_clk_n => MGTREFCLK0N,
      diff_clock_rtl_clk_p => MGTREFCLK0P,
      
      --ref_clk_125_p => MGTREFCLK0P,
      --ref_clk_125_n => MGTREFCLK0N,        
        
      ext_reset_in => '1',
      mdio_rtl_mdc => mdio_rtl_mdc,
      mdio_rtl_mdio_i => mdio_rtl_mdio_i,
      mdio_rtl_mdio_o => mdio_rtl_mdio_o,
      mdio_rtl_mdio_t => mdio_rtl_mdio_t,
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
    
-- note andy uses mgtrefclk0, it is in his process
    
IBUFDS_GTE2_inst_1:  IBUFDS_GTE2 
    generic map (
       CLKCM_CFG => TRUE,    -- Refer to Transceiver User Guide
       CLKRCV_TRST => TRUE,  -- Refer to Transceiver User Guide
       CLKSWING_CFG => "11"  -- Refer to Transceiver User Guide
    )
    port map (
       O => mgtrefclk1,  -- Buffer output
         ODIV2 => open, 
         CEB => '0',
       I => MGTREFCLK1P,  -- Diff_p buffer input (connect directly to top-level port)
       IB => MGTREFCLK1N -- Diff_n buffer input (connect directly to top-level port)
    );
    
    
 -- kjohns instances here    
   clk_user_inst : clk_wiz_0
   port map ( 

-- Clock in ports
   clk_in1 => clk_400_clean,
-- Clock out ports  
   clk_200_o => clk_200,
   clk_160_o => clk_160,
   clk_100_o => clk_100,
   clk_50_o => clk_50,
   clk_40_o => clk_40,
   clk_20_o => clk_20, 
   clk_10_o => clk_10          
   );
       
clk_200_to_400_inst : clk_wiz_200_to_400
          port map ( 
       
          -- Clock in ports
          clk_in1_p => X_2V5_DIFF_CLK_P,
          clk_in1_n => X_2V5_DIFF_CLK_N,
         -- Clock out ports  
          clk_out_400 => clk_400_noclean              
        );
               
clk_400_low_jitter_inst : clk_wiz_low_jitter
           port map ( 
        
           -- Clock in ports
           clk_in1 => clk_400_noclean,
          -- Clock out ports  
           clk_out1 => clk_400_clean              
         );
                
-- kjohns assigns probes
       
       probe0_out_i(0) <= vmm_ena;
       probe1_out_i(0) <= vmm_wen;
       probe2_out_i(0) <= vmm_ckbc;
       probe3_out_i(0) <= vmm_ckbc_en;
       probe4_out_i(0) <= vmm_cktp;
       probe5_out_i(0) <= cktp_done;
       probe6_out_i(0) <= vmm_cktk;
       probe7_out_i(0) <= vmm_cktk_en_i; 
       probe8_out_i(0) <= vmm_ckdt; 
       probe9_out_i(0) <= vmm_ckdt_en_i;  
       probe10_out_i(0) <= fifo_wr_en_i; 
       probe11_out_i(0) <= vmm_data0;
       probe12_out_i(0) <= vmm_data1;
       probe13_out_i    <= counter_for_cktp_done;
       probe14_out_i    <= vmm_data_buf_i;
       probe15_out_i    <= din_i; 
                                     
     
ila_1_inst : ila_1
       PORT MAP (
           clk => clk_200,
       
           probe0 => probe0_out_i, 
           probe1 => probe1_out_i, 
           probe2 => probe2_out_i,
           probe3 => probe3_out_i, 
           probe4 => probe4_out_i, 
           probe5 => probe5_out_i,
           probe6 => probe6_out_i, 
           probe7 => probe7_out_i, 
           probe8 => probe8_out_i,
           probe9 => probe9_out_i, 
           probe10 => probe10_out_i, 
           probe11 => probe11_out_i,
           probe12 => probe12_out_i, 
           probe13 => probe13_out_i, 
           probe14 => probe14_out_i,
           probe15 => probe15_out_i 
                                           
       );       
   
    external_trigger_inst: external_trigger
    port map
    (
           clk_40MHz              => clk_40,  
           reset_for_bc_counters  => vmm_ckbc_en, 
           ext_trigger_in         => external_trigger_deb,  -- debounced
           ext_trigger_pulse      => external_trigger_pulse_i,
           busy_from_ext_trigger  => busy_from_external_trigger_i,
           bcid_counter           => bcid_counter_i,
           bcid_captured          => bcid_captured_i,
           bcid_corrected         => bcid_corrected_i,
           turn_counter           => turn_counter_i,
           turn_captured          => turn_captured_i
    );
    
	vmm_cfg_inst: vmm_cfg 
	port map
	(
		clk_ila			=> clk_100, 
		clk200			=> clk_200 , -- 200MHz
		vmm_clk_200     => clk_200 ,
		
	    clk100			=> clk_100 , -- 100MHz
	    vmm_clk_100     => clk_100 ,
	    
		reset			=> reset,

		cfg_bit_in		=> vmm_do, -- in from vmm --b
		cfg_bit_out		=> vmm_di, -- out to vmm  --b

		vmm_ena			=> vmm_ena,
		vmm_wen			=> vmm_wen,
  
        vmm_ckdt_en     => vmm_ckdt_en_i,
        vmm_ckdt        => vmm_ckdt, 

        vmm_ckart_en    => vmm_ckart_en,
        vmm_ckart       => vmm_ckart,


		vmm_cktk_en		=> vmm_cktk_en_i, 
		vmm_cktk		=> vmm_cktk,
		
		vmm_cktp_en	    => vmm_cktp_en, 
		vmm_cktp		=> vmm_cktp,
		
		vmm_ckbc_en		=> vmm_ckbc_en, 
		vmm_ckbc		=> vmm_ckbc,
		        
		vmm_data0		=> vmm_data0,
		vmm_data1		=> vmm_data1,
		vmm_art 		=> vmm_art,
		wr_en           => fifo_wr_en_i,
		din             => din_i,          
        dt_cntr_intg0_i => dt_cntr_intg0_i,
        dt_cntr_intg1_i => dt_cntr_intg1_i,  
        vmm_data_buf_i  => vmm_data_buf_i,        

        vmm_2cfg        =>  vmm_2cfg_i,  
        vmm_2display    =>  vmm_2display_i,
        mmfeID          =>  mmfeID_i,
        		
		LEDx 			=> LEDx,
		testX           => testX,
		axi_reg_4       => axi_reg_4,
	    axi_reg_5       => axi_reg_5,
		axi_reg_6       => axi_reg_6,
        axi_reg_7       => axi_reg_7,
        axi_reg_8       => axi_reg_8,
		axi_reg_9       => axi_reg_9,
        axi_reg_10       => axi_reg_10,
        axi_reg_11       => axi_reg_11,
		axi_reg_12       => axi_reg_12,
        axi_reg_13       => axi_reg_13,
        axi_reg_14       => axi_reg_14,   
		axi_reg_15       => axi_reg_15,
        axi_reg_16       => axi_reg_16,
        axi_reg_17       => axi_reg_17,
        axi_reg_18       => axi_reg_18,
        axi_reg_19       => axi_reg_19,
        axi_reg_20       => axi_reg_20,
        axi_reg_21       => axi_reg_21,
        axi_reg_22       => axi_reg_22,
        axi_reg_23       => axi_reg_23,
        axi_reg_24       => axi_reg_24,
        axi_reg_25       => axi_reg_25,
        axi_reg_26       => axi_reg_26, 
        axi_reg_27       => axi_reg_27,
        axi_reg_28       => axi_reg_28,
        axi_reg_29       => axi_reg_29,
        axi_reg_30       => axi_reg_30,
        axi_reg_31       => axi_reg_31,
        axi_reg_32       => axi_reg_32,
        axi_reg_33       => axi_reg_33,
        axi_reg_34       => axi_reg_34,
        axi_reg_35       => axi_reg_35,
        axi_reg_36       => axi_reg_36,
        axi_reg_37       => axi_reg_37,
        axi_reg_38       => axi_reg_38, 
		axi_reg_39       => axi_reg_39,
        axi_reg_40       => axi_reg_40,
        axi_reg_41       => axi_reg_41,
        axi_reg_42       => axi_reg_42,
        axi_reg_43       => axi_reg_43,
        axi_reg_44       => axi_reg_44,
        axi_reg_45       => axi_reg_45,
        axi_reg_46       => axi_reg_46,
        axi_reg_47       => axi_reg_47,
        axi_reg_48       => axi_reg_48,
        axi_reg_49       => axi_reg_49,
        axi_reg_50       => axi_reg_50, 
		axi_reg_51       => axi_reg_51,
        axi_reg_52       => axi_reg_52,
        axi_reg_53       => axi_reg_53, 
        axi_reg_54       => axi_reg_54,
        vmm_cfg_sel      => axi_reg_59,        
        
        axi_clk => EXT_AXI_CLK,
        axi_pop_vmm1 => axi_pop_vmm1,
        axi_rdata_ls_vmm1 => axi_rdata_ls_vmm1,
        axi_rdata_rcnt_vmm1 => axi_rdata_rcnt_vmm1       
                                         	    
	);

    -- i/o for vmm
	-- config data in from vmm 
    do_diff_1 : IBUFDS port map ( O =>  vmm_do_1, I =>  DO_1_P, IB => DO_1_N);
    do_diff_2 : IBUFDS port map ( O =>  vmm_do_2, I =>  DO_2_P, IB => DO_2_N);
    do_diff_3 : IBUFDS port map ( O =>  vmm_do_3, I =>  DO_3_P, IB => DO_3_N);
    do_diff_4 : IBUFDS port map ( O =>  vmm_do_4, I =>  DO_4_P, IB => DO_4_N);
    do_diff_5 : IBUFDS port map ( O =>  vmm_do_5, I =>  DO_5_P, IB => DO_5_N);
    do_diff_6 : IBUFDS port map ( O =>  vmm_do_6, I =>  DO_6_P, IB => DO_6_N);
    do_diff_7 : IBUFDS port map ( O =>  vmm_do_7, I =>  DO_7_P, IB => DO_7_N);
    do_diff_8 : IBUFDS port map ( O =>  vmm_do_8, I =>  DO_8_P, IB => DO_8_N);
	
	-- config data out to vmm 
	di_diff_1 : OBUFDS port map ( O => DI_1_P, OB => DI_1_N, I =>  vmm_di_1);
    di_diff_2 : OBUFDS port map ( O => DI_2_P, OB => DI_2_N, I =>  vmm_di_2);
	di_diff_3 : OBUFDS port map ( O => DI_3_P, OB => DI_3_N, I =>  vmm_di_3);
    di_diff_4 : OBUFDS port map ( O => DI_4_P, OB => DI_4_N, I =>  vmm_di_4);
	di_diff_5 : OBUFDS port map ( O => DI_5_P, OB => DI_5_N, I =>  vmm_di_5);
    di_diff_6 : OBUFDS port map ( O => DI_6_P, OB => DI_6_N, I =>  vmm_di_6);
	di_diff_7 : OBUFDS port map ( O => DI_7_P, OB => DI_7_N, I =>  vmm_di_7);
    di_diff_8 : OBUFDS port map ( O => DI_8_P, OB => DI_8_N, I =>  vmm_di_8);

vmm_di_r_vec( 0) <= not( vmm_di_en_vec( 0));
vmm_di_r_vec( 1) <= not( vmm_di_en_vec( 1));
vmm_di_r_vec( 2) <= not( vmm_di_en_vec( 2));
vmm_di_r_vec( 3) <= not( vmm_di_en_vec( 3));
vmm_di_r_vec( 4) <= not( vmm_di_en_vec( 4));
vmm_di_r_vec( 5) <= not( vmm_di_en_vec( 5));
vmm_di_r_vec( 6) <= not( vmm_di_en_vec( 6));
vmm_di_r_vec( 7) <= not( vmm_di_en_vec( 7));

di_ODDR_1 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                 port map( Q => vmm_di_1, C => vmm_di, CE => vmm_di_en_vec( 0), D1 => '1', D2 => '0', R => vmm_di_r_vec( 0), S => '0');
di_ODDR_2 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                 port map( Q => vmm_di_2, C => vmm_di, CE => vmm_di_en_vec( 1), D1 => '1', D2 => '0', R => vmm_di_r_vec( 1), S => '0');
di_ODDR_3 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                 port map( Q => vmm_di_3, C => vmm_di, CE => vmm_di_en_vec( 2), D1 => '1', D2 => '0', R => vmm_di_r_vec( 2), S => '0');
di_ODDR_4 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                 port map( Q => vmm_di_4, C => vmm_di, CE => vmm_di_en_vec( 3), D1 => '1', D2 => '0', R => vmm_di_r_vec( 3), S => '0');
di_ODDR_5 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                 port map( Q => vmm_di_5, C => vmm_di, CE => vmm_di_en_vec( 4), D1 => '1', D2 => '0', R => vmm_di_r_vec( 4), S => '0');
di_ODDR_6 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                 port map( Q => vmm_di_6, C => vmm_di, CE => vmm_di_en_vec( 5), D1 => '1', D2 => '0', R => vmm_di_r_vec( 5), S => '0');
di_ODDR_7 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                 port map( Q => vmm_di_7, C => vmm_di, CE => vmm_di_en_vec( 6), D1 => '1', D2 => '0', R => vmm_di_r_vec( 6), S => '0');
di_ODDR_8 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                 port map( Q => vmm_di_8, C => vmm_di, CE => vmm_di_en_vec( 7), D1 => '1', D2 => '0', R => vmm_di_r_vec( 7), S => '0');
	
	wen_diff_1 : OBUFDS port map ( O =>  WEN_1_P, OB => WEN_1_N, I =>  vmm_wen_1);
    wen_diff_2 : OBUFDS port map ( O =>  WEN_2_P, OB => WEN_2_N, I =>  vmm_wen_2);
	wen_diff_3 : OBUFDS port map ( O =>  WEN_3_P, OB => WEN_3_N, I =>  vmm_wen_3);
    wen_diff_4 : OBUFDS port map ( O =>  WEN_4_P, OB => WEN_4_N, I =>  vmm_wen_4);
	wen_diff_5 : OBUFDS port map ( O =>  WEN_5_P, OB => WEN_5_N, I =>  vmm_wen_5);
    wen_diff_6 : OBUFDS port map ( O =>  WEN_6_P, OB => WEN_6_N, I =>  vmm_wen_6);
	wen_diff_7 : OBUFDS port map ( O =>  WEN_7_P, OB => WEN_7_N, I =>  vmm_wen_7);
    wen_diff_8 : OBUFDS port map ( O =>  WEN_8_P, OB => WEN_8_N, I =>  vmm_wen_8);
    
    vmm_wen_R <= not( vmm_wen_en);
    
    wen_ODDR_1 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                      port map( Q => vmm_wen_1, C => vmm_wen, CE => vmm_wen_en, D1 => '1', D2 => '0', R => vmm_wen_R, S => '0');
    wen_ODDR_2 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                      port map( Q => vmm_wen_2, C => vmm_wen, CE => vmm_wen_en, D1 => '1', D2 => '0', R => vmm_wen_R, S => '0');
    wen_ODDR_3 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                      port map( Q => vmm_wen_3, C => vmm_wen, CE => vmm_wen_en, D1 => '1', D2 => '0', R => vmm_wen_R, S => '0');
    wen_ODDR_4 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                      port map( Q => vmm_wen_4, C => vmm_wen, CE => vmm_wen_en, D1 => '1', D2 => '0', R => vmm_wen_R, S => '0');
    wen_ODDR_5 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                      port map( Q => vmm_wen_5, C => vmm_wen, CE => vmm_wen_en, D1 => '1', D2 => '0', R => vmm_wen_R, S => '0');
    wen_ODDR_6 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                      port map( Q => vmm_wen_6, C => vmm_wen, CE => vmm_wen_en, D1 => '1', D2 => '0', R => vmm_wen_R, S => '0');
    wen_ODDR_7 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                      port map( Q => vmm_wen_7, C => vmm_wen, CE => vmm_wen_en, D1 => '1', D2 => '0', R => vmm_wen_R, S => '0');
    wen_ODDR_8 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                      port map( Q => vmm_wen_8, C => vmm_wen, CE => vmm_wen_en, D1 => '1', D2 => '0', R => vmm_wen_R, S => '0');    

    vmm_wen_en <= '1';
	
	ena_diff_1 : OBUFDS port map ( O =>  ENA_1_P, OB => ENA_1_N, I =>  vmm_ena_1);
    ena_diff_2 : OBUFDS port map ( O =>  ENA_2_P, OB => ENA_2_N, I =>  vmm_ena_2);
	ena_diff_3 : OBUFDS port map ( O =>  ENA_3_P, OB => ENA_3_N, I =>  vmm_ena_3);
    ena_diff_4 : OBUFDS port map ( O =>  ENA_4_P, OB => ENA_4_N, I =>  vmm_ena_4);
	ena_diff_5 : OBUFDS port map ( O =>  ENA_5_P, OB => ENA_5_N, I =>  vmm_ena_5);
    ena_diff_6 : OBUFDS port map ( O =>  ENA_6_P, OB => ENA_6_N, I =>  vmm_ena_6);
	ena_diff_7 : OBUFDS port map ( O =>  ENA_7_P, OB => ENA_7_N, I =>  vmm_ena_7);
    ena_diff_8 : OBUFDS port map ( O =>  ENA_8_P, OB => ENA_8_N, I =>  vmm_ena_8);
	
    vmm_ena_R <= not( vmm_ena_en);
    
    ena_ODDR_1 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                      port map( Q => vmm_ena_1, C => vmm_ena, CE => vmm_ena_en, D1 => '1', D2 => '0', R => vmm_ena_R, S => '0');
    ena_ODDR_2 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                      port map( Q => vmm_ena_2, C => vmm_ena, CE => vmm_ena_en, D1 => '1', D2 => '0', R => vmm_ena_R, S => '0');
    ena_ODDR_3 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                      port map( Q => vmm_ena_3, C => vmm_ena, CE => vmm_ena_en, D1 => '1', D2 => '0', R => vmm_ena_R, S => '0');
    ena_ODDR_4 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                      port map( Q => vmm_ena_4, C => vmm_ena, CE => vmm_ena_en, D1 => '1', D2 => '0', R => vmm_ena_R, S => '0');
    ena_ODDR_5 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                      port map( Q => vmm_ena_5, C => vmm_ena, CE => vmm_ena_en, D1 => '1', D2 => '0', R => vmm_ena_R, S => '0');
    ena_ODDR_6 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                      port map( Q => vmm_ena_6, C => vmm_ena, CE => vmm_ena_en, D1 => '1', D2 => '0', R => vmm_ena_R, S => '0');
    ena_ODDR_7 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                      port map( Q => vmm_ena_7, C => vmm_ena, CE => vmm_ena_en, D1 => '1', D2 => '0', R => vmm_ena_R, S => '0');
    ena_ODDR_8 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                      port map( Q => vmm_ena_8, C => vmm_ena, CE => vmm_ena_en, D1 => '1', D2 => '0', R => vmm_ena_R, S => '0');
    
    vmm_ena_en <= '1';
    
	ckbc_diff_1 : OBUFDS port map ( O =>  CKBC_1_P, OB => CKBC_1_N, I =>  vmm_ckbc_1);
    ckbc_diff_2 : OBUFDS port map ( O =>  CKBC_2_P, OB => CKBC_2_N, I =>  vmm_ckbc_2);
	ckbc_diff_3 : OBUFDS port map ( O =>  CKBC_3_P, OB => CKBC_3_N, I =>  vmm_ckbc_3);
    ckbc_diff_4 : OBUFDS port map ( O =>  CKBC_4_P, OB => CKBC_4_N, I =>  vmm_ckbc_4);
	ckbc_diff_5 : OBUFDS port map ( O =>  CKBC_5_P, OB => CKBC_5_N, I =>  vmm_ckbc_5);
    ckbc_diff_6 : OBUFDS port map ( O =>  CKBC_6_P, OB => CKBC_6_N, I =>  vmm_ckbc_6);
	ckbc_diff_7 : OBUFDS port map ( O =>  CKBC_7_P, OB => CKBC_7_N, I =>  vmm_ckbc_7);
    ckbc_diff_8 : OBUFDS port map ( O =>  CKBC_8_P, OB => CKBC_8_N, I =>  vmm_ckbc_8);

    vmm_ckbc_R <= not( vmm_ckbc_en);
                                                                                   
ckbc_ODDR_1 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                   port map( Q => vmm_ckbc_1, C => vmm_ckbc, CE => vmm_ckbc_en, D1 => '1', D2 => '0', R => vmm_ckbc_R, S => '0');
ckbc_ODDR_2 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                   port map( Q => vmm_ckbc_2, C => vmm_ckbc, CE => vmm_ckbc_en, D1 => '1', D2 => '0', R => vmm_ckbc_R, S => '0');
ckbc_ODDR_3 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                   port map( Q => vmm_ckbc_3, C => vmm_ckbc, CE => vmm_ckbc_en, D1 => '1', D2 => '0', R => vmm_ckbc_R, S => '0');
ckbc_ODDR_4 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                   port map( Q => vmm_ckbc_4, C => vmm_ckbc, CE => vmm_ckbc_en, D1 => '1', D2 => '0', R => vmm_ckbc_R, S => '0');
ckbc_ODDR_5 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                   port map( Q => vmm_ckbc_5, C => vmm_ckbc, CE => vmm_ckbc_en, D1 => '1', D2 => '0', R => vmm_ckbc_R, S => '0');
ckbc_ODDR_6 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                   port map( Q => vmm_ckbc_6, C => vmm_ckbc, CE => vmm_ckbc_en, D1 => '1', D2 => '0', R => vmm_ckbc_R, S => '0');
ckbc_ODDR_7 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                   port map( Q => vmm_ckbc_7, C => vmm_ckbc, CE => vmm_ckbc_en, D1 => '1', D2 => '0', R => vmm_ckbc_R, S => '0');
ckbc_ODDR_8 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                   port map( Q => vmm_ckbc_8, C => vmm_ckbc, CE => vmm_ckbc_en, D1 => '1', D2 => '0', R => vmm_ckbc_R, S => '0');
    
vmm_ckbc <= clk_bc_out;
                                                                                                                                                                      
	cktk_diff_1 : OBUFDS port map ( O =>  CKTK_1_P, OB => CKTK_1_N, I =>  vmm_cktk_1);
    cktk_diff_2 : OBUFDS port map ( O =>  CKTK_2_P, OB => CKTK_2_N, I =>  vmm_cktk_2);
	cktk_diff_3 : OBUFDS port map ( O =>  CKTK_3_P, OB => CKTK_3_N, I =>  vmm_cktk_3);
    cktk_diff_4 : OBUFDS port map ( O =>  CKTK_4_P, OB => CKTK_4_N, I =>  vmm_cktk_4);
	cktk_diff_5 : OBUFDS port map ( O =>  CKTK_5_P, OB => CKTK_5_N, I =>  vmm_cktk_5);
    cktk_diff_6 : OBUFDS port map ( O =>  CKTK_6_P, OB => CKTK_6_N, I =>  vmm_cktk_6);
	cktk_diff_7 : OBUFDS port map ( O =>  CKTK_7_P, OB => CKTK_7_N, I =>  vmm_cktk_7);
    cktk_diff_8 : OBUFDS port map ( O =>  CKTK_8_P, OB => CKTK_8_N, I =>  vmm_cktk_8);
	
    vmm_cktk_r_vec( 0) <= not( vmm_cktk_en_vec( 0));
    vmm_cktk_r_vec( 1) <= not( vmm_cktk_en_vec( 1));
    vmm_cktk_r_vec( 2) <= not( vmm_cktk_en_vec( 2));
    vmm_cktk_r_vec( 3) <= not( vmm_cktk_en_vec( 3));
    vmm_cktk_r_vec( 4) <= not( vmm_cktk_en_vec( 4));
    vmm_cktk_r_vec( 5) <= not( vmm_cktk_en_vec( 5));
    vmm_cktk_r_vec( 6) <= not( vmm_cktk_en_vec( 6));
    vmm_cktk_r_vec( 7) <= not( vmm_cktk_en_vec( 7));
    
    cktk_ODDR_1 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                       port map( Q => vmm_cktk_1, C => vmm_cktk, CE => vmm_cktk_en_vec( 0), D1 => '1', D2 => '0', R => vmm_cktk_r_vec( 0), S => '0');
    cktk_ODDR_2 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                       port map( Q => vmm_cktk_2, C => vmm_cktk, CE => vmm_cktk_en_vec( 1), D1 => '1', D2 => '0', R => vmm_cktk_r_vec( 1), S => '0');
    cktk_ODDR_3 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                       port map( Q => vmm_cktk_3, C => vmm_cktk, CE => vmm_cktk_en_vec( 2), D1 => '1', D2 => '0', R => vmm_cktk_r_vec( 2), S => '0');
    cktk_ODDR_4 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                       port map( Q => vmm_cktk_4, C => vmm_cktk, CE => vmm_cktk_en_vec( 3), D1 => '1', D2 => '0', R => vmm_cktk_r_vec( 3), S => '0');
    cktk_ODDR_5 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                       port map( Q => vmm_cktk_5, C => vmm_cktk, CE => vmm_cktk_en_vec( 4), D1 => '1', D2 => '0', R => vmm_cktk_r_vec( 4), S => '0');
    cktk_ODDR_6 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                       port map( Q => vmm_cktk_6, C => vmm_cktk, CE => vmm_cktk_en_vec( 5), D1 => '1', D2 => '0', R => vmm_cktk_r_vec( 5), S => '0');
    cktk_ODDR_7 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                       port map( Q => vmm_cktk_7, C => vmm_cktk, CE => vmm_cktk_en_vec( 6), D1 => '1', D2 => '0', R => vmm_cktk_r_vec( 6), S => '0');
    cktk_ODDR_8 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                       port map( Q => vmm_cktk_8, C => vmm_cktk, CE => vmm_cktk_en_vec( 7), D1 => '1', D2 => '0', R => vmm_cktk_r_vec( 7), S => '0');
    
-- vmm_cktk <= clk_tk_out or vmm_clk_int;
    vmm_cktk <= clk_tk_out;
    testX <= vmm_cktk_en_vec( 0);
-- testX <= vmm_cktk_en_vect(0);    
	cktp_diff_1 : OBUFDS port map ( O =>  CKTP_1_P, OB => CKTP_1_N, I => vmm_cktp_1);
    cktp_diff_2 : OBUFDS port map ( O =>  CKTP_2_P, OB => CKTP_2_N, I => vmm_cktp_2);
	cktp_diff_3 : OBUFDS port map ( O =>  CKTP_3_P, OB => CKTP_3_N, I => vmm_cktp_3);
    cktp_diff_4 : OBUFDS port map ( O =>  CKTP_4_P, OB => CKTP_4_N, I => vmm_cktp_4);
	cktp_diff_5 : OBUFDS port map ( O =>  CKTP_5_P, OB => CKTP_5_N, I => vmm_cktp_5);
    cktp_diff_6 : OBUFDS port map ( O =>  CKTP_6_P, OB => CKTP_6_N, I => vmm_cktp_6);
	cktp_diff_7 : OBUFDS port map ( O =>  CKTP_7_P, OB => CKTP_7_N, I => vmm_cktp_7);
    cktp_diff_8 : OBUFDS port map ( O =>  CKTP_8_P, OB => CKTP_8_N, I => vmm_cktp_8);

-- vmm_cktp_en <= '1';
-- vmm_cktp_R <= not( vmm_cktp_en);

-- kjohns for the moment we are pulsing all vmm
cktp_ODDR_1 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                   port map( Q => vmm_cktp_1, C => vmm_cktp, CE => '1', D1 => '1', D2 => '0', R => '0', S => '0');
cktp_ODDR_2 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                   port map( Q => vmm_cktp_2, C => vmm_cktp, CE => '1', D1 => '1', D2 => '0', R => '0', S => '0');
cktp_ODDR_3 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                   port map( Q => vmm_cktp_3, C => vmm_cktp, CE => '1', D1 => '1', D2 => '0', R => '0', S => '0');
cktp_ODDR_4 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                   port map( Q => vmm_cktp_4, C => vmm_cktp, CE => '1', D1 => '1', D2 => '0', R => '0', S => '0');
cktp_ODDR_5 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                   port map( Q => vmm_cktp_5, C => vmm_cktp, CE => '1', D1 => '1', D2 => '0', R => '0', S => '0');
cktp_ODDR_6 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                   port map( Q => vmm_cktp_6, C => vmm_cktp, CE => '1', D1 => '1', D2 => '0', R => '0', S => '0');
cktp_ODDR_7 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                   port map( Q => vmm_cktp_7, C => vmm_cktp, CE => '1', D1 => '1', D2 => '0', R => '0', S => '0');
cktp_ODDR_8 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                   port map( Q => vmm_cktp_8, C => vmm_cktp, CE => '1', D1 => '1', D2 => '0', R => '0', S => '0');

    vmm_cktp <= clk_tp_out;

    data0_diff_1 : IBUFDS    port map ( O => vmm_data0_1, I => DATA0_1_P, IB => DATA0_1_N);
    data0_diff_2 : IBUFDS    port map ( O => vmm_data0_2, I => DATA0_2_P, IB => DATA0_2_N);
    data0_diff_3 : IBUFDS    port map ( O => vmm_data0_3, I => DATA0_3_P, IB => DATA0_3_N);
    data0_diff_4 : IBUFDS    port map ( O => vmm_data0_4, I => DATA0_4_P, IB => DATA0_4_N);
    data0_diff_5 : IBUFDS    port map ( O => vmm_data0_5, I => DATA0_5_P, IB => DATA0_5_N);
    data0_diff_6 : IBUFDS    port map ( O => vmm_data0_6, I => DATA0_6_P, IB => DATA0_6_N);
    data0_diff_7 : IBUFDS    port map ( O => vmm_data0_7, I => DATA0_7_P, IB => DATA0_7_N);
    data0_diff_8 : IBUFDS    port map ( O => vmm_data0_8, I => DATA0_8_P, IB => DATA0_8_N);

    data1_diff_1 : IBUFDS    port map ( O => vmm_data1_1, I => DATA1_1_P, IB => DATA1_1_N);
    data1_diff_2 : IBUFDS    port map ( O => vmm_data1_2, I => DATA1_2_P, IB => DATA1_2_N);
    data1_diff_3 : IBUFDS    port map ( O => vmm_data1_3, I => DATA1_3_P, IB => DATA1_3_N);
    data1_diff_4 : IBUFDS    port map ( O => vmm_data1_4, I => DATA1_4_P, IB => DATA1_4_N);
    data1_diff_5 : IBUFDS    port map ( O => vmm_data1_5, I => DATA1_5_P, IB => DATA1_5_N);
    data1_diff_6 : IBUFDS    port map ( O => vmm_data1_6, I => DATA1_6_P, IB => DATA1_6_N);
    data1_diff_7 : IBUFDS    port map ( O => vmm_data1_7, I => DATA1_7_P, IB => DATA1_7_N);
    data1_diff_8 : IBUFDS    port map ( O => vmm_data1_8, I => DATA1_8_P, IB => DATA1_8_N);

	ckdt_diff_1 : OBUFDS port map ( O => ckdt_1_P, OB => ckdt_1_N, I => vmm_ckdt_1);
	ckdt_diff_2 : OBUFDS port map ( O => ckdt_2_P, OB => ckdt_2_N, I => vmm_ckdt_2);
	ckdt_diff_3 : OBUFDS port map ( O => ckdt_3_P, OB => ckdt_3_N, I => vmm_ckdt_3);
	ckdt_diff_4 : OBUFDS port map ( O => ckdt_4_P, OB => ckdt_4_N, I => vmm_ckdt_4);
	ckdt_diff_5 : OBUFDS port map ( O => ckdt_5_P, OB => ckdt_5_N, I => vmm_ckdt_5);
	ckdt_diff_6 : OBUFDS port map ( O => ckdt_6_P, OB => ckdt_6_N, I => vmm_ckdt_6);
	ckdt_diff_7 : OBUFDS port map ( O => ckdt_7_P, OB => ckdt_7_N, I => vmm_ckdt_7);
	ckdt_diff_8 : OBUFDS port map ( O => ckdt_8_P, OB => ckdt_8_N, I => vmm_ckdt_8);

vmm_ckdt_r_vec( 0) <= not( vmm_ckdt_en_vec( 0));
vmm_ckdt_r_vec( 1) <= not( vmm_ckdt_en_vec( 1));
vmm_ckdt_r_vec( 2) <= not( vmm_ckdt_en_vec( 2));
vmm_ckdt_r_vec( 3) <= not( vmm_ckdt_en_vec( 3));
vmm_ckdt_r_vec( 4) <= not( vmm_ckdt_en_vec( 4));
vmm_ckdt_r_vec( 5) <= not( vmm_ckdt_en_vec( 5));
vmm_ckdt_r_vec( 6) <= not( vmm_ckdt_en_vec( 6));
vmm_ckdt_r_vec( 7) <= not( vmm_ckdt_en_vec( 7));

ckdt_ODDR_1 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                    port map( Q => vmm_ckdt_1, C => vmm_ckdt, CE => vmm_ckdt_en_vec( 0), D1 => '1', D2 => '0', R => vmm_ckdt_r_vec( 0), S => '0');
ckdt_ODDR_2 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC")
                    port map( Q => vmm_ckdt_2, C => vmm_ckdt, CE => vmm_ckdt_en_vec( 1), D1 => '1', D2 => '0', R => vmm_ckdt_r_vec( 1), S => '0');
ckdt_ODDR_3 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC")
                    port map( Q => vmm_ckdt_3, C => vmm_ckdt, CE => vmm_ckdt_en_vec( 2), D1 => '1', D2 => '0', R => vmm_ckdt_r_vec( 2), S => '0');
ckdt_ODDR_4 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC")
                    port map( Q => vmm_ckdt_4, C => vmm_ckdt, CE => vmm_ckdt_en_vec( 3), D1 => '1', D2 => '0', R => vmm_ckdt_r_vec( 3), S => '0');
ckdt_ODDR_5 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC")
                    port map( Q => vmm_ckdt_5, C => vmm_ckdt, CE => vmm_ckdt_en_vec( 4), D1 => '1', D2 => '0', R => vmm_ckdt_r_vec( 4), S => '0');
ckdt_ODDR_6 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC")
                    port map( Q => vmm_ckdt_6, C => vmm_ckdt, CE => vmm_ckdt_en_vec( 5), D1 => '1', D2 => '0', R => vmm_ckdt_r_vec( 5), S => '0');
ckdt_ODDR_7 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC")
                    port map( Q => vmm_ckdt_7, C => vmm_ckdt, CE => vmm_ckdt_en_vec( 6), D1 => '1', D2 => '0', R => vmm_ckdt_r_vec( 6), S => '0');
ckdt_ODDR_8 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC")
                    port map( Q => vmm_ckdt_8, C => vmm_ckdt, CE => vmm_ckdt_en_vec( 7), D1 => '1', D2 => '0', R => vmm_ckdt_r_vec( 7), S => '0');

     vmm_ckdt <= clk_dt_out;
-- a test for why we can't see vmm_ckdt on the scope 
-- we cannot see the 200 MHz clock on our crummy scope 
-- this should do a divide by 4   
	 process(clk_200)
       begin
        if rising_edge(clk_200) then
         counter_kj <= counter_kj + b"00000001";
        end if;
     end process;
     vmm_ckdt_kj <= counter_kj(2);

	ckart_diff_1 : OBUFDS port map ( O => ckart_1_P, OB => ckart_1_N, I => vmm_ckart_1);
	ckart_diff_2 : OBUFDS port map ( O => ckart_2_P, OB => ckart_2_N, I => vmm_ckart_2);
	ckart_diff_3 : OBUFDS port map ( O => ckart_3_P, OB => ckart_3_N, I => vmm_ckart_3);
	ckart_diff_4 : OBUFDS port map ( O => ckart_4_P, OB => ckart_4_N, I => vmm_ckart_4);
	ckart_diff_5 : OBUFDS port map ( O => ckart_5_P, OB => ckart_5_N, I => vmm_ckart_5);
	ckart_diff_6 : OBUFDS port map ( O => ckart_6_P, OB => ckart_6_N, I => vmm_ckart_6);
	ckart_diff_7 : OBUFDS port map ( O => ckart_7_P, OB => ckart_7_N, I => vmm_ckart_7);
	ckart_diff_8 : OBUFDS port map ( O => ckart_8_P, OB => ckart_8_N, I => vmm_ckart_8);

    vmm_ckart_r <= not( vmm_ckart_en);

ckart_ODDR_1 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                    port map( Q => vmm_ckart_1, C => vmm_ckart, CE => vmm_ckart_en, D1 => '1', D2 => '0', R => vmm_ckart_r, S => '0');
ckart_ODDR_2 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                    port map( Q => vmm_ckart_2, C => vmm_ckart, CE => vmm_ckart_en, D1 => '1', D2 => '0', R => vmm_ckart_r, S => '0');
ckart_ODDR_3 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                    port map( Q => vmm_ckart_3, C => vmm_ckart, CE => vmm_ckart_en, D1 => '1', D2 => '0', R => vmm_ckart_r, S => '0');
ckart_ODDR_4 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                    port map( Q => vmm_ckart_4, C => vmm_ckart, CE => vmm_ckart_en, D1 => '1', D2 => '0', R => vmm_ckart_r, S => '0');
ckart_ODDR_5 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                    port map( Q => vmm_ckart_5, C => vmm_ckart, CE => vmm_ckart_en, D1 => '1', D2 => '0', R => vmm_ckart_r, S => '0');
ckart_ODDR_6 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                    port map( Q => vmm_ckart_6, C => vmm_ckart, CE => vmm_ckart_en, D1 => '1', D2 => '0', R => vmm_ckart_r, S => '0');
ckart_ODDR_7 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                    port map( Q => vmm_ckart_7, C => vmm_ckart, CE => vmm_ckart_en, D1 => '1', D2 => '0', R => vmm_ckart_r, S => '0');
ckart_ODDR_8 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                    port map( Q => vmm_ckart_8, C => vmm_ckart, CE => vmm_ckart_en, D1 => '1', D2 => '0', R => vmm_ckart_r, S => '0');
	
	-- vmm tokens
    token_diff_1 : IBUFDS    port map ( O => vmm_TKO, I => TKO_8_P, IB => TKO_8_N);
    token_diff_2 : IBUFDS    port map ( O => vmm_SETB, I => SETB_8_P, IB => SETB_8_N);
    token_diff_4 : IBUFDS    port map ( O => vmm_SETT, I => SETT_1_P, IB => SETT_1_N);	

    token_diff_3 : OBUFDS    port map ( O => TKI_1_P, OB =>  TKI_1_N, I => vmm_TKI);
    token_ODDR_1 : ODDR port map( Q => vmm_TKI, C => vmm_TKI_i, CE => vmm_TKI_en, D1 => '1', D2 => '0', R => '0', S => '0');
    vmm_TKI_i <= '0';
    vmm_TKI_en <= '1';
    
    -- monitor pins
    obuf_inst_25 : OBUF port map ( O => EXTERNAL_3_P, I => scopeD7);
    obuf_inst_26 : OBUF port map ( O => EXTERNAL_3_N, I => scopeD6);
    obuf_inst_23 : OBUF port map ( O => EXTERNAL_2_P, I => scopeD5);
    obuf_inst_24 : OBUF port map ( O => EXTERNAL_2_N, I => scopeD4);
    obuf_inst_27 : OBUF port map ( O => EXTERNAL_1_P, I => scopeD3);
    obuf_inst_28 : OBUF port map ( O => EXTERNAL_1_N, I => scopeD2);
    obuf_inst_21 : OBUF port map ( O => EXTERNAL_0_P, I => scopeD1);
    obuf_inst_22 : OBUF port map ( O => EXTERNAL_0_N, I => scopeD0);
    
    scope_R( 0) <= not( scope_CE( 0));
    scope_R( 1) <= not( scope_CE( 1));
    scope_R( 2) <= not( scope_CE( 2));
    scope_R( 3) <= not( scope_CE( 3));
    scope_R( 4) <= not( scope_CE( 4));
    scope_R( 5) <= not( scope_CE( 5));
    scope_R( 6) <= not( scope_CE( 6));
    scope_R( 7) <= not( scope_CE( 7));
    
    scope_ODDR_0 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                        port map( Q => scopeD0, C => scopeD0_i, CE => scope_CE( 0), D1 => '1', D2 => '0', R => scope_R( 0), S => '0');
    scope_ODDR_1 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                        port map( Q => scopeD1, C => scopeD1_i, CE => scope_CE( 1), D1 => '1', D2 => '0', R => scope_R( 1), S => '0');
    scope_ODDR_2 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                        port map( Q => scopeD2, C => scopeD2_i, CE => scope_CE( 2), D1 => '1', D2 => '0', R => scope_R( 2), S => '0');
    scope_ODDR_3 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                        port map( Q => scopeD3, C => scopeD3_i, CE => scope_CE( 3), D1 => '1', D2 => '0', R => scope_R( 3), S => '0');
    scope_ODDR_4 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                        port map( Q => scopeD4, C => scopeD4_i, CE => scope_CE( 4), D1 => '1', D2 => '0', R => scope_R( 4), S => '0');
    scope_ODDR_5 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC")
                        port map( Q => scopeD5, C => scopeD5_i, CE => scope_CE( 5), D1 => '1', D2 => '0', R => scope_R( 5), S => '0');
    scope_ODDR_6 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                        port map( Q => scopeD6, C => scopeD6_i, CE => scope_CE( 6), D1 => '1', D2 => '0', R => scope_R( 6), S => '0');
    scope_ODDR_7 : ODDR generic map( DDR_CLK_EDGE => "OPPOSITE_EDGE", INIT => '0', SRTYPE => "ASYNC") 
                        port map( Q => scopeD7, C => scopeD7_i, CE => scope_CE( 7), D1 => '1', D2 => '0', R => scope_R( 7), S => '0');    
                       
--  input for external trigger
    ibuf_inst_1 : IBUF port map ( O => external_trigger_in, I => EXTERNAL_TRIGGER_HDMI);   
--   debounce it
--   i took the code from the template (coding examples, misc, debounce circuit) 
--   here is the debounce circuit for the external_trigger_in
     process(clk_200)
     begin
        if (clk_200'event and clk_200 = '1') then
           if (reset = '1') then
             Q1 <= '0';
             Q2 <= '0';
             Q3 <= '0'; 
           else
             Q1 <= external_trigger_in;
             Q2 <= Q1;
             Q3 <= Q2;
           end if;
        end if;
     end process;
 
     external_trigger_deb <= Q1 and Q2 and Q3;
               	      
-- relevant vmm processes goes here

--process( clk_200, clk_100)
--begin
--    if rising_edge( clk_200) then
--        clk_100 <= not clk_100;
--    end if ;
--end process ;

-- this is for reset
-- we can substitute a register r/w for this later

--	process( clk_200, count1, reset) -- 200MHz
--    begin
--      if ( clk_200'event and clk_200 = '1') then
--         if( count1 = x"08000000") then 
--              reset <= '1';
--              count1 <= count1 + '1';
--          else 
--             if( count1 = x"08000010") then 
--                  reset <= '0';
--                  count1 <= (others=>'0');
--              else
--                  count1 <= count1 + '1';
--              end if;        
--          end if;    
--      end if;
--    end process;

-- charlie #######################################################
-- this is for reset bit 0 of axi_reg_55
 

-- charlie reset code is here

reset <= vmm_global_reset;
count1 <= count1_next;

process(axi_reg_60, count1)
   begin
      if axi_reg_60(0) = '1' then
         if count1 <= x"10" then
	        count1_max <= '0';
            vmm_global_reset <= '1';
            count1_rst   <= '0';
	     else
	        count1_max <= '1';
		    vmm_global_reset <= '0';
         end if;
      else
         count1_rst <= '1';
      end if;
end process;	  
			 
process(clk_50)
   begin
      if clk_50'event and clk_50 = '1' then
	     if vmm_global_reset = '1' then    
		    if count1_max = '0' then
		       count1_next <= count1 + 1;
		    end if;			   
		 elsif count1_rst = '1' then
		    count1_next <= (others => '0');
		 end if;
	  end if;
end process;

-- end charlie reset code
 
-- check with bill on this 
   logic_dump <= vmm_TKO or vmm_SETB or vmm_SETT;
 
--   clk_dt_out <= clk_100;
   clk_dt_out <= clk_50;
   vmm_ckart <= clk_160;
   clk_tk_out <= clk_10;
   clk_bc_out <= clk_40;

-- kjohns commented out because we don't use it
--   clk_tp_sync <= '1';
 
-- kjohns changed this from clk_200 to clk_100
-- kjohns removed clk_tp_sync 
process( clk_100, reset)
   begin
       if rising_edge( clk_100) then
           if reset='1' then
               clk_tp_cntr <= clk_tp_period_cnt;
               clk_tp_out  <= '0';
               cktp_done <= '0';
           else
             if cktp_done = '0' and vmm_cktp_en = '1' then
               if clk_tp_cntr = clk_tp_period_cnt then
                   clk_tp_cntr <= (others => '0') ;
                   clk_tp_out <= '1';
               else
                   clk_tp_cntr <= clk_tp_cntr + '1';
                   if clk_tp_cntr = clk_tp_dutycycle_cnt then       
                       clk_tp_out <='0';
                   end if;
               end if ;
             end if;
             if counter_for_cktp_done = x"0032" then  --Changed from ff (from 255 to 50 pulses)
--  this sets the number of cktp sent
--  if you want send continuously, set cktp_done <= '0' here             
               cktp_done <= '1';
             end if;
           end if ;
       end if ;
   end process ;

   process (clk_tp_out, reset)
      begin
            if reset = '1' then
              counter_for_cktp_done <= (others => '0') ;
            else                
              if (clk_tp_out'event and clk_tp_out = '1') then
                counter_for_cktp_done <= counter_for_cktp_done + '1';
              end if;
            end if;
      end process ;              
                                            
-- select display choice
process (clk_100)
          begin
                if rising_edge( clk_100) then
                case vmm_2display_i is
 
                   when "000" =>
                   scopeD1_i <= vmm_wen;
                   scope_CE( 1) <= '1';  
                   scopeD0_i <= vmm_ena;
                   scope_CE( 0) <= '1';                     
                   scopeD3_i <= vmm_di_en_vec( 0);
                   scope_CE( 3) <= '1';  
                   scopeD2_i <= vmm_do;
                   scope_CE( 2) <= '1';                     
                   scopeD5_i <= vmm_data0_1;
                   scope_CE( 5) <= '1';                     
                   scopeD4_i <= vmm_data1_1;
                   scope_CE( 4) <= '1';                     
                   scopeD7_i <= vmm_cktk;
                   scope_CE( 7) <= vmm_cktk_en_vec( 0);                   
                   scopeD6_i <= vmm_cktp;
                   scope_CE( 6) <= '1';                     
  
                   when "001" => 
                   scopeD1_i <= vmm_wen;
                   scope_CE( 1) <= '1';  
                   scopeD0_i <= vmm_ena;
                   scope_CE( 0) <= '1';                     
                   scopeD3_i <= vmm_di_en_vec( 1);
                   scope_CE( 3) <= '1';  
                   scopeD2_i <= vmm_do;
                   scope_CE( 2) <= '1';                     
                   scopeD5_i <= vmm_data0_2;
                   scope_CE( 5) <= '1';                     
                   scopeD4_i <= vmm_data1_2;
                   scope_CE( 4) <= '1';                     
                   scopeD7_i <= vmm_cktk;
                   scope_CE( 7) <= vmm_cktk_en_vec( 1);                   
                   scopeD6_i <= vmm_cktp;
                   scope_CE( 6) <= '1'; 
                   
                   when "010" =>
                   scopeD1_i <= vmm_wen;
                   scope_CE( 1) <= '1';  
                   scopeD0_i <= vmm_ena;
                   scope_CE( 0) <= '1';                     
                   scopeD3_i <= vmm_di_en_vec( 2);
                   scope_CE( 3) <= '1';  
                   scopeD2_i <= vmm_do;
                   scope_CE( 2) <= '1';                     
                   scopeD5_i <= vmm_data0_3;
                   scope_CE( 5) <= '1';                     
                   scopeD4_i <= vmm_data1_3;
                   scope_CE( 4) <= '1';                     
                   scopeD7_i <= vmm_cktk;
                   scope_CE( 7) <= vmm_cktk_en_vec( 2);                   
                   scopeD6_i <= vmm_cktp;
                   scope_CE( 6) <= '1';
                                   
                   when "011" =>
                   scopeD1_i <= vmm_wen;
                   scope_CE( 1) <= '1';  
                   scopeD0_i <= vmm_ena;
                   scope_CE( 0) <= '1';                     
                   scopeD3_i <= vmm_di_en_vec( 3);
                   scope_CE( 3) <= '1';  
                   scopeD2_i <= vmm_do;
                   scope_CE( 2) <= '1';                     
                   scopeD5_i <= vmm_data0_4;
                   scope_CE( 5) <= '1';                     
                   scopeD4_i <= vmm_data1_4;
                   scope_CE( 4) <= '1';                     
                   scopeD7_i <= vmm_cktk;
                   scope_CE( 7) <= vmm_cktk_en_vec( 3);                   
                   scopeD6_i <= vmm_cktp;
                   scope_CE( 6) <= '1';
                
                   when "100" =>
                   scopeD1_i <= vmm_wen;
                   scope_CE( 1) <= '1';  
                   scopeD0_i <= vmm_ena;
                   scope_CE( 0) <= '1';                     
                   scopeD3_i <= vmm_di_en_vec( 4);
                   scope_CE( 3) <= '1';  
                   scopeD2_i <= vmm_do;
                   scope_CE( 2) <= '1';                     
                   scopeD5_i <= vmm_data0_5;
                   scope_CE( 5) <= '1';                     
                   scopeD4_i <= vmm_data1_5;
                   scope_CE( 4) <= '1';                     
                   scopeD7_i <= vmm_cktk;
                   scope_CE( 7) <= vmm_cktk_en_vec( 4);                   
                   scopeD6_i <= vmm_cktp;
                   scope_CE( 6) <= '1';
                
                   when "101" => 
                   scopeD1_i <= vmm_wen;
                   scope_CE( 1) <= '1';  
                   scopeD0_i <= vmm_ena;
                   scope_CE( 0) <= '1';                     
                   scopeD3_i <= vmm_di_en_vec( 5);
                   scope_CE( 3) <= '1';  
                   scopeD2_i <= vmm_do;
                   scope_CE( 2) <= '1';                     
                   scopeD5_i <= vmm_data0_6;
                   scope_CE( 5) <= '1';                     
                   scopeD4_i <= vmm_data1_6;
                   scope_CE( 4) <= '1';                     
                   scopeD7_i <= vmm_cktk;
                   scope_CE( 7) <= vmm_cktk_en_vec( 5);                   
                   scopeD6_i <= vmm_cktp;
                   scope_CE( 6) <= '1';
                
                   when "110" => 
                   scopeD1_i <= vmm_wen;
                   scope_CE( 1) <= '1';  
                   scopeD0_i <= vmm_ena;
                   scope_CE( 0) <= '1';                     
                   scopeD3_i <= vmm_di_en_vec( 6);
                   scope_CE( 3) <= '1';  
                   scopeD2_i <= vmm_do;
                   scope_CE( 2) <= '1';                     
                   scopeD5_i <= vmm_data0_7;
                   scope_CE( 5) <= '1';                     
                   scopeD4_i <= vmm_data1_7;
                   scope_CE( 4) <= '1';                     
                   scopeD7_i <= vmm_cktk;
                   scope_CE( 7) <= vmm_cktk_en_vec( 6);                   
                   scopeD6_i <= vmm_cktp;
                   scope_CE( 6) <= '1';
                
                   when "111" => 
                   scopeD1_i <= vmm_wen;
                   scope_CE( 1) <= '1';  
                   scopeD0_i <= vmm_ena;
                   scope_CE( 0) <= '1';                     
                   scopeD3_i <= vmm_di_en_vec( 7);
                   scope_CE( 3) <= '1';  
                   scopeD2_i <= vmm_do;
                   scope_CE( 2) <= '1';                     
                   scopeD5_i <= vmm_data0_8;
                   scope_CE( 5) <= '1';                     
                   scopeD4_i <= vmm_data1_8;
                   scope_CE( 4) <= '1';                     
                   scopeD7_i <= vmm_cktk;
                   scope_CE( 7) <= vmm_cktk_en_vec( 7);                   
                   scopeD6_i <= vmm_cktp;
                   scope_CE( 6) <= '1';
                              
                   when others =>  
                   null;                                     
               
               end case;
               end if;
       end process;
    	
      -- select which vmm to use
-- this was for a test
--      vmm_do      <= vmm_do_8;
--      vmm_di_en_vec   <= b"10000000"; 
--      vmm_cktk_en_vec <= vmm_cktk_en_i & b"0000000";
--      vmm_ckdt_en_vec <= vmm_ckdt_en_i & b"0000000";
--      vmm_data0   <= vmm_data0_8;
--      vmm_data1   <= vmm_data1_8;
--      vmm_art     <= vmm_art_8;

process (clk_100)
    begin
          if rising_edge( clk_100) then
          case vmm_2cfg_i is

                when "000" =>
                 vmm_do      <= vmm_do_1;
                 vmm_di_en_vec   <= "00000001"; 
                 vmm_cktk_en_vec <= "0000000" & vmm_cktk_en_i;
                 vmm_ckdt_en_vec <= "0000000" & vmm_ckdt_en_i;
                 vmm_data0   <= vmm_data0_1;
                 vmm_data1   <= vmm_data1_1;
                 vmm_art     <= vmm_art_1;

                 when "001" =>
                  vmm_do      <= vmm_do_2;
                  vmm_di_en_vec   <= "00000010"; 
                  vmm_cktk_en_vec <= "000000" & vmm_cktk_en_i & "0";
                  vmm_ckdt_en_vec <= "000000" & vmm_ckdt_en_i & "0";
                  vmm_data0   <= vmm_data0_2;
                  vmm_data1   <= vmm_data1_2;
                  vmm_art     <= vmm_art_2;
                 
                 when "010" =>
                  vmm_do      <= vmm_do_3;
                  vmm_di_en_vec   <= "00000100"; 
                  vmm_cktk_en_vec <= "00000" & vmm_cktk_en_i & "00";
                  vmm_ckdt_en_vec <= "00000" & vmm_ckdt_en_i & "00";
                  vmm_data0   <= vmm_data0_3;
                  vmm_data1   <= vmm_data1_3;
                  vmm_art     <= vmm_art_3;
                                  
                 when "011" =>
                  vmm_do      <= vmm_do_4;
                  vmm_di_en_vec   <= "00001000"; 
                  vmm_cktk_en_vec <= "0000" & vmm_cktk_en_i & "000";
                  vmm_ckdt_en_vec <= "0000" & vmm_ckdt_en_i & "000";
                  vmm_data0   <= vmm_data0_4;
                  vmm_data1   <= vmm_data1_4;
                  vmm_art     <= vmm_art_4;
                                        
                 when "100" =>
                  vmm_do      <= vmm_do_5;
                  vmm_di_en_vec   <= "00010000"; 
                  vmm_cktk_en_vec <= "000" & vmm_cktk_en_i & "0000";
                  vmm_ckdt_en_vec <= "000" & vmm_ckdt_en_i & "0000";
                  vmm_data0   <= vmm_data0_5;
                  vmm_data1   <= vmm_data1_5;
                  vmm_art     <= vmm_art_5;                 
                 
                 when "101" =>
                  vmm_do      <= vmm_do_6;
                  vmm_di_en_vec   <= "00100000"; 
                  vmm_cktk_en_vec <= "00" & vmm_cktk_en_i & "00000";
                  vmm_ckdt_en_vec <= "00" & vmm_ckdt_en_i & "00000";
                  vmm_data0   <= vmm_data0_6;
                  vmm_data1   <= vmm_data1_6;
                  vmm_art     <= vmm_art_6;
                 
                 when "110" =>
                  vmm_do      <= vmm_do_7;
                  vmm_di_en_vec   <= "01000000"; 
                  vmm_cktk_en_vec <= "0" & vmm_cktk_en_i & "000000";
                  vmm_ckdt_en_vec <= "0" & vmm_ckdt_en_i & "000000";
                  vmm_data0   <= vmm_data0_7;
                  vmm_data1   <= vmm_data1_7;
                  vmm_art     <= vmm_art_7;                 

                 when "111" => 
                  vmm_do      <= vmm_do_8;
                  vmm_di_en_vec   <= "10000000"; 
                  vmm_cktk_en_vec <= vmm_cktk_en_i & "0000000";
                  vmm_ckdt_en_vec <= vmm_ckdt_en_i & "0000000";
                  vmm_data0   <= vmm_data0_8;
                  vmm_data1   <= vmm_data1_8;
                  vmm_art     <= vmm_art_8;

                  when others =>  
                  null;     

         end case;
         end if;
 end process;
    	      
-- --------------------------------------------------------------------------------------------------------------
-- MDIO
ENET_MDIO <= mdio_rtl_mdio_io;
ENET_MDC  <= mdio_rtl_mdc;
-- ENET_PHY_INT    for now, don't catch phy interrupts
ENET_RST_N  <= reset_rtl;

 -- --------------------------------------------------------------------------------------------------------------
-- Connect LEDs to GPIO

--LED_BANK_13   <=  gpio_o(0);
--LED_BANK_14   <=  gpio_o(1);
--LED_BANK_15   <=  gpio_o(2);
--LED_BANK_16   <=  gpio_o(3);
----LED_BANK_34   <=  gpio_o(4);
--LED_BANK_35   <=  gpio_o(5);

--gpio_i <= x"deadbeef";

-- --------------------------------------------------------------------------------------------------------------
-- AXI READ handshaking - with wait states!
--  two cycles after arread is intiated, we assert rvalid.  We keep rvalid asserted, until the slave responds with
-- tready, which indicates it read the data and we deassert valid until another address is written
-- --------------------------------------------------------------------------------------------------------------
U_AXI_READ_CAPT: process(EXT_AXI_CLK)
    begin
       if( rising_edge(EXT_AXI_CLK)) then
          if (EXT_AXI_arready = '1') then --Got a new read address 
               EXT_AXI_rvalid_z <= "100";
          elsif (EXT_AXI_rready = '1' and EXT_AXI_rvalid = '1') then
               EXT_AXI_rvalid_z <= "000";
          else 
               EXT_AXI_rvalid_z <= EXT_AXI_rvalid_z(2) & EXT_AXI_rvalid_z(2 downto 1);
          end if; 
       end if;
     end process;
   -- AFter the two cycle delay, read valid is strobed.  
   EXT_AXI_rvalid <= EXT_AXI_rvalid_z(0);
-- --------------------------------------------------------------------------------------------------------------
-- AXI capture of address and write data - no wait necessary
--  two cycles after arread is intiated, we assert rvalid.  We keep rvalid asserted, until the slave responds with
-- tready, which indicates it read the data and we deassert valid until another address is written
-- -----------------------------------------------
U_AXI_ADDWRITE_CAPT: process(EXT_AXI_CLK)
    begin
       if( rising_edge(EXT_AXI_CLK)) then
          if (EXT_AXI_arvalid = '1') then --Got a new read address 
            if(EXT_AXI_arready = '0') then
               EXT_AXI_arready <= '1';
            else
               EXT_AXI_arready <= '0';         
            end if;
          end if;
          if (EXT_AXI_awvalid = '1') then --Got a new read address 
            if(EXT_AXI_awready = '0') then
               EXT_AXI_awready <= '1';
            else
               EXT_AXI_awready <= '0';         
            end if;
          end if;
          if (EXT_AXI_wvalid = '1') then --Got a new read address 
            if(EXT_AXI_wready = '0') then
               EXT_AXI_wready <= '1';
            else
               EXT_AXI_wready <= '0';       
            end if;
          end if;
        end if;       
     end process;
         
   -- Capture the AXI bus master (i.e mb) address (both read and/or write) and data(write) 
   -- Also multiplex the address between read and write...
   --  axi_addr_muxed is what I use.  
   U_AXI_ADDR : process(EXT_AXI_CLK)
     begin
     if( rising_edge(EXT_AXI_CLK)) then 
       if( EXT_AXI_RESETN = '0' ) then
           axi_addr_muxed <= (others => '0');  
           axi_addr_write <= (others => '0');     
           axi_addr_read <= (others => '0');
           EXT_AXI_wdata_v <= (others => '0');
       else
         if (EXT_AXI_arvalid = '1') then
            axi_addr_read <= EXT_AXI_araddr(15 downto 0);          
            axi_addr_muxed <= EXT_AXI_araddr(15 downto 0);
         elsif (EXT_AXI_awvalid = '1') then
            axi_addr_write <= EXT_AXI_awaddr(15 downto 0);          
            axi_addr_muxed<= EXT_AXI_awaddr(15 downto 0);        
         end if;
         if (EXT_AXI_wvalid = '1') then
             EXT_AXI_wdata_v <= EXT_AXI_wdata;
         end if;         
      end if;
    end if;   
   end process;

-- ---------------------------------------------------------------------------------
-- Decode the AXI write strobe
--   00010          -> 
--   00014          -> Coefficient/Offset Memory (Write Only)
-- ---------------------------------------------------------------------------------
U_AXI_WE_STROBE: process(EXT_AXI_CLK)
    begin
     if( rising_edge(EXT_AXI_CLK)) then 
       if( EXT_AXI_RESETN = '0' ) then
           axi_we_axi_reg_0 <= '0';
           axi_we_axi_reg_1 <= '0';
           axi_we_axi_reg_2 <= '0';
           axi_we_axi_reg_3 <= '0';
           axi_we_axi_reg_4 <= '0';
           axi_we_axi_reg_5 <= '0';
           axi_we_axi_reg_6 <= '0';
           axi_we_axi_reg_7 <= '0';
           axi_we_axi_reg_8 <= '0';
           axi_we_axi_reg_9 <= '0';
           axi_we_axi_reg_10 <= '0';
           axi_we_axi_reg_11 <= '0';
           axi_we_axi_reg_12 <= '0';
           axi_we_axi_reg_13 <= '0';
           axi_we_axi_reg_14 <= '0';
           axi_we_axi_reg_15 <= '0';
           axi_we_axi_reg_16 <= '0';
           axi_we_axi_reg_17 <= '0';
           axi_we_axi_reg_18 <= '0';
           axi_we_axi_reg_19 <= '0';
           axi_we_axi_reg_20 <= '0'; 
           axi_we_axi_reg_21 <= '0';
           axi_we_axi_reg_22 <= '0';
           axi_we_axi_reg_23 <= '0';
           axi_we_axi_reg_24 <= '0';
           axi_we_axi_reg_25 <= '0';
           axi_we_axi_reg_26 <= '0';
           axi_we_axi_reg_27 <= '0';
           axi_we_axi_reg_28 <= '0';
           axi_we_axi_reg_29 <= '0';
           axi_we_axi_reg_30 <= '0';
           axi_we_axi_reg_31 <= '0';
           axi_we_axi_reg_32 <= '0';
           axi_we_axi_reg_33 <= '0';
           axi_we_axi_reg_34 <= '0';
           axi_we_axi_reg_35 <= '0';
           axi_we_axi_reg_36 <= '0';
           axi_we_axi_reg_37 <= '0';
           axi_we_axi_reg_38 <= '0';
           axi_we_axi_reg_39 <= '0';
           axi_we_axi_reg_40 <= '0'; 
           axi_we_axi_reg_41 <= '0';
           axi_we_axi_reg_42 <= '0';
           axi_we_axi_reg_43 <= '0';
           axi_we_axi_reg_44 <= '0';
           axi_we_axi_reg_45 <= '0';
           axi_we_axi_reg_46 <= '0';
           axi_we_axi_reg_47 <= '0';
           axi_we_axi_reg_48 <= '0';
           axi_we_axi_reg_49 <= '0';
           axi_we_axi_reg_50 <= '0';
           axi_we_axi_reg_51 <= '0';
           axi_we_axi_reg_52 <= '0';
           axi_we_axi_reg_53 <= '0';
           axi_we_axi_reg_54 <= '0';
           axi_we_axi_reg_55 <= '0';
           axi_we_axi_reg_56 <= '0';
           axi_we_axi_reg_57 <= '0';
           axi_we_axi_reg_58 <= '0';
           axi_we_axi_reg_59 <= '0';
           axi_we_axi_reg_60 <= '0';  -- reset reg
           axi_we_axi_reg_61 <= '0';
           axi_we_axi_reg_62 <= '0';
           axi_we_axi_reg_63 <= '0';
           axi_we_axi_reg_64 <= '0';
           axi_we_axi_reg_65 <= '0';
           axi_we_axi_reg_66 <= '0';
           axi_we_axi_reg_67 <= '0';
           axi_we_axi_reg_68 <= '0';
           axi_we_axi_reg_69 <= '0';
           axi_we_axi_reg_70 <= '0';
           axi_we_axi_reg_71 <= '0';
           axi_we_axi_reg_72 <= '0';
           axi_we_axi_reg_73 <= '0';
           axi_we_axi_reg_74 <= '0';
           axi_we_axi_reg_75 <= '0';
           axi_we_axi_reg_76 <= '0';
           axi_we_axi_reg_77 <= '0';
           axi_we_axi_reg_78 <= '0';
           axi_we_axi_reg_79 <= '0'; 
           axi_we_axi_reg_amux <= '0';                                                                                                                                                 
       else
           axi_we_axi_reg_0 <= '0';
           axi_we_axi_reg_1 <= '0';
           axi_we_axi_reg_2 <= '0';
           axi_we_axi_reg_3 <= '0';
           axi_we_axi_reg_4 <= '0';
           axi_we_axi_reg_5 <= '0';  
           axi_we_axi_reg_6 <= '0';
           axi_we_axi_reg_7 <= '0';
           axi_we_axi_reg_8 <= '0';
           axi_we_axi_reg_9 <= '0';
           axi_we_axi_reg_10 <= '0';
           axi_we_axi_reg_11 <= '0';
           axi_we_axi_reg_12 <= '0';
           axi_we_axi_reg_13 <= '0';
           axi_we_axi_reg_14 <= '0';
           axi_we_axi_reg_15 <= '0';
           axi_we_axi_reg_16 <= '0';
           axi_we_axi_reg_17 <= '0';
           axi_we_axi_reg_18 <= '0';
           axi_we_axi_reg_19 <= '0';
           axi_we_axi_reg_20 <= '0'; 
           axi_we_axi_reg_21 <= '0';
           axi_we_axi_reg_22 <= '0';
           axi_we_axi_reg_23 <= '0';
           axi_we_axi_reg_24 <= '0';
           axi_we_axi_reg_25 <= '0';
           axi_we_axi_reg_26 <= '0';
           axi_we_axi_reg_27 <= '0';
           axi_we_axi_reg_28 <= '0';
           axi_we_axi_reg_29 <= '0';
           axi_we_axi_reg_30 <= '0';
           axi_we_axi_reg_31 <= '0';
           axi_we_axi_reg_32 <= '0';
           axi_we_axi_reg_33 <= '0';
           axi_we_axi_reg_34 <= '0';
           axi_we_axi_reg_35 <= '0';
           axi_we_axi_reg_36 <= '0';
           axi_we_axi_reg_37 <= '0';
           axi_we_axi_reg_38 <= '0';
           axi_we_axi_reg_39 <= '0';   
           axi_we_axi_reg_40 <= '0'; 
           axi_we_axi_reg_41 <= '0';
           axi_we_axi_reg_42 <= '0';
           axi_we_axi_reg_43 <= '0';
           axi_we_axi_reg_44 <= '0';
           axi_we_axi_reg_45 <= '0';
           axi_we_axi_reg_46 <= '0';
           axi_we_axi_reg_47 <= '0';
           axi_we_axi_reg_48 <= '0';
           axi_we_axi_reg_49 <= '0';
           axi_we_axi_reg_50 <= '0';
           axi_we_axi_reg_51 <= '0';
           axi_we_axi_reg_52 <= '0';
           axi_we_axi_reg_53 <= '0';
           axi_we_axi_reg_54 <= '0';
           axi_we_axi_reg_55 <= '0';
           axi_we_axi_reg_56 <= '0';
           axi_we_axi_reg_57 <= '0';
           axi_we_axi_reg_58 <= '0';
           axi_we_axi_reg_59 <= '0';
           axi_we_axi_reg_60 <= '0';  -- reset reg
           axi_we_axi_reg_61 <= '0';
           axi_we_axi_reg_62 <= '0';
           axi_we_axi_reg_63 <= '0';
           axi_we_axi_reg_64 <= '0';
           axi_we_axi_reg_65 <= '0';
           axi_we_axi_reg_66 <= '0';
           axi_we_axi_reg_67 <= '0';
           axi_we_axi_reg_68 <= '0';
           axi_we_axi_reg_69 <= '0';
           axi_we_axi_reg_70 <= '0';
           axi_we_axi_reg_71 <= '0';
           axi_we_axi_reg_72 <= '0';
           axi_we_axi_reg_73 <= '0';
           axi_we_axi_reg_74 <= '0';
           axi_we_axi_reg_75 <= '0';
           axi_we_axi_reg_76 <= '0';
           axi_we_axi_reg_77 <= '0';
           axi_we_axi_reg_78 <= '0';
           axi_we_axi_reg_79 <= '0';
           axi_we_axi_reg_amux <= '0';                                                                                                                    
           if (axi_addr_write = X"0010")  then
           -- kjohns addresses are 0x44A10000 to 0x44A1FFF 
              axi_we_axi_reg_0 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0014")  then 
              axi_we_axi_reg_1 <= EXT_AXI_wvalid and EXT_AXI_wready;              
           elsif (axi_addr_write = X"0018") then
              axi_we_axi_reg_2 <= EXT_AXI_wvalid and EXT_AXI_wready;            
           elsif (axi_addr_write = X"001C") then
              axi_we_axi_reg_3 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0020") then
              axi_we_axi_reg_4 <= EXT_AXI_wvalid and EXT_AXI_wready;                  
           elsif (axi_addr_write = X"0024") then
              axi_we_axi_reg_5 <= EXT_AXI_wvalid and EXT_AXI_wready; 
           elsif (axi_addr_write = X"0028") then
              axi_we_axi_reg_6 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"002C") then
              axi_we_axi_reg_7 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0030") then
              axi_we_axi_reg_8 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0034") then
              axi_we_axi_reg_9 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0038")  then 
              axi_we_axi_reg_10 <= EXT_AXI_wvalid and EXT_AXI_wready;              
           elsif (axi_addr_write = X"003C") then
              axi_we_axi_reg_11 <= EXT_AXI_wvalid and EXT_AXI_wready;            
           elsif (axi_addr_write = X"0040") then
              axi_we_axi_reg_12 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0044") then
              axi_we_axi_reg_13 <= EXT_AXI_wvalid and EXT_AXI_wready;                  
           elsif (axi_addr_write = X"0048") then
              axi_we_axi_reg_14 <= EXT_AXI_wvalid and EXT_AXI_wready; 
           elsif (axi_addr_write = X"004C") then
              axi_we_axi_reg_15 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0050") then
              axi_we_axi_reg_16 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0054") then
              axi_we_axi_reg_17 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0058") then
              axi_we_axi_reg_18 <= EXT_AXI_wvalid and EXT_AXI_wready; 
           elsif (axi_addr_write = X"005C") then
              axi_we_axi_reg_19 <= EXT_AXI_wvalid and EXT_AXI_wready; 
           elsif (axi_addr_write = X"0060")  then  
              axi_we_axi_reg_20 <= EXT_AXI_wvalid and EXT_AXI_wready;              
           elsif (axi_addr_write = X"0064")  then
              axi_we_axi_reg_21 <= EXT_AXI_wvalid and EXT_AXI_wready;            
           elsif (axi_addr_write = X"0068") then
              axi_we_axi_reg_22 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"006C") then
              axi_we_axi_reg_23 <= EXT_AXI_wvalid and EXT_AXI_wready;                  
           elsif (axi_addr_write = X"0070") then
              axi_we_axi_reg_24 <= EXT_AXI_wvalid and EXT_AXI_wready; 
           elsif (axi_addr_write = X"0074") then
              axi_we_axi_reg_25 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0078") then
              axi_we_axi_reg_26 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"007C") then
              axi_we_axi_reg_27 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0080") then
              axi_we_axi_reg_28 <= EXT_AXI_wvalid and EXT_AXI_wready; 
           elsif (axi_addr_write = X"0084") then
              axi_we_axi_reg_29 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0088")  then 
              axi_we_axi_reg_30 <= EXT_AXI_wvalid and EXT_AXI_wready;              
           elsif (axi_addr_write = X"008C")  then
              axi_we_axi_reg_31 <= EXT_AXI_wvalid and EXT_AXI_wready;            
           elsif (axi_addr_write = X"0090") then
              axi_we_axi_reg_32 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0094") then
              axi_we_axi_reg_33 <= EXT_AXI_wvalid and EXT_AXI_wready;                  
           elsif (axi_addr_write = X"0098") then
              axi_we_axi_reg_34 <= EXT_AXI_wvalid and EXT_AXI_wready; 
           elsif (axi_addr_write = X"009C") then
              axi_we_axi_reg_35 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"00A0") then
              axi_we_axi_reg_36 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"00A4") then
              axi_we_axi_reg_37 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"00A8") then
              axi_we_axi_reg_38 <= EXT_AXI_wvalid and EXT_AXI_wready; 
           elsif (axi_addr_write = X"00AC") then
              axi_we_axi_reg_39 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"00B0")  then 
              axi_we_axi_reg_40 <= EXT_AXI_wvalid and EXT_AXI_wready;              
           elsif (axi_addr_write = X"00B4")  then
              axi_we_axi_reg_41 <= EXT_AXI_wvalid and EXT_AXI_wready;            
           elsif (axi_addr_write = X"00B8") then
              axi_we_axi_reg_42 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"00BC") then
              axi_we_axi_reg_43 <= EXT_AXI_wvalid and EXT_AXI_wready;                  
           elsif (axi_addr_write = X"00C0") then
              axi_we_axi_reg_44 <= EXT_AXI_wvalid and EXT_AXI_wready; 
           elsif (axi_addr_write = X"00C4") then
              axi_we_axi_reg_45 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"00C8") then
              axi_we_axi_reg_46 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"00CC") then
              axi_we_axi_reg_47 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"00D0") then
              axi_we_axi_reg_48 <= EXT_AXI_wvalid and EXT_AXI_wready; 
           elsif (axi_addr_write = X"00D4") then
              axi_we_axi_reg_49 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"00D8")  then 
              axi_we_axi_reg_50 <= EXT_AXI_wvalid and EXT_AXI_wready;              
           elsif (axi_addr_write = X"00DC")  then
              axi_we_axi_reg_51 <= EXT_AXI_wvalid and EXT_AXI_wready;            
           elsif (axi_addr_write = X"00E0") then
              axi_we_axi_reg_52 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"00E4") then
              axi_we_axi_reg_53 <= EXT_AXI_wvalid and EXT_AXI_wready;                  
           elsif (axi_addr_write = X"00E8") then
              axi_we_axi_reg_54 <= EXT_AXI_wvalid and EXT_AXI_wready; 
           elsif (axi_addr_write = X"00EC") then
              axi_we_axi_reg_55 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"00F0") then
              axi_we_axi_reg_56 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"00F4") then
              axi_we_axi_reg_57 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"00F8") then
              axi_we_axi_reg_58 <= EXT_AXI_wvalid and EXT_AXI_wready; 
           elsif (axi_addr_write = X"00FC") then
              axi_we_axi_reg_59 <= EXT_AXI_wvalid and EXT_AXI_wready; 
           elsif (axi_addr_write = X"0100")  then  -- reset reg
              axi_we_axi_reg_60 <= EXT_AXI_wvalid and EXT_AXI_wready;              
           elsif (axi_addr_write = X"0104")  then
              axi_we_axi_reg_61 <= EXT_AXI_wvalid and EXT_AXI_wready;            
           elsif (axi_addr_write = X"0108") then
              axi_we_axi_reg_62 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"010C") then
              axi_we_axi_reg_63 <= EXT_AXI_wvalid and EXT_AXI_wready;                  
           elsif (axi_addr_write = X"0110") then
              axi_we_axi_reg_64 <= EXT_AXI_wvalid and EXT_AXI_wready; 
           elsif (axi_addr_write = X"0114") then
              axi_we_axi_reg_65 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0118") then
              axi_we_axi_reg_66 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"011C") then
              axi_we_axi_reg_67 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0120") then
              axi_we_axi_reg_68 <= EXT_AXI_wvalid and EXT_AXI_wready; 
           elsif (axi_addr_write = X"0124") then
              axi_we_axi_reg_69 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0128")  then 
              axi_we_axi_reg_70 <= EXT_AXI_wvalid and EXT_AXI_wready;              
           elsif (axi_addr_write = X"012C")  then
              axi_we_axi_reg_71 <= EXT_AXI_wvalid and EXT_AXI_wready;            
           elsif (axi_addr_write = X"0130") then
              axi_we_axi_reg_72 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0134") then
              axi_we_axi_reg_73 <= EXT_AXI_wvalid and EXT_AXI_wready;                  
           elsif (axi_addr_write = X"0138") then
              axi_we_axi_reg_74 <= EXT_AXI_wvalid and EXT_AXI_wready; 
           elsif (axi_addr_write = X"013C") then
              axi_we_axi_reg_75 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0140") then
              axi_we_axi_reg_76 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0144") then
              axi_we_axi_reg_77 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0148") then
              axi_we_axi_reg_78 <= EXT_AXI_wvalid and EXT_AXI_wready; 
           elsif (axi_addr_write = X"014C") then
              axi_we_axi_reg_79 <= EXT_AXI_wvalid and EXT_AXI_wready;
           elsif (axi_addr_write = X"0200") then
              axi_we_axi_reg_amux <= EXT_AXI_wvalid and EXT_AXI_wready;                                                                                                                                                                            
           end if;           
         end if;
      end if;
    end process;

-- ---------------------------------------------------------------------------------
-- Decode the AXI read strobe - used to read/pop the FIFO
--   00010      
-- ---------------------------------------------------------------------------------
U_AXI_WE_STROBE_2: process(EXT_AXI_CLK)
    begin
     if( rising_edge(EXT_AXI_CLK)) then 
       if( EXT_AXI_RESETN = '0' ) then
           axi_pop_vmm1 <= '0';           
           axi_pop_vmm2 <= '0';                                                                                                                                               
       else
           axi_we_axi_reg_0 <= '0';      -- vmm1                                                                                 
           if (axi_addr_read = X"0010")  then            -- kjohns addresses are 0x44A10000 to 0x44A1FFF 
              axi_pop_vmm1 <= EXT_AXI_rvalid and EXT_AXI_rready;
           elsif (axi_addr_read = X"0018")  then 
              axi_pop_vmm2 <= EXT_AXI_rvalid and EXT_AXI_rready;
           end if;
         end if;
      end if;
    end process;
-- ---------------------------------------------------------------------------------
-- AXI Bus Read  -> Decode the AXI read address
-- ---------------------------------------------------------------------------------
U_AXI_READ_DECODE:  process(axi_addr_read, 
                                 axi_rdata_ls_vmm1, axi_rdata_rcnt_vmm1, 
								 axi_rdata_ls_vmm2, axi_rdata_rcnt_vmm2,
                                 axi_reg_4, axi_reg_5, axi_reg_6,
                                 axi_reg_7, axi_reg_8, axi_reg_9,
                                 axi_reg_10,
                                 axi_reg_11, axi_reg_12, axi_reg_13,
                                 axi_reg_14, axi_reg_15, axi_reg_16,
                                 axi_reg_17, axi_reg_18, axi_reg_19,
                                 axi_reg_20,
                                 axi_reg_21, axi_reg_22, axi_reg_23,
                                 axi_reg_24, axi_reg_25, axi_reg_26,
                                 axi_reg_27, axi_reg_28, axi_reg_29,
                                 axi_reg_30,
                                 axi_reg_31, axi_reg_32, axi_reg_33,
                                 axi_reg_34, axi_reg_35, axi_reg_36,
                                 axi_reg_37, axi_reg_38, axi_reg_39,
                                 axi_reg_40,
                                 axi_reg_41, axi_reg_42, axi_reg_43,
                                 axi_reg_44, axi_reg_45, axi_reg_46,
                                 axi_reg_47, axi_reg_48, axi_reg_49,
                                 axi_reg_50,
                                 axi_reg_51, axi_reg_52, axi_reg_53,
                                 axi_reg_54, axi_reg_55, axi_reg_56,
                                 axi_reg_57, axi_reg_58, axi_reg_59,
                                 axi_reg_60,
                                 axi_reg_61, axi_reg_62, axi_reg_63,
                                 axi_reg_64, axi_reg_65, axi_reg_66,
                                 axi_reg_67, axi_reg_68, axi_reg_69,
                                 axi_reg_70,
                                 axi_reg_71, axi_reg_72, axi_reg_73,
                                 axi_reg_74, axi_reg_75, axi_reg_76,
                                 axi_reg_77, axi_reg_78, axi_reg_79,
                                 axi_reg_amux
                                 )
     begin     
        if (axi_addr_read = X"0000")  then -- 2048 (32 bit) locations: 4000-0000
            EXT_AXI_rdata <=  X"C0FFEE00";
        elsif (axi_addr_read = X"0004")  then 
            EXT_AXI_rdata <= X"C0FFEE01";
        elsif (axi_addr_read = X"0008") then
           EXT_AXI_rdata <= X"C0FFEE02";  
        elsif (axi_addr_read = X"000C") then
            EXT_AXI_rdata <= X"C0FFEE03";  
        elsif (axi_addr_read = X"0010") then 
           EXT_AXI_rdata <=  axi_rdata_ls_vmm1;  -- Returns the popped FIFO value (vmm1)
        elsif (axi_addr_read = X"0014") then 
            EXT_AXI_rdata <= axi_rdata_rcnt_vmm1;   -- Returns the FIFO count (vmm1)
        elsif (axi_addr_read = X"0018") then
            EXT_AXI_rdata <= axi_rdata_ls_vmm2;
        elsif (axi_addr_read = X"001C") then
            EXT_AXI_rdata <= axi_rdata_rcnt_vmm2;  
        elsif (axi_addr_read = X"0020") then
            EXT_AXI_rdata <= axi_reg_4;
        elsif (axi_addr_read = X"0024") then
            EXT_AXI_rdata <= axi_reg_5;
        elsif (axi_addr_read = X"0028") then 
            EXT_AXI_rdata <= axi_reg_6;
        elsif (axi_addr_read = X"002C") then
            EXT_AXI_rdata <= axi_reg_7;
        elsif (axi_addr_read = X"0030") then
            EXT_AXI_rdata <= axi_reg_8;
        elsif (axi_addr_read = X"0034") then
            EXT_AXI_rdata <= axi_reg_9;
        elsif (axi_addr_read = X"0038") then 
            EXT_AXI_rdata <= axi_reg_10;
        elsif (axi_addr_read = X"003C") then 
            EXT_AXI_rdata <= axi_reg_11;
        elsif (axi_addr_read = X"0040") then
            EXT_AXI_rdata <= axi_reg_12;
        elsif (axi_addr_read = X"0044") then
            EXT_AXI_rdata <= axi_reg_13;
        elsif (axi_addr_read = X"0048") then
            EXT_AXI_rdata <= axi_reg_14;
        elsif (axi_addr_read = X"004C") then
            EXT_AXI_rdata <= axi_reg_15;
        elsif (axi_addr_read = X"0050") then 
            EXT_AXI_rdata <= axi_reg_16;
        elsif (axi_addr_read = X"0054") then
            EXT_AXI_rdata <= axi_reg_17;
        elsif (axi_addr_read = X"0058") then
            EXT_AXI_rdata <= axi_reg_18;
        elsif (axi_addr_read = X"005C") then
            EXT_AXI_rdata <= axi_reg_19;
        elsif (axi_addr_read = X"0060") then 
            EXT_AXI_rdata <= axi_reg_20;
        elsif (axi_addr_read = X"0064") then 
            EXT_AXI_rdata <= axi_reg_21;
        elsif (axi_addr_read = X"0068") then
            EXT_AXI_rdata <= axi_reg_22;
        elsif (axi_addr_read = X"006C") then
            EXT_AXI_rdata <= axi_reg_23;
        elsif (axi_addr_read = X"0070") then
            EXT_AXI_rdata <= axi_reg_24;
        elsif (axi_addr_read = X"0074") then
            EXT_AXI_rdata <= axi_reg_25;
        elsif (axi_addr_read = X"0078") then 
            EXT_AXI_rdata <= axi_reg_26;
        elsif (axi_addr_read = X"007C") then
            EXT_AXI_rdata <= axi_reg_27;
        elsif (axi_addr_read = X"0080") then
            EXT_AXI_rdata <= axi_reg_28;
        elsif (axi_addr_read = X"0084") then
            EXT_AXI_rdata <= axi_reg_29;
        elsif (axi_addr_read = X"0088") then 
            EXT_AXI_rdata <= axi_reg_30;
        elsif (axi_addr_read = X"008C") then 
            EXT_AXI_rdata <= axi_reg_31;
        elsif (axi_addr_read = X"0090") then
            EXT_AXI_rdata <= axi_reg_32;
        elsif (axi_addr_read = X"0094") then
            EXT_AXI_rdata <= axi_reg_33;
        elsif (axi_addr_read = X"0098") then
            EXT_AXI_rdata <= axi_reg_34;
        elsif (axi_addr_read = X"009C") then
            EXT_AXI_rdata <= axi_reg_35;
        elsif (axi_addr_read = X"00A0") then 
            EXT_AXI_rdata <= axi_reg_36;
        elsif (axi_addr_read = X"00A4") then
            EXT_AXI_rdata <= axi_reg_37;
        elsif (axi_addr_read = X"00A8") then
            EXT_AXI_rdata <= axi_reg_38;
        elsif (axi_addr_read = X"00AC") then
            EXT_AXI_rdata <= axi_reg_39;
        elsif (axi_addr_read = X"00B0") then 
            EXT_AXI_rdata <= axi_reg_40;
        elsif (axi_addr_read = X"00B4") then 
            EXT_AXI_rdata <= axi_reg_41;
        elsif (axi_addr_read = X"00B8") then
            EXT_AXI_rdata <= axi_reg_42;
        elsif (axi_addr_read = X"00BC") then
            EXT_AXI_rdata <= axi_reg_43;
        elsif (axi_addr_read = X"00C0") then
            EXT_AXI_rdata <= axi_reg_44;
        elsif (axi_addr_read = X"00C4") then
            EXT_AXI_rdata <= axi_reg_45;
        elsif (axi_addr_read = X"00C8") then 
            EXT_AXI_rdata <= axi_reg_46;
        elsif (axi_addr_read = X"00CC") then
            EXT_AXI_rdata <= axi_reg_47;
        elsif (axi_addr_read = X"00D0") then
            EXT_AXI_rdata <= axi_reg_48;
        elsif (axi_addr_read = X"00D4") then
            EXT_AXI_rdata <= axi_reg_49;
        elsif (axi_addr_read = X"00D8") then 
            EXT_AXI_rdata <= axi_reg_50;
        elsif (axi_addr_read = X"00DC") then 
            EXT_AXI_rdata <= axi_reg_51;
        elsif (axi_addr_read = X"00E0") then
            EXT_AXI_rdata <= axi_reg_52;
        elsif (axi_addr_read = X"00E4") then
            EXT_AXI_rdata <= axi_reg_53;
        elsif (axi_addr_read = X"00E8") then
            EXT_AXI_rdata <= axi_reg_54;
        elsif (axi_addr_read = X"00EC") then
            EXT_AXI_rdata <= axi_reg_55;
        elsif (axi_addr_read = X"00F0") then 
            EXT_AXI_rdata <= axi_reg_56;
        elsif (axi_addr_read = X"00F4") then
            EXT_AXI_rdata <= axi_reg_57;
        elsif (axi_addr_read = X"00F8") then
            EXT_AXI_rdata <= axi_reg_58;
        elsif (axi_addr_read = X"00FC") then
            EXT_AXI_rdata <= axi_reg_59;  
        elsif (axi_addr_read = X"0100") then -- reset reg
            EXT_AXI_rdata <= axi_reg_60;
        elsif (axi_addr_read = X"0104") then 
            EXT_AXI_rdata <= axi_reg_61;
        elsif (axi_addr_read = X"0108") then
            EXT_AXI_rdata <= axi_reg_62;
        elsif (axi_addr_read = X"010C") then
            EXT_AXI_rdata <= axi_reg_63;
        elsif (axi_addr_read = X"0110") then
            EXT_AXI_rdata <= axi_reg_64;
        elsif (axi_addr_read = X"0114") then
            EXT_AXI_rdata <= axi_reg_65;
        elsif (axi_addr_read = X"0118") then 
            EXT_AXI_rdata <= axi_reg_66;
        elsif (axi_addr_read = X"011C") then
            EXT_AXI_rdata <= axi_reg_67;
        elsif (axi_addr_read = X"0120") then
            EXT_AXI_rdata <= axi_reg_68;
        elsif (axi_addr_read = X"0124") then
            EXT_AXI_rdata <= axi_reg_69;
        elsif (axi_addr_read = X"0128") then 
            EXT_AXI_rdata <= axi_reg_70;
        elsif (axi_addr_read = X"012C") then 
            EXT_AXI_rdata <= axi_reg_71;
        elsif (axi_addr_read = X"0130") then
            EXT_AXI_rdata <= axi_reg_72;
        elsif (axi_addr_read = X"0134") then
            EXT_AXI_rdata <= axi_reg_73;
        elsif (axi_addr_read = X"0138") then
            EXT_AXI_rdata <= axi_reg_74;
        elsif (axi_addr_read = X"013C") then
            EXT_AXI_rdata <= axi_reg_75;
        elsif (axi_addr_read = X"0140") then 
            EXT_AXI_rdata <= axi_reg_76;
        elsif (axi_addr_read = X"0144") then
            EXT_AXI_rdata <= axi_reg_77;
        elsif (axi_addr_read = X"0148") then
            EXT_AXI_rdata <= axi_reg_78;
        elsif (axi_addr_read = X"014C") then
            EXT_AXI_rdata <= axi_reg_79;
        elsif (axi_addr_read = X"200") then
            EXT_AXI_rdata <= std_logic_vector(resize(unsigned(axi_reg_amux),32));                                                    
         else
            EXT_AXI_rdata <= (others => '0');  -- reduce the number of cases.  This is really don't care!
        end if;  
     end process;  
-- ---------------------------------------------------------------------------------
-- AXI - GPIO control
-- ---------------------------------------------------------------------------------

U_STATUS_WRITE: process(EXT_AXI_CLK)
   begin
      if( rising_edge(EXT_AXI_CLK)) then
        if( EXT_AXI_RESETN = '0' ) then
           axi_reg_0 <= x"01234567";
           axi_reg_1 <= x"11111111";
           axi_reg_2 <= x"22222222";
           axi_reg_3 <= x"33333333";
           axi_reg_4 <= x"FEDCBA98";         
           axi_reg_5 <= x"55555555"; 
           axi_reg_6 <= x"66666666"; 
           axi_reg_7 <= x"77777777";         
           axi_reg_8 <= x"88888888"; 
           axi_reg_9 <= x"99999999";
           axi_reg_10 <= x"00000000";
           axi_reg_11 <= x"00000000";
           axi_reg_12 <= x"00000000";
           axi_reg_13 <= x"00000000";
           axi_reg_14 <= x"00000000";         
           axi_reg_15 <= x"00000000"; 
           axi_reg_16 <= x"00000000"; 
           axi_reg_17 <= x"00000000";         
           axi_reg_18 <= x"00000000"; 
           axi_reg_19 <= x"00000000";
           axi_reg_20 <= x"00000000";
           axi_reg_21 <= x"00000000";
           axi_reg_22 <= x"00000000";
           axi_reg_23 <= x"00000000";
           axi_reg_24 <= x"00000000";         
           axi_reg_25 <= x"00000000"; 
           axi_reg_26 <= x"00000000"; 
           axi_reg_27 <= x"00000000";         
           axi_reg_28 <= x"00000000"; 
           axi_reg_29 <= x"00000000"; 
           axi_reg_30 <= x"00000000";
           axi_reg_31 <= x"00000000";
           axi_reg_32 <= x"00000000";
           axi_reg_33 <= x"00000000";
           axi_reg_34 <= x"00000000";         
           axi_reg_35 <= x"00000000"; 
           axi_reg_36 <= x"00000000"; 
           axi_reg_37 <= x"00000000";         
           axi_reg_38 <= x"00000000"; 
           axi_reg_39 <= x"00000000"; 
           axi_reg_40 <= x"00000000";
           axi_reg_41 <= x"00000000";
           axi_reg_42 <= x"00000000";
           axi_reg_43 <= x"00000000";
           axi_reg_44 <= x"00000000";         
           axi_reg_45 <= x"00000000"; 
           axi_reg_46 <= x"00000000"; 
           axi_reg_47 <= x"00000000";         
           axi_reg_48 <= x"00000000"; 
           axi_reg_49 <= x"00000000"; 
           axi_reg_50 <= x"00000000";
           axi_reg_51 <= x"00000000";
           axi_reg_52 <= x"00000000";
           axi_reg_53 <= x"00000000";
           axi_reg_54 <= x"00000000";         
           axi_reg_55 <= x"00000000"; 
           axi_reg_56 <= x"00000000"; 
           axi_reg_57 <= x"00000000";         
           axi_reg_58 <= x"00000000"; 
           axi_reg_59 <= x"00000000";  
           axi_reg_60 <= x"00000000"; -- reset reg
           axi_reg_61 <= x"00000000";
           axi_reg_62 <= x"00000000";
           axi_reg_63 <= x"00000000";
           axi_reg_64 <= x"00000000";         
           axi_reg_65 <= x"00000000"; 
           axi_reg_66 <= x"00000000"; 
           axi_reg_67 <= x"00000000";         
           axi_reg_68 <= x"00000000"; 
           axi_reg_69 <= x"00000000"; 
           axi_reg_70 <= x"00000000";
           axi_reg_71 <= x"00000000";
           axi_reg_72 <= x"00000000";
           axi_reg_73 <= x"00000000";
           axi_reg_74 <= x"00000000";         
           axi_reg_75 <= x"00000000"; 
           axi_reg_76 <= x"00000000"; 
           axi_reg_77 <= x"00000000";         
           axi_reg_78 <= x"00000000"; 
           axi_reg_79 <= x"00000000"; 
           axi_reg_amux <= "0000";                                              
         else
           if (axi_we_axi_reg_0 = '1') then
              axi_reg_0 <= EXT_AXI_wdata_v;
           end if;
           if (axi_we_axi_reg_1 = '1') then
              axi_reg_1 <= EXT_AXI_wdata_v;
           end if;
           if (axi_we_axi_reg_2 = '1') then
              axi_reg_2 <= EXT_AXI_wdata_v;
           end if;
           if (axi_we_axi_reg_3 = '1') then
              axi_reg_3 <= EXT_AXI_wdata_v;
           end if;
           if (axi_we_axi_reg_4 = '1') then
              axi_reg_4 <= EXT_AXI_wdata_v;
           end if;        
           if (axi_we_axi_reg_5 = '1') then
              axi_reg_5 <= EXT_AXI_wdata_v;
           end if;
           if (axi_we_axi_reg_6 = '1') then
              axi_reg_6 <= EXT_AXI_wdata_v;
           end if; 
           if (axi_we_axi_reg_7 = '1') then
              axi_reg_7 <= EXT_AXI_wdata_v;
           end if;
           if (axi_we_axi_reg_8 = '1') then
              axi_reg_8 <= EXT_AXI_wdata_v;
           end if;
           if (axi_we_axi_reg_9 = '1') then
              axi_reg_9 <= EXT_AXI_wdata_v;
           end if;   
           if (axi_we_axi_reg_10 = '1') then
               axi_reg_10 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_11 = '1') then
               axi_reg_11 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_12 = '1') then
               axi_reg_12 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_13 = '1') then
               axi_reg_13 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_14 = '1') then
               axi_reg_14 <= EXT_AXI_wdata_v;
            end if;        
            if (axi_we_axi_reg_15 = '1') then
               axi_reg_15 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_16 = '1') then
               axi_reg_16 <= EXT_AXI_wdata_v;
            end if; 
            if (axi_we_axi_reg_17 = '1') then
               axi_reg_17 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_18 = '1') then
               axi_reg_18 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_19 = '1') then
               axi_reg_19 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_20 = '1') then
               axi_reg_20 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_21 = '1') then
               axi_reg_21 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_22 = '1') then
               axi_reg_22 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_23 = '1') then
               axi_reg_23 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_24 = '1') then
               axi_reg_24 <= EXT_AXI_wdata_v;
            end if;        
            if (axi_we_axi_reg_25 = '1') then
               axi_reg_25 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_26 = '1') then
               axi_reg_26 <= EXT_AXI_wdata_v;
            end if; 
            if (axi_we_axi_reg_27 = '1') then
               axi_reg_27 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_28 = '1') then
               axi_reg_28 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_29 = '1') then
               axi_reg_29 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_30 = '1') then
               axi_reg_30 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_31 = '1') then
               axi_reg_31 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_32 = '1') then
               axi_reg_32 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_33 = '1') then
               axi_reg_33 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_34 = '1') then
               axi_reg_34 <= EXT_AXI_wdata_v;
            end if;        
            if (axi_we_axi_reg_35 = '1') then
               axi_reg_35 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_36 = '1') then
               axi_reg_36 <= EXT_AXI_wdata_v;
            end if; 
            if (axi_we_axi_reg_37 = '1') then
               axi_reg_37 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_38 = '1') then
               axi_reg_38 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_39 = '1') then
               axi_reg_39 <= EXT_AXI_wdata_v;
            end if;                           
            if (axi_we_axi_reg_40 = '1') then
               axi_reg_40 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_41 = '1') then
               axi_reg_41 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_42 = '1') then
               axi_reg_42 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_43 = '1') then
               axi_reg_43 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_44 = '1') then
               axi_reg_44 <= EXT_AXI_wdata_v;
            end if;        
            if (axi_we_axi_reg_45 = '1') then
               axi_reg_45 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_46 = '1') then
               axi_reg_46 <= EXT_AXI_wdata_v;
            end if; 
            if (axi_we_axi_reg_47 = '1') then
               axi_reg_47 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_48 = '1') then
               axi_reg_48 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_49 = '1') then
               axi_reg_49 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_50 = '1') then
               axi_reg_50 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_51 = '1') then
               axi_reg_51 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_52 = '1') then
               axi_reg_52 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_53 = '1') then
               axi_reg_53 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_54 = '1') then
               axi_reg_54 <= EXT_AXI_wdata_v;
            end if;        
            if (axi_we_axi_reg_55 = '1') then
               axi_reg_55 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_56 = '1') then
               axi_reg_56 <= EXT_AXI_wdata_v;
            end if; 
            if (axi_we_axi_reg_57 = '1') then
               axi_reg_57 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_58 = '1') then
               axi_reg_58 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_59 = '1') then
               axi_reg_59 <= EXT_AXI_wdata_v;
            end if;           
            if (axi_we_axi_reg_60 = '1') then -- reset reg
               axi_reg_60 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_61 = '1') then
               axi_reg_61 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_62 = '1') then
               axi_reg_62 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_63 = '1') then
               axi_reg_63 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_64 = '1') then
               axi_reg_64 <= EXT_AXI_wdata_v;
            end if;        
            if (axi_we_axi_reg_65 = '1') then
               axi_reg_65 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_66 = '1') then
               axi_reg_66 <= EXT_AXI_wdata_v;
            end if; 
            if (axi_we_axi_reg_67 = '1') then
               axi_reg_67 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_68 = '1') then
               axi_reg_68 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_69 = '1') then
               axi_reg_69 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_70 = '1') then
               axi_reg_70 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_71 = '1') then
               axi_reg_71 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_72 = '1') then
               axi_reg_72 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_73 = '1') then
               axi_reg_73 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_74 = '1') then
               axi_reg_74 <= EXT_AXI_wdata_v;
            end if;        
            if (axi_we_axi_reg_75 = '1') then
               axi_reg_75 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_76 = '1') then
               axi_reg_76 <= EXT_AXI_wdata_v;
            end if; 
            if (axi_we_axi_reg_77 = '1') then
               axi_reg_77 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_78 = '1') then
               axi_reg_78 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_79 = '1') then
               axi_reg_79 <= EXT_AXI_wdata_v;
            end if;
            if (axi_we_axi_reg_amux = '1') then
               axi_reg_amux <= EXT_AXI_wdata_v(axi_reg_amux'left downto axi_reg_amux'right);
            end if;                                                                                                     
        end if; 
      end if;
    end process;
    
    -- Connect amux to outputs 
    
    MuxAddr0 <= axi_reg_amux(0);
    MuxAddr1 <= axi_reg_amux(1);
    MuxAddr2 <= axi_reg_amux(2);
    MuxAddr3_p <= axi_reg_amux(3);
    MuxAddr3_n <= not axi_reg_amux(3);    
    -- kjohns leds
--    LED_BANK_16 <= LEDx( 2); -- 84
--    LED_BANK_13 <= LEDx( 1); -- 85
--    LED_BANK_15 <= LEDx( 0); -- 86
    LED_BANK_16 <=  vmm_di_en_vec( 0);
    LED_BANK_13 <=  vmm_di_en_vec( 1);
    LED_BANK_15 <=  vmm_di_en_vec( 2);
    LED_BANK_34 <= vmm_di_en_vec( 4);  -- 87
    LED_BANK_35 <= vmm_di_en_vec( 6);  -- 88
    LED_BANK_14 <= vmm_di_en_vec( 7);  -- 89

--    LED_BANK_34 <= LED( 2);  -- 87
--    LED_BANK_35 <= LED( 1);  -- 88
--    LED_BANK_14 <= LED( 0);  -- 89
    
    LED( 0) <= external_trigger_in;
    LED( 1) <= external_trigger_deb;
    LED( 2) <= external_trigger_pulse_i;
    
-- ------------------------------------------------
-- Chipscope to monitor the AXI bus
-- ------------------------------------------------
--U_CS_EAXI: ila_0
--PORT MAP (
--	clk => EXT_AXI_CLK,
--	probe0 => EXT_AXI_rdata,
--    probe1(0) => EXT_AXI_rready,
--    probe2(0) => EXT_AXI_rvalid,
--    probe3 =>  EXT_AXI_araddr, 
--    probe4(0) => EXT_AXI_arready,
--    probe5(0) => EXT_AXI_arvalid,
--    probe6 =>  EXT_AXI_awaddr,
--    probe7(0) => EXT_AXI_awready,
--    probe8(0) =>  EXT_AXI_awvalid,
--    probe9 => EXT_AXI_wdata, 
--    probe10(0) => EXT_AXI_wready,
--    probe11(0) => EXT_AXI_wvalid,
--    probe12 => EXT_AXI_wstrb
--);


    
end STRUCTURE;




