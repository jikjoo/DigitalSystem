

`timescale 100ps/1ps

module tb_calculator;
reg clk, rst, valid;
reg [4:0] key_input;
wire [7:0] out0,out1,out2,out3,out4;

calculator cal(clk,rst,key_input,valid,out0,out1,out2,out3,out4);

// CLK, RESET setting
initial forever #5 clk = ~clk;

initial begin
	clk = 1'b0;
	valid = 1'b0;
end

initial begin
	rst = 1'b0;
	#10
	rst = 1'b1;
end

initial forever begin
	#10 valid = 'b0;
	#90 valid = 'b1;
end
//INPUT setting

initial begin
    key_input = 'b0;
	#100;
	key_input = 5'b00001;
	#100;
	key_input = 5'b00000;
	#100;
	key_input = 5'b01110;
	#100;
	key_input = 5'b00001;
	#100;
	key_input = 5'b00010;
	#100;
	key_input = 5'b10001;//10*12=
	#100;
	key_input = 5'b00011;
	#100;
	key_input = 5'b01111;
	#100;
	key_input = 5'b00101;
	#100;
	key_input = 5'b10001;//3-5=
	#100;
	key_input = 5'b00010;
	#100;
	key_input = 5'b00100;
	#100;
	key_input = 5'b01101;
	#100;
	key_input = 5'b00011;
	#100;
	key_input = 5'b10001;//24/3=
	#100;
	key_input = 5'b10000;
	#100;
	key_input = 5'b01001;
	#100;
	key_input = 5'b10001;//result + 9 =
	#100;
	key_input = 5'b01010;//AC
	#100;
	key_input = 5'b00001;
	#100;
	key_input = 5'b00000;
	#100;
	key_input = 5'b01100;
	#100;
	key_input = 5'b01110;
	#100;
	key_input = 5'b00011;
	#100;
	key_input = 5'b10001;//-10*3=
	
end
endmodule
