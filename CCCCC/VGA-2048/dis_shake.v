`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:05:24 01/08/2015 
// Design Name: 
// Module Name:    dis_shake 
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
module dis_shake(
input clk,input clr,
input in_button,
output wire out_button
    );
reg temp1;
reg temp2;
reg temp3;

always @(posedge clk or posedge clr) begin
	if (clr) begin
		temp1 <= 0;
		temp2 <= 0;
		temp3 <= 0;
	end
	else begin
		temp1 <= in_button;
		temp2 <= temp1;
		temp3 <= temp2;
	end
end

assign out_button = in_button & temp3;

endmodule
