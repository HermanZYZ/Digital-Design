`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/20 14:54:22
// Design Name: 
// Module Name: vga_controller
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

//640*800 60Hz VGA驱动

module vga_controller(
    input wire clk_25MHz, //25MHz
    input wire rst_n, //复位信号，rst_n == 1时画面全黑
    input wire [1:80] VRAM [1:30], //从另一个模块传过来的图像信息
    output reg VGA_HS,//行同步信号
    output reg VGA_VS,//场同步信号
    output wire VGA_R,
    output wire VGA_G,
    output wire VGA_B
    );
    
    parameter PAL = 646; // Pixels Active Line
    parameter LAF = 484; // Lines Active Frame
    
    parameter PLD = 800; // Pixel Line Divider 行实际扫描像素
    parameter LFD = 525; // Line Frame Divider 列实际扫描像素
    
    parameter HPW = 96; // Horizontal synchro Pulse Width 行同步脉冲
    parameter HFP = 13 - 1; // Horizontal synchro Front Porch 行显示前沿
    parameter HBP = 45 - 1; // Horizontal synchro Back Porch 行显示后沿
    
    parameter VPW = 2;  // Vertical synchro Pulse Width 场同步脉冲
    parameter VFP = 9 - 1; // Vertical synchro Front Porch 场显示前沿
    parameter VBP = 30 - 1; // Vertical synchro Back Porch  场显示后沿
    
    //reg [3:0] clkdiv;
    reg [10:1] x_counter;
    reg [10:0] y_counter;
    reg [3:1] RGB;

/*****************************************************************************************************************************/

    initial begin
        x_counter = 0;
        y_counter = 0;
    end
/*
    always @ (posedge clk) begin
        clkdiv = clkdiv + 1;
    end
    
    //分频产生一个25MHz的时钟信号
 */   
/*****************************************************************************************************************************/

always @(posedge clk_25MHz)
    begin
    
        if(x_cnt == PLD - 1) begin //PLD = 800
            x_counter <= 0;
            if(y_counter == LFD - 1) y_counter <= 0; //LFD = 525
            else y_counter <= y_counter + 1; //行信号 + 1
        end
        else if (x_counter == 0)//新的一行，在x_counter = 96之前行同步信号为低电平
            begin 
                VGA_HS <= 0;
                x_counter <= x_counter + 1;
            end
        else if(x_counter == HPW - 1) //HPW = 96，同步脉冲时间已过，拉高行同步信号电平
            begin
                VGA_HS <= 1;
                x_counter <= x_counter + 1;
            end
        else 
            x_counter <= x_counter + 1;
       
       //行扫描及行同步信号
       
        if (y_cnt == 0) //新的一帧，在y_counter = 2之前场同步信号为低电平
            VGA_VS <= 0;
        else if (y_cnt == VPW - 1) //VPW = 2，同步脉冲时间已过，拉高行同步信号电平
            VGA_VS <= 1;
        
    end
    
    //更改行同步和场同步脉冲、当前像素坐标
    
/*****************************************************************************************************************************/
 
    always @ (*) begin
       if(x_counter - HFP < 80) RGB <= 3'b001;
       else if(x_counter - HFP < 160) RGB <= 3'b010;
       else if(x_counter - HFP < 240) RGB <= 3'b011;
       else if(x_counter - HFP < 320) RGB <= 3'b100;
       else if(x_counter - HFP < 400) RGB <= 3'b101;
       else if(x_counter - HFP < 480) RGB <= 3'b110;
       else if(x_counter - HFP < 560) RGB <= 3'b111;
       else RGB <= 3'b000;
    end

/*****************************************************************************************************************************/

    assign VGA_R = RGB[1];
    assign VGA_G = RGB[2];
    assign VGA_B = RGB[3];
    
endmodule
