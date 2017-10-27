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

//640*800 60Hz VGA����

module vga_controller(
    input wire clk_25MHz, //25MHz
    input wire rst_n, //��λ�źţ�rst_n == 1ʱ����ȫ��
    input wire [1:80] VRAM [1:30], //����һ��ģ�鴫������ͼ����Ϣ
    output reg VGA_HS,//��ͬ���ź�
    output reg VGA_VS,//��ͬ���ź�
    output wire VGA_R,
    output wire VGA_G,
    output wire VGA_B
    );
    
    parameter PAL = 646; // Pixels Active Line
    parameter LAF = 484; // Lines Active Frame
    
    parameter PLD = 800; // Pixel Line Divider ��ʵ��ɨ������
    parameter LFD = 525; // Line Frame Divider ��ʵ��ɨ������
    
    parameter HPW = 96; // Horizontal synchro Pulse Width ��ͬ������
    parameter HFP = 13 - 1; // Horizontal synchro Front Porch ����ʾǰ��
    parameter HBP = 45 - 1; // Horizontal synchro Back Porch ����ʾ����
    
    parameter VPW = 2;  // Vertical synchro Pulse Width ��ͬ������
    parameter VFP = 9 - 1; // Vertical synchro Front Porch ����ʾǰ��
    parameter VBP = 30 - 1; // Vertical synchro Back Porch  ����ʾ����
    
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
    
    //��Ƶ����һ��25MHz��ʱ���ź�
 */   
/*****************************************************************************************************************************/

always @(posedge clk_25MHz)
    begin
    
        if(x_cnt == PLD - 1) begin //PLD = 800
            x_counter <= 0;
            if(y_counter == LFD - 1) y_counter <= 0; //LFD = 525
            else y_counter <= y_counter + 1; //���ź� + 1
        end
        else if (x_counter == 0)//�µ�һ�У���x_counter = 96֮ǰ��ͬ���ź�Ϊ�͵�ƽ
            begin 
                VGA_HS <= 0;
                x_counter <= x_counter + 1;
            end
        else if(x_counter == HPW - 1) //HPW = 96��ͬ������ʱ���ѹ���������ͬ���źŵ�ƽ
            begin
                VGA_HS <= 1;
                x_counter <= x_counter + 1;
            end
        else 
            x_counter <= x_counter + 1;
       
       //��ɨ�輰��ͬ���ź�
       
        if (y_cnt == 0) //�µ�һ֡����y_counter = 2֮ǰ��ͬ���ź�Ϊ�͵�ƽ
            VGA_VS <= 0;
        else if (y_cnt == VPW - 1) //VPW = 2��ͬ������ʱ���ѹ���������ͬ���źŵ�ƽ
            VGA_VS <= 1;
        
    end
    
    //������ͬ���ͳ�ͬ�����塢��ǰ��������
    
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
