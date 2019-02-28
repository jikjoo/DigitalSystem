
module cla8 (a,b,s,out,c,v);
input [7:0] a, b;
input s;
output [7:0] out;
output c, v;

wire [7:0] carry;
wire [7:0] wb,wa,ws,wc,wx;

xor x0(wb[0],b[0],s);
xor x1(wb[1],b[1],s);
xor x2(wb[2],b[2],s);
xor x3(wb[3],b[3],s);
xor x4(wb[4],b[4],s);
xor x5(wb[5],b[5],s);
xor x6(wb[6],b[6],s);
xor x7(wb[7],b[7],s);

and a0[7:0](wa[7:0],a[7:0],wb[7:0]);
xor xa[7:0](wx[7:0],a[7:0],wb[7:0]);

and as(ws[0],s,wx[0]);
or o0(carry[0], wa[0], ws[0]);
and ac[6:0](wc[6:0],carry[6:0],wx[7:1]);
or o1[6:0](carry[7:1],wa[7:1],wc[6:0]);
/*
xor xo0(out[0],wx[0],s);
xor xo[6:0](out[7:1],wx[7:1],carry[6:0]);
*/
fulladder fa0(a[0],wb[0],s,out[0],);
fulladder fa1[6:0](a[7:1],wb[7:1],carry[6:0],out[7:1],); 
assign c=carry[7];
xor xv (v,c,carry[6]);
endmodule

