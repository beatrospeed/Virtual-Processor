library verilog;
use verilog.vl_types.all;
entity two_to_one_mux is
    port(
        \out\           : out    vl_logic_vector(31 downto 0);
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        control         : in     vl_logic
    );
end two_to_one_mux;
