library verilog;
use verilog.vl_types.all;
entity encoder_32_to_5 is
    port(
        SelectOut       : out    vl_logic_vector(4 downto 0);
        R0out           : in     vl_logic;
        R1out           : in     vl_logic;
        R2out           : in     vl_logic;
        R3out           : in     vl_logic;
        R4out           : in     vl_logic;
        R5out           : in     vl_logic;
        R6out           : in     vl_logic;
        R7out           : in     vl_logic;
        R8out           : in     vl_logic;
        R9out           : in     vl_logic;
        R10out          : in     vl_logic;
        R11out          : in     vl_logic;
        R12out          : in     vl_logic;
        R13out          : in     vl_logic;
        R14out          : in     vl_logic;
        R15out          : in     vl_logic;
        HIout           : in     vl_logic;
        LOout           : in     vl_logic;
        Zhighout        : in     vl_logic;
        Zlowout         : in     vl_logic;
        PCout           : in     vl_logic;
        MDRout          : in     vl_logic;
        In_Portout      : in     vl_logic;
        Cout            : in     vl_logic;
        in24            : in     vl_logic;
        in25            : in     vl_logic;
        in26            : in     vl_logic;
        in27            : in     vl_logic;
        in28            : in     vl_logic;
        in29            : in     vl_logic;
        in30            : in     vl_logic;
        in31            : in     vl_logic
    );
end encoder_32_to_5;
