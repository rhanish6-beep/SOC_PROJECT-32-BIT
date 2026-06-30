module register_file (
    input              clk,
    input              rstn,

    input              wr_en,
    input      [3:0]   rd_addr,   
    input      [7:0]   wr_data,

    input      [3:0]   rs1_addr,
    input      [3:0]   rs2_addr,

    output     [7:0]   rs1_data,
    output     [7:0]   rs2_data
);

    
    reg [7:0] regs [0:15];

    integer i;

    
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            for (i = 0; i < 16; i = i + 1)
                regs[i] <= 8'h00;
        end
        else if (wr_en && (rd_addr != 4'd0)) begin
            regs[rd_addr] <= wr_data;
        end
    end

    assign rs1_data = regs[rs1_addr];
    assign rs2_data = regs[rs2_addr];

endmodule
