library verilog;
use verilog.vl_types.all;
entity thirtytwo_bit_twos_complement is
    port(
        complement      : out    vl_logic_vector(31 downto 0);
        num             : in     vl_logic_vector(31 downto 0)
    );
end thirtytwo_bit_twos_complement;
