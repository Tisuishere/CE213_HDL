`timescale 1ns/1ps

module tb_Counter_lab5();
    reg clock, reset_n, enable, up_down;
    wire [3:0] q_out;

    counter_lab5 dut (
        .clock(clock),
        .reset_n(reset_n),
        .enable(enable),
        .up_down(up_down),
        .q_out(q_out)
    );

    initial clock = 0;
    always #5 clock = ~clock;

    initial begin
        reset_n = 0; enable = 0; up_down = 1;
	#5;
	reset_n = 1;
        enable = 1;      

        up_down = 1;
        repeat (16) @(posedge clock); 

        up_down = 0;
        repeat (16) @(posedge clock);

        up_down = 1;
        repeat (5) @(posedge clock);

        up_down = 0;
        repeat (8) @(posedge clock);
		
        $stop;
    end
endmodule