module ALU_Control (
    input  wire [1:0] ALUOp,
    output reg  [3:0] ALUcontrol
);
    always @(*) begin
        ALUcontrol = 4'b0000;

        case (ALUOp)
            2'b00: begin
                ALUcontrol = 4'b0101; 
            end
            
            2'b10: begin
                ALUcontrol = 4'b0101; 
            end
            
            default: begin
                ALUcontrol = 4'b0000;
            end
        endcase
    end
endmodule
