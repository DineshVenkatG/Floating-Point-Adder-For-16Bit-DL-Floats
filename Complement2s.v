module Complement2s(
    input [5:0] A,
    output [5:0] Out
    );
	 
wire [5:0]w;
genvar j;

 generate
  begin
   for(j=0;j<6;j=j+1)
    begin: MuxM
     Mux M(1'b1,1'b0,A[j],w[j]);
    end
  end
endgenerate

wire [5:0]c;
HalfAdder H1(w[0],1'b1,Out[0],c[0]);

genvar i;

	generate
		begin: FullAdder
			for(i=1;i<6;i=i+1)
			  begin : FullAdder
			    FullAdder F1(w[i],1'b0,c[i-1],Out[i],c[i]);
			  end
		end
	endgenerate
	
endmodule