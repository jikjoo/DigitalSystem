
module keypad(clk, rst, BCD_input, Valid_siganl, IsOperator, test_data, test_operator, overflow);

input 		clk,rst;
input [31:0] 	BCD_input;
input  		Valid_siganl;
input IsOperator;
output [31:0]   test_data;
output [ 4:0]   test_operator;
output overflow;

reg [31:0] 	test_data;
reg [4:0] test_operator;
reg overflow;

always @(posedge clk or negedge rst) begin
	if (!rst) begin
									test_data <= 'b0;
									test_operator <= 'b0;
	overflow <= 'b0;
	end 
	else if (Valid_siganl) begin
		if(IsOperator) begin
			overflow <= 'b0;
			case(BCD_input)
			'd16:test_operator <= 'd16 ;	//+
			'd15:test_operator <= 'd15; 	//-
			'd14:test_operator <= 'd14;	//*
			'd13:test_operator <= 'd13;	// /
			'd17:test_operator <= 'd17;	// =
			'd10:test_operator <= 'd10;	//AC 
			default ;
			endcase
		end 
		else begin //not operator
		if(BCD_input[3:0]>'d9||BCD_input[7:4]>'d9||BCD_input[11:8]>'d9||BCD_input[15:12]>'d9||(BCD_input[19:16]>'d9&&BCD_input[19:16]<'b1111)||BCD_input[31:20]>0) begin
			test_data<='b0;
			overflow <= 'b1;
		end
		else begin //not overflow
			overflow <= 'b0;
			if(BCD_input[19:16]=='b1) begin
				test_data <= -(BCD_input[3:0]+(BCD_input[7:4]*'d10)+(BCD_input[11:8]*'d100)+(BCD_input[15:12]*'d1000));
			end
			else begin // positive
				test_data <= BCD_input[3:0]+(BCD_input[7:4]*'d10)+(BCD_input[11:8]*'d100)+(BCD_input[15:12]*'d1000)+(BCD_input[19:16]*'d10000);
			end	
		end
		end
	end
	else ;//not valid
end

endmodule