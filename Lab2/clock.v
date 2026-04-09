module clock (CLK, SW, KEY, H2, H3, H4, H5, H6, H7,LEDR);
    input CLK;       
    input [16:0] SW;      
    input [0:0] KEY;      
    output [6:0] H2, H3, H4, H5, H6, H7;
    output [0:0] LEDR;     

    wire clk_1s;
    reg [5:0] sec, min;
    reg [4:0] hour;
    
    delay_1s d1 (CLK, KEY[0], clk_1s);

    wire error = (SW[16:12] > 8'd23) || (SW[11:6] > 8'd59) || (SW[5:0] > 8'd59);
    assign LEDR[0] = error; 

    always @(posedge CLK or negedge KEY[0]) begin
        if (!KEY[0]) begin
            if (!error) begin
                hour <= SW[16:12]; 
                min  <= SW[11:6];  
                sec  <= SW[5:0];
            end
        end 
        else if (clk_1s) begin
            if (sec == 6'd59) begin
                sec <= 6'd0;
                if (min == 6'd59) begin
                    min <= 6'd0;
                    if (hour == 5'd23) hour <= 5'd0;
                    else hour <= hour + 1'b1;
                end else min <= min + 1'b1;
            end else sec <= sec + 1'b1;
        end
    end
	 // giây
    bcd_to_led7 s_ones (sec % 10, H2);
    bcd_to_led7 s_tens (sec / 10, H3);
	 // phút
    bcd_to_led7 m_ones (min % 10, H4);
    bcd_to_led7 m_tens (min / 10, H5);
	 // giờ
    bcd_to_led7 h_ones (hour % 10, H6);
    bcd_to_led7 h_tens (hour / 10, H7);

endmodule