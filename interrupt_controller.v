module interrupt_controller (
    input clk,
    input rst_n,
    input [7:0] irq_in,
    input [7:0] addr,
    input [31:0] wdata,
    input write_en,
    input read_en,
    output reg [31:0] rdata,
    output cpu_irq,
    output ready
);

reg [7:0] irq_pending;
reg [7:0] irq_enable;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        irq_pending <= 8'b0;
    else
    begin
        irq_pending <= irq_pending | irq_in;

        if(write_en && addr == 8'h0C)
            irq_pending <= irq_pending & ~wdata[7:0];
    end
end

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        irq_enable <= 8'b0;
    else if(write_en && addr == 8'h04)
        irq_enable <= wdata[7:0];
end

always @(*)
begin
    if(read_en)
    begin
        case(addr)
            8'h00: rdata = {24'b0, irq_pending};                 
            8'h04: rdata = {24'b0, irq_enable};                  
            8'h08: rdata = {24'b0, (irq_pending & irq_enable)};  
            default: rdata = 32'b0;
        endcase
    end
    else
        rdata = 32'b0;
end

assign cpu_irq = |(irq_pending & irq_enable);

assign ready = 1'b1;

endmodule
