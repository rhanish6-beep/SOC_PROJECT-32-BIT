module tb_register_file;

    reg         clk;
    reg         rstn;
    reg         wr_en;
    reg  [3:0]  rd_addr;
    reg  [7:0]  wr_data;
    reg  [3:0]  rs1_addr;
    reg  [3:0]  rs2_addr;

    wire [7:0]  rs1_data;
    wire [7:0]  rs2_data;

   
    register_file dut (
        .clk(clk),
        .rstn(rstn),
        .wr_en(wr_en),
        .rd_addr(rd_addr),
        .wr_data(wr_data),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   
    end

    initial begin

        
        $dumpfile("tb.vcd");
        $dumpvars(0, tb_register_file);

        
        rstn     = 0;
        wr_en    = 0;
        rd_addr  = 0;
        wr_data  = 0;
        rs1_addr = 0;
        rs2_addr = 0;

        
        #15;
        rstn = 1;

        
        @(posedge clk);
        wr_en   = 1;
        rd_addr = 4'd1;
        wr_data = 8'hAA;

        
        @(posedge clk);
        rd_addr = 4'd2;
        wr_data = 8'h55;

        
        @(posedge clk);
        rd_addr = 4'd3;
        wr_data = 8'hF0;

        
        @(posedge clk);
        wr_en = 0;

        
        rs1_addr = 4'd1;
        rs2_addr = 4'd2;
        #2;
        $display("R1 = %h, R2 = %h", rs1_data, rs2_data);

        
        rs1_addr = 4'd2;
        rs2_addr = 4'd3;
        #2;
        $display("R2 = %h, R3 = %h", rs1_data, rs2_data);

        
        @(posedge clk);
        wr_en   = 1;
        rd_addr = 4'd0;
        wr_data = 8'hFF;

        @(posedge clk);
        wr_en = 0;

        rs1_addr = 4'd0;
        #2;
        $display("R0 = %h (should be 00)", rs1_data);

        #20;
        $finish;
    end

    initial begin
        $monitor("Time=%0t | wr_en=%b wr_addr=%d wr_data=%h | rs1_addr=%d rs1_data=%h | rs2_addr=%d rs2_data=%h",
                 $time, wr_en, rd_addr, wr_data,
                 rs1_addr, rs1_data,
                 rs2_addr, rs2_data);
    end

endmodule
