library verilog;
use verilog.vl_types.all;
entity Dual_Port_Ram is
    port(
        clk             : in     vl_logic;
        Address         : in     vl_logic_vector(9 downto 0);
        WriteData       : in     vl_logic_vector(31 downto 0);
        WriteEn         : in     vl_logic;
        ReadEn          : in     vl_logic;
        ReadData        : out    vl_logic_vector(31 downto 0)
    );
end Dual_Port_Ram;
