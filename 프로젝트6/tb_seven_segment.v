
`timescale 100ps/1ps

module tb_seven_segment;
reg clk, rst;
reg [20:0] bcd_input;
wire [7:0] out0,out1,out2,out3,out4,dout;
seven_segment ss(clk,rst,bcd_input,out0,out1,out2,out3,out4,dout);

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
    bcd_input = 'b0;
	#100;
	bcd_input = 21'b0_0000_0000_0000_0000_0001;
	#100;
	bcd_input = 21'b0_0000_0000_0000_0001_0010;
	#100;
	bcd_input = 21'b0_0000_0000_0001_0010_0011;
	#100;
	bcd_input = 21'b0_0000_0001_0010_0011_0100;
	#100;
	bcd_input = 21'b0_0001_0010_0011_0100_0101;
	#100;
	bcd_input = 21'b0_1011_0000_0000_0000_0000;
	#100;
	bcd_input = 21'b1_0000_0000_0000_0000_0001;
	#100;
	bcd_input = 21'b1_0000_0000_0000_0001_0010;
	#100;
	bcd_input = 21'b1_0000_0000_0001_0010_0011;
	#100;
	bcd_input = 21'b1_0000_0001_0010_0011_0100;
	#100;
	bcd_input = 21'b1_0001_0010_0011_0100_0101;
	#100;
	bcd_input = 21'b1_0000_1111_0000_0000_0001;
   
end
endmodule

