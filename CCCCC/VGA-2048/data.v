`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:04:05 01/05/2015 
// Design Name: 
// Module Name:    data 
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
module data(
input clr,input clk,
input [3:0]in_data,
input up,input down,input left,input right,
output reg death,output wire [3:0]out_data
    );

assign out_data = lab[in_data];

reg [3:0]state;
parameter stop=4'b0000,
			 change1=4'b0001,change2=4'b0010,change3=4'b0100,change4=4'b1000,
			 nec1=4'b1110,nec2=4'b1101,nec3=4'b1011,nec4=4'b0111,
			 trap=4'b1111,birthset=4'b0101,birth=4'b1010;
//FSM
always @(posedge clk or posedge clr) begin
	if (clr) state <= stop;
	else begin
		case (state)
		stop: if (up || down || left || right) state <= change1;
				else state <= stop;
		change1: state <= change2;
		change2: state <= change3;
		change3: state <= change4;
		change4: state <= nec1;
		nec1: state <= nec2;
		nec2: state <= nec3;
		nec3: state <= nec4;
		nec4: state <= birthset;
		birthset: state <= birth;
		birth: state <= trap;
		trap: if (up || down || left || right) state <= trap;
				else state <= stop;
		endcase
	end
end

reg [3:0]lab[0:15];
reg [3:0]num1; reg [3:0]num2; reg [3:0]num3; reg [3:0]num4;
//change && nec && birth
always @(posedge clk or posedge clr) begin
	if (clr) begin
		lab[0] = 4'd1; lab[1] = 4'd1; lab[2] = 4'd1; lab[3] = 4'd1;
		lab[4] = 4'd1; lab[5] = 4'd1; lab[6] = 4'd1; lab[7] = 4'd1;
		lab[8] = 4'd1; lab[9] = 4'd1; lab[10] = 4'd1; lab[11] = 4'd1;
		lab[12] = 4'd1; lab[13] = 4'd1; lab[14] = 4'd1; lab[15] = 4'd1;
		death = 1'b0;
	end
	//change
	else if ((state == change1) || (state == change2) || (state == change3) || (state == change4))
	begin
	if (((num2 == num1 + 4'd4) && (num3 == num2 + 4'd4) && (num4 == num3 + 4'd4))
	|| ((num2 == num1 - 4'd4) && (num3 == num2 - 4'd4) && (num4 == num3 - 4'd4))
	|| ((num2 == num1 + 4'd1) && (num3 == num2 + 4'd1) && (num4 == num3 + 4'd1))
	|| ((num2 == num1 - 4'd1) && (num3 == num2 - 4'd1) && (num4 == num3 - 4'd1)))
		begin
			if ((lab[num1] == lab[num2]) || (lab[num3] == lab[num4])) begin
				if ((lab[num1] == lab[num2]) && (lab[num1] != 4'd1)) begin lab[num1] = lab[num1] + 4'd1; lab[num2] = 4'd1; end
				if ((lab[num3] == lab[num4]) && (lab[num3] != 4'd1)) begin lab[num3] = lab[num3] + 4'd1; lab[num4] = 4'd1; end
			end
			else if ((lab[num2] == lab[num3]) && (lab[num2] != 4'd1)) begin lab[num2] = lab[num2] + 4'd1; lab[num3] = 4'd1; end
			else if ((lab[num1] == lab[num3]) && (lab[num1] != 4'd1) && (lab[num2] == 4'd1)) begin lab[num1] = lab[num1] + 4'd1; lab[num3] = 4'd1; end
			else if ((lab[num2] == lab[num4]) && (lab[num2] != 4'd1) && (lab[num3] == 4'd1)) begin lab[num2] = lab[num2] + 4'd1; lab[num4] = 4'd1; end
			else if ((lab[num1] == lab[num4]) && (lab[num1] != 4'd1) && (lab[num2] == 4'd1) && (lab[num3] == 4'd1)) begin lab[num1] = lab[num1] + 4'd1; lab[num4] = 4'd1; end
		end
	end
	//nec
	else if ((state == nec1) || (state == nec2) || (state == nec3) || (state == nec4))
	begin
	if (((num2 == num1 + 4'd4) && (num3 == num2 + 4'd4) && (num4 == num3 + 4'd4))
	|| ((num2 == num1 - 4'd4) && (num3 == num2 - 4'd4) && (num4 == num3 - 4'd4))
	|| ((num2 == num1 + 4'd1) && (num3 == num2 + 4'd1) && (num4 == num3 + 4'd1))
	|| ((num2 == num1 - 4'd1) && (num3 == num2 - 4'd1) && (num4 == num3 - 4'd1)))
		begin
			//for_num1
			if (lab[num1] != 1) lab[num1] = lab[num1];
			else if (lab[num2] != 4'd1) begin lab[num1] = lab[num2]; lab[num2] = 4'd1; end
			else if (lab[num3] != 4'd1) begin lab[num1] = lab[num3]; lab[num3] = 4'd1; end
			else begin lab[num1] = lab[num4]; lab[num4] = 4'd1; end
			//for_num2
			if (lab[num2] != 4'd1) lab[num2] = lab[num2];
			else if (lab[num3] != 4'd1) begin lab[num2] = lab[num3]; lab[num3] = 4'd1; end
			else begin lab[num2] = lab[num4]; lab[num4] = 4'd1; end
			//for_num3
			if (lab[num3] != 4'd1) lab[num3] = lab[num3];
			else begin lab[num3] = lab[num4]; lab[num4] = 4'd1; end
		end
	end
	//birth
	else if (state == birth)
	begin
	if (((num2 == num1 + 4'd4) && (num3 == num2 + 4'd4) && (num4 == num3 + 4'd4))
	|| ((num2 == num1 + 4'd1) && (num3 == num2 + 4'd1) && (num4 == num3 + 4'd1)))
		begin
			if (lab[num1] == 1) lab[num1] = lab[num1] + 4'd1;
			else if (lab[num2] == 1) lab[num2] = lab[num2] + 4'd1;
			else if (lab[num3] == 1) lab[num3] = lab[num3] + 4'd1;
			else if (lab[num4] == 1) lab[num4] = lab[num4] + 4'd1;
			else death = 1;
		end
	end
end
//set
always @(*) begin
		//if (clr) begin
		//	num1 <= 0; num2 <= 0; num3 <= 0; num4 <= 0;
		//end
		//else begin
		case (state)
		stop: begin num1 <= 0; num2 <= 0; num3 <= 0; num4 <= 0; end
		change1: begin
			//set_num
			if (up) begin num1 <= 0; num2 <= 4; num3 <= 8; num4 <= 12; end
			else if (down) begin num1 <= 12; num2 <= 8; num3 <= 4; num4 <= 0; end
			else if (left) begin num1 <= 0; num2 <= 1; num3 <= 2; num4 <= 3; end
			else if (right) begin num1 <= 3; num2 <= 2; num3 <= 1; num4 <= 0; end
			//change
			/*
			if ((lab[num1] == lab[num2]) || (lab[num3] == lab[num4])) begin
				if ((lab[num1] == lab[num2]) && (lab[num1] != 4'b0001)) begin lab[num1] = lab[num1] + 1'b1; lab[num2] = 4'b0001; end
				if ((lab[num3] == lab[num4]) && (lab[num3] != 4'b0001)) begin lab[num3] = lab[num3] + 1'b1; lab[num4] = 4'b0001; end
			end
			else if ((lab[num2] == lab[num3]) && (lab[num2] != 4'b0001)) begin lab[num2] = lab[num2] + 1'b1; lab[num3] = 4'b0001; end
			else if ((lab[num1] == lab[num3]) && (lab[num1] != 4'b0001) && (lab[num2] == 4'b0001)) begin lab[num1] = lab[num1] + 1'b1; lab[num3] = 4'b0001; end
			else if ((lab[num2] == lab[num4]) && (lab[num2] != 4'b0001) && (lab[num3] == 4'b0001)) begin lab[num2] = lab[num2] + 1'b1; lab[num4] = 4'b0001; end
			else if ((lab[num1] == lab[num4]) && (lab[num1] != 4'b0001) && (lab[num2] == 4'b0001) && (lab[num3] == 4'b0001)) begin lab[num1] = lab[num1] + 1'b1; lab[num4] = 4'b0001; end
			*/
		end
		change2: begin
			//set_num
			if (up) begin num1 <= 1; num2 <= 5; num3 <= 9; num4 <= 13; end
			else if (down) begin num1 <= 13; num2 <= 9; num3 <= 5; num4 <= 1; end
			else if (left) begin num1 <= 4; num2 <= 5; num3 <= 6; num4 <= 7; end
			else if (right) begin num1 <= 7; num2 <= 6; num3 <= 5; num4 <= 4; end
			//change
			/*
			if ((lab[num1] == lab[num2]) || (lab[num3] == lab[num4])) begin
				if ((lab[num1] == lab[num2]) && (lab[num1] != 4'b0001)) begin lab[num1] = lab[num1] + 1'b1; lab[num2] = 4'b0001; end
				if ((lab[num3] == lab[num4]) && (lab[num3] != 4'b0001)) begin lab[num3] = lab[num3] + 1'b1; lab[num4] = 4'b0001; end
			end
			else if ((lab[num2] == lab[num3]) && (lab[num2] != 4'b0001)) begin lab[num2] = lab[num2] + 1'b1; lab[num3] = 4'b0001; end
			else if ((lab[num1] == lab[num3]) && (lab[num1] != 4'b0001) && (lab[num2] == 4'b0001)) begin lab[num1] = lab[num1] + 1'b1; lab[num3] = 4'b0001; end
			else if ((lab[num2] == lab[num4]) && (lab[num2] != 4'b0001) && (lab[num3] == 4'b0001)) begin lab[num2] = lab[num2] + 1'b1; lab[num4] = 4'b0001; end
			else if ((lab[num1] == lab[num4]) && (lab[num1] != 4'b0001) && (lab[num2] == 4'b0001) && (lab[num3] == 4'b0001)) begin lab[num1] = lab[num1] + 1'b1; lab[num4] = 4'b0001; end
			*/
		end
		change3: begin
			//set_num
			if (up) begin num1 <= 2; num2 <= 6; num3 <= 10; num4 <= 14; end
			else if (down) begin num1 <= 14; num2 <= 10; num3 <= 6; num4 <= 2; end
			else if (left) begin num1 <= 8; num2 <= 9; num3 <= 10; num4 <= 11; end
			else if (right) begin num1 <= 11; num2 <= 10; num3 <= 9; num4 <= 8; end
			//change
			/*
			if ((lab[num1] == lab[num2]) || (lab[num3] == lab[num4])) begin
				if ((lab[num1] == lab[num2]) && (lab[num1] != 4'b0001)) begin lab[num1] = lab[num1] + 1'b1; lab[num2] = 4'b0001; end
				if ((lab[num3] == lab[num4]) && (lab[num3] != 4'b0001)) begin lab[num3] = lab[num3] + 1'b1; lab[num4] = 4'b0001; end
			end
			else if ((lab[num2] == lab[num3]) && (lab[num2] != 4'b0001)) begin lab[num2] = lab[num2] + 1'b1; lab[num3] = 4'b0001; end
			else if ((lab[num1] == lab[num3]) && (lab[num1] != 4'b0001) && (lab[num2] == 4'b0001)) begin lab[num1] = lab[num1] + 1'b1; lab[num3] = 4'b0001; end
			else if ((lab[num2] == lab[num4]) && (lab[num2] != 4'b0001) && (lab[num3] == 4'b0001)) begin lab[num2] = lab[num2] + 1'b1; lab[num4] = 4'b0001; end
			else if ((lab[num1] == lab[num4]) && (lab[num1] != 4'b0001) && (lab[num2] == 4'b0001) && (lab[num3] == 4'b0001)) begin lab[num1] = lab[num1] + 1'b1; lab[num4] = 4'b0001; end
			*/
		end
		change4: begin
			//set_num
			if (up) begin num1 <= 3; num2 <= 7; num3 <= 11; num4 <= 15; end
			else if (down) begin num1 <= 15; num2 <= 11; num3 <= 7; num4 <= 3; end
			else if (left) begin num1 <= 12; num2 <= 13; num3 <= 14; num4 <= 15; end
			else if (right) begin num1 <= 15; num2 <= 14; num3 <= 13; num4 <= 12; end
			//change
			/*
			if ((lab[num1] == lab[num2]) || (lab[num3] == lab[num4])) begin
				if ((lab[num1] == lab[num2]) && (lab[num1] != 4'b0001)) begin lab[num1] = lab[num1] + 1'b1; lab[num2] = 4'b0001; end
				if ((lab[num3] == lab[num4]) && (lab[num3] != 4'b0001)) begin lab[num3] = lab[num3] + 1'b1; lab[num4] = 4'b0001; end
			end
			else if ((lab[num2] == lab[num3]) && (lab[num2] != 4'b0001)) begin lab[num2] = lab[num2] + 1'b1; lab[num3] = 4'b0001; end
			else if ((lab[num1] == lab[num3]) && (lab[num1] != 4'b0001) && (lab[num2] == 4'b0001)) begin lab[num1] = lab[num1] + 1'b1; lab[num3] = 4'b0001; end
			else if ((lab[num2] == lab[num4]) && (lab[num2] != 4'b0001) && (lab[num3] == 4'b0001)) begin lab[num2] = lab[num2] + 1'b1; lab[num4] = 4'b0001; end
			else if ((lab[num1] == lab[num4]) && (lab[num1] != 4'b0001) && (lab[num2] == 4'b0001) && (lab[num3] == 4'b0001)) begin lab[num1] = lab[num1] + 1'b1; lab[num4] = 4'b0001; end
			*/
		end
		nec1: begin
			//set_num
			if (up) begin num1 <= 0; num2 <= 4; num3 <= 8; num4 <= 12; end
			else if (down) begin num1 <= 12; num2 <= 8; num3 <= 4; num4 <= 0; end
			else if (left) begin num1 <= 0; num2 <= 1; num3 <= 2; num4 <= 3; end
			else if (right) begin num1 <= 3; num2 <= 2; num3 <= 1; num4 <= 0; end
			/*
			//for_num1
			if (lab[num1] != 4'b0001) lab[num1] = lab[num1];
			else if (lab[num2] != 4'b0001) begin lab[num1] = lab[num2]; lab[num2] = 4'b0001; end
			else if (lab[num3] != 4'b0001) begin lab[num1] = lab[num3]; lab[num3] = 4'b0001; end
			else begin lab[num1] = lab[num4]; lab[num4] = 4'b0001; end
			//for_num2
			if (lab[num2] != 4'b0001) lab[num2] = lab[num2];
			else if (lab[num3] != 4'b0001) begin lab[num2] = lab[num3]; lab[num3] = 4'b0001; end
			else begin lab[num2] = lab[num4]; lab[num4] = 4'b0001; end
			//for_num3
			if (lab[num3] != 4'b0001) lab[num3] = lab[num3];
			else begin lab[num3] = lab[num4]; lab[num4] = 4'b0001; end
			*/
		end
		nec2: begin
			//set_num
			if (up) begin num1 <= 1; num2 <= 5; num3 <= 9; num4 <= 13; end
			else if (down) begin num1 <= 13; num2 <= 9; num3 <= 5; num4 <= 1; end
			else if (left) begin num1 <= 4; num2 <= 5; num3 <= 6; num4 <= 7; end
			else if (right) begin num1 <= 7; num2 <= 6; num3 <= 5; num4 <= 4; end
			/*
			//for_num1
			if (lab[num1] != 4'b0001) lab[num1] = lab[num1];
			else if (lab[num2] != 4'b0001) begin lab[num1] = lab[num2]; lab[num2] = 4'b0001; end
			else if (lab[num3] != 4'b0001) begin lab[num1] = lab[num3]; lab[num3] = 4'b0001; end
			else begin lab[num1] = lab[num4]; lab[num4] = 4'b0001; end
			//for_num2
			if (lab[num2] != 4'b0001) lab[num2] = lab[num2];
			else if (lab[num3] != 4'b0001) begin lab[num2] = lab[num3]; lab[num3] = 4'b0001; end
			else begin lab[num2] = lab[num4]; lab[num4] = 4'b0001; end
			//for_num3
			if (lab[num3] != 4'b0001) lab[num3] = lab[num3];
			else begin lab[num3] = lab[num4]; lab[num4] = 4'b0001; end
			*/
		end
		nec3: begin
			//set_num
			if (up) begin num1 <= 2; num2 <= 6; num3 <= 10; num4 <= 14; end
			else if (down) begin num1 <= 14; num2 <= 10; num3 <= 6; num4 <= 2; end
			else if (left) begin num1 <= 8; num2 <= 9; num3 <= 10; num4 <= 11; end
			else if (right) begin num1 <= 11; num2 <= 10; num3 <= 9; num4 <= 8; end
			/*
			//for_num1
			if (lab[num1] != 4'b0001) lab[num1] = lab[num1];
			else if (lab[num2] != 4'b0001) begin lab[num1] = lab[num2]; lab[num2] = 4'b0001; end
			else if (lab[num3] != 4'b0001) begin lab[num1] = lab[num3]; lab[num3] = 4'b0001; end
			else begin lab[num1] = lab[num4]; lab[num4] = 4'b0001; end
			//for_num2
			if (lab[num2] != 4'b0001) lab[num2] = lab[num2];
			else if (lab[num3] != 4'b0001) begin lab[num2] = lab[num3]; lab[num3] = 4'b0001; end
			else begin lab[num2] = lab[num4]; lab[num4] = 4'b0001; end
			//for_num3
			if (lab[num3] != 4'b0001) lab[num3] = lab[num3];
			else begin lab[num3] = lab[num4]; lab[num4] = 4'b0001; end
			*/
		end
		nec4: begin
			//set_num
			if (up) begin num1 <= 3; num2 <= 7; num3 <= 11; num4 <= 15; end
			else if (down) begin num1 <= 15; num2 <= 11; num3 <= 7; num4 <= 3; end
			else if (left) begin num1 <= 12; num2 <= 13; num3 <= 14; num4 <= 15; end
			else if (right) begin num1 <= 15; num2 <= 14; num3 <= 13; num4 <= 12; end
			/*
			//for_num1
			if (lab[num1] != 4'b0001) lab[num1] = lab[num1];
			else if (lab[num2] != 4'b0001) begin lab[num1] = lab[num2]; lab[num2] = 4'b0001; end
			else if (lab[num3] != 4'b0001) begin lab[num1] = lab[num3]; lab[num3] = 4'b0001; end
			else begin lab[num1] = lab[num4]; lab[num4] = 4'b0001; end
			//for_num2
			if (lab[num2] != 4'b0001) lab[num2] = lab[num2];
			else if (lab[num3] != 4'b0001) begin lab[num2] = lab[num3]; lab[num3] = 4'b0001; end
			else begin lab[num2] = lab[num4]; lab[num4] = 4'b0001; end
			//for_num3
			if (lab[num3] != 4'b0001) lab[num3] = lab[num3];
			else begin lab[num3] = lab[num4]; lab[num4] = 4'b0001; end
			*/
		end
		birthset: begin
			//set_num
			if (up) begin num1 <= 12; num2 <= 13; num3 <= 14; num4 <= 15; end
			else if (down) begin num1 <= 0; num2 <= 1; num3 <= 2; num4 <= 3; end
			else if (left) begin num1 <= 3; num2 <= 7; num3 <= 11; num4 <= 15; end
			else if (right) begin num1 <= 0; num2 <= 4; num3 <= 8; num4 <= 12; end
			/*
			//choose_birth_pos
			if (lab[num1] == 4'd0001) lab[num1] = lab[num1] + 1'b1;
			else if (lab[num2] == 4'd0001) lab[num2] = lab[num2] + 1'b1;
			else if (lab[num3] == 4'd0001) lab[num3] = lab[num3] + 1'b1;
			else if (lab[num4] == 4'd0001) lab[num4] = lab[num4] + 1'b1;
			else death = 1'b1;
			*/
		end
		default: begin
			num1 <= num1; num2 <= num2; num3 <= num3; num4 <= num4;
		end
		endcase
		//end
end

endmodule
