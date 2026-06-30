module tb_decoder;

reg[1:0] a;
wire[3:0] y;

decoder def(

	.en(en),
	.a(a),
	.y(y)

);

initial begin

	en=0 ; a=2'bxx ; #10;
	en=1 ; a=2'b00 ; #10;
	en=1 ; a=2'b01 ; #10;
	en=1 ; a=2'b10 ; #10;
	en=1 ; a=2'b11 ; #10;

	$finish; #200;

end

initial begin

	$dumpfile("tb.fsdb");
	$dumpvars(0,tb_decoder);

end

endmodule 
	
	
	
