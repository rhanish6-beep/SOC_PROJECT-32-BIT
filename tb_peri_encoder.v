module tb_pri_encoder;

reg [3:0] d;
wire [1:0] y;

pri_encoder uut (

	.d(d),
	.y(y)

);

initial begin

	d=4'b0000 ; #10;
	d=4'b0001 ; #10;	
	d=4'b0010 ; #10;
	d=4'b0100 ; #10;	
	d=4'b1000 ; #10;	
	d=4'b1010 ; #10;	
	d=4'b1111 ; #10;

	#200; $finish; 


	.d(d),
	.y(y)

end 

initial begin 

	$dumpfile("tb.fsdb");
	$dumpvars(0,tb_pri_encoder);

end

endmodule


                       


