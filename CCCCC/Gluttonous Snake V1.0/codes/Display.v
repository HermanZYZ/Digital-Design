`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/23 22:19:30
// Design Name: 
// Module Name: Display
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


module Display(   

    input wire [3:0] score,
    input wire clk_100Hz, //用于七段管扫描
    input wire clk_50MHz,
    input wire clk_25MHz,
    
    input wire [5:0] y_pos,
    
    input wire [5:0] node_cube_x,//蛇身信息
    input wire [5:0] node_cube_y,//蛇身信息
    
    output wire [3:0] node,//蛇身节点
    
    input wire [5:0] apple_x,//苹果信息
    input wire [5:0] apple_y,//苹果信息
    
    output wire [39:0] Line_VRAM,
    output reg [6:0] a_to_g,
    output reg [3:0] an
    );

/***********************************************************七段管显示控制******************************************************************/
    
    reg [3:0] digit;
    reg [7:0] score_;
    
    always @ (*) begin
        case(score)
            1: score_ <= 8'b00000001;
            2: score_ <= 8'b00000010;
            3: score_ <= 8'b00000011;
            4: score_ <= 8'b00000100;
            5: score_ <= 8'b00000101;
            6: score_ <= 8'b00000110;
            7: score_ <= 8'b00000111;
            8: score_ <= 8'b00001000;
            9: score_ <= 8'b00001001;
            10: score_ <= 8'b00010000;
            11: score_ <= 8'b00010001;
            12: score_ <= 8'b00010010;
            13: score_ <= 8'b00010011;
            default: score_ <= 8'b00000000;
        endcase
    end
    
    //分离十进制数的个位和十位
    
    reg [3:0] j;
    reg [39:0] Temp_Line_VRAM;
    reg [5:0] y_last_pos;
    
    initial begin 
          an <= 4'b1110;
          j <= 0;
          y_last_pos <= 29;
          Temp_Line_VRAM <= 0;
    end
    
    always @ (posedge clk_100Hz) begin
        an[0] <= an[0] + 1;
        an[1] <= an[1] + 1; 
    end
    
    //刷新七段管
    
    always @ (*) begin
        case(an)
            14: digit <= score_[3:0];
            15: digit <= score_[7:4];
            default : digit <= 4'b0000;
        endcase
    end
    
    always @ (*) begin
        case(digit)
            0: a_to_g <= 7'b0000001; 
            1: a_to_g <= 7'b1001111; 
            2: a_to_g <= 7'b0010010; 
            3: a_to_g <= 7'b0000110; 
            4: a_to_g <= 7'b1001100; 
            5: a_to_g <= 7'b0100100; 
            6: a_to_g <= 7'b0100000; 
            7: a_to_g <= 7'b0001111; 
            8: a_to_g <= 7'b0000000; 
            9: a_to_g <= 7'b0000100; 
            default: a_to_g <= 7'b0000001;
            endcase
    end

/*****************************************************************************************************************************/

    
    //根据VGA控制模块中的扫描的情况传出行显存
    
    
    assign Line_VRAM = Temp_Line_VRAM;
    
    assign node = j;
    
    
    
    always @ (  posedge clk_50MHz ) begin
         j = j + 1;
    end //用于遍历蛇身节点
    
    always @ (y_pos) begin
          y_last_pos <= y_pos;
    end
     
    always @ (  posedge clk_50MHz ) begin
    
         if(y_last_pos != y_pos) begin 
            Temp_Line_VRAM = 0;
         end
          if(y_pos == apple_y) Temp_Line_VRAM[apple_x] = 1;
        //显示苹果
          if(y_pos == node_cube_y && j < 3 + score) begin 
              Temp_Line_VRAM[node_cube_x] = 1;
          end
        //显示蛇身
         // end
    end
    
/*****************************************************************************************************************************/
    
endmodule
