module tb_inst_decoder;

    reg  [15:0] instr;
    reg  zero_flag;

    wire [3:0] opcode;
    wire [3:0] rd_addr;
    wire [3:0] rs1_addr;
    wire [3:0] rs2_addr;
    wire [7:0] imm;

    wire [3:0] alu_op;
    wire       reg_wr_en;
    wire       imm_sel;
    wire       branch_en;

    inst_decoder dut (
        .instr(instr),
        .zero_flag(zero_flag),

        .opcode(opcode),
        .rd_addr(rd_addr),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .imm(imm),

        .alu_op(alu_op),
        .reg_wr_en(reg_wr_en),
        .imm_sel(imm_sel),
        .branch_en(branch_en)
    );

    initial begin

        $dumpfile("tb.vcd");
        $dumpvars(0, tb_inst_decoder);

        $display("\nTime Opcode RD RS1 RS2 IMM ALU REGW IMMSEL BRANCH");

        instr = 16'h0123;
        zero_flag = 0;
        #10;

        instr = 16'h1234;
        #10;

        instr = 16'h2345;
        #10;

        instr = 16'h3456;
        #10;

        instr = 16'h4567;
        #10;

        instr = 16'h5125;
        #10;
 
         instr = 16'h68FD;
        #10;

        instr = 16'h7002;
        zero_flag = 0;
        #10;

        instr = 16'h7002;
        zero_flag = 1;
        #10;

        $finish;
    end

    initial begin
        $monitor("%0t    %h     %h  %h   %h   %h   %h    %b      %b      %b",
                  $time,
                  opcode,
                  rd_addr,
                  rs1_addr,
                  rs2_addr,
                  imm,
                  alu_op,
                  reg_wr_en,
                  imm_sel,
                  branch_en);
    end

endmodule
