
`timescale 100ps/1ps

module tb_binary_to_bcd_encoder;

reg 		clk, rst;
reg  [17:0]	binaryInput;

wire [20:0] BCDoutput;
wire v;
binary_to_bcd_encoder ENCODER(clk,rst,binaryInput,BCDoutput,v);

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
    binaryInput = 'b0;
	#300;
	binaryInput = 'd1;
	#300;
	binaryInput = 'd12;
	#300;
	binaryInput = 'd123;
	#300;
	binaryInput = 'd1234;
	#300;
	binaryInput = 'd12345;
	#300;
	binaryInput = 'd123456;
	#300;
	binaryInput = -'d1;
	#300;
	binaryInput = -'d12;
	#300;
	binaryInput = -'d123;
	#300;
	binaryInput = -'d1234;
	#300;
	binaryInput = -'d12345;
	
	  
end
endmodule
