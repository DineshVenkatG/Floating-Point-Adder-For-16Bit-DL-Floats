module Subtractor_6Bit(

    input [5:0] A,
    input [5:0] B,
    output [5:0] D,
    output Bout
    );
	 
wire [5:0] w;

HalfSubtractor H1(A[0],B[0],D[0],w[0]);
FullSubtractor F1(A[1],B[1],w[0],D[1],w[1]);
FullSubtractor F2(A[2],B[2],w[1],D[2],w[2]);
FullSubtractor F3(A[3],B[3],w[2],D[3],w[3]);
FullSubtractor F4(A[4],B[4],w[3],D[4],w[4]);
FullSubtractor F5(A[5],B[5],w[4],D[5],w[5]);


assign Bout=w[5];

endmodule