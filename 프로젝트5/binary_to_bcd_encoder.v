
module binary_to_bcd_encoder(clk,rst,binaryInput,BCDoutput,v);

input clk, rst;
input [17:0] binaryInput;
wire [17:0] negInput;
wire [3:0] c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20;
wire [3:0] c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32,c33,c34;
wire [3:0] d1,d2,d4,d3,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20;
wire [3:0] d21,d22,d23,d24,d25,d26,d27,d28,d29,d30,d31,d32,d33,d34;
wire [3:0] n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14,n15,n16,n17,n18,n19,n20,n21,n22,n23,n24;
wire [3:0] m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15,m16,m17,m18,m19,m20,m21,m22,m23,m24;
output reg [20:0] BCDoutput;
output reg v;

assign d1 = binaryInput[16:13];
assign d2 = {c1[2:0],binaryInput[12]};
assign d3 = {c2[2:0],binaryInput[11]};
assign d4 = {c3[2:0],binaryInput[10]};
assign d5 = {c4[2:0],binaryInput[9]};
assign d6 = {c5[2:0],binaryInput[8]};
assign d7 = {c6[2:0],binaryInput[7]};
assign d8 = {c7[2:0],binaryInput[6]};
assign d9 = {c8[2:0],binaryInput[5]};
assign d10 = {c9[2:0],binaryInput[4]};
assign d11 = {c10[2:0],binaryInput[3]};
assign d12 = {c11[2:0],binaryInput[2]};
assign d13 = {c12[2:0],binaryInput[1]};
assign d14 = {1'b0,c1[3],c2[3],c3[3]};
assign d15 = {c14[2:0],c4[3]};
assign d16 = {c15[2:0],c5[3]};
assign d17 = {c16[2:0],c6[3]};
assign d18 = {c17[2:0],c7[3]};
assign d19 = {c18[2:0],c8[3]};
assign d20 = {c19[2:0],c9[3]};
assign d21 = {c20[2:0],c10[3]};
assign d22 = {c21[2:0],c11[3]};
assign d23 = {c22[2:0],c12[3]};
assign d24 = {1'b0,c14[3],c15[3],c16[3]};
assign d25 = {c24[2:0],c17[3]};
assign d26 = {c25[2:0],c18[3]};
assign d27 = {c26[2:0],c19[3]};
assign d28 = {c27[2:0],c20[3]};
assign d29 = {c28[2:0],c21[3]};
assign d30 = {c29[2:0],c22[3]};
assign d31 = {1'b0,c24[3],c25[3],c26[3]};
assign d32 = {c31[2:0],c27[3]};
assign d33 = {c32[2:0],c28[3]};
assign d34 = {c33[2:0],c29[3]};
add3 a1(c1,d1);
add3 a2(c2,d2);
add3 a3(c3,d3);
add3 a4(c4,d4);
add3 a5(c5,d5);
add3 a6(c6,d6);
add3 a7(c7,d7);
add3 a8(c8,d8);
add3 a9(c9,d9);
add3 a10(c10,d10);
add3 a11(c11,d11);
add3 a12(c12,d12);
add3 a13(c13,d13);
add3 a14(c14,d14);
add3 a15(c15,d15);
add3 a16(c16,d16);
add3 a17(c17,d17);
add3 a18(c18,d18);
add3 a19(c19,d19);
add3 a20(c20,d20);
add3 a21(c21,d21);
add3 a22(c22,d22);
add3 a23(c23,d23);
add3 a24(c24,d24);
add3 a25(c25,d25);
add3 a26(c26,d26);
add3 a27(c27,d27);
add3 a28(c28,d28);
add3 a29(c29,d29);
add3 a30(c30,d30);
add3 a31(c31,d31);
add3 a32(c32,d32);
add3 a33(c33,d33);
add3 a34(c34,d34);
assign negInput = -binaryInput;
assign m1 = negInput[14:11];
assign m2 = {n1[2:0],negInput[10]};
assign m3 = {n2[2:0],negInput[9]};
assign m4 = {n3[2:0],negInput[8]};
assign m5 = {n4[2:0],negInput[7]};
assign m6 = {n5[2:0],negInput[6]};
assign m7 = {n6[2:0],negInput[5]};
assign m8 = {n7[2:0],negInput[4]};
assign m9 = {n8[2:0],negInput[3]};
assign m10 = {n9[2:0],negInput[2]};
assign m11 = {n10[2:0],negInput[1]};
assign m12 = {1'b0,n1[3],n2[3],n3[3]};
assign m13 = {n12[2:0],n4[3]};
assign m14 = {n13[2:0],n5[3]};
assign m15 = {n14[2:0],n6[3]};
assign m16 = {n15[2:0],n7[3]};
assign m17 = {n16[2:0],n8[3]};
assign m18 = {n17[2:0],n9[3]};
assign m19 = {n18[2:0],n10[3]};
assign m20 = {1'b0,n12[3],n13[3],n14[3]};
assign m21 = {n20[2:0],n15[3]};
assign m22 = {n21[2:0],n16[3]};
assign m23 = {n22[2:0],n17[3]};
assign m24 = {n23[2:0],n18[3]};
add3 b1(n1,m1);
add3 b2(n2,m2);
add3 b3(n3,m3);
add3 b4(n4,m4);
add3 b5(n5,m5);
add3 b6(n6,m6);
add3 b7(n7,m7);
add3 b8(n8,m8);
add3 b9(n9,m9);
add3 b10(n10,m10);
add3 b11(n11,m11);
add3 b12(n12,m12);
add3 b13(n13,m13);
add3 b14(n14,m14);
add3 b15(n15,m15);
add3 b16(n16,m16);
add3 b17(n17,m17);
add3 b18(n18,m18);
add3 b19(n19,m19);
add3 b20(n20,m20);
add3 b21(n21,m21);
add3 b22(n22,m22);
add3 b23(n23,m23);
add3 b24(n24,m24);
always @(posedge clk or negedge rst) begin
	if(!rst) begin
		BCDoutput <= 'b0;
		v<='b0;
	end
	else begin
		if(binaryInput < 'd100000) begin //positive
			v<='b0;
			BCDoutput[0] <= binaryInput[0];
			BCDoutput[4:1] <= c13[3:0];
			BCDoutput[8:5] <= c23[3:0];
			BCDoutput[12:9] <= c30[3:0];
			BCDoutput[16:13] <= c34[3:0];
			BCDoutput[17] <= c33[3];
			BCDoutput[18] <= c32[3];
			BCDoutput[19] <= c31[3];
			BCDoutput[20] <= 'b0;
		end
		else if(binaryInput[17:0] > -18'd10000) begin//negative
			v<='b0;
			BCDoutput[0] <= negInput[0];
			BCDoutput[4:1] <= n11[3:0];
			BCDoutput[8:5] <= n19[3:0];
			BCDoutput[12:9] <= n24[3:0];
			BCDoutput[13] <= n23[3];
			BCDoutput[14] <= n22[3];
			BCDoutput[15] <= n21[3];
			BCDoutput[19:16] <= 4'b0;
			BCDoutput[20] <= 'b1;
			
		end
		else v<='b1;

	end
end
	
endmodule
