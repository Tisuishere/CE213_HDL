module ALU_32bit(A, B, M, S1, S0, Out, Overflow);
    input signed [31:0] A; 
    input signed [31:0] B;
    input M, S1, S0;
    output reg signed [31:0] Out;
    output reg Overflow;

    wire [2:0] opcode = {M, S1, S0};

    always @(*) begin
        Out = 32'd0;
        Overflow = 1'b0;
        case(opcode)
            3'b000: Out = ~A; // Not   
            3'b001: Out = A & B; // And        
            3'b010: Out = A ^ B; // Xor        
            3'b011: Out = A | B; // Or        
            
            3'b100: begin                 
                Out = A - 1; // Tr? 1
                Overflow = (A[31] == 1'b1 && Out[31] == 1'b0);
            end
            
            3'b101: begin                 
                Out = A + B; // A+B
                Overflow = (A[31] == B[31] && Out[31] != A[31]);
            end
            
            3'b110: begin                 
                Out = A - B; // A-B
                Overflow = (A[31] != B[31] && Out[31] != A[31]);
            end
            
            3'b111: begin                 
                Out = A + 1; // C?ng 1
                Overflow = (A[31] == 1'b0 && Out[31] == 1'b1);
            end
            default: begin
                Out = 32'd0;
                Overflow = 1'b0;
            end
        endcase
    end
endmodule
