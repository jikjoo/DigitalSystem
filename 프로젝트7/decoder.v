module decoder(binary_input, decoder_output);
input [3:0] binary_input;
output reg [7:0] decoder_output;

always @(*) begin
	case(binary_input)
	4'b0000 : decoder_output = 8'b01111110;
	4'b0001 : decoder_output = 8'b00110000;
	4'b0010 : decoder_output = 8'b01101101;
	4'b0011 : decoder_output = 8'b01111001;
	4'b0100 : decoder_output = 8'b00110011;
	4'b0101 : decoder_output = 8'b01011011;
	4'b0110 : decoder_output = 8'b01011111;
	4'b0111 : decoder_output = 8'b01110000;
	4'b1000 : decoder_output = 8'b01111111;
	4'b1001 : decoder_output = 8'b01111011;//9
	default : decoder_output = 'b0;
	endcase
end
endmodule
