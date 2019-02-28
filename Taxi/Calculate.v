module Calculate(CLK,RST,Pause,Velocity,Charge,cnt,out);
 input CLK, RST, Pause;
 input [7:0] Velocity;
 input [11:0] Charge;
 input [15:0] cnt;
 output reg [11:0] out;

 always @ (posedge CLK) begin
  if(!RST) begin
	out <= 0;
  end
  else begin
	if(Pause) begin
	  out <= Charge;
	end
	else begin
	if(!cnt) begin
	  out <= 300;
	end
	else if(cnt==1) begin
	 if(Velocity >0 && Velocity < 30) out <= Charge + 10;
	 else if(Velocity < 50) out <= Charge + 12;
	 else if(Velocity < 70) out <= Charge + 14;
	 else out <= Charge + 16;
	end
	else out <= Charge;
	end
  end
 end
endmodule
