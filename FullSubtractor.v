module FullSubtractor(
    input A,
    input B,
    input Bin,
    output D,
    output Bout
    );
	 
wire w1,w2,w3,w4;

xor(w1,A,B);
xor(D,w1,Bin);

and(w2,~A,~B,Bin);
and(w3,A,~B,~Bin);
and(w4,~A,B,~Bin);
and(w5,A,B,Bin);

or(Bout,w2,w3,w4,w5);

endmodule
