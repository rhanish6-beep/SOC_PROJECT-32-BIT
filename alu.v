module alu (
    input  [7:0] operand_a,
    input  [7:0] operand_b,
    input  [3:0] alu_op,
    output reg [7:0] alu_result,
    output reg zero_flag,
    output reg carry_flag
);

reg [8:0] temp;

always @(*) begin
    alu_result = 8'b0;
    carry_flag = 1'b0;
    temp       = 9'b0;

    case (alu_op)

        4'b0000: begin // ADD
            temp = operand_a + operand_b;
            alu_result = temp[7:0];
            carry_flag = temp[8];
        end

        4'b0001: begin // SUB
            temp = operand_a - operand_b;
            alu_result = temp[7:0];
            carry_flag = temp[8];
        end

        4'b0011: alu_result = operand_a & operand_b; // AND

        4'b0100: alu_result = operand_a | operand_b; // OR

        4'b0101: alu_result = operand_a ^ operand_b; // XOR

        4'b0110: alu_result = ~operand_a; // INV

        4'b0111: alu_result = operand_a << operand_b[2:0]; // SHL

        4'b1000: alu_result = operand_a >> operand_b[2:0]; // SHR

        4'b1001: alu_result = operand_b; // PASS_B

        4'b1010: alu_result = operand_a; // PASS_A

        default: alu_result = 8'b0;

    endcase

    zero_flag = (alu_result == 8'b0);

end

endmodule
