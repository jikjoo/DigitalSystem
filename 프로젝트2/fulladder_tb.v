
`timescale 100ps/1ps

module tb_fulladder;
reg x,y,z;
wire s,c;
fulladder fa0(x,y,z,s,c);

initial
begin
x <=0;
y<=0;
z<=0;

#5
z<=1;

#5
y<=1;
z<=0;

#5
z<=1;

#5
x<=1;
y<=0;
z<=0;

#5
z<=1;

#5
y<=1;
z<=0;

#5
z<=1;
end
endmodule
