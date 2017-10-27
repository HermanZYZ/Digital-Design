`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:55:55 01/05/2015 
// Design Name: 
// Module Name:    VGA_TOP 
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
module VGA_TOP(
input clk,input clr,
input up_button,input down_button,input left_button,input right_button,
output wire [2:0]red,output wire [2:0]grn, output wire [1:0]blu,
output wire hsync,output wire vsync,output wire death
    );

wire clk_vga;
wire [1:0]num_h;
wire [1:0]num_v;
wire flag;

wire [9:0]count_h;
wire [9:0]count_v;

wire up;
wire down;
wire left;
wire right;

wire [3:0]data;
wire [3:0]out_data;

wire [5:0]count;

divider DIV(
clk,clr,
clk_vga,count
    );

VGA VGA(
clk_vga,clr,
hsync,vsync,
num_h,num_v,flag,
count_h,count_v
    );
	 
VGA_dis DIS(
count_h,count_v,
num_h,num_v,flag,data,
red,grn,blu,
out_data
    ); 
//button
dis_shake UP(
count[5],clr,
up_button,
up
    );
dis_shake DOWN(
count[5],clr,
down_button,
down
    );
dis_shake LEFT(
count[5],clr,
left_button,
left
    );
dis_shake RIGHT(
count[5],clr,
right_button,
right
    );
	 
data DATA(
clr,count[1],
out_data,
up,down,left,right,
death,data
    );	
endmodule
