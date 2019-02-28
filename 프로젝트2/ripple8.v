
module ripple8 (a,b,s,out,c,v);
input [7:0] a,b;
input s;
output [7:0] out;
output c,v;
wire [7:0] r;
wire [7:0] carry;
xor xo0(r[0],b[0],s);
xor xo1(r[1],b[1],s);
xor xo2(r[2],b[2],s);
xor xo3(r[3],b[3],s);
xor xo4(r[4],b[4],s);
xor xo5(r[5],b[5],s);
xor xo6(r[6],b[6],s);
xor xo7(r[7],b[7],s);

fulladder fa0(a[0],r[0],s,out[0],carry[0]),
	fa1(a[1],r[1],carry[0],out[1],carry[1]),
	fa2(a[2],r[2],carry[1],out[2],carry[2]),
	fa3(a[3],r[3],carry[2],out[3],carry[3]),
	fa4(a[4],r[4],carry[3],out[4],carry[4]),
	fa5(a[5],r[5],carry[4],out[5],carry[5]),
	fa6(a[6],r[6],carry[5],out[6],carry[6]),
	fa7(a[7],r[7],carry[6],out[7],c);
xor xv(v,carry[6],c);
endmodule
