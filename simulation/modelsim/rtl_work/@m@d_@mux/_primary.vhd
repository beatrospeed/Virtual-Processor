library verilog;
use verilog.vl_types.all;
entity MD_Mux is
    port(
        Output          : out    vl_logic_vector(31 downto 0);
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        C               : in     vl_logic_vector(31 downto 0);
        D               : in     vl_logic_vector(31 downto 0);
        \Select\        : in     vl_logic_vector(1 downto 0)
    );
end MD_Mux;
