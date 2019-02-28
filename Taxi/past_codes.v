
module LineDecoder(A3,A2,A1,A0,S3,S2,S1,S0);

input A3,A2,A1,A0;
output S3,S2,S1,S0;

reg [3:0] out; 

always @(A3,A2,A1,A0)
begin
case({A3,A2,A1,A0})
4'b0000 : out <= 4'b0000; //0
4'b0001 : out <= 4'b0001; //1
4'b0010 : out <= 4'b0010; //2
4'b0011 : out <= 4'b0011; //3
4'b0100 : out <= 4'b0100; //4
4'b0101 : out <= 4'b1000; //5
4'b0110 : out <= 4'b1001; //6
4'b0111 : out <= 4'b1010; //7
4'b1000 : out <= 4'b1011; //8
4'b1001 : out <= 4'b1100; //9
default : out <= 4'b0000; //NULL
endcase 
end

assign {S3,S2,S1,S0} = out;

endmodule


module Binary_to_BCD(B3,B2,B1,B0, P9,P8,P7,P6,P5,P4,P3,P2,P1,P0);

input B3,B2,B1,B0;
output P9,P8,P7,P6,P5,P4,P3,P2,P1,P0;
wire T10,T9,T8,T7,T6,T5,T4,T3,T2,T1,T0;

assign P0 = B0;
LineDecoder C1(0,0,0,B3,		T3,T2,T1,T0);
LineDecoder C2(T2,T1,T0,B2,	T7,T6,T5,T4);
LineDecoder C3(0,0,0,T3,		P9,T10,T9,T8);
LineDecoder C4(T6,T5,T4,B1,	P4,P3,P2,P1);
LineDecoder C5(T10,T9,T8,T7,	P8,P7,P6,P5);

endmodule


module BCD_to_7segment(D3,D2,D1,D0, A,B,C,D,E,F,G);

input D3,D2,D1,D0;
output A,B,C,D,E,F,G;
reg [7:0] out; 

always @(D3,D2,D1,D0)
begin
case({D3,D2,D1,D0})
	4'b0000 : out <= 7'b1111110; //0
	4'b0001 : out <= 7'b0110000; //1
	4'b0010 : out <= 7'b1101101; //2
	4'b0011 : out <= 7'b1111001; //3
	4'b0100 : out <= 7'b0110011; //4
	4'b0101 : out <= 7'b1011011; //5
	4'b0110 : out <= 7'b1011111; //6
	4'b0111 : out <= 7'b1110010; //7
	4'b1000 : out <= 7'b1111111; //8
	4'b1001 : out <= 7'b1111011; //9
	default : out <= 7'b0000000; //NULL
endcase 
end

assign {A,B,C,D,E,F,G} = out;

endmodule


module SevenSeg_CTRL(iCLK, nRST,iSEG7,iSEG6,iSEG5,iSEG4,iSEG3,iSEG2,iSEG1,iSEG0, oS_COM, oS_ENS);
// I/O definition------------------------------------------	
input iCLK, nRST;
input [6:0] iSEG7, iSEG6, iSEG5, iSEG4,iSEG3, iSEG2, iSEG1, iSEG0;
output [7:0] oS_COM;
output [6:0] oS_ENS; /* a,b,c,d, e,f,g,dp */
reg [7:0] oS_COM;
reg [6:0] oS_ENS;
integer CNT_SCAN; 

always @(posedge iCLK)
begin
	if (nRST)
	  begin
		oS_COM <= 8'b00000000;
		oS_ENS <= 0;
	    CNT_SCAN = 0;
	  end
	else
	  begin
	  	if (CNT_SCAN >= 7)
	  	  CNT_SCAN = 0;
	  	else
	  	  CNT_SCAN = CNT_SCAN + 1;
	  	  	  	
	  	case (CNT_SCAN)
	  	  0 : 
	  	    begin
				oS_COM <= 8'b11111110;
				oS_ENS <= iSEG0;
	  	    end
	  	  1 : 
	  	    begin
				oS_COM <= 8'b11111101;
				oS_ENS <= iSEG1;
	  	    end
	  	  2 : 
	  	    begin
				oS_COM <= 8'b11111011;
				oS_ENS <= iSEG2;
	  	    end
	  	  3 : 
	  	    begin
				oS_COM <= 8'b11110111;
				oS_ENS <= iSEG3;
	  	    end
	  	  4 : 
	  	    begin
				oS_COM <= 8'b11101111;
				oS_ENS <= iSEG4;
	  	    end
	  	  5 : 
	  	    begin
				oS_COM <= 8'b11011111;
				oS_ENS <= iSEG5;
	  	    end
	  	  6 : 
	  	    begin
				oS_COM <= 8'b10111111;
				oS_ENS <= iSEG6;
	  	    end
	  	  7 : 
	  	    begin
				oS_COM <= 8'b01111111;
				oS_ENS <= iSEG7;
	  	    end			 
	  	  default : 
	  	    begin
	  	      oS_COM <= 8'b11111111;
				oS_ENS <= iSEG7;
	  	    end
	  	endcase
      end
end

endmodule
