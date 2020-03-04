library verilog;
use verilog.vl_types.all;
entity Reg64 is
    port(
        D               : in     vl_logic_vector(63 downto 0);
        clock           : in     vl_logic;
        clear           : in     vl_logic;
        load            : in     vl_logic;
        Q               : out    vl_logic_vector(63 downto 0)
    );
end Reg64;
