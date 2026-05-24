`timescale 1ns/1ps

module tb_Datapath();
    reg         clk;
    reg         rst_n;
    reg  [31:0] Instruction;

    wire [31:0] ALU_Out_Debug;
    wire [31:0] WriteDataReg_Debug;
    wire [31:0] MemWriteData_Debug;

    Datapath dut (
        .clk(clk),
        .rst_n(rst_n),
        .Instruction(Instruction),
        .ALU_Out_Debug(ALU_Out_Debug),
        .WriteDataReg_Debug(WriteDataReg_Debug),
        .MemWriteData_Debug(MemWriteData_Debug)
    );

    initial begin
        clk = 0; //Fmax=71.4mHz -> T = 14ns
        forever #10 clk = ~clk; 
    end

    initial begin
        rst_n = 0; // 
        Instruction = 32'b0;
        #20; 
        rst_n = 1;

        @(posedge clk); 

        Instruction = {6'b001000, 5'd0, 5'd2, 16'd10}; 
        #20;
        @(posedge clk); 
        
        Instruction = {6'b001000, 5'd0, 5'd3, 16'd40}; 
        #20; 
        @(posedge clk);

        Instruction = {6'b000001, 5'd2, 5'd3, 5'd1, 5'd0, 6'd0}; // ADD $1, $2, $3
        #20; 
        $display("[ADD] Ket qua cua ALU = %0d", ALU_Out_Debug);
        
        @(posedge clk); 

        Instruction = {6'b000010, 5'd2, 5'd1, 16'd0}; // SW $1, 0($2)
        #20;
        $display("SW] Du lieu day vao RAM = %0d", MemWriteData_Debug);
        @(posedge clk);


        Instruction = {6'b000100, 5'd2, 5'd4, 16'd0}; // LW $4, 0($2)
        #20;
        $display("LW] Du lieu doc tu RAM ra = %0d", WriteDataReg_Debug);
        @(posedge clk);
        #20 $stop; 
    end
endmodule