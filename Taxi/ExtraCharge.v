module ExtraCharge(plus, Charge, out);
 input plus;
 input [11:0] Charge;
 output [11:0] out;
 wire [11:0] w1, w0;
 
 assign w1 = Charge + Charge/5;
 assign w0 = Charge;
 assign out = plus ? w1 : w0;
endmodule
