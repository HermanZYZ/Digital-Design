`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:32:37 01/08/2015
// Design Name:   VGA_TOP
// Module Name:   C:/VGA/VGA_TOP_test.v
// Project Name:  VGA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VGA_TOP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module VGA_TOP_test;

	// Inputs
	reg clk;
	reg clr;
	reg up_button;
	reg down_button;
	reg left_button;
	reg right_button;

	// Outputs
	wire [2:0] red;
	wire [2:0] grn;
	wire [1:0] blu;
	wire hsync;
	wire vsync;
	wire death;

	// Instantiate the Unit Under Test (UUT)
	VGA_TOP uut (
		.clk(clk), 
		.clr(clr), 
		.up_button(up_button), 
		.down_button(down_button), 
		.left_button(left_button), 
		.right_button(right_button), 
		.red(red), 
		.grn(grn), 
		.blu(blu), 
		.hsync(hsync), 
		.vsync(vsync), 
		.death(death)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clr = 0;
		up_button = 0;
		down_button = 0;
		left_button = 0;
		right_button = 0;
		#10;clr=1;#10;clr=0;
		#20000;up_button = 1;
		#20000;up_button = 0;
		#20000;down_button = 1;
		#20000;down_button = 0;
		#20000;left_button = 1;
		#20000;left_button = 0;
		#20000;right_button = 1;
		#20000;right_button = 0;
        
		// Add stimulus here

	end
      always #1 clk=~clk;
endmodule

