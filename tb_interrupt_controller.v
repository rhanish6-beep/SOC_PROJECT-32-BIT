module tb_interrupt_controller;
reg clk;
reg rst_n;
reg [7:0] irq_in;
reg [7:0] addr;
reg [31:0] wdata;
reg write_en;
reg read_en;
wire [31:0] rdata;
wire cpu_irq;
wire ready;

interrupt_controller dut (
    .clk(clk),
    .rst_n(rst_n),
    .irq_in(irq_in),
    .addr(addr),
    .wdata(wdata),
    .write_en(write_en),
    .read_en(read_en),
    .rdata(rdata),
    .cpu_irq(cpu_irq),
    .ready(ready)
);


initial begin 
	clk = 1'b0;
	#10;
	clk = 1'b1;
	#10;
end

initial
begin
    clk = 0;
    rst_n = 0;
    irq_in = 0;
    addr = 0;
    wdata = 0;
    write_en = 0;
    read_en = 0;

    #10 rst_n = 1;

    #10;
    addr = 8'h04;
    wdata = 32'h00000003;
    write_en = 1;
    #10 write_en = 0;

    #10 irq_in = 8'b00000001;
    #10 irq_in = 8'b00000000;
    
    #10;
    addr = 8'h00;
    read_en = 1;
    #10 read_en = 0;
    
    #10;
    addr = 8'h08;
    read_en = 1;
    #10 read_en = 0;

    #10;
    addr = 8'h0C;
    wdata = 32'h00000001;
    write_en = 1;
    #10 write_en = 0;

    #20 $finish;#100;
end

initial
begin
    $monitor("Time=%0t irq_in=%b pending=%h cpu_irq=%b",
              $time, irq_in, dut.irq_pending, cpu_irq);
end
initial begin
	$dumpfile("tb.vcd");
	$dumpvars(0,tb_interrupt_controller);
end

endmodule
