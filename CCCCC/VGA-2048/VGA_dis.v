`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:54:17 01/06/2015 
// Design Name: 
// Module Name:    VGA_dis 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module VGA_dis(
input [9:0]count_h,input [9:0]count_v,
input [1:0]num_h,input [1:0]num_v,input flag,input [3:0]data,
output wire [2:0]red,output wire [2:0]grn,output wire [1:0]blu,
output reg [3:0]out_data
    );

//reg [3:0]data;

wire [7:0]color;
assign red[2] = (flag)? color[7] : 1'b0;
assign red[1] = (flag)? color[6] : 1'b0;
assign red[0] = (flag)? color[5] : 1'b0;
assign grn[2] = (flag)? color[4] : 1'b0;
assign grn[1] = (flag)? color[3] : 1'b0;
assign grn[0] = (flag)? color[2] : 1'b0;
assign blu[1] = (flag)? color[1] : 1'b0;
assign blu[0] = (flag)? color[0] : 1'b0;

wire [7:0]set[0:15];
assign set[0] = 8'b000_000_11;//board
assign set[1] = 8'b000_000_00;//black

assign set[2] = 8'b000_001_00;//for 2
assign set[3] = 8'b000_011_00;//for 4
assign set[4] = 8'b000_101_00;//for 8
assign set[5] = 8'b000_111_00;//for 16
assign set[6] = 8'b001_001_01;//for 32
assign set[7] = 8'b011_000_00;//for 64
assign set[8] = 8'b101_000_00;//for 128
assign set[9] = 8'b111_000_00;//for 256
assign set[10] = 8'b100_100_00;//for 512
assign set[11] = 8'b111_111_00;//for 1024
assign set[12] = 8'b111_111_11;//for 2048
assign set[13] = 8'b010_010_01;//for 4096
assign set[14] = 8'b011_011_01;//for 8192
assign set[15] = 8'b101_101_01;//for 16384
/*
assign set[2] = 8'b001_000_00;//for 2
assign set[3] = 8'b010_000_00;//for 4
assign set[4] = 8'b011_000_00;//for 8
assign set[5] = 8'b100_000_00;//for 16
assign set[6] = 8'b101_000_00;//for 32
assign set[7] = 8'b110_000_00;//for 64
assign set[8] = 8'b111_000_00;//for 128
assign set[9] = 8'b000_111_00;//for 256
assign set[10] = 8'b000_110_00;//for 512
assign set[11] = 8'b000_101_00;//for 1024
assign set[12] = 8'b000_100_00;//for 2048
assign set[13] = 8'b000_011_00;//for 4096
assign set[14] = 8'b000_010_00;//for 8192
assign set[15] = 8'b000_001_00;//for 16384
*/
always @(*) begin
	out_data = num_h + num_v * 4;
end

assign color = (((count_h > 250) && (count_h <= 262))
				|| ((count_h > 658) && (count_h <= 670))
				|| ((count_v > 60) && (count_v <= 72))
				|| ((count_v > 468) && (count_v <= 480))
				|| ((count_h > 358) && (count_h <= 362))
				|| ((count_h > 458) && (count_h <= 462))
				|| ((count_h > 558) && (count_h <= 562))
				|| ((count_v > 168) && (count_v <= 172))
				|| ((count_v > 268) && (count_v <= 272))
				|| ((count_v > 368) && (count_v <= 372))
				)? set[0] : set[data];
/*
always @(*) begin
	if (((count_h > 250) && (count_h <= 260))
	 || ((count_h > 660) && (count_h <= 670))
	 || ((count_v > 60) && (count_v <= 70))
	 || ((count_v > 470) && (count_v <= 480)))
		color = set[1];
	else
		color = set[data];
end
*/
endmodule
