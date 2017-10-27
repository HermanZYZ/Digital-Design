`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/07 20:49:28
// Design Name: 
// Module Name: ID
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


module ID #(
    parameter len = 12,
    parameter data_0 = 4'b0000,   
    parameter data_1 = 4'b0000,    
    parameter data_2 = 4'b0000,    
    parameter data_3 = 4'b0000,    
    parameter data_4 = 4'b0001,//1 
    parameter data_5 = 4'b0101,//5 
    parameter data_6 = 4'b0011,//3 
    parameter data_7 = 4'b0101,//5 
    parameter data_8 = 4'b0010,//2 
    parameter data_9 = 4'b0100,//4 
    parameter data_10 = 4'b0101,//5
    parameter data_11 = 4'b0111//7
    )
    (
    input wire clk,
    input wire clr,
    output reg [6:0] a_to_g,
    output reg [3:0] an,
    output wire dp
    );
    wire [1:0] s;
    wire one;//count for time:about one second
    reg [3:0] data[len-1:0];//memory care about the definition
    reg [3:0] digit;
    wire [3:0] aen;
    reg [25:0] clkdiv;
    reg [3:0] position;//index of the data
    reg [3:0] t0,t1,t2,t3;
    assign dp = 1;
    assign s = clkdiv[19:18]; // count every 5.2 ms
    assign aen = 4'b1111; // enable all digits
    assign one = clkdiv[25];
    
    initial
    begin
        position <= 4'b0000;
 //   always @ ( * )
        data[0] <= data_0; 
        data[1] <= data_1; 
        data[2] <= data_2; 
        data[3] <= data_3; 
        data[4] <= data_4; 
        data[5] <= data_5; 
        data[6] <= data_6; 
        data[7] <= data_7; 
        data[8] <= data_8; 
        data[9] <= data_9; 
        data[10] <= data_10;
        data[11] <= data_11;
    end
    
    always @ ( * )
    begin
        t0 = position % len;
        t1 = (t0+ 1) % len;
        t2 = (t1+ 1) % len;
        t3 = (t2+ 1) % len;
    end
    
    // 4位 4选1 MUX: mux44
    always @ ( * )
    begin
    case (s)
       0: digit = data[t0];//position % len
       1: digit = data[t1];//(position + 1) % len
       2: digit = data[t2];//(position + 2) % len
       3: digit = data[t3];//(position + 3) % len
        default:  digit = data[position % len];
    endcase
    end
    // 7段数码管：hex7seg
    always @ ( * )
    begin
    case (digit)
    0: a_to_g = 7'b1111110;//all off
    1: a_to_g = 7'b1001111;
    2: a_to_g = 7'b0010010;
    3: a_to_g = 7'b0000110;
    4: a_to_g = 7'b1001100;
    5: a_to_g = 7'b0100100;
    7: a_to_g = 7'b0001111;
    
    default: a_to_g = 7'b1111101; // all off
    endcase
    end
    // Digit select: ancode
    always @ ( * )
    begin
    an = 4'b1111;
    if (aen[s] == 1)
        an[s] = 0;
    end
        
    always @ ( posedge one)
    begin
        if(position[3] == 1 && position[2] == 1)
            position = 4'b0000;
        else
            position <= position + 1;//about one second
    end
    
    // 时钟分频器
    always @ (posedge clk or posedge clr)
    begin
        if (clr == 1)
        begin
            clkdiv <= 0;
            position <= 0;
        end
        else
        begin
            clkdiv <= clkdiv + 1;
        end
    end
endmodule
  
