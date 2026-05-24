`timescale 1ns/1ps
module tb_Single_Port_Ram();
    reg clock, cs, wr_e, oe;
    reg [6:0] addr;
    wire [7:0] data;
    reg [7:0] data_in; 

    Single_Port_Ram uut (
        .clock(clock), .cs(cs), .wr_e(wr_e), .oe(oe), .addr(addr), .data(data)
    );

    assign data = (cs && wr_e) ? data_in : 8'hzz;

    always #5 clock = ~clock;

    initial begin
        clock = 0; cs = 0; wr_e = 0; oe = 0; addr = 0; data_in = 0;
        #15; 

        //Ghi du lieu
        cs = 1; wr_e = 1; 
        
        addr = 7'h01; data_in = 8'hAA; #10; 
        addr = 7'h02; data_in = 8'hBB; #10; 
        addr = 7'h05; data_in = 8'hCC; #10; 
        wr_e = 0; //Dung ghi
        #10;

        //Doc du lieu
        oe = 1; 
        
        addr = 7'h01; #10; 
        addr = 7'h02; #10; 
        addr = 7'h05; #10;
        
        #20;
        $stop; 
    end
endmodule