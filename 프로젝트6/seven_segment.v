
module seven_segment(clk, rst, bcd_input,out0,out1,out2,out3,out4,dout);
input clk, rst;
input [20:0] bcd_input;
output reg [7:0] out0,out1,out2,out3,out4; 
output dout;
reg[3:0] addr;
wire[7:0] dout,din0,din1,din2,din3,din4;
reg[7:0] din;
reg ena, wea;

always @(posedge clk) begin
if(!rst) begin
	addr<=0;ena <=0;wea<=0;
end
else if(bcd_input[3:0]<4'd10&&bcd_input[7:4]<4'd10&&bcd_input[11:8]<4'd10&&bcd_input[15:12]<4'd10&&bcd_input[19:16]<4'd10&&bcd_input[20]==0) begin
	out0 <= din0;
	out1 <= din1;
	out2 <= din2;
	out3 <= din3;
	out4 <= din4;
	case(addr)
		'd0: begin din<=din0;	addr<='d1;end
		'd1: begin din<=din1; 	addr<='d2;end
		'd2: begin din<=din2;	addr<='d3;end
		'd3: begin din<=din3;	addr<='d4;end
		'd4: begin din<=din4; 	addr<='d5;end
		default : addr<=0; 
	endcase
	wea<=1;
	ena<=1;

end
else if(bcd_input[3:0]<4'd10&&bcd_input[7:4]<4'd10&&bcd_input[11:8]<4'd10&&bcd_input[15:12]<4'd10&&bcd_input[20:16]==5'b10000) begin
	out0 <= din0;
	out1 <= din1;
	out2 <= din2;
	out3 <= din3;
	out4 <= 8'b00000001;
	case(addr)
		'd0: begin din<=din0;	addr<='d1; end
		'd1: begin din<=din1; 	addr<='d2; end
		'd2: begin din<=din2;	addr<='d3; end
		'd3: begin din<=din3;	addr<='d4; end
		'd4: begin din<=8'b00000001; 	addr<='d5; end
		default : addr<=0;
	endcase
	wea<=1;
	ena<=1;
end
else begin
	out0<=8'b01001111;//E
	out1<=8'b00000101;//r
	out2<=8'b00000101;//r
	out3<=8'b00011101;//o
	out4<=8'b00000101;//r
	ena<=0;
	wea<=0;
end
end

decoder d0(bcd_input[3:0],din0);
decoder d1(bcd_input[7:4], din1);
decoder d2(bcd_input[11:8], din2);
decoder d3(bcd_input[15:12], din3);
decoder d4(bcd_input[19:16], din4);

sram_ff ram(clk, rst, ena, wea, addr, din, dout);

endmodule
