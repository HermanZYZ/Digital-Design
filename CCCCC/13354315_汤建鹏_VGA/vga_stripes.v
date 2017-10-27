`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:54:44 01/05/2015 
// Design Name: 
// Module Name:    vga_stripes 
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
module vga_stripes(
    input vidon,
	 input vsync,
	 input hsync,
	 input clk25,
	 input clr,
    input [9:0] hc,  
    input [9:0] vc,  
    output reg [2:0] red,  
    output reg [2:0] green,  
    output reg [1:0] blue  
    );  
	 
    parameter hbp = 10'b00100_10000;     //144
    parameter hfp = 10'b11000_10000;     //784
    parameter vbp =10'b00000_11111;      //31
    parameter vfp = 10'b01111_11111;     //511
	 reg [9:0] left, right, top, botton;
	 reg hmove, lmove;
	 always @(posedge vsync or posedge clr)
	 begin
		if(clr)
		begin
			hmove <= 1;
			lmove <= 1;
			left <= hbp+10'b0000_00101;
			right <= hbp+10'b00010_00100;
			top <= vbp+10'b0000_00101;
			botton <= vbp+10'b00001_10100;
		end
		else
		begin
			if(left<=hbp+3'b100)
				hmove <= 1;
			else if(right>=hfp-3'b100)
				hmove <= 0;
			else
				hmove <= hmove;
			if(top<=vbp+3'b100)
				lmove <= 1;
			else if(botton>=vfp-3'b100)
				lmove <= 0;
			else
				lmove <= lmove;
			
			left <= ((hmove) ? (left+1'b1) : (left-1'b1));
			right <= hmove ? right+1'b1 : right-1'b1;
			top <= lmove ? top+1'b1 : top-1'b1;
			botton <= lmove ? botton+1'b1 : botton-1'b1;
		end
	 end
	 
    always@(posedge clk25) 
	 begin  
        if(vidon == 1) 
		  begin 
			   if((hc>=hbp&&hc<hbp+4)||(hc<hfp&&hc>=hfp-4)||(vc>=vbp&&vc<vbp+4)||(vc<vfp&&vc>=vfp-4))
				begin
					red   <= 3'b111;  
					green <= 3'b111;  
					blue  <= 2'b11; 
				end
            else if((hc >= left)&&(hc <= right)&&(vc >= top)&&(vc <= botton))
				begin
					red   <= 3'b111;  
					green <= 3'b000;  
					blue  <= 2'b00; 
				end
				else
				begin
					red   <= 0;  
					green <= 0;  
					blue  <= 0; 
				end
        end  
        else 
		  begin  
           red   <= 0;  
           green <= 0;  
           blue  <= 0;  
        end  
    end  
  
endmodule
