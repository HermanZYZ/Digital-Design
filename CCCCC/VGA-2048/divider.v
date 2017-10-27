`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:56:13 01/05/2015 
// Design Name: 
// Module Name:    divider 
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
module divider(
input clk,input clr,
output wire clk_vga,output reg [5:0]count
    );//100MHz -> 25.175MHz ¡Ö 25MHz

//reg [5:0]count;
assign clk_vga = count[1];

always @(posedge clk or posedge clr) begin
	if (clr) count <= 0;
	else count <= count + 1;
end

endmodule
