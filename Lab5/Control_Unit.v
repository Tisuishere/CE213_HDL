module Control_Unit (
    input  wire [5:0] Opcode,
    output reg        RegDst,
    output reg        ALUSrc,
    output reg        MemToReg,
    output reg        RegWrite,
    output reg        MemRead,
    output reg        MemWrite,
    output reg  [1:0] ALUOp
);
    always @(*) begin
        RegDst   = 1'b0;
        ALUSrc   = 1'b0;
        MemToReg = 1'b0;
        RegWrite = 1'b0;
        MemRead  = 1'b0;
        MemWrite = 1'b0;
        ALUOp    = 2'b00;

        case(Opcode)
            6'b000001: begin //add 
                RegDst   = 1'b1; 
                ALUSrc   = 1'b0; 
                MemToReg = 1'b0; 
                RegWrite = 1'b1; 
                MemRead  = 1'b0; 
                MemWrite = 1'b0; 
                ALUOp    = 2'b10;
            end
            6'b000010: begin //sw 
                RegDst   = 1'b0; 
                ALUSrc   = 1'b1; 
                MemToReg = 1'b0; 
                RegWrite = 1'b0; 
                MemRead  = 1'b0; 
                MemWrite = 1'b1; 
                ALUOp    = 2'b00;
            end
            6'b000100: begin //lw
                RegDst   = 1'b0; 
                ALUSrc   = 1'b1; 
                MemToReg = 1'b1; 
                RegWrite = 1'b1; 
                MemRead  = 1'b1; 
                MemWrite = 1'b0; 
                ALUOp    = 2'b00;
            end
				6'b001000: begin // addi 
                RegDst   = 1'b0; 
                ALUSrc   = 1'b1; 
                MemToReg = 1'b0; 
                RegWrite = 1'b1; 
                MemRead  = 1'b0; 
                MemWrite = 1'b0; 
                ALUOp    = 2'b00;
            end
        endcase
    end
endmodule
