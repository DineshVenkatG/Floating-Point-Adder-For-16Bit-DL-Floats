module Sub_Result(

    input [5:0] A,
    input [5:0] B,
    output [5:0] Out,
	 output b
    );
	 
wire [5:0]d;
wire [5:0]d1;

Subtractor_6Bit S(A,B,d,b);
Complement2s C(d, d1);
assign Out=(b == 1'b1)?d1:d;
endmodule