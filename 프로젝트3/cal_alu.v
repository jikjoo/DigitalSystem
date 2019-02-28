
module cla_alu(x,y,s,z,v);
input [17:0] x,y;
input [1:0] s;
output reg[17:0] z;
output v;

wire [1:0] acarry,scarry;
wire av,sv,xv,dv;
wire [17:0] az,sz,xz,dz,mz;

//adder, subtractor
cla8bit c0(x[7:0],y[7:0],s[0],0,az[7:0],acarry[0],);
xor x0(scarry[0],s[0],acarry[0]);
cla8bit c1(x[15:8],y[15:8],s[0],scarry[0],az[15:8],acarry[1],);
xor x1(scarry[1],s[0],acarry[1]);
cla8bit c2(x[17:16],y[17:16],s[0],scarry[1],az[17:16],,av);
//multiplier
assign xz = x[17:0]*y[17:0];
//divider
assign dz = x[17:0]/y[17:0];
mux mux0(mz[17:0], s[1:0], az[17:0], az[17:0], xz[17:0],dz[17:0]);
always @(*) begin
	z[17:0] = mz[17:0];
end
endmodule
