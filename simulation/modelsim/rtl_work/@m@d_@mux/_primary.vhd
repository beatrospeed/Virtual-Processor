library verilog;
use verilog.vl_types.all;
entity MD_Mux is
    port(
        Output          : out    vl_logic;
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        \Select\        : in     vl_logic
    );
end MD_Mux;
