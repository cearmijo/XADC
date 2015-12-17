#CONFIG PART = xc7a200t-fbg484-2;
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 2.5 [current_design]

# clocks
create_clock -period 8.000 -name MGTREFCLK0P -waveform {0.000 4.000} [get_ports MGTREFCLK0P]
create_clock -period 5.000 -name MGTREFCLK1P -waveform {0.000 2.500} [get_ports MGTREFCLK1P]

set_property PACKAGE_PIN Y17 [get_ports LED_BANK_13]
set_property PACKAGE_PIN P20 [get_ports LED_BANK_14]
set_property PACKAGE_PIN J16 [get_ports LED_BANK_15]
set_property PACKAGE_PIN F15 [get_ports LED_BANK_16]
set_property PACKAGE_PIN T3 [get_ports LED_BANK_34]
set_property PACKAGE_PIN F4 [get_ports LED_BANK_35]

set_property IOSTANDARD HSUL_12 [get_ports LED_BANK_13]
set_property IOSTANDARD LVCMOS25 [get_ports LED_BANK_14]
set_property IOSTANDARD HSUL_12 [get_ports LED_BANK_15]
set_property IOSTANDARD HSUL_12 [get_ports LED_BANK_16]
set_property IOSTANDARD HSUL_12 [get_ports LED_BANK_34]
set_property IOSTANDARD HSUL_12 [get_ports LED_BANK_35]

set_property PACKAGE_PIN V18 [get_ports EXTERNAL_3_P]
set_property IOSTANDARD LVCMOS25 [get_ports EXTERNAL_3_P]
set_property PACKAGE_PIN V19 [get_ports EXTERNAL_3_N]
set_property IOSTANDARD LVCMOS25 [get_ports EXTERNAL_3_N]
set_property PACKAGE_PIN Y18 [get_ports EXTERNAL_2_P]
set_property IOSTANDARD LVCMOS25 [get_ports EXTERNAL_2_P]
set_property PACKAGE_PIN Y19 [get_ports EXTERNAL_2_N]
set_property IOSTANDARD LVCMOS25 [get_ports EXTERNAL_2_N]
set_property PACKAGE_PIN U17 [get_ports EXTERNAL_1_P]
set_property IOSTANDARD LVCMOS25 [get_ports EXTERNAL_1_P]
set_property PACKAGE_PIN U18 [get_ports EXTERNAL_1_N]
set_property IOSTANDARD LVCMOS25 [get_ports EXTERNAL_1_N]
set_property PACKAGE_PIN Y13 [get_ports EXTERNAL_0_P]
set_property IOSTANDARD HSUL_12 [get_ports EXTERNAL_0_P]
set_property PACKAGE_PIN AA14 [get_ports EXTERNAL_0_N]
set_property IOSTANDARD HSUL_12 [get_ports EXTERNAL_0_N]

set_property PACKAGE_PIN F10 [get_ports MGTREFCLK1P]
set_property PACKAGE_PIN F6 [get_ports MGTREFCLK0P]

set_property PACKAGE_PIN W19 [get_ports X_2V5_DIFF_CLK_P]
set_property IOSTANDARD LVDS_25 [get_ports X_2V5_DIFF_CLK_P]
set_property PACKAGE_PIN W20 [get_ports X_2V5_DIFF_CLK_N]
set_property IOSTANDARD LVDS_25 [get_ports X_2V5_DIFF_CLK_N]

set_property PACKAGE_PIN P19 [get_ports EXTERNAL_TRIGGER_HDMI]
set_property IOSTANDARD LVCMOS25 [get_ports EXTERNAL_TRIGGER_HDMI]

set_property INTERNAL_VREF 0.6 [get_iobanks 13]
set_property INTERNAL_VREF 0.6 [get_iobanks 15]
set_property INTERNAL_VREF 0.6 [get_iobanks 16]
set_property INTERNAL_VREF 0.6 [get_iobanks 34]
set_property INTERNAL_VREF 0.6 [get_iobanks 35]

# Analog Multiplexer Pins
set_property PACKAGE_PIN T20 [get_ports MuxAddr0]
set_property IOSTANDARD LVCMOS25 [get_ports MuxAddr0]
set_property PACKAGE_PIN P14 [get_ports MuxAddr1]
set_property IOSTANDARD LVCMOS25 [get_ports MuxAddr1]
set_property PACKAGE_PIN R14 [get_ports MuxAddr2]
set_property IOSTANDARD LVCMOS25 [get_ports MuxAddr2]
set_property PACKAGE_PIN R18 [get_ports MuxAddr3_p]
set_property IOSTANDARD LVCMOS25 [get_ports MuxAddr3_p]
set_property PACKAGE_PIN T18 [get_ports MuxAddr3_n]
set_property IOSTANDARD LVCMOS25 [get_ports MuxAddr3_n]

# XADC Pins

# vmms

#vmm 1
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA0_1_P]
set_property PACKAGE_PIN J17 [get_ports DATA0_1_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA0_1_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA1_1_P]
set_property PACKAGE_PIN K14 [get_ports DATA1_1_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA1_1_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTK_1_P]
set_property PACKAGE_PIN H19 [get_ports CKTK_1_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTK_1_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DI_1_P]
set_property PACKAGE_PIN L13 [get_ports DI_1_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DI_1_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DO_1_P]
set_property PACKAGE_PIN M20 [get_ports DO_1_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DO_1_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKBC_1_P]
set_property PACKAGE_PIN N19 [get_ports CKBC_1_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKBC_1_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTP_1_P]
set_property PACKAGE_PIN K16 [get_ports CKTP_1_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTP_1_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports WEN_1_P]
set_property PACKAGE_PIN M16 [get_ports WEN_1_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports WEN_1_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports ENA_1_P]
set_property PACKAGE_PIN L18 [get_ports ENA_1_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports ENA_1_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKDT_1_P]
set_property PACKAGE_PIN J21 [get_ports CKDT_1_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKDT_1_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKART_1_P]
set_property PACKAGE_PIN L15 [get_ports CKART_1_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKART_1_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports TKI_1_P]
set_property PACKAGE_PIN AB13 [get_ports TKI_1_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports TKI_1_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports SETT_1_P]
set_property PACKAGE_PIN AB15 [get_ports SETT_1_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports SETT_1_N]


# vmm2
set_property IOSTANDARD DIFF_HSUL_12 [get_ports ENA_2_P]
set_property PACKAGE_PIN K19 [get_ports ENA_2_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports ENA_2_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports WEN_2_P]
set_property PACKAGE_PIN D22 [get_ports WEN_2_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports WEN_2_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DI_2_P]
set_property PACKAGE_PIN L20 [get_ports DI_2_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DI_2_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DO_2_P]
set_property PACKAGE_PIN E17 [get_ports DO_2_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DO_2_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKDT_2_P]
set_property PACKAGE_PIN C15 [get_ports CKDT_2_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKDT_2_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA0_2_P]
set_property PACKAGE_PIN G18 [get_ports DATA0_2_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA0_2_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA1_2_P]
set_property PACKAGE_PIN H18 [get_ports DATA1_2_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA1_2_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKBC_2_P]
set_property PACKAGE_PIN M22 [get_ports CKBC_2_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKBC_2_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKART_2_P]
set_property PACKAGE_PIN D21 [get_ports CKART_2_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKART_2_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTK_2_P]
set_property PACKAGE_PIN G22 [get_ports CKTK_2_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTK_2_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTP_2_P]
set_property PACKAGE_PIN F14 [get_ports CKTP_2_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTP_2_N]

# vmm 3
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKART_3_P]
set_property PACKAGE_PIN C17 [get_ports CKART_3_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKART_3_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKBC_3_P]
set_property PACKAGE_PIN E14 [get_ports CKBC_3_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKBC_3_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTP_3_P]
set_property PACKAGE_PIN B22 [get_ports CKTP_3_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTP_3_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKDT_3_P]
set_property PACKAGE_PIN A21 [get_ports CKDT_3_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKDT_3_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DI_3_P]
set_property PACKAGE_PIN B13 [get_ports DI_3_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DI_3_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DO_3_P]
set_property PACKAGE_PIN D15 [get_ports DO_3_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DO_3_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTK_3_P]
set_property PACKAGE_PIN A16 [get_ports CKTK_3_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTK_3_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA0_3_P]
set_property PACKAGE_PIN B18 [get_ports DATA0_3_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA0_3_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA1_3_P]
set_property PACKAGE_PIN B16 [get_ports DATA1_3_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA1_3_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports WEN_3_P]
set_property PACKAGE_PIN D16 [get_ports WEN_3_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports WEN_3_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports ENA_3_P]
set_property PACKAGE_PIN A14 [get_ports ENA_3_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports ENA_3_N]

# vmm 4
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA0_4_P]
set_property PACKAGE_PIN C19 [get_ports DATA0_4_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA0_4_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA1_4_P]
set_property PACKAGE_PIN C20 [get_ports DATA1_4_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA1_4_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTK_4_P]
set_property PACKAGE_PIN A20 [get_ports CKTK_4_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTK_4_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DO_4_P]
set_property PACKAGE_PIN A19 [get_ports DO_4_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DO_4_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DI_4_P]
set_property PACKAGE_PIN E18 [get_ports DI_4_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DI_4_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKBC_4_P]
set_property PACKAGE_PIN F20 [get_ports CKBC_4_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKBC_4_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports WEN_4_P]
set_property PACKAGE_PIN N5 [get_ports WEN_4_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports WEN_4_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports ENA_4_P]
set_property PACKAGE_PIN D19 [get_ports ENA_4_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports ENA_4_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTP_4_P]
set_property PACKAGE_PIN N2 [get_ports CKTP_4_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTP_4_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKART_4_P]
set_property PACKAGE_PIN M5 [get_ports CKART_4_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKART_4_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKDT_4_P]
set_property PACKAGE_PIN A1 [get_ports CKDT_4_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKDT_4_N]

# vmm 5
set_property IOSTANDARD DIFF_HSUL_12 [get_ports ENA_5_P]
set_property PACKAGE_PIN F1 [get_ports ENA_5_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports ENA_5_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports WEN_5_P]
set_property PACKAGE_PIN H5 [get_ports WEN_5_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports WEN_5_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTP_5_P]
set_property PACKAGE_PIN G2 [get_ports CKTP_5_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTP_5_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKBC_5_P]
set_property PACKAGE_PIN J1 [get_ports CKBC_5_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKBC_5_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKART_5_P]
set_property PACKAGE_PIN G4 [get_ports CKART_5_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKART_5_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKDT_5_P]
set_property PACKAGE_PIN E3 [get_ports CKDT_5_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKDT_5_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DI_5_P]
set_property PACKAGE_PIN G3 [get_ports DI_5_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DI_5_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DO_5_P]
set_property PACKAGE_PIN J2 [get_ports DO_5_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DO_5_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTK_5_P]
set_property PACKAGE_PIN B2 [get_ports CKTK_5_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTK_5_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA1_5_P]
set_property PACKAGE_PIN D2 [get_ports DATA1_5_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA1_5_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA0_5_P]
set_property PACKAGE_PIN D1 [get_ports DATA0_5_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA0_5_N]

# vmm 6
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKDT_6_P]
set_property PACKAGE_PIN V2 [get_ports CKDT_6_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKDT_6_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKART_6_P]
set_property PACKAGE_PIN U1 [get_ports CKART_6_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKART_6_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA0_6_P]
set_property PACKAGE_PIN L1 [get_ports DATA0_6_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA0_6_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA1_6_P]
set_property PACKAGE_PIN K3 [get_ports DATA1_6_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA1_6_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTK_6_P]
set_property PACKAGE_PIN P4 [get_ports CKTK_6_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTK_6_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DO_6_P]
set_property PACKAGE_PIN N3 [get_ports DO_6_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DO_6_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DI_6_P]
set_property PACKAGE_PIN L4 [get_ports DI_6_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DI_6_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports WEN_6_P]
set_property PACKAGE_PIN P1 [get_ports WEN_6_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports WEN_6_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports ENA_6_P]
set_property PACKAGE_PIN J4 [get_ports ENA_6_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports ENA_6_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKBC_6_P]
set_property PACKAGE_PIN J6 [get_ports CKBC_6_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKBC_6_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTP_6_P]
set_property PACKAGE_PIN M2 [get_ports CKTP_6_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTP_6_N]

# vmm 7
set_property IOSTANDARD DIFF_HSUL_12 [get_ports WEN_7_P]
set_property PACKAGE_PIN AA3 [get_ports WEN_7_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports WEN_7_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTP_7_P]
set_property PACKAGE_PIN V3 [get_ports CKTP_7_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTP_7_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKBC_7_P]
set_property PACKAGE_PIN R2 [get_ports CKBC_7_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKBC_7_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKART_7_P]
set_property PACKAGE_PIN AB1 [get_ports CKART_7_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKART_7_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKDT_7_P]
set_property PACKAGE_PIN W4 [get_ports CKDT_7_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKDT_7_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DI_7_P]
set_property PACKAGE_PIN Y9 [get_ports DI_7_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DI_7_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DO_7_P]
set_property PACKAGE_PIN Y1 [get_ports DO_7_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DO_7_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTK_7_P]
set_property PACKAGE_PIN AB2 [get_ports CKTK_7_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTK_7_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA1_7_P]
set_property PACKAGE_PIN Y2 [get_ports DATA1_7_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA1_7_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA0_7_P]
set_property PACKAGE_PIN AA4 [get_ports DATA0_7_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA0_7_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports ENA_7_P]
set_property PACKAGE_PIN AB5 [get_ports ENA_7_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports ENA_7_N]

# vmm 8
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA0_8_P]
set_property PACKAGE_PIN AA6 [get_ports DATA0_8_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA0_8_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA1_8_P]
set_property PACKAGE_PIN Y7 [get_ports DATA1_8_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DATA1_8_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTK_8_P]
set_property PACKAGE_PIN AB8 [get_ports CKTK_8_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTK_8_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DO_8_P]
set_property PACKAGE_PIN T6 [get_ports DO_8_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DO_8_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports DI_8_P]
set_property PACKAGE_PIN V8 [get_ports DI_8_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports DI_8_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKDT_8_P]
set_property PACKAGE_PIN AB6 [get_ports CKDT_8_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKDT_8_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKART_8_P]
set_property PACKAGE_PIN W5 [get_ports CKART_8_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKART_8_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKBC_8_P]
set_property PACKAGE_PIN U5 [get_ports CKBC_8_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKBC_8_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTP_8_P]
set_property PACKAGE_PIN T4 [get_ports CKTP_8_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports CKTP_8_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports WEN_8_P]
set_property PACKAGE_PIN V5 [get_ports WEN_8_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports WEN_8_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports ENA_8_P]
set_property PACKAGE_PIN W7 [get_ports ENA_8_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports ENA_8_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports TKO_8_P]
set_property PACKAGE_PIN AA16 [get_ports TKO_8_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports TKO_8_N]

set_property IOSTANDARD DIFF_HSUL_12 [get_ports SETB_8_P]
set_property PACKAGE_PIN AB17 [get_ports SETB_8_N]
set_property IOSTANDARD DIFF_HSUL_12 [get_ports SETB_8_N]


# MDIO interaface
set_property PACKAGE_PIN N13 [get_ports ENET_MDIO]
set_property PACKAGE_PIN N14 [get_ports ENET_MDC]
set_property PACKAGE_PIN P16 [get_ports ENET_PHY_INT]
set_property PACKAGE_PIN R17 [get_ports ENET_RST_N]

set_property IOSTANDARD LVCMOS25 [get_ports ENET_MDIO]
set_property IOSTANDARD LVCMOS25 [get_ports ENET_MDC]
set_property IOSTANDARD LVCMOS25 [get_ports ENET_PHY_INT]
set_property IOSTANDARD LVCMOS25 [get_ports ENET_RST_N]

#set_property PACKAGE_PIN A8 [get_ports sgmii_rtl_rxn]
#set_property PACKAGE_PIN A4 [get_ports sgmii_rtl_txn]
set_property PACKAGE_PIN B4 [get_ports sgmii_rtl_txp]

#set_false_path -through [get_nets {axi_reg_0} -hierarchical]
#set_false_path -through [get_nets {axi_reg_1} -hierarchical]
#set_false_path -through [get_nets {axi_reg_2} -hierarchical]
#set_false_path -through [get_nets {axi_reg_3} -hierarchical]
#set_false_path -through [get_nets {axi_reg_4} -hierarchical]
#set_false_path -through [get_nets {axi_reg_5} -hierarchical]
#set_false_path -through [get_nets {axi_reg_6} -hierarchical]
#set_false_path -through [get_nets {axi_reg_7} -hierarchical]
#set_false_path -through [get_nets {axi_reg_8} -hierarchical]
#set_false_path -through [get_nets {axi_reg_9} -hierarchical]
#set_false_path -through [get_nets {axi_reg_10} -hierarchical]
#set_false_path -through [get_nets {axi_reg_11} -hierarchical]
#set_false_path -through [get_nets {axi_reg_12} -hierarchical]
#set_false_path -through [get_nets {axi_reg_13} -hierarchical]
#set_false_path -through [get_nets {axi_reg_14} -hierarchical]
#set_false_path -through [get_nets {axi_reg_15} -hierarchical]
#set_false_path -through [get_nets {axi_reg_16} -hierarchical]
#set_false_path -through [get_nets {axi_reg_17} -hierarchical]
#set_false_path -through [get_nets {axi_reg_18} -hierarchical]
#set_false_path -through [get_nets {axi_reg_19} -hierarchical]
#set_false_path -through [get_nets {axi_reg_20} -hierarchical]
#set_false_path -through [get_nets {axi_reg_21} -hierarchical]
#set_false_path -through [get_nets {axi_reg_22} -hierarchical]
#set_false_path -through [get_nets {axi_reg_23} -hierarchical]
#set_false_path -through [get_nets {axi_reg_24} -hierarchical]
#set_false_path -through [get_nets {axi_reg_25} -hierarchical]
#set_false_path -through [get_nets {axi_reg_26} -hierarchical]
#set_false_path -through [get_nets {axi_reg_27} -hierarchical]
#set_false_path -through [get_nets {axi_reg_28} -hierarchical]
#set_false_path -through [get_nets {axi_reg_29} -hierarchical]
#set_false_path -through [get_nets {axi_reg_30} -hierarchical]
#set_false_path -through [get_nets {axi_reg_31} -hierarchical]
#set_false_path -through [get_nets {axi_reg_32} -hierarchical]
#set_false_path -through [get_nets {axi_reg_33} -hierarchical]
#set_false_path -through [get_nets {axi_reg_34} -hierarchical]
#set_false_path -through [get_nets {axi_reg_35} -hierarchical]
#set_false_path -through [get_nets {axi_reg_36} -hierarchical]
#set_false_path -through [get_nets {axi_reg_37} -hierarchical]
#set_false_path -through [get_nets {axi_reg_38} -hierarchical]
#set_false_path -through [get_nets {axi_reg_39} -hierarchical]
#set_false_path -through [get_nets {axi_reg_40} -hierarchical]
#set_false_path -through [get_nets {axi_reg_41} -hierarchical]
#set_false_path -through [get_nets {axi_reg_42} -hierarchical]
#set_false_path -through [get_nets {axi_reg_43} -hierarchical]
#set_false_path -through [get_nets {axi_reg_44} -hierarchical]
#set_false_path -through [get_nets {axi_reg_45} -hierarchical]
#set_false_path -through [get_nets {axi_reg_46} -hierarchical]
#set_false_path -through [get_nets {axi_reg_47} -hierarchical]
#set_false_path -through [get_nets {axi_reg_48} -hierarchical]
#set_false_path -through [get_nets {axi_reg_49} -hierarchical]
#set_false_path -through [get_nets {axi_reg_50} -hierarchical]
#set_false_path -through [get_nets {axi_reg_51} -hierarchical]
#set_false_path -through [get_nets {axi_reg_52} -hierarchical]
#set_false_path -through [get_nets {axi_reg_53} -hierarchical]
#set_false_path -through [get_nets {axi_reg_54} -hierarchical]
#set_false_path -through [get_nets {axi_reg_55} -hierarchical]
#set_false_path -through [get_nets {axi_reg_56} -hierarchical]
#set_false_path -through [get_nets {axi_reg_57} -hierarchical]
#set_false_path -through [get_nets {axi_reg_58} -hierarchical]
#set_false_path -through [get_nets {axi_reg_59} -hierarchical]
# kjohns temp fix for implementation error
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets vmm_data0_8]


set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_200]

set_property DONT_TOUCH true [get_cells mbsys_i]
set_property DONT_TOUCH true [get_cells mbsys_i/axi_ethernet_0]
set_property DONT_TOUCH true [get_cells mbsys_i/axi_ethernet_0/U0]
set_property DONT_TOUCH true [get_cells mbsys_i/axi_ethernet_0/U0/eth_buf]
set_property DONT_TOUCH true [get_cells mbsys_i/axi_ethernet_0/U0/eth_buf/U0]
set_property DONT_TOUCH true [get_cells mbsys_i/axi_ethernet_0/U0/eth_mac]
set_property DONT_TOUCH true [get_cells mbsys_i/axi_ethernet_0/U0/eth_mac/U0]
set_property DONT_TOUCH true [get_cells mbsys_i/axi_ethernet_0/U0/pcs_pma]
set_property DONT_TOUCH true [get_cells mbsys_i/axi_ethernet_0_fifo]
set_property DONT_TOUCH true [get_cells mbsys_i/axi_timer_0]
set_property DONT_TOUCH true [get_cells mbsys_i/clk_wiz_1]
set_property DONT_TOUCH true [get_cells mbsys_i/clk_wiz_1/U0]
set_property DONT_TOUCH true [get_cells mbsys_i/mdm_1]
set_property DONT_TOUCH true [get_cells mbsys_i/mdm_1/U0]
set_property DONT_TOUCH true [get_cells mbsys_i/microblaze_0]
set_property DONT_TOUCH true [get_cells mbsys_i/microblaze_0/U0]
set_property DONT_TOUCH true [get_cells mbsys_i/microblaze_0_axi_intc]
set_property DONT_TOUCH true [get_cells mbsys_i/microblaze_0_axi_intc/U0]
set_property DONT_TOUCH true [get_cells mbsys_i/microblaze_0_axi_periph]
set_property DONT_TOUCH true [get_cells mbsys_i/microblaze_0_axi_periph/xbar]
set_property DONT_TOUCH true [get_cells mbsys_i/microblaze_0_local_memory/dlmb_bram_if_cntlr]
set_property DONT_TOUCH true [get_cells mbsys_i/microblaze_0_local_memory/dlmb_v10]
set_property DONT_TOUCH true [get_cells mbsys_i/microblaze_0_local_memory/dlmb_v10/U0]
set_property DONT_TOUCH true [get_cells mbsys_i/microblaze_0_local_memory/ilmb_bram_if_cntlr]
set_property DONT_TOUCH true [get_cells mbsys_i/microblaze_0_local_memory/ilmb_v10]
set_property DONT_TOUCH true [get_cells mbsys_i/microblaze_0_local_memory/ilmb_v10/U0]
set_property DONT_TOUCH true [get_cells mbsys_i/microblaze_0_local_memory/lmb_bram]
set_property DONT_TOUCH true [get_cells mbsys_i/microblaze_0_xlconcat]
set_property DONT_TOUCH true [get_cells mbsys_i/rst_clk_wiz_1_100M]
set_property DONT_TOUCH true [get_cells mbsys_i/xadc_wiz_0]
set_property DONT_TOUCH true [get_cells mbsys_i/xadc_wiz_0/U0]
set_property IOSTANDARD LVCMOS12 [get_ports Vaux0_v_p]
set_property PACKAGE_PIN K22 [get_ports Vaux3_v_n]
set_property PACKAGE_PIN K21 [get_ports Vaux3_v_p]
set_property PACKAGE_PIN G13 [get_ports Vaux0_v_n]
set_property PACKAGE_PIN H13 [get_ports Vaux0_v_p]
set_property PACKAGE_PIN H14 [get_ports Vaux1_v_n]
set_property PACKAGE_PIN J14 [get_ports Vaux1_v_p]
set_property PACKAGE_PIN J22 [get_ports Vaux2_v_p]
set_property PACKAGE_PIN H22 [get_ports Vaux2_v_n]
set_property PACKAGE_PIN G16 [get_ports Vaux8_v_n]
set_property PACKAGE_PIN G15 [get_ports Vaux8_v_p]
set_property PACKAGE_PIN H15 [get_ports Vaux9_v_n]
set_property PACKAGE_PIN J15 [get_ports Vaux9_v_p]
set_property PACKAGE_PIN G20 [get_ports Vaux10_v_n]
set_property PACKAGE_PIN H20 [get_ports Vaux10_v_p]
set_property PACKAGE_PIN L21 [get_ports Vaux11_v_n]
set_property PACKAGE_PIN M21 [get_ports Vaux11_v_p]
set_property IOSTANDARD LVCMOS12 [get_ports Vaux0_v_n]
set_property IOSTANDARD LVCMOS12 [get_ports Vaux1_v_n]
set_property IOSTANDARD LVCMOS12 [get_ports Vaux1_v_p]
set_property IOSTANDARD LVCMOS12 [get_ports Vaux2_v_n]
set_property IOSTANDARD LVCMOS12 [get_ports Vaux2_v_p]
set_property IOSTANDARD LVCMOS12 [get_ports Vaux3_v_n]
set_property IOSTANDARD LVCMOS12 [get_ports Vaux3_v_p]
set_property IOSTANDARD LVCMOS12 [get_ports Vaux8_v_n]
set_property IOSTANDARD LVCMOS12 [get_ports Vaux8_v_p]
set_property IOSTANDARD LVCMOS12 [get_ports Vaux9_v_n]
set_property IOSTANDARD LVCMOS12 [get_ports Vaux9_v_p]
set_property IOSTANDARD LVCMOS12 [get_ports Vaux10_v_n]
set_property IOSTANDARD LVCMOS12 [get_ports Vaux10_v_p]
set_property IOSTANDARD LVCMOS12 [get_ports Vaux11_v_n]
set_property IOSTANDARD LVCMOS12 [get_ports Vaux11_v_p]
set_property PACKAGE_PIN M9 [get_ports Vp_Vn_v_n]
set_property PACKAGE_PIN L10 [get_ports Vp_Vn_v_p]
