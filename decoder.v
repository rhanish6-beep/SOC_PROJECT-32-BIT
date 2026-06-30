module decoder (input wire [1:0]a, input wire en, output reg [1:0]y);
always @(*) begin
     y = 4 'b0000;
     if(en == 1'b1)begin
	     case(a)
	     	2'b00 : y[0]=1'b1;
       	     	2'b01 : y[1]=1'b1;
       	     	2'b10 : y[2]=1'b1;
             	2'b11 : y[3]=1'b1;
	endcase
       end
end
endmodule




