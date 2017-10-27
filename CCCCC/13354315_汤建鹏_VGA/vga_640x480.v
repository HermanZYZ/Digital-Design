`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:45:48 01/05/2015 
// Design Name: 
// Module Name:    vga_640x480 
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
module vga_640x480(
    input clk,  
    input clr,  
    output reg hsync,  
    output reg vsync,  
    output reg [9:0] hc,  
    output reg [9:0] vc,  
    output reg vidon  
);  
    
    parameter hpixels = 10'b11001_00000; //行像素点=800   
    parameter vlines = 10'b10000_01001;  //行数=521   
    parameter hbp = 10'b00100_10000;     //144
    parameter hfp = 10'b11000_10000;     //784
    parameter vbp =10'b00000_11111;      //31
    parameter vfp = 10'b01111_11111;     //511
    reg vsensable;  //enable for the vertical counter   
      
    //行同步信号计数器·   
    always@(posedge clk)  
	 begin  
        if(clr)  
				hc <= 0;  
        else  
        begin  
            if(hc == hpixels - 1) 
				begin  
					hc <= 0;  
					vsensable <= 1;  
					//enable teh vertical counter to increase   
            end  
            else  
            begin  
					hc <= hc + 1'b1;  
					vsensable <= 0; //leave the vsenable off   
				end       
        end  
    end  
      
      
    //产生hsync脉冲   
    //当hc乾127的时候，行同步信号为低电幊  
	 always@(*) 
	 begin   
        if(hc < 96)  
            hsync <= 0;  
        else   
            hsync <= 1;  
    end  
      
    //场同步信号计数器   
    always@(posedge clk) 
	 begin  
        if(clr)  
            vc <= 0;  
        else 
		  begin  
            if(vsensable == 1) 
				begin  
                if(vc == vlines - 1)  
                    vc <= 0;  
                else   
                    vc <= vc + 1'b1;  
            end  
        end  
    end  
      
    //产生vsync脉冲   
    //当hc书?聧?时候，场同步脉冲为低电幊      
    always@(*) 
	 begin  
        if( vc < 2)   
            vsync <= 0;  
        else  
            vsync <= 1;  
    end  
      
    always@(*) 
	 begin  
        if((hc < hfp)&&(hc >= hbp)&&(vc < vfp)&&(vc >= vbp))  
            vidon <= 1;  
        else   
            vidon <= 0;  
    end  

endmodule
