module inst_m (
    input  wire [15:0] addr,
    output wire [15:0] instr
);

    // 256 locations, each 16 bits wide
    reg [15:0] mem [0:255];

    // Initialize memory from hex file
    initial begin
        $readmemh("program.mem", mem);
    end

    // Combinational read
    assign instr = mem[addr[7:0]];

endmodule
