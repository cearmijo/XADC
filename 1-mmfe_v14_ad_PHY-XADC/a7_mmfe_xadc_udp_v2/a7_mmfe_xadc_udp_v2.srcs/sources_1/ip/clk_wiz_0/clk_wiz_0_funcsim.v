// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4.1 (win64) Build 1149489 Thu Feb 19 16:20:35 MST 2015
// Date        : Sat Jun 27 09:57:34 2015
// Host        : phys-pc458-4 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/kjohns/Documents/1-mmfe_v13/a7_mmfe_xadc_udp_v2/a7_mmfe_xadc_udp_v2.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_funcsim.v
// Design      : clk_wiz_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* core_generation_info = "clk_wiz_0,clk_wiz_v5_1,{component_name=clk_wiz_0,use_phase_alignment=true,use_min_o_jitter=true,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,enable_axi=0,feedback_source=FDBK_AUTO,PRIMITIVE=MMCM,num_out_clk=7,clkin1_period=2.5,clkin2_period=10.0,use_power_down=false,use_reset=false,use_locked=false,use_inclk_stopped=false,feedback_type=SINGLE,CLOCK_MGR_TYPE=NA,manual_override=false}" *) 
(* NotValidForBitStream *)
module clk_wiz_0
   (clk_in1,
    clk_200_o,
    clk_160_o,
    clk_100_o,
    clk_50_o,
    clk_40_o,
    clk_20_o,
    clk_10_o);
  input clk_in1;
  output clk_200_o;
  output clk_160_o;
  output clk_100_o;
  output clk_50_o;
  output clk_40_o;
  output clk_20_o;
  output clk_10_o;

  wire clk_100_o;
  wire clk_10_o;
  wire clk_160_o;
  wire clk_200_o;
  wire clk_20_o;
  wire clk_40_o;
  wire clk_50_o;
  wire clk_in1;

clk_wiz_0_clk_wiz_0_clk_wiz U0
       (.clk_100_o(clk_100_o),
        .clk_10_o(clk_10_o),
        .clk_160_o(clk_160_o),
        .clk_200_o(clk_200_o),
        .clk_20_o(clk_20_o),
        .clk_40_o(clk_40_o),
        .clk_50_o(clk_50_o),
        .clk_in1(clk_in1));
endmodule

(* ORIG_REF_NAME = "clk_wiz_0_clk_wiz" *) 
module clk_wiz_0_clk_wiz_0_clk_wiz
   (clk_in1,
    clk_200_o,
    clk_160_o,
    clk_100_o,
    clk_50_o,
    clk_40_o,
    clk_20_o,
    clk_10_o);
  input clk_in1;
  output clk_200_o;
  output clk_160_o;
  output clk_100_o;
  output clk_50_o;
  output clk_40_o;
  output clk_20_o;
  output clk_10_o;

  wire clk_100_o;
  wire clk_100_o_clk_wiz_0;
  wire clk_10_o;
  wire clk_10_o_clk_wiz_0;
  wire clk_160_o;
  wire clk_160_o_clk_wiz_0;
  wire clk_200_o;
  wire clk_200_o_clk_wiz_0;
  wire clk_20_o;
  wire clk_20_o_clk_wiz_0;
  wire clk_40_o;
  wire clk_40_o_clk_wiz_0;
  wire clk_50_o;
  wire clk_50_o_clk_wiz_0;
  wire clk_in1;
  wire clkfbout_buf_clk_wiz_0;
  wire clkfbout_clk_wiz_0;
  wire NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_DRDY_UNCONNECTED;
  wire NLW_mmcm_adv_inst_LOCKED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_PSDONE_UNCONNECTED;
  wire [15:0]NLW_mmcm_adv_inst_DO_UNCONNECTED;

(* box_type = "PRIMITIVE" *) 
   BUFG clkf_buf
       (.I(clkfbout_clk_wiz_0),
        .O(clkfbout_buf_clk_wiz_0));
(* box_type = "PRIMITIVE" *) 
   BUFG clkout1_buf
       (.I(clk_200_o_clk_wiz_0),
        .O(clk_200_o));
(* box_type = "PRIMITIVE" *) 
   BUFG clkout2_buf
       (.I(clk_160_o_clk_wiz_0),
        .O(clk_160_o));
(* box_type = "PRIMITIVE" *) 
   BUFG clkout3_buf
       (.I(clk_100_o_clk_wiz_0),
        .O(clk_100_o));
(* box_type = "PRIMITIVE" *) 
   BUFG clkout4_buf
       (.I(clk_50_o_clk_wiz_0),
        .O(clk_50_o));
(* box_type = "PRIMITIVE" *) 
   BUFG clkout5_buf
       (.I(clk_40_o_clk_wiz_0),
        .O(clk_40_o));
(* box_type = "PRIMITIVE" *) 
   BUFG clkout6_buf
       (.I(clk_20_o_clk_wiz_0),
        .O(clk_20_o));
(* box_type = "PRIMITIVE" *) 
   BUFG clkout7_buf
       (.I(clk_10_o_clk_wiz_0),
        .O(clk_10_o));
(* box_type = "PRIMITIVE" *) 
   MMCME2_ADV #(
    .BANDWIDTH("HIGH"),
    .CLKFBOUT_MULT_F(2.000000),
    .CLKFBOUT_PHASE(0.000000),
    .CLKFBOUT_USE_FINE_PS("FALSE"),
    .CLKIN1_PERIOD(2.500000),
    .CLKIN2_PERIOD(0.000000),
    .CLKOUT0_DIVIDE_F(4.000000),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT0_USE_FINE_PS("FALSE"),
    .CLKOUT1_DIVIDE(5),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT1_USE_FINE_PS("FALSE"),
    .CLKOUT2_DIVIDE(8),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT2_USE_FINE_PS("FALSE"),
    .CLKOUT3_DIVIDE(16),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT3_USE_FINE_PS("FALSE"),
    .CLKOUT4_CASCADE("FALSE"),
    .CLKOUT4_DIVIDE(20),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT4_USE_FINE_PS("FALSE"),
    .CLKOUT5_DIVIDE(40),
    .CLKOUT5_DUTY_CYCLE(0.250000),
    .CLKOUT5_PHASE(45.000000),
    .CLKOUT5_USE_FINE_PS("FALSE"),
    .CLKOUT6_DIVIDE(80),
    .CLKOUT6_DUTY_CYCLE(0.250000),
    .CLKOUT6_PHASE(45.000000),
    .CLKOUT6_USE_FINE_PS("FALSE"),
    .COMPENSATION("ZHOLD"),
    .DIVCLK_DIVIDE(1),
    .IS_CLKINSEL_INVERTED(1'b0),
    .IS_PSEN_INVERTED(1'b0),
    .IS_PSINCDEC_INVERTED(1'b0),
    .IS_PWRDWN_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .REF_JITTER1(0.000000),
    .REF_JITTER2(0.000000),
    .SS_EN("FALSE"),
    .SS_MODE("CENTER_HIGH"),
    .SS_MOD_PERIOD(10000),
    .STARTUP_WAIT("FALSE")) 
     mmcm_adv_inst
       (.CLKFBIN(clkfbout_buf_clk_wiz_0),
        .CLKFBOUT(clkfbout_clk_wiz_0),
        .CLKFBOUTB(NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED),
        .CLKFBSTOPPED(NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED),
        .CLKIN1(clk_in1),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKINSTOPPED(NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED),
        .CLKOUT0(clk_200_o_clk_wiz_0),
        .CLKOUT0B(NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(clk_160_o_clk_wiz_0),
        .CLKOUT1B(NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED),
        .CLKOUT2(clk_100_o_clk_wiz_0),
        .CLKOUT2B(NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED),
        .CLKOUT3(clk_50_o_clk_wiz_0),
        .CLKOUT3B(NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED),
        .CLKOUT4(clk_40_o_clk_wiz_0),
        .CLKOUT5(clk_20_o_clk_wiz_0),
        .CLKOUT6(clk_10_o_clk_wiz_0),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_mmcm_adv_inst_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_mmcm_adv_inst_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(NLW_mmcm_adv_inst_LOCKED_UNCONNECTED),
        .PSCLK(1'b0),
        .PSDONE(NLW_mmcm_adv_inst_PSDONE_UNCONNECTED),
        .PSEN(1'b0),
        .PSINCDEC(1'b0),
        .PWRDWN(1'b0),
        .RST(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
