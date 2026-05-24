`timescale 1ns / 1ps

module tb_ALU_32bit();
    reg signed [31:0] A;
    reg signed [31:0] B;
    reg M, S1, S0;
    wire signed [31:0] Out;
    wire Overflow;
    wire [2:0] opcode = {M, S1, S0};

    ALU_32bit uut (
        .A(A), 
        .B(B), 
        .M(M), 
        .S1(S1), 
        .S0(S0), 
        .Out(Out), 
        .Overflow(Overflow)
    );

    initial begin
        $monitor("Time=%0t | Op=%b | A=%d | B=%d | Out=%d | Ov=%b", 
                 $time, opcode, A, B, Out, Overflow);
    end

    initial begin
        A = 32'd0; B = 32'd0; M = 0; S1 = 0; S0 = 0;
        #10;

        $display("\n--- Logical Operations ---");
        A = 32'h0000FFFF; B = 32'h55555555;
        
        {M, S1, S0} = 3'b000; #10; // NOT A
        {M, S1, S0} = 3'b001; #10; // A AND B
        {M, S1, S0} = 3'b010; #10; // A XOR B
        {M, S1, S0} = 3'b011; #10; // A OR B

        $display("\n--- Arithmetic Operations ---");

	// 100 - 1 = 99
        A = 32'd100;
        {M, S1, S0} = 3'b100; #100;

        // 15 + 25 = 40
        A = 32'd15; B = 32'd25;
        {M, S1, S0} = 3'b101; #100; 

        // 100 - 40 = 60
        A = 32'd100; B = 32'd40;
        {M, S1, S0} = 3'b110; #100;

        // 99 + 1 = 100
        A = 32'd99;
        {M, S1, S0} = 3'b111; #100;

        $display("\n--- Overflow Testing ---");
        //Ktra overflow 
        A = 32'b10000000_00000000_00000000_00000000; 
        {M, S1, S0} = 3'b100; #10; 

        A = 32'b01111111_11111111_11111111_11111111; 
        B = 32'd1;
        {M, S1, S0} = 3'b101; #10; 

        A = 32'b10000000_00000000_00000000_00000000; 
        B = 32'd1;
        {M, S1, S0} = 3'b110; #10; 

        A = 32'b01111111_11111111_11111111_11111111;
        {M, S1, S0} = 3'b111; #10;	

        $display("\n--- Finished ---");
        $stop; 
    end
endmodule