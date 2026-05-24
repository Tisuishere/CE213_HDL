module Datapath (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] Instruction,
	 output wire [31:0] ALU_Out_Debug,
    output wire [31:0] WriteDataReg_Debug,
    output wire [31:0] MemWriteData_Debug
);
    wire [5:0]  opcode = Instruction[31:26];
    wire [4:0]  rs     = Instruction[25:21];
    wire [4:0]  rt     = Instruction[20:16];
    wire [4:0]  rd     = Instruction[15:11];
    wire [15:0] imm    = Instruction[15:0];

    wire RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite;
    wire [1:0] ALUOp;
    
    Control_Unit cu (
        .Opcode(opcode),
        .RegDst(RegDst), .ALUSrc(ALUSrc), .MemToReg(MemToReg),
        .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite),
        .ALUOp(ALUOp)
    );

    wire [3:0] ALUcontrol;
    ALU_Control alu_ctrl (
        .ALUOp(ALUOp),
        .ALUcontrol(ALUcontrol)
    );

    wire [4:0] WriteRegister = (RegDst) ? rd : rt;
    wire [31:0] WriteDataReg; 
    wire [31:0] ReadData1, ReadData2;

    RegisterFile rf (
        .clk(clk), .rst_n(rst_n),
        .ReadAddress1(rs), .ReadAddress2(rt), .WriteAddress(WriteRegister),
        .WriteData(WriteDataReg), .WriteEn(RegWrite),
        .ReadData1(ReadData1), .ReadData2(ReadData2)
    );

    wire [31:0] SignExtImm = {{16{imm[15]}}, imm}; 
    wire [31:0] ALU_InB    = (ALUSrc) ? SignExtImm : ReadData2;

    wire [31:0] ALU_Result;
    wire Overflow;
    
    ALU_32bit alu (
        .A(ReadData1), .B(ALU_InB),
        .M(ALUcontrol[2]), .S1(ALUcontrol[1]), .S0(ALUcontrol[0]), 
        .Out(ALU_Result), .Overflow(Overflow)
    );

    wire [31:0] ReadDataMem_32bit; 
    Dual_Port_Ram dmem (
        .clk(clk),
        .Address(ALU_Result[9:0]),      
        .WriteData(ReadData2),         
        .WriteEn(MemWrite),
        .ReadEn(MemRead),
        .ReadData(ReadDataMem_32bit)   
    );

    assign WriteDataReg = (MemToReg) ? ReadDataMem_32bit : ALU_Result;
	 assign ALU_Out_Debug      = ALU_Result;        
    assign WriteDataReg_Debug = WriteDataReg;      
    assign MemWriteData_Debug = ReadData2;

endmodule
