library verilog;
use verilog.vl_types.all;
entity sixteen_bit_carry_adder is
    port(
        sum             : out    vl_logic_vector(15 downto 0);
        g               : out    vl_logic;
        p               : out    vl_logic;
        x               : in     vl_logic_vector(15 downto 0);
        y               : in     vl_logic_vector(15 downto 0);
        c_0             : in     vl_logic
    );
end sixteen_bit_carry_adder;
