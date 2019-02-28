`timescale 100ps/1ps

module tb_keypad;

reg 		clk, rst;
reg  [31:0]	BCD_input;
reg 		Valid_siganl;
reg         IsOperator;

wire [31:0] test_data;
wire [ 3:0] test_operator;

test_keypad_interface KEYPAD(clk, rst, BCD_input, Valid_siganl,IsOperator, test_data, test_operator);

// CLK, RESET setting
initial forever #5 clk = ~clk;

initial begin
	clk = 1'b0;
end

initial begin
	rst = 1'b1;
	#10
	rst = 1'b0;
end

//INPUT setting

initial begin
    BCD_input = 'b0;
    Valid_siganl = 'b0;
    IsOperator = 'b0;
	#50;
	BCD_input = 16'b1001_1001_1001_1001;
	Valid_siganl = 1'b1;
	#10
	Valid_siganl = 1'b0;
	#60
	BCD_input = 16'b1001_1001;
	Valid_siganl = 1'b1;
	#10	
	Valid_siganl = 1'b0;
	#60
	BCD_input = "+";    //HEX : 2b
	Valid_siganl = 1'b1;
	IsOperator = 1'b1;  
	#60
	BCD_input = "-";    //HEX : 2d
	Valid_siganl = 1'b1;
	IsOperator = 1'b1;  
	#60
	BCD_input = "*";	//HEX : 2a
	Valid_siganl = 1'b1;
	IsOperator = 1'b1;  
	#60
	BCD_input = "/";	//HEX : 2f
	Valid_siganl = 1'b1;
	IsOperator = 1'b1;  
	#60
	BCD_input = "=";    //HEX : 3d
	Valid_siganl = 1'b1;
	IsOperator = 1'b1;  
	#60
	BCD_input = "AC";   //HEX : 4143
	Valid_siganl = 1'b1;
	IsOperator = 1'b1;  
end
endmodule

module test_keypad_interface(clk, rst, BCD_input, Valid_siganl,IsOperator, test_data, test_operator);

input 			clk,rst;
input [31:0] 	BCD_input;
input  			Valid_siganl;
input IsOperator;
output [31:0]   test_data;
output [ 3:0]   test_operator;

reg [31:0]		test_data;

always @(posedge clk or negedge rst) begin
	if (!rst) begin
									test_data <= 'b0;
									test_operator <= 'b0;
	end 
	else if (Valid_siganl) begin
		if(IsOperator) begin
			if(BCD_input>='d13&&BCD_input<='d17)					test_operator <= BCD_input[0:3] ;
			else               test_operator <= 'b0 ;
		end 
		else begin
				test_data <= BCD_input[0:3]+BCD_input[4:7]*10+BCD_input[8:11]*100+BCD_input[12:15]*1000+BCD_input[16:19]*10000;
		end
	end

end

endmodule
