module BarrelShifter(
    input [9:0] In,
    output [9:0] Out,
    input [4:0] Shift
    );
	 
 wire [9:0]a;
 genvar i;
 
 generate
	begin:b1
		for(i=0;i<9;i=i+1)
			begin:b2
			Mux M(In[i] , In[i+1] , Shift[0] , a[i]);
			end
	 Mux M1(In[9] , 1'b0 , Shift[0] , a[9]);
	end
endgenerate

wire [9:0]a1;
genvar j , k;

generate
	begin:b3
		for(j=0;j<8;j=j+1)
			begin:b4
		    	Mux M2(a[j] , a[j+2] , Shift[1] , a1[j]);
			end
	    for(k=8;k<10;k=k+1)
			begin:b5
			   Mux M3(a[k] , 1'b0 , Shift[1] , a1[k]);
			end
	end
endgenerate

genvar p , q;
wire [9:0]a2;

generate
	begin:b6
		for(p=0;p<6;p=p+1)
			begin:b7
			 Mux M4(a1[p] , a1[p+4] , Shift[2] , a2[p]);
			end
		for(k=6;k<10;k=k+1)
			begin:b8
			 Mux M5(a1[k] , 1'b0 , Shift[2] , a2[k]);
			end
	end
endgenerate

genvar x , y;
wire [9:0]a3;

generate
	begin
		for(x=0;x<2;x=x+1)
		 begin:b9
		  Mux M6(a2[x] , a2[x+8] , Shift[3] , a3[x]);
		 end
		for(y=2;y<10;y=y+1)
		 begin:b10
		  Mux M7(a2[y] , 1'b0 , Shift[3] , a3[y]);
		 end
	end
endgenerate

genvar s , t;
wire [9:0]a4;

generate
	begin:b11
	for(s=0;s<2;s=s+1)
		begin:b12
		 Mux M8(a3[s] , a3[s+4] , Shift[4] , a4[s]);
		end
	for(t=2;t<10;t=t+1)
		begin:b13
		 Mux M9(a3[t] , 1'b0 , Shift[4] , a4[t]);
		end
	end
endgenerate

assign Out = a4;

endmodule