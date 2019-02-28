
`timescale 100ps/1ps

module cla8_tb;
reg  [7:0] a, b;
reg s;
wire [7:0]out;
wire c,v;

cla8 cla(a,b,s,out,c,v);

always #1 b=b+1;
always #(256) a=a+1;
always #(256*256) s=s+1;
initial
begin
a=8'd0;b=8'd0;s=1'b0;
end
endmodule
