`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:42:37 01/05/2015 
// Design Name: 
// Module Name:    clkdiv 
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
module clkdiv(
    input clk,  
    input clr,  
    output clk25  
    );  
    
    reg  [24:0] q;  
    //25Î»¼ÆÊýÆ÷   
    always@(posedge clk or posedge clr) begin  
        if(clr)  
            q <= 0;  
        else   
            q <= q + 1'b1;  
    end  
      
    assign clk25 = q[1];  

endmodule
