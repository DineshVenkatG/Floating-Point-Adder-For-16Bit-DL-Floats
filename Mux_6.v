module Mux_6(
    input [5:0] A,
    input [5:0] B,
    input C,
    output [5:0] Out
    );
	 
 genvar j;
 
 generate 
  begin: Mux
   for(j=0;j<=5;j=j+1)
    begin:Mux
     Mux M(A[j],B[j],C,Out[j]);
    end
   end
endgenerate

endmodule