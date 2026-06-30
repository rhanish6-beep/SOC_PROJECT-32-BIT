module inst_decoder (
    input  wire [15:0] instr,
    input  wire        zero_flag,

    output wire [3:0] opcode,
    output wire [3:0] rd_addr,
    output wire [3:0] rs1_addr,
    output wire [3:0] rs2_addr,
    output wire [7:0] imm,

    output reg  [3:0] alu_op,
    output reg        reg_wr_en,
    output reg        imm_sel,
    output reg        branch_en
);

    assign opcode   = instr[15:12];
    assign rd_addr  = instr[11:8];
    assign rs1_addr = instr[7:4];
    assign rs2_addr = instr[3:0];
    assign imm = {{4{instr[3]}}, instr[3:0]};

    localparam ADD  = 4'h0;
    localparam SUB  = 4'h1;
    localparam AND_ = 4'h2;
    localparam OR_  = 4'h3;
    localparam XOR_ = 4'h4;
    localparam ADDI = 4'h5;
    localparam MOVI = 4'h6;
    localparam BEQ  = 4'h7;

        always @(*) begin

        alu_op    = 4'h0;
        reg_wr_en = 1'b0;
        imm_sel   = 1'b0;
        branch_en = 1'b0;

        case (opcode)

            ADD: begin
                alu_op    = 4'h0;
                reg_wr_en = 1'b1;
            end

            SUB: begin
                alu_op    = 4'h1;
                reg_wr_en = 1'b1;
            end

            AND_: begin
                alu_op    = 4'h2;
                reg_wr_en = 1'b1;
            end

            OR_: begin
                alu_op    = 4'h3;
                reg_wr_en = 1'b1;
            end

            XOR_: begin
                alu_op    = 4'h4;
                reg_wr_en = 1'b1;
            end

            ADDI: begin
                alu_op    = 4'h0;
                reg_wr_en = 1'b1;
                imm_sel   = 1'b1;
            end

            MOVI: begin
                alu_op    = 4'h5;
                reg_wr_en = 1'b1;
                imm_sel   = 1'b1;
            end

            BEQ: begin
                alu_op    = 4'h1;
                if (zero_flag)
                    branch_en = 1'b1;
            end

            default: begin
                alu_op    = 4'h0;
                reg_wr_en = 1'b0;
                imm_sel   = 1'b0;
                branch_en = 1'b0;
            end

        endcase
    end

endmodule
