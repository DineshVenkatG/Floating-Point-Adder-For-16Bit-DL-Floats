module  FloatingPointAdder(  input [15:0] A,
input [15:0] B, output [15:0] Out
);
wire [8:0]MA; wire [8:0]MB; wire [5:0]EA; wire [5:0]EB;
assign MA[8:0]=A[8:0];
assign MB[8:0]=B[8:0];
assign EA = A[14:9];
assign EB = B[14:9];

wire [5:0]Modulo;
wire Borrow;
Sub_Result subtract(EA,EB,Modulo,Borrow);
wire [9:0]mux1out;
wire [9:0]mux2out;
Mux9 rightshiftertop(MB,MA,Borrow,mux1out);
Mux9 addertop(MA,MB,Borrow,mux2out);
wire [9:0]outshift;

wire [4:0]shiftdiff;
assign shiftdiff = Modulo[4:0];
BarrelShifter rightshift(mux1out,outshift,shiftdiff);

wire [9:0]adderout;
wire cout;
Adder_9Bit A1(mux2out,outshift,adderout,cout);

wire [5:0]maxexp ;
Mux_6 expmax(EA,EB,Borrow,maxexp);

wire [5:0]expfinal;
ControlledIncrementor finexp(cout,maxexp,expfinal);
wire [9:0]finalM;
 wire [4:0]select;
assign select[4:1] = 4'b0000;
assign select[0] = cout;
BarrelShifter finalshifter(adderout,finalM,select); assign Out[15] = 0;
endmodule