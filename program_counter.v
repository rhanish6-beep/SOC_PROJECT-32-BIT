module program_counter (
    input  wire        clk,
    input  wire        rstn,          
    input  wire        pc_en,        
    input  wire        branch_en,    
    input  wire [15:0] branch_target,
    output reg  [15:0] pc_out       
);

always @(posedge clk or negedge rstn) begin
    if (!rstn)
        pc_out <= 16'h0000;
    else if (!pc_en)
        pc_out <= pc_out;            
    else if (branch_en)
        pc_out <= branch_target;     
    else
        pc_out <= pc_out + 16'd1;    
end

endmodule
