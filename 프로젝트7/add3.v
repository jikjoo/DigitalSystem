
module add3(s,a);
input[3:0] a;
output reg[3:0] s;
always @(*) begin
 s[3] = a[3]|(a[2]&a[0])|(a[2]&a[1]);
 s[2] = (a[3]&a[0])|(a[2]&~a[1]&~a[0]);
 s[1] = (a[3]&~a[0])|(~a[2]&a[1])|(a[1]&a[0]);
 s[0] = (a[3]&~a[0])|(~a[3]&~a[2]&a[0])|(a[2]&a[1]&~a[0]);
end
endmodule
