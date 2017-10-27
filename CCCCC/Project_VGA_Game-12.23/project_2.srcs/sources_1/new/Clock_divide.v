`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/23 20:47:06
// Design Name: 
// Module Name: Clock_divide
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Clock_divide(
    input wire clk,
    output reg [3:0]clkdiv
    );
    
    initial begin
        clkdiv <= 0;
    end
       
    always @ (posedge clk)
        begin
            clkdiv <= clkdiv + 1;
        end
endmodule
