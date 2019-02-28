
module mux(out,sel,a,b,c,d);
input [1:0] sel;
input a,b,c,d;

output out;

wire wa,wb,wc,wd;
and a0(wa,~sel[1],~sel[0],a);
and a1(wb,~sel[1],sel[0],b);
and a2(wc,sel[1],~sel[0],c);
and a3(wd,sel[1],sel[0],d);
xor x0(out,wa,wb,wc,wd);


endmodule
