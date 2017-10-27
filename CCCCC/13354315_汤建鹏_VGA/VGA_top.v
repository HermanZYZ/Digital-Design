`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:38:46 01/05/2015 
// Design Name: 
// Module Name:    VGA_top 
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
module VGA_top(
	  input clk,  
     input clr,
     output hsync,  
     output vsync,  
     output [2:0] red,  
     output [2:0] green,  
     output [1:0] blue  
    );  
      
    wire clk25,vidon;  
    wire [9:0] hc,vc;  

    clkdiv U1(  
        .clk(clk),  
        .clr(clr),  
        .clk25(clk25)  
    );  
      
    vga_640x480 V1(  
        .clk(clk25),  
        .clr(clr),  
        .hsync(hsync),  
        .vsync(vsync),  
        .hc(hc),  
        .vc(vc),  
        .vidon(vidon)  
    );  
    
    vga_stripes V2(  
        .vidon(vidon),
		  .vsync(vsync),
		  .hsync(hsync),
		  .clk25(clk25),
		  .clr(clr),
        .hc(hc),  
        .vc(vc),  
        .red(red),  
        .green(green),  
        .blue(blue)  
    );  

endmodule
