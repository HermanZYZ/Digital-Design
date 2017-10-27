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
    //input wire clk, // 100MHz
    input wire clk, //25MHz
    input wire rst_n, //��λ�źţ�rst_n == 1ʱ����ȫ��
    //input reg [79:0] VRAM [29:0], //����һ��ģ�鴫������ͼ����Ϣ, ÿ2bits��¼һ�������ɫ����Ϣ
    output reg VGA_HS,//��ͬ���ź�
    output reg VGA_VS,//��ͬ���ź�
    output wire [3:0]VGA_R,
    output wire [3:0]VGA_G,
    output wire [3:0]VGA_B
    );
    
    parameter PAL = 640; // Pixels Active Line
    parameter LAF = 480; // Lines Active Frame
    
    parameter PLD = 800; // Pixel Line Divider ��ʵ��ɨ������
    parameter LFD = 521; // Line Frame Divider ��ʵ��ɨ������
    
    parameter HPW = 96; // Horizontal synchro Pulse Width ��ͬ������
    parameter HFP = 16; // Horizontal synchro Front Porch ����ʾǰ��
    parameter HBP = 48; // Horizontal synchro Back Porch ����ʾ����
    
    parameter VPW = 2;  // Vertical synchro Pulse Width ��ͬ������
    parameter VFP = 10; // Vertical synchro Front Porch ����ʾǰ��
    parameter VBP = 29; // Vertical synchro Back Porch  ����ʾ����
    
    //reg [3:0] clkdiv;
    reg [10:1] x_counter;
    reg [10:0] y_counter;
    reg [2:0] RGB;
    
                                 
    assign VGA_R[0] = RGB[2];
    assign VGA_R[1] = RGB[2];
    assign VGA_R[2] = RGB[2];
    assign VGA_R[3] = RGB[2];
    
    assign VGA_G[0] = RGB[1];
    assign VGA_G[1] = RGB[1];
    assign VGA_G[2] = RGB[1];
    assign VGA_G[3] = RGB[1];
    
    assign VGA_B[0] = RGB[0];
    assign VGA_B[1] = RGB[0];
    assign VGA_B[2] = RGB[0];
    assign VGA_B[3] = RGB[0];
    
    reg [3:1] Color;

/*****************************************************************************************************************************/

    initial begin
        x_counter <= 0;
        y_counter <= 0;
        VGA_HS <= 1;
        VGA_VS <= 1;
        RGB <= 0;
    end

/*****************************************************************************************************************************/
    reg [2:0]clkdiv;
    reg line_end;
    //clkdiv[0]->50MHz
    //clkdiv[1]->25MHz
    
    always @ (posedge clk)
    begin
        clkdiv <= clkdiv + 1;
    end
    
    always @(posedge clkdiv[1])
        begin
    
        if(x_counter == 799) begin //PLD -1 = 799
            x_counter <= 0;
            line_end <= 1;
          end
        else begin
            x_counter <= x_counter + 1;
            line_end <= 0;
          end
       //��ɨ�輰��ͬ���ź�
       
    end
    
    always @ (posedge clkdiv[1]) begin
          if(line_end == 1)
          begin
               if(y_counter == 520) y_counter <= 0; //LFD - 1 = 521
               else y_counter <= y_counter + 1; //���ź� + 1
          end
          
    end
    
    always @ (*) begin
          if(x_counter < 96) //HPW = 96��ͬ������ʱ���ѹ���������ͬ���źŵ�ƽ
                begin
                    VGA_HS <= 0;
                end
          else 
                begin
                    VGA_HS <= 1;
                end
    end
    
    always @ (*) begin
          if (y_counter < 2) //�µ�һ֡����y_counter = 2֮ǰ��ͬ���ź�Ϊ�͵�ƽ
                VGA_VS <= 0;
          else //VPW = 2��ͬ������ʱ���ѹ���������ͬ���źŵ�ƽ
                VGA_VS <= 1;
    end
    
    //������ͬ���ͳ�ͬ�����塢��ǰ��������
 
/*****************************************************************************************************************************/

/*****************************************************************************************************************************/

 
    always @ (x_counter or y_counter) begin
        if (x_counter<100)  RGB<=3'b111;
        else if (x_counter<200)   RGB<=3'b111;//qing
        else if (x_counter<300)   RGB<=3'b000;//qing
        else if (x_counter<400)   RGB<=3'b111;
        else if (x_counter<500)   RGB<=3'b000;
        else if (x_counter<600)   RGB<=3'b000;
        else if (x_counter<700)   RGB<=3'b111;
        else  RGB<=3'b000; 
    end


//���ڲ���VGA���Ч��

/*****************************************************************************************************************************/

/*****************************************************************************************************************************/
    
endmodule
