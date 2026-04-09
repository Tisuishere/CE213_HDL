module ALU_32bit(
    input signed [31:0] A,
    input signed [31:0] B,
    input M, S1, S0,
    output reg signed [31:0] Result,
    output reg add_sub_overflow
);

    wire [2:0] opcode = {M, S1, S0};

    always @(*) begin
        Result = 32'd0;
        add_sub_overflow = 1'b0;

        case(opcode)
            3'b000: Result = ~A;          // Complement A
            3'b001: Result = A & B;       // AND
            3'b010: Result = A ^ B;       // EX-OR
            3'b011: Result = A | B;       // OR
            
            3'b100: begin                 // Decrement A (A - 1)
                Result = A - 1;
                // (100...0) trừ 1 thành số dương lớn nhất (011...1)
                add_sub_overflow = (A[31] == 1'b1 && Result[31] == 1'b0);
            end
            
            3'b101: begin                 // Add (A + B)
                Result = A + B;
                // Tràn số khi A, B cùng dấu nhưng kết quả lại ngược dấu với A
                add_sub_overflow = (A[31] == B[31] && Result[31] != A[31]);
            end
            
            3'b110: begin                 // Subtract (A - B)
                Result = A - B;
                // Tràn số khi A, B khác dấu và kết quả có dấu ngược với A
                add_sub_overflow = (A[31] != B[31] && Result[31] != A[31]);
            end
            
            3'b111: begin                 // Increment A (A + 1)
                Result = A + 1;
                // (011...1) cộng 1 thành (100...0)
                add_sub_overflow = (A[31] == 1'b0 && Result[31] == 1'b1);
            end
            
            default: begin
                Result = 32'd0;
                add_sub_overflow = 1'b0;
            end
        endcase
    end

endmodule