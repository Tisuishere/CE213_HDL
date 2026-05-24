`timescale 1ns/1ps

module tb_counter_lab5_SelfCheck();
    reg clock, reset_n, enable, up_down;
    wire [3:0] q_out;
    
    reg [3:0] expected_q;
    integer i; 
    integer error_count = 0;

    counter_lab5 dut (
        .clock(clock),
        .reset_n(reset_n),
        .enable(enable),
        .up_down(up_down),
        .q_out(q_out)
    );

    initial clock = 0;
    always #5 clock = ~clock;

    task check_result;
        begin
            @(negedge clock); 
            if (q_out !== expected_q) begin
                $display("[LOI] Tai %t: Ky vong = %d, Thuc te = %d", $time, expected_q, q_out);
                error_count = error_count + 1;
            end
        end
    endtask

    initial begin
        reset_n = 0; enable = 0; up_down = 1; expected_q = 0;
        #5 reset_n = 1;
        enable = 1;      
        $display("Self Checking");

        $display("Dem len");
        up_down = 1;
        repeat (16) begin
            expected_q = expected_q + 1'b1; // +1
            check_result();
        end

        $display("Dem xuong");
        up_down = 0;
        repeat (16) begin
            expected_q = expected_q - 1'b1; // -1
            check_result();
        end

        $display("Kiem tra song song");
        for (i = 0; i < 13; i = i + 1) begin
            if (i < 5) begin
                up_down = 1;
                expected_q = expected_q + 1'b1;
            end 
            else begin
                up_down = 0;
                expected_q = expected_q - 1'b1;
            end
            
            check_result(); 
        end

        if (error_count == 0) begin
            $display("---------------------------");
            $display("Mach chay dung kich ban!");
            $display("---------------------------");
        end else begin
            $display("---------------------------");
            $display("Phat hien %d loi!", error_count);
            $display("---------------------------");
        end
        $stop;
    end
endmodule