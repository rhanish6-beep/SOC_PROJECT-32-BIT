module mux (

	input a,
	input b,
	input sel,
	input y

);

assign y=(sel==0)? a:b;

endmodule	
