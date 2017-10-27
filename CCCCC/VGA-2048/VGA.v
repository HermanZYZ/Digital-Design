`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:39:30 12/18/2014 
// Design Name: 
// Module Name:    VGA 
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
module VGA(
input clk,input clr,
output wire hsync,output wire vsync,
output reg [1:0]num_h,output reg [1:0]num_v,output wire flag,
output reg [9:0]count_h,output reg [9:0]count_v
    );

reg [7:0]color;
//count_h
always @(posedge clk or posedge clr) begin
	if (clr) count_h <= 0;
	else if (count_h == 10'd800) count_h <= 0;
	else count_h <= count_h + 1;
end
//count_v
always @(posedge clk or posedge clr) begin
	if (clr) count_v <= 0;
	else if (count_v == 10'd521) count_v <= 0;
	else if (count_h == 10'd800) count_v <= count_v + 1;
	else count_v <= count_v;
end
//hsync
assign hsync = (count_h >= 10'd96)? 1'b1 : 1'b0;
//vsync
assign vsync = (count_v >= 10'd2)? 1'b1: 1'b0;
//flag
//assign flag = ((count_v > 31) && (count_v <= 511) && (count_h > 144) && (count_h <= 784))? 1'b1 : 1'b0;
assign flag = ((count_v > 60) && (count_v <= 480) && (count_h > 250) && (count_h <= 670))? 1'b1 : 1'b0;
//num_h
always @(count_h) begin
	if ((count_h > 260) && (count_h <= 360)) num_h = 2'b00;
	else if ((count_h > 360) && (count_h <= 460)) num_h = 2'b01;
	else if ((count_h > 460) && (count_h <= 560)) num_h = 2'b10;
	else num_h = 2'b11;
end
//num_v
always @(count_v) begin
	if ((count_v > 70) && (count_v <= 170)) num_v = 2'b00;
	else if ((count_v > 170) && (count_v <= 270)) num_v = 2'b01;
	else if ((count_v > 270) && (count_v <= 370)) num_v = 2'b10;
	else num_v = 2'b11;
end

endmodule
