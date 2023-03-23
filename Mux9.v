module Mux9(

    input [8:0] A,
    input [8:0] B,
    input S,
	 output [9:0] Out
    );
	 
genvar i;

generate
 begin:Mux
  for(i=0;i<9;i = i + 1)begin:Mux
    Mux M(A[i],B[i],S,Out[i]);
	 end
 end
endgenerate
assign Out[9]=1'b1;

endmodule