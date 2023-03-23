module ControlledIncrementor(
    input A,
    input [5:0] Z,
    output [5:0] Out
    );
	 
wire [5:0]w;
wire [5:0]Cin;

assign w =(A==1'b1)?1:0;

HalfAdder H(Z[0],w[0],Out[0],Cin[0]);

genvar j;
generate 
 begin:FullAdder1
  for(j=1;j<6;j=j+1)
   begin:FullAdder1
   FullAdder F1(Z[j],w[j],Cin[j-1],Out[j],Cin[j]);
   end
 end
endgenerate

endmodule 