
module fulladder(x,y,z,s,c);
	input x,y,z;
	output s,c;
	wire w,wx,wy,wz;
	xor x0(w,x,y);
	xor x1(s,w,z);
	and a0(wx,x,y);
	and a1(wy,y,z);
	and a2(wz,x,z);
	or o0(c,wx,wy,wz);
endmodule

