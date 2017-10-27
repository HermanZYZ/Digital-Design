// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Tue Dec 13 03:08:20 2016
// Host        : Abner-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               G:/Project_Clock/project_1/project_1.sim/sim_1/impl/timing/project_clock_time_impl.v
// Design      : project_clock
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35ticpg236-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "2b771bd6" *) 
(* NotValidForBitStream *)
module project_clock
   (function_key,
    up,
    down,
    clk,
    clr,
    an,
    a_to_g,
    dp);
  input function_key;
  input up;
  input down;
  input clk;
  input clr;
  output [3:0]an;
  output [6:0]a_to_g;
  output dp;

  wire [6:0]a_to_g;
  wire [3:0]an;
  wire [3:0]an_OBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire \clkdiv[0]_i_5_n_0 ;
  wire \clkdiv_reg[0]_i_1_n_0 ;
  wire \clkdiv_reg[0]_i_1_n_4 ;
  wire \clkdiv_reg[0]_i_1_n_5 ;
  wire \clkdiv_reg[0]_i_1_n_6 ;
  wire \clkdiv_reg[0]_i_1_n_7 ;
  wire \clkdiv_reg[12]_i_1_n_0 ;
  wire \clkdiv_reg[12]_i_1_n_4 ;
  wire \clkdiv_reg[12]_i_1_n_5 ;
  wire \clkdiv_reg[12]_i_1_n_6 ;
  wire \clkdiv_reg[12]_i_1_n_7 ;
  wire \clkdiv_reg[16]_i_1_n_4 ;
  wire \clkdiv_reg[16]_i_1_n_5 ;
  wire \clkdiv_reg[16]_i_1_n_6 ;
  wire \clkdiv_reg[16]_i_1_n_7 ;
  wire \clkdiv_reg[4]_i_1_n_0 ;
  wire \clkdiv_reg[4]_i_1_n_4 ;
  wire \clkdiv_reg[4]_i_1_n_5 ;
  wire \clkdiv_reg[4]_i_1_n_6 ;
  wire \clkdiv_reg[4]_i_1_n_7 ;
  wire \clkdiv_reg[8]_i_1_n_0 ;
  wire \clkdiv_reg[8]_i_1_n_4 ;
  wire \clkdiv_reg[8]_i_1_n_5 ;
  wire \clkdiv_reg[8]_i_1_n_6 ;
  wire \clkdiv_reg[8]_i_1_n_7 ;
  wire \clkdiv_reg_n_0_[0] ;
  wire \clkdiv_reg_n_0_[10] ;
  wire \clkdiv_reg_n_0_[11] ;
  wire \clkdiv_reg_n_0_[12] ;
  wire \clkdiv_reg_n_0_[13] ;
  wire \clkdiv_reg_n_0_[14] ;
  wire \clkdiv_reg_n_0_[15] ;
  wire \clkdiv_reg_n_0_[16] ;
  wire \clkdiv_reg_n_0_[17] ;
  wire \clkdiv_reg_n_0_[1] ;
  wire \clkdiv_reg_n_0_[2] ;
  wire \clkdiv_reg_n_0_[3] ;
  wire \clkdiv_reg_n_0_[4] ;
  wire \clkdiv_reg_n_0_[5] ;
  wire \clkdiv_reg_n_0_[6] ;
  wire \clkdiv_reg_n_0_[7] ;
  wire \clkdiv_reg_n_0_[8] ;
  wire \clkdiv_reg_n_0_[9] ;
  wire clr;
  wire clr_IBUF;
  wire down;
  wire down_IBUF;
  wire dp;
  wire dp_OBUF;
  wire [1:0]flash;
  wire function_key;
  wire function_key_IBUF;
  wire up;
  wire up_IBUF;
  wire [2:0]\NLW_clkdiv_reg[0]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_clkdiv_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_clkdiv_reg[16]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_clkdiv_reg[4]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_clkdiv_reg[8]_i_1_CO_UNCONNECTED ;

initial begin
 $sdf_annotate("project_clock_time_impl.sdf",,,,"tool_control");
end
  OBUF \a_to_g_OBUF[0]_inst 
       (.I(1'b1),
        .O(a_to_g[0]));
  OBUF \a_to_g_OBUF[1]_inst 
       (.I(1'b0),
        .O(a_to_g[1]));
  OBUF \a_to_g_OBUF[2]_inst 
       (.I(1'b0),
        .O(a_to_g[2]));
  OBUF \a_to_g_OBUF[3]_inst 
       (.I(1'b0),
        .O(a_to_g[3]));
  OBUF \a_to_g_OBUF[4]_inst 
       (.I(1'b0),
        .O(a_to_g[4]));
  OBUF \a_to_g_OBUF[5]_inst 
       (.I(1'b0),
        .O(a_to_g[5]));
  OBUF \a_to_g_OBUF[6]_inst 
       (.I(1'b0),
        .O(a_to_g[6]));
  OBUF \an_OBUF[0]_inst 
       (.I(an_OBUF[0]),
        .O(an[0]));
  LUT2 #(
    .INIT(4'hE)) 
    \an_OBUF[0]_inst_i_1 
       (.I0(flash[1]),
        .I1(flash[0]),
        .O(an_OBUF[0]));
  OBUF \an_OBUF[1]_inst 
       (.I(dp_OBUF),
        .O(an[1]));
  LUT2 #(
    .INIT(4'hB)) 
    \an_OBUF[1]_inst_i_1 
       (.I0(flash[1]),
        .I1(flash[0]),
        .O(dp_OBUF));
  OBUF \an_OBUF[2]_inst 
       (.I(an_OBUF[2]),
        .O(an[2]));
  LUT2 #(
    .INIT(4'hB)) 
    \an_OBUF[2]_inst_i_1 
       (.I0(flash[0]),
        .I1(flash[1]),
        .O(an_OBUF[2]));
  OBUF \an_OBUF[3]_inst 
       (.I(an_OBUF[3]),
        .O(an[3]));
  LUT2 #(
    .INIT(4'h7)) 
    \an_OBUF[3]_inst_i_1 
       (.I0(flash[1]),
        .I1(flash[0]),
        .O(an_OBUF[3]));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT1 #(
    .INIT(2'h1)) 
    \clkdiv[0]_i_5 
       (.I0(\clkdiv_reg_n_0_[0] ),
        .O(\clkdiv[0]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[0]_i_1_n_7 ),
        .Q(\clkdiv_reg_n_0_[0] ),
        .R(clr_IBUF));
  CARRY4 \clkdiv_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\clkdiv_reg[0]_i_1_n_0 ,\NLW_clkdiv_reg[0]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\clkdiv_reg[0]_i_1_n_4 ,\clkdiv_reg[0]_i_1_n_5 ,\clkdiv_reg[0]_i_1_n_6 ,\clkdiv_reg[0]_i_1_n_7 }),
        .S({\clkdiv_reg_n_0_[3] ,\clkdiv_reg_n_0_[2] ,\clkdiv_reg_n_0_[1] ,\clkdiv[0]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[8]_i_1_n_5 ),
        .Q(\clkdiv_reg_n_0_[10] ),
        .R(clr_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[8]_i_1_n_4 ),
        .Q(\clkdiv_reg_n_0_[11] ),
        .R(clr_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[12]_i_1_n_7 ),
        .Q(\clkdiv_reg_n_0_[12] ),
        .R(clr_IBUF));
  CARRY4 \clkdiv_reg[12]_i_1 
       (.CI(\clkdiv_reg[8]_i_1_n_0 ),
        .CO({\clkdiv_reg[12]_i_1_n_0 ,\NLW_clkdiv_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clkdiv_reg[12]_i_1_n_4 ,\clkdiv_reg[12]_i_1_n_5 ,\clkdiv_reg[12]_i_1_n_6 ,\clkdiv_reg[12]_i_1_n_7 }),
        .S({\clkdiv_reg_n_0_[15] ,\clkdiv_reg_n_0_[14] ,\clkdiv_reg_n_0_[13] ,\clkdiv_reg_n_0_[12] }));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[12]_i_1_n_6 ),
        .Q(\clkdiv_reg_n_0_[13] ),
        .R(clr_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[12]_i_1_n_5 ),
        .Q(\clkdiv_reg_n_0_[14] ),
        .R(clr_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[12]_i_1_n_4 ),
        .Q(\clkdiv_reg_n_0_[15] ),
        .R(clr_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[16]_i_1_n_7 ),
        .Q(\clkdiv_reg_n_0_[16] ),
        .R(clr_IBUF));
  CARRY4 \clkdiv_reg[16]_i_1 
       (.CI(\clkdiv_reg[12]_i_1_n_0 ),
        .CO(\NLW_clkdiv_reg[16]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clkdiv_reg[16]_i_1_n_4 ,\clkdiv_reg[16]_i_1_n_5 ,\clkdiv_reg[16]_i_1_n_6 ,\clkdiv_reg[16]_i_1_n_7 }),
        .S({flash,\clkdiv_reg_n_0_[17] ,\clkdiv_reg_n_0_[16] }));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[16]_i_1_n_6 ),
        .Q(\clkdiv_reg_n_0_[17] ),
        .R(clr_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[16]_i_1_n_5 ),
        .Q(flash[0]),
        .R(clr_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[16]_i_1_n_4 ),
        .Q(flash[1]),
        .R(clr_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[0]_i_1_n_6 ),
        .Q(\clkdiv_reg_n_0_[1] ),
        .R(clr_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[0]_i_1_n_5 ),
        .Q(\clkdiv_reg_n_0_[2] ),
        .R(clr_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[0]_i_1_n_4 ),
        .Q(\clkdiv_reg_n_0_[3] ),
        .R(clr_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[4]_i_1_n_7 ),
        .Q(\clkdiv_reg_n_0_[4] ),
        .R(clr_IBUF));
  CARRY4 \clkdiv_reg[4]_i_1 
       (.CI(\clkdiv_reg[0]_i_1_n_0 ),
        .CO({\clkdiv_reg[4]_i_1_n_0 ,\NLW_clkdiv_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clkdiv_reg[4]_i_1_n_4 ,\clkdiv_reg[4]_i_1_n_5 ,\clkdiv_reg[4]_i_1_n_6 ,\clkdiv_reg[4]_i_1_n_7 }),
        .S({\clkdiv_reg_n_0_[7] ,\clkdiv_reg_n_0_[6] ,\clkdiv_reg_n_0_[5] ,\clkdiv_reg_n_0_[4] }));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[4]_i_1_n_6 ),
        .Q(\clkdiv_reg_n_0_[5] ),
        .R(clr_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[4]_i_1_n_5 ),
        .Q(\clkdiv_reg_n_0_[6] ),
        .R(clr_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[4]_i_1_n_4 ),
        .Q(\clkdiv_reg_n_0_[7] ),
        .R(clr_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[8]_i_1_n_7 ),
        .Q(\clkdiv_reg_n_0_[8] ),
        .R(clr_IBUF));
  CARRY4 \clkdiv_reg[8]_i_1 
       (.CI(\clkdiv_reg[4]_i_1_n_0 ),
        .CO({\clkdiv_reg[8]_i_1_n_0 ,\NLW_clkdiv_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clkdiv_reg[8]_i_1_n_4 ,\clkdiv_reg[8]_i_1_n_5 ,\clkdiv_reg[8]_i_1_n_6 ,\clkdiv_reg[8]_i_1_n_7 }),
        .S({\clkdiv_reg_n_0_[11] ,\clkdiv_reg_n_0_[10] ,\clkdiv_reg_n_0_[9] ,\clkdiv_reg_n_0_[8] }));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\clkdiv_reg[8]_i_1_n_6 ),
        .Q(\clkdiv_reg_n_0_[9] ),
        .R(clr_IBUF));
  IBUF clr_IBUF_inst
       (.I(clr),
        .O(clr_IBUF));
  (* OPT_INSERTED *) 
  IBUF down_IBUF_inst
       (.I(down),
        .O(down_IBUF));
  OBUF dp_OBUF_inst
       (.I(dp_OBUF),
        .O(dp));
  (* OPT_INSERTED *) 
  IBUF function_key_IBUF_inst
       (.I(function_key),
        .O(function_key_IBUF));
  (* OPT_INSERTED *) 
  IBUF up_IBUF_inst
       (.I(up),
        .O(up_IBUF));
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
