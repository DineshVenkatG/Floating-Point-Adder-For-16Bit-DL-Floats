module FullAdder(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
    );
	 
wire w1,w2,w3;
xor(w1,A,B);
xor(S,w1,Cin);
and(w2,w1,Cin);
and(w3,A,B);
or(Cout,w3,w2);

endmodule