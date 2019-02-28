

module calculator(clk,rst,Key_input,valid,result0,result1,result2,result3,result4);
input clk, rst, valid;
input[4:0] Key_input;
output reg[7:0] result0, result1, result2, result3, result4;

reg[31:0] bcd_input;
reg IsOperator;
reg key_v;
reg[1:0] CS;
reg[2:0] counter;
reg [17:0] binary_temp;
reg overflow;

wire [31:0] test_data;
wire [4:0] test_operator;
wire keypad_v,alu_v,encoder_v;
wire [17:0] binary_result;
wire [20:0]bcd_temp;
wire[7:0] out0,out1,out2,out3,out4;
always@(*) begin
	if(Key_input < 5'b01010) IsOperator = 'b0;
	else IsOperator = 'b1;
end
always@(*) begin
	if(counter>'d4) key_v=1;
	else key_v=0;
end
always@(posedge clk) begin
if(!rst) begin
	bcd_input<=0;
	counter <= 0;
	end
else if(valid) begin//bcd_input decide
	if(!IsOperator) begin
		if(counter==0) begin
			bcd_input[31:4]<=0;
			if(Key_input==0) counter<=0;
			else counter <= counter + 1;
		end
		else begin
			bcd_input[31:4] <= bcd_input[27:0];
			counter <= counter + 1;
		end
		bcd_input[3:0] <= Key_input;

	end
 	else begin
		if(Key_input=='d10) begin
			bcd_input <=0;
		end
		else begin
			bcd_input[31:5] <= 0;
			bcd_input[4:0] <= Key_input;
		end
		counter <=0;
	end
end
else ;
end

always@(*) begin
	case (test_operator)
	'd16 : CS= 2'b00; //+
	'd15 : CS = 2'b01; //-
	'd14 : CS = 2'b10; //*
	'd13 : CS = 2'b11; ///
	default : CS =2'b00;
	endcase
end

always@(posedge clk) begin
if(!rst) begin
	binary_temp<=0;
end
else if(valid) begin
	if(IsOperator) begin
		if(Key_input=='d10) begin	//AC
			key_v<=0;
			binary_temp<=0;
		end
		else if(Key_input == 'd12) begin//toggle
			binary_temp<=-binary_result;
		end
		else if(test_operator=='d17) begin//=	
			if(overflow) binary_temp<=0;
			else;
		end
		else begin
			binary_temp<=binary_result;	
		end
	end
	else begin 
		if(test_operator=='d17) begin
			binary_temp<=0;
		end 
		else;
	end
end
else begin//not valid
	if(test_operator=='d17&&IsOperator==0) begin
		binary_temp<=test_data[17:0];
	end
end
end
always @(posedge clk) begin
if(!rst) begin
			result0 <= 0;
			result1 <= 0;
			result2 <= 0;
			result3 <= 0;
			result4 <= 0;
end
else begin
	if(test_operator=='d17&&IsOperator) begin
		if(overflow) begin
			result0<=8'b01001111;//E
			result1<=8'b00000101;//r
			result2<=8'b00000101;//r
			result3<=8'b00011101;//o
			result4<=8'b00000101;//r
			
		end
		else begin
			result0 <= out0;
			result1 <= out1;
			result2 <= out2;
			result3 <= out3;
			result4 <= out4;
		end
	end
	else ;
end
end
always @(*) begin
	overflow <= key_v|keypad_v|alu_v|encoder_v;
end
 keypad kpd(clk, rst, bcd_input, 1, IsOperator, test_data, test_operator, keypad_v);
 cla_alu2 alu2(binary_temp,test_data[17:0],CS,binary_result,alu_v);
 binary_to_bcd_encoder enc(clk, rst, binary_temp, bcd_temp, encoder_v);
 seven_segment svn(clk, rst, bcd_temp,out0,out1,out2,out3,out4,);
endmodule
