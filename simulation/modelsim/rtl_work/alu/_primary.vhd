library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        z_high          : out    vl_logic_vector(31 downto 0);
        z_low           : out    vl_logic_vector(31 downto 0);
        reg1            : in     vl_logic_vector(31 downto 0);
        reg2            : in     vl_logic_vector(31 downto 0);
        control         : in     vl_logic_vector(3 downto 0);
        inc_pc          : in     vl_logic;
        Clk             : in     vl_logic
    );
end alu;
