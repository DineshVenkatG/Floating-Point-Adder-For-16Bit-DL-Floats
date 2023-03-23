module Adder_9Bit(
    input [9:0] A,
    input [9:0] B,
    output [9:0] Out,
    output Cout
    );
	 
 wire [9:0] Cin;
 HalfAdder H1(A[0],B[0],Out[0],Cin[0]);
 
 genvar j;
 generate 
  begin
   for(j=1;j<=9;j=j+1)
    begin: FullAdder
     FullAdder F1(A[j],B[j],Cin[j-1],Out[j],Cin[j]);
    end
  end
 assign Cout = Cin[9];
endgenerate

endmodule