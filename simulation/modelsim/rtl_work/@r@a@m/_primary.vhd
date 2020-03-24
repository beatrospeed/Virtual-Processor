library verilog;
use verilog.vl_types.all;
entity RAM is
    port(
        RAMout          : out    vl_logic_vector(31 downto 0);
        clock           : in     vl_logic;
        read            : in     vl_logic;
        write           : in     vl_logic;
        data            : in     vl_logic_vector(31 downto 0);
        Address         : in     vl_logic_vector(31 downto 0)
    );
end RAM;
