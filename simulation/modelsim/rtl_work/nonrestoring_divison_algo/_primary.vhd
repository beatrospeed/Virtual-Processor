library verilog;
use verilog.vl_types.all;
entity nonrestoring_divison_algo is
    port(
        quotient        : out    vl_logic_vector(31 downto 0);
        remainder       : out    vl_logic_vector(31 downto 0);
        m               : in     vl_logic_vector(31 downto 0);
        q               : in     vl_logic_vector(31 downto 0)
    );
end nonrestoring_divison_algo;
