module tb_program_counter;

reg         clk;
reg         rstn;
reg         pc_en;
reg         branch_en;
reg  [15:0] branch_target;
wire [15:0] pc_out;

program_counter dut (
    .clk(clk),
    .rstn(rstn),
    .pc_en(pc_en),
    .branch_en(branch_en),
    .branch_target(branch_target),
    .pc_out(pc_out)
);

always #5 clk = ~clk;

initial begin
  
    clk = 0;
    rstn = 0;
    pc_en = 0;
    branch_en = 0;
    branch_target = 16'h0000;

     #12 rstn = 1;
     pc_en = 1;
      #30;

     branch_target = 16'h0010;
    branch_en = 1;
    #10;
    branch_en = 0;
     #20;

    pc_en = 0;;

    #20;
    pc_en = 1;
    #20;

    $finish; #100;
end

initial begin
    $monitor("Time=%0t rstn=%b pc_en=%b branch_en=%b branch_target=%h pc_out=%h",
              $time, rstn, pc_en, branch_en, branch_target, pc_out);

     $dumpfile("tb.vcd");
    $dumpvars(0, tb_program_counter);

end

endmodule
