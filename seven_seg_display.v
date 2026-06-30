module seven_seg_display (
    input  [15:0] data_in,
    output [7:0] seg3,
    output [7:0] seg2,
    output [7:0] seg1,
    output [7:0] seg0
);

    function [7:0] seg_encode;
        input [3:0] nibble;
        begin
            case (nibble)
                4'h0: seg_encode = 8'b00111111; 
                4'h1: seg_encode = 8'b00000110; 
                4'h2: seg_encode = 8'b01011011; 
                4'h3: seg_encode = 8'b01001111; 
                4'h4: seg_encode = 8'b01100110; 
                4'h5: seg_encode = 8'b01101101; 
                4'h6: seg_encode = 8'b01111101; 
                4'h7: seg_encode = 8'b00000111; 
                4'h8: seg_encode = 8'b01111111; 
                4'h9: seg_encode = 8'b01101111; 
                4'hA: seg_encode = 8'b01110111; 
                4'hB: seg_encode = 8'b01111100; 
                4'hC: seg_encode = 8'b00111001; 
                4'hD: seg_encode = 8'b01011110; 
                4'hE: seg_encode = 8'b01111001; 
                4'hF: seg_encode = 8'b01110001; 
                default: seg_encode = 8'b00000000;
            endcase
        end
    endfunction

    assign seg3 = seg_encode(data_in[15:12]);
    assign seg2 = seg_encode(data_in[11:8]);
    assign seg1 = seg_encode(data_in[7:4]);
    assign seg0 = seg_encode(data_in[3:0]);

endmodule

