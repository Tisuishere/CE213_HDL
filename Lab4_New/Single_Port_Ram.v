module Single_Port_Ram (
    input wire clock,          
    input wire cs,             
    input wire wr_e,           
    input wire oe,             
    input wire [6:0] addr,     
    inout wire [7:0] data      
);

    reg [7:0] ram [0:127];
    reg [7:0] data_reg;

    always @(posedge clock) begin
        if (cs) begin
            if (wr_e) begin
                ram[addr] <= data;
            end
            else begin
                data_reg <= ram[addr];
            end
        end
    end
    assign data = (cs && !wr_e && oe) ? data_reg : 8'hzz;

endmodule