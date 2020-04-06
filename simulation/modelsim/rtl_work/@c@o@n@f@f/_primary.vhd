library verilog;
use verilog.vl_types.all;
entity CONFF is
    port(
        busContents     : in     vl_logic_vector(31 downto 0);
        IR              : in     vl_logic_vector(31 downto 0);
        CONin           : in     vl_logic;
        q               : out    vl_logic
    );
end CONFF;
