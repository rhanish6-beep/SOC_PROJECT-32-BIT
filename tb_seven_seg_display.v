module tb_seven_seg_display;

    reg  [15:0] data_in;
    wire [7:0] seg3, seg2, seg1, seg0;
    seven_seg_display uut (
        .data_in(data_in),
        .seg3(seg3),
        .seg2(seg2),
        .seg1(seg1),
        .seg0(seg0)
    );

    initial begin

        $display("Time\tdata_in\t\tseg3\t\tseg2\t\tseg1\t\tseg0");

        data_in = 16'h1234;
        #10;
        $display("%0t\t%h\t%b\t%b\t%b\t%b",
                 $time, data_in, seg3, seg2, seg1, seg0);

        data_in = 16'hABCD;
        #10;
        $display("%0t\t%h\t%b\t%b\t%b\t%b",
                 $time, data_in, seg3, seg2, seg1, seg0);

        data_in = 16'hFFFF;
        #10;
        $display("%0t\t%h\t%b\t%b\t%b\t%b",
                 $time, data_in, seg3, seg2, seg1, seg0);

        data_in = 16'h0000;
        #10;
        $display("%0t\t%h\t%b\t%b\t%b\t%b",
                 $time, data_in, seg3, seg2, seg1, seg0);

        data_in = 16'h5A3F;
        #10;
        $display("%0t\t%h\t%b\t%b\t%b\t%b",
                 $time, data_in, seg3, seg2, seg1, seg0);

        $finish;
    end

initial begin 
	$dumpfile("tb.vcd");
	$dumpvars(0,tb_seven_seg_display);
end
endmodule
