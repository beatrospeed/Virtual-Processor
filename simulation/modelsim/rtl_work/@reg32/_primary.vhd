library verilog;
use verilog.vl_types.all;
entity Reg32 is
    port(
        D               : in     vl_logic_vector(31 downto 0);
        clock           : in     vl_logic;
        clear           : in     vl_logic;
        load            : in     vl_logic;
        Q               : out    vl_logic_vector(31 downto 0)
    );
end Reg32;
