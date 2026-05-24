library verilog;
use verilog.vl_types.all;
entity sram_interface is
    port(
        SW17            : in     vl_logic;
        SW18            : in     vl_logic;
        SW              : in     vl_logic_vector(15 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        SRAM_DQ         : inout  vl_logic_vector(15 downto 0);
        SRAM_ADDR       : out    vl_logic_vector(17 downto 0);
        SRAM_CE_N       : out    vl_logic;
        SRAM_OE_N       : out    vl_logic;
        SRAM_WE_N       : out    vl_logic;
        SRAM_LB_N       : out    vl_logic;
        SRAM_UB_N       : out    vl_logic
    );
end sram_interface;
