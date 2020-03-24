library verilog;
use verilog.vl_types.all;
entity SelectEncode is
    port(
        RinOut          : out    vl_logic_vector(15 downto 0);
        RoutOut         : out    vl_logic_vector(15 downto 0);
        c_sign_extended : out    vl_logic_vector(31 downto 0);
        IRin            : in     vl_logic_vector(31 downto 0);
        Rin             : in     vl_logic;
        Rout            : in     vl_logic;
        BAout           : in     vl_logic;
        GRA             : in     vl_logic;
        GRB             : in     vl_logic;
        GRC             : in     vl_logic
    );
end SelectEncode;
