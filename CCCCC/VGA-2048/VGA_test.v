`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:52:24 01/07/2015
// Design Name:   VGA_TOP
// Module Name:   C:/Documents and Settings/VGA/VGA_test.v
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

module VGA_test;

	// Inputs
	reg clk;
	reg clr;

	// Outputs
	wire [2:0] red;
	wire [2:0] grn;
	wire [1:0] blu;
	wire hsync;
	wire vsync;

	// Instantiate the Unit Under Test (UUT)
	VGA_TOP uut (
		.clk(clk), 
		.clr(clr), 
		.red(red), 
		.grn(grn), 
		.blu(blu), 
		.hsync(hsync), 
		.vsync(vsync)
	);

	initial begin
		// Initialize Inputs
		clk = 0;clr = 0;#10;clr=1;#10;clr=0;

        
		// Add stimulus here

	end
      always #5 clk=~clk;
endmodule

