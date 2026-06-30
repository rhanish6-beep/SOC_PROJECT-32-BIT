module tb_alu;

reg  [7:0] operand_a;
reg  [7:0] operand_b;
reg  [3:0] alu_op;

wire [7:0] alu_result;
wire zero_flag;
wire carry_flag;

alu dut (
    .operand_a(operand_a),
    .operand_b(operand_b),
    .alu_op(alu_op),
    .alu_result(alu_result),
    .zero_flag(zero_flag),
    .carry_flag(carry_flag)
);

initial begin

    $display("Time\tOp\tA\tB\tResult\tZero\tCarry");
    $monitor("%0t\t%b\t%0d\t%0d\t%0d\t%b\t%b",
             $time, alu_op, operand_a, operand_b,
             alu_result, zero_flag, carry_flag);

    // ADD
    operand_a = 8'd10;
    operand_b = 8'd5;
    alu_op    = 4'b0000;
    #10;

    // SUB
    alu_op = 4'b0001;
    #10;

    // AND
    alu_op = 4'b0011;
    #10;

    // OR
    alu_op = 4'b0100;
    #10;

    // XOR
    alu_op = 4'b0101;
    #10;

    // INV
    alu_op = 4'b0110;
    #10;

    // SHL
    operand_a = 8'd4;
    operand_b = 8'd2;
    alu_op    = 4'b0111;
    #10;

    // SHR
    alu_op = 4'b1000;
    #10;

    // PASS_B
    alu_op = 4'b1001;
    #10;

    // PASS_A:
    alu_op = 4'b1010;
    #10;

    $finish;#100;
end 
initial begin
	$dumpfile("tb.vcd");
	$dumpvars(0,tb_alu);

end

endmodule
