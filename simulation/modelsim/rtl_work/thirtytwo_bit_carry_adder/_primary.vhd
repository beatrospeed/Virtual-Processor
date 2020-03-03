library verilog;
use verilog.vl_types.all;
entity thirtytwo_bit_carry_adder is
    port(
        sum             : out    vl_logic_vector(31 downto 0);
        x               : in     vl_logic_vector(31 downto 0);
        y               : in     vl_logic_vector(31 downto 0);
        c_0             : in     vl_logic
    );
end thirtytwo_bit_carry_adder;
