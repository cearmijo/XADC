// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4.1 (win64) Build 1149489 Thu Feb 19 16:23:09 MST 2015
// Date        : Thu Jul 16 16:06:34 2015
// Host        : lithe-ad-work running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               C:/export/uaphysics/atlas/muon/1-mmfe_v14_ca7-1-15/a7_mmfe_xadc_udp_v2/a7_mmfe_xadc_udp_v2.srcs/sources_1/ip/clk_wiz_low_jitter/clk_wiz_low_jitter_funcsim.v
// Design      : clk_wiz_low_jitter
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* core_generation_info = "clk_wiz_low_jitter,clk_wiz_v5_1,{component_name=clk_wiz_low_jitter,use_phase_alignment=false,use_min_o_jitter=true,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,enable_axi=0,feedback_source=FDBK_AUTO,PRIMITIVE=MMCM,num_out_clk=1,clkin1_period=2.5,clkin2_period=10.0,use_power_down=false,use_reset=false,use_locked=false,use_inclk_stopped=false,feedback_type=SINGLE,CLOCK_MGR_TYPE=NA,manual_override=false}" *) 
(* NotValidForBitStream *)
module clk_wiz_low_jitter
   (clk_in1,
    clk_out1);
  input clk_in1;
  output clk_out1;

  wire clk_in1;
  wire clk_out1;

clk_wiz_low_jitter_clk_wiz_low_jitter_clk_wiz U0
       (.clk_in1(clk_in1),
        .clk_out1(clk_out1));
endmodule

(* ORIG_REF_NAME = "clk_wiz_low_jitter_clk_wiz" *) 
module clk_wiz_low_jitter_clk_wiz_low_jitter_clk_wiz
   (clk_in1,
    clk_out1);
  input clk_in1;
  output clk_out1;

  wire clk_in1;
  wire clk_out1;
  wire clk_out1_clk_wiz_low_jitter;
  wire clk_out1_clk_wiz_low_jitter_en_clk;
  wire clkfbout_clk_wiz_low_jitter;
  wire locked_int;
(* RTL_KEEP = "TRUE" *) (* async_reg = "true" *)   wire [7:0]seq_reg1;
  wire NLW_clkf_buf_O_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT1_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED;
  wire NLW_mmcm_adv_inst_DRDY_UNCONNECTED;
  wire NLW_mmcm_adv_inst_PSDONE_UNCONNECTED;
  wire [15:0]NLW_mmcm_adv_inst_DO_UNCONNECTED;

(* box_type = "PRIMITIVE" *) 
   BUFG clkf_buf
       (.I(clkfbout_clk_wiz_low_jitter),
        .O(NLW_clkf_buf_O_UNCONNECTED));
(* CE_TYPE = "SYNC" *) 
   (* XILINX_LEGACY_PRIM = "BUFGCE" *) 
   (* XILINX_TRANSFORM_PINMAP = "CE:CE0 I:I0" *) 
   (* box_type = "PRIMITIVE" *) 
   BUFGCTRL #(
    .INIT_OUT(0),
    .PRESELECT_I0("TRUE"),
    .PRESELECT_I1("FALSE")) 
     clkout1_buf
       (.CE0(seq_reg1[7]),
        .CE1(1'b0),
        .I0(clk_out1_clk_wiz_low_jitter),
        .I1(1'b1),
        .IGNORE0(1'b0),
        .IGNORE1(1'b1),
        .O(clk_out1),
        .S0(1'b1),
        .S1(1'b0));
(* box_type = "PRIMITIVE" *) 
   BUFH clkout1_buf_en
       (.I(clk_out1_clk_wiz_low_jitter),
        .O(clk_out1_clk_wiz_low_jitter_en_clk));
(* box_type = "PRIMITIVE" *) 
   MMCME2_ADV #(
    .BANDWIDTH("HIGH"),
    .CLKFBOUT_MULT_F(3.500000),
    .CLKFBOUT_PHASE(0.000000),
    .CLKFBOUT_USE_FINE_PS("FALSE"),
    .CLKIN1_PERIOD(2.500000),
    .CLKIN2_PERIOD(0.000000),
    .CLKOUT0_DIVIDE_F(3.500000),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT0_USE_FINE_PS("FALSE"),
    .CLKOUT1_DIVIDE(1),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT1_USE_FINE_PS("FALSE"),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT2_USE_FINE_PS("FALSE"),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT3_USE_FINE_PS("FALSE"),
    .CLKOUT4_CASCADE("FALSE"),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT4_USE_FINE_PS("FALSE"),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .CLKOUT5_USE_FINE_PS("FALSE"),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT6_DUTY_CYCLE(0.500000),
    .CLKOUT6_PHASE(0.000000),
    .CLKOUT6_USE_FINE_PS("FALSE"),
    .COMPENSATION("INTERNAL"),
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
       (.CLKFBIN(clkfbout_clk_wiz_low_jitter),
        .CLKFBOUT(clkfbout_clk_wiz_low_jitter),
        .CLKFBOUTB(NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED),
        .CLKFBSTOPPED(NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED),
        .CLKIN1(clk_in1),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKINSTOPPED(NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED),
        .CLKOUT0(clk_out1_clk_wiz_low_jitter),
        .CLKOUT0B(NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(NLW_mmcm_adv_inst_CLKOUT1_UNCONNECTED),
        .CLKOUT1B(NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED),
        .CLKOUT2(NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED),
        .CLKOUT2B(NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED),
        .CLKOUT3(NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED),
        .CLKOUT3B(NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED),
        .CLKOUT4(NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED),
        .CLKOUT6(NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_mmcm_adv_inst_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_mmcm_adv_inst_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(locked_int),
        .PSCLK(1'b0),
        .PSDONE(NLW_mmcm_adv_inst_PSDONE_UNCONNECTED),
        .PSEN(1'b0),
        .PSINCDEC(1'b0),
        .PWRDWN(1'b0),
        .RST(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg1_reg[0] 
       (.C(clk_out1_clk_wiz_low_jitter_en_clk),
        .CE(1'b1),
        .D(locked_int),
        .Q(seq_reg1[0]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg1_reg[1] 
       (.C(clk_out1_clk_wiz_low_jitter_en_clk),
        .CE(1'b1),
        .D(seq_reg1[0]),
        .Q(seq_reg1[1]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg1_reg[2] 
       (.C(clk_out1_clk_wiz_low_jitter_en_clk),
        .CE(1'b1),
        .D(seq_reg1[1]),
        .Q(seq_reg1[2]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg1_reg[3] 
       (.C(clk_out1_clk_wiz_low_jitter_en_clk),
        .CE(1'b1),
        .D(seq_reg1[2]),
        .Q(seq_reg1[3]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg1_reg[4] 
       (.C(clk_out1_clk_wiz_low_jitter_en_clk),
        .CE(1'b1),
        .D(seq_reg1[3]),
        .Q(seq_reg1[4]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg1_reg[5] 
       (.C(clk_out1_clk_wiz_low_jitter_en_clk),
        .CE(1'b1),
        .D(seq_reg1[4]),
        .Q(seq_reg1[5]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg1_reg[6] 
       (.C(clk_out1_clk_wiz_low_jitter_en_clk),
        .CE(1'b1),
        .D(seq_reg1[5]),
        .Q(seq_reg1[6]),
        .R(1'b0));
(* KEEP = "yes" *) 
   FDRE #(
    .INIT(1'b0)) 
     \seq_reg1_reg[7] 
       (.C(clk_out1_clk_wiz_low_jitter_en_clk),
        .CE(1'b1),
        .D(seq_reg1[6]),
        .Q(seq_reg1[7]),
        .R(1'b0));
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
