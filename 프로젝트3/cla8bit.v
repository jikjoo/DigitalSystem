module cla8bit(A, B, Cin, Control, S, Cout, O);
  input [7:0] A, B;
  input Cin;
  input Control;
  output [7:0] S;
  output Cout;
  output O;
  
  wire [7:0] P, G;
  wire [7:0] C;
  wire [35:0] a;

  wire [7:0] B_w;

  xor C0XOR0(B_w[0],B[0],Control);
  xor C0XOR1(B_w[1],B[1],Control);
  xor C0XOR2(B_w[2],B[2],Control);
  xor C0XOR3(B_w[3],B[3],Control);
  xor C0XOR4(B_w[4],B[4],Control);
  xor C0XOR5(B_w[5],B[5],Control);
  xor C0XOR6(B_w[6],B[6],Control);
  xor C0XOR7(B_w[7],B[7],Control);
  
  xor C0XOR8(C[0],Cin,Control);
  
  pfa pfa0(A[0], B_w[0], C[0], P[0], G[0], S[0]);
  // compute C1
  and C1a0(a[0], P[0], C[0]);
  or C1o(C[1], G[0], a[0]);

  pfa pfa1(A[1], B_w[1], C[1], P[1], G[1], S[1]);
  // compute C2
  and C2a0(a[1], P[1], G[0]);
  and C2a1(a[2], P[1], P[0], C[0]);
  or C2o(C[2], G[1], a[1], a[2]);

  pfa pfa2(A[2], B_w[2], C[2], P[2], G[2], S[2]);
  // compute C3
  and C3a0(a[3], P[2], G[1]);
  and C3a1(a[4], P[2], P[1], G[0]);
  and C3a2(a[5], P[2], P[1], P[0], C[0]);
  or C3o(C[3], G[2], a[3], a[4], a[5]);

  pfa pfa3(A[3], B_w[3], C[3], P[3], G[3], S[3]);
  // compute C4
  and C4a0(a[6], P[3], G[2]);
  and C4a1(a[7], P[3], P[2], G[1]);
  and C4a2(a[8], P[3], P[2], P[1], G[0]);
  and C4a3(a[9], P[3], P[2], P[1], P[0], C[0]);
  or C4o(C[4], G[3], a[6], a[7], a[8], a[9]);

  pfa pfa4(A[4], B_w[4], C[4], P[4], G[4], S[4]);
  // compute C5
  and C5a0(a[10], P[4], G[3]);
  and C5a1(a[11], P[4], P[3], G[2]);
  and C5a2(a[12], P[4], P[3], P[2], G[1]);
  and C5a3(a[13], P[4], P[3], P[2], P[1], G[0]);
  and C5a4(a[14], P[4], P[3], P[2], P[1], P[0], C[0]);
  or C5o(C[5], G[4], a[10], a[11], a[12], a[13], a[14]);

  pfa pfa5(A[5], B_w[5], C[5], P[5], G[5], S[5]);
  // compute C6
  and C6a0(a[15], P[5], G[4]);
  and C6a1(a[16], P[5], P[4], G[3]);
  and C6a2(a[17], P[5], P[4], P[3], G[2]);
  and C6a3(a[18], P[5], P[4], P[3], P[2], G[1]);
  and C6a4(a[19], P[5], P[4], P[3], P[2], P[1], G[0]);
  and C6a5(a[20], P[5], P[4], P[3], P[2], P[1], P[0], C[0]);
  or C6o(C[6], G[5], a[15], a[16], a[17], a[18], a[19], a[20]);

  pfa pfa6(A[6], B_w[6], C[6], P[6], G[6], S[6]);
  // compute C7
  and C7a0(a[21], P[6], G[5]);
  and C7a1(a[22], P[6], P[5], G[4]);
  and C7a2(a[23], P[6], P[5], P[4], G[3]);
  and C7a3(a[24], P[6], P[5], P[4], P[3], G[2]);
  and C7a4(a[25], P[6], P[5], P[4], P[3], P[2], G[1]);
  and C7a5(a[26], P[6], P[5], P[4], P[3], P[2], P[1], G[0]);
  and C7a6(a[27], P[6], P[5], P[4], P[3], P[2], P[1], P[0], C[0]);
  or C7o(C[7], G[6], a[21], a[22], a[23], a[24], a[25], a[26], a[27]);

  pfa pfa7(A[7], B_w[7], C[7], P[7], G[7], S[7]);
  // compute C8
  and C8a0(a[28], P[7], G[6]);
  and C8a1(a[29], P[7], P[6], G[5]);
  and C8a2(a[30], P[7], P[6], P[5], G[4]);
  and C8a3(a[31], P[7], P[6], P[5], P[4], G[3]);
  and C8a4(a[32], P[7], P[6], P[5], P[4], P[3], G[2]);
  and C8a5(a[33], P[7], P[6], P[5], P[4], P[3], P[2], G[1]);
  and C8a6(a[34], P[7], P[6], P[5], P[4], P[3], P[2], P[1], G[0]);
  and C8a7(a[35], P[7], P[6], P[5], P[4], P[3], P[2], P[1], P[0], C[0]);
  or C8o(Cout, G[7], a[28], a[29], a[30], a[31], a[32], a[33], a[34], a[35]);

  //overflow detection
  xor C9XOR(O,Cout,C[7]);
      
endmodule
