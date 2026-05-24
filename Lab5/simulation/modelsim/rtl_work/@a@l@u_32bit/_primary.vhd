library verilog;
use verilog.vl_types.all;
entity ALU_32bit is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        M               : in     vl_logic;
        S1              : in     vl_logic;
        S0              : in     vl_logic;
        \Out\           : out    vl_logic_vector(31 downto 0);
        Overflow        : out    vl_logic
    );
end ALU_32bit;
