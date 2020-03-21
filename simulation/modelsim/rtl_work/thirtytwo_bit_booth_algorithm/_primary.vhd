library verilog;
use verilog.vl_types.all;
entity thirtytwo_bit_booth_algorithm is
    port(
        \out\           : out    vl_logic_vector(63 downto 0);
        m               : in     vl_logic_vector(31 downto 0);
        q               : in     vl_logic_vector(31 downto 0)
    );
end thirtytwo_bit_booth_algorithm;
