
`timescale 100ps/1ps

module tb_keypad;

reg 		clk, rst;
reg  [31:0]	BCD_input;
reg 		Valid_signal;
reg         IsOperator;

wire [31:0] test_data;
wire [ 4:0] test_operator;
wire overflow;

keypad KEYPAD(clk, rst, BCD_input, Valid_signal,IsOperator, test_data, test_operator, overflow);

// CLK, RESET setting
initial forever #5 clk = ~clk;

initial begin
	clk = 1'b0;
end

initial begin
	rst = 1'b0;
	#10
	rst = 1'b1;
end

//INPUT setting

initial begin
    BCD_input = 'b0;
    Valid_signal = 'b0;
    IsOperator = 'b0;
	#50;
	BCD_input = 16'b1001_1001_1001_1001;
	Valid_signal = 1'b1;
	#10
	Valid_signal = 1'b0;
	#60
	BCD_input = 16'b1001_1001;
	Valid_signal = 1'b1;
	#60
	BCD_input = 'b1111_0000_0000_0000_0001; //-1 input
	Valid_signal = 1'b1;
	#60
	BCD_input = 'b0001_0000_0000_0000_0000_0000; //overflow check
	Valid_signal = 1'b1;
	#60
	BCD_input = -'b1; //overflow check
	Valid_signal = 1'b1;
	#10	
	Valid_signal = 1'b0;
	#60
	BCD_input = "+";    //HEX : 2b
	Valid_signal = 1'b1;
	IsOperator = 1'b1;  
	#60
	BCD_input = "-";    //HEX : 2d
	Valid_signal = 1'b1;
	IsOperator = 1'b1;  
	#60
	BCD_input = "*";	//HEX : 2a
	Valid_signal = 1'b1;
	IsOperator = 1'b1;  
	#60
	BCD_input = "/";	//HEX : 2f
	Valid_signal = 1'b1;
	IsOperator = 1'b1;  
	#60
	BCD_input = "=";    //HEX : 3d
	Valid_signal = 1'b1;
	IsOperator = 1'b1;  
	#60
	BCD_input = "AC";   //HEX : 4143
	Valid_signal = 1'b1;
	IsOperator = 1'b1;  
	#60
	BCD_input = "X";   //overflow check
	Valid_signal = 1'b1;
	IsOperator = 1'b1;  
end
endmodule
