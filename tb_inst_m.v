module tb_inst_m;

    reg  [15:0] addr;
    wire [15:0] instr;

    inst_m dut (
        .addr(addr),
        .instr(instr)
    );

    initial begin
        $display("Time\tAddr\tInstr");
        $monitor("%0t\t%h\t%h", $time, addr, instr);

        addr = 16'h0000; #10;
        addr = 16'h0001; #10;
        addr = 16'h0002; #10;
        addr = 16'h0003; #10;
        addr = 16'h0004; #10;
        addr = 16'h0005; #10;
        addr = 16'h000F; #10;

        // Demonstrate addr[7:0] indexing
        addr = 16'h0100; #10; // same as location 0
        addr = 16'h0101; #10; // same as location 1
        addr = 16'h01FF; #10; // location 255

        $finish;
    end
    initial begin
	    $dumpfile("tb.vcd");
	    $dumpvars(0,tb_inst_m);
    end


endmodule
