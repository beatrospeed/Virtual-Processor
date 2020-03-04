library verilog;
use verilog.vl_types.all;
entity four_to_one_mux is
    port(
        \out\           : out    vl_logic_vector(31 downto 0);
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        c               : in     vl_logic_vector(31 downto 0);
        d               : in     vl_logic_vector(31 downto 0);
        control         : in     vl_logic_vector(1 downto 0)
    );
end four_to_one_mux;
