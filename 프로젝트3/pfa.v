module pfa(A, B, C, P, G, S);
  input A, B, C;
  output P, G, S;
  
  // compute P, G
  xor x0(P, A, B);
  and a0(G, A, B);
  
  // compute S = (A xor B) xor C = P xor C
  xor x1(S, P, C);
  
endmodule
