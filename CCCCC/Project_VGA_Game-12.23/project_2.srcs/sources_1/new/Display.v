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
    //蛇身信息
    //苹果信息
    output reg [1:80] VRAM [1:30],
    output reg [6:0] a_to_g,
    output reg [1:0] an
    );
    
    reg [3:0] digit;
    reg [3:0] score_;
    
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
    
    always @ (posedge clk_100Hz) begin
        an[0] <= clk_100Hz;
        an[1] <= !an[0]; 
    end
    
    always @ (*) begin
        case(an)
            1: digit <= score_[3:0];
            2: digit <= score_[7:4];
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

    
endmodule
