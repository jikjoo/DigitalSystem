
`timescale 100ps/1ps
module tb_cla_alu;

reg [17:0] x, y;
reg [1:0] s;
wire [17:0] z;
wire v;
integer i,j,k;
cla_alu alu(x,y,s,z,v);

initial begin
x=18'd0;y=18'd0;s=2'd0;
//x>0,y>0
for(i=0;i<1000;i=i+1) begin
 y=i;
 for(j=0;j<1000;j=j+1) begin
 x=j;
  for(k=0;k<4;k=k+1) begin
  s=k;
	#1;
  end
 end
end
//x<0,y>0
for(i=0;i<1000;i=i+1) begin
 y=i;
 for(j=0;j<1000;j=j+1) begin
 x=-j;
  for(k=0;k<4;k=k+1) begin
  s=k;
	#1;
  end
 end
end
//x>0,y<0
for(i=0;i<1000;i=i+1) begin
 y=-i;
 for(j=0;j<1000;j=j+1) begin
 x=j;
  for(k=0;k<4;k=k+1) begin
  s=k;
	#1;
  end
 end
end
//x<0,y<0
for(i=0;i<1000;i=i+1) begin
 y=-i;
 for(j=0;j<1000;j=j+1) begin
 x=-j;
  for(k=0;k<4;k=k+1) begin
  s=k;	#1;
  end
 end
end

end
endmodule
