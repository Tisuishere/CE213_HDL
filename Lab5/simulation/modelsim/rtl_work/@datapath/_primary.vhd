library verilog;
use verilog.vl_types.all;
entity Datapath is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        Instruction     : in     vl_logic_vector(31 downto 0);
        ALU_Out_Debug   : out    vl_logic_vector(31 downto 0);
        WriteDataReg_Debug: out    vl_logic_vector(31 downto 0);
        MemWriteData_Debug: out    vl_logic_vector(31 downto 0)
    );
end Datapath;
