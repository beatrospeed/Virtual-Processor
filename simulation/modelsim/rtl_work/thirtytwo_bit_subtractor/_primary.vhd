library verilog;
use verilog.vl_types.all;
entity thirtytwo_bit_subtractor is
    port(
        \out\           : out    vl_logic_vector(31 downto 0);
        num1            : in     vl_logic_vector(31 downto 0);
        num2            : in     vl_logic_vector(31 downto 0)
    );
end thirtytwo_bit_subtractor;
