module Cau3 (
    input CLOCK_50,
    input [0:0] KEY, // Reset 
    input [1:1] KEY_START, // Bắt đầu
    input [2:0] SW,
    output reg LEDR0
);
    wire en;
	 // đếm 0.5s -> 1.5s = 3 lần 0.5s liên tục
    pulse_05s timer_inst (
        .clk(CLOCK_50),
        .rst_n(KEY[0]),
        .pulse(en)
    );

    //States
    localparam Wait = 1'b0;
    localparam Send = 1'b1;

    reg state;
    reg [11:0] shift_reg;
    reg [3:0] bit_count;
    reg [3:0] max_bits;

    // Morse qua bit dài = 111, ngắn = 1
    always @(*) begin
        case(SW)
            3'b000: begin shift_reg = 12'b101110000000; max_bits = 5;  end // A: .- 	(1 0 111)
            3'b001: begin shift_reg = 12'b111010101000; max_bits = 9;  end // B: -...	(111 0 1 0 1 0 1)
            3'b010: begin shift_reg = 12'b111010111010; max_bits = 11; end // C: -.-.	(111 0 111 0 1)	
            3'b011: begin shift_reg = 12'b111010100000; max_bits = 7;  end // D: -..	(111 0 1 0 1)
            3'b100: begin shift_reg = 12'b100000000000; max_bits = 1;  end // E: .		(1)
            3'b101: begin shift_reg = 12'b101011101000; max_bits = 9;  end // F: ..-.	(1 0 1 0 111 0 1)
            3'b110: begin shift_reg = 12'b111011101000; max_bits = 9;  end // G: --.	(111 0 111 0 1)
            3'b111: begin shift_reg = 12'b101010100000; max_bits = 7;  end // H: ....	(1 0 1 0 1 0 1)
            default:begin shift_reg = 12'b000000000000; max_bits = 0;  end
        endcase
    end

    reg [11:0] curr_morse;

    always @(posedge CLOCK_50 or negedge KEY[0]) begin
        if (!KEY[0]) begin
            state <= Wait;
            LEDR0 <= 0;
            bit_count <= 0;
        end else begin
            case (state)
                Wait: begin
                    LEDR0 <= 0;
                    bit_count <= 0;
                    if (!KEY_START[1]) begin 
                        curr_morse <= shift_reg;
                        state <= Send;
                    end
                end

                Send: begin
                    if (en) begin
                        if (bit_count == max_bits) begin 
                            state <= Wait;
                        end else begin
                            LEDR0 <= curr_morse[11]; 
                            curr_morse <= {curr_morse[10:0], 1'b0};
                            bit_count <= bit_count + 1;
                        end
                    end
                end
            endcase
        end
    end
endmodule