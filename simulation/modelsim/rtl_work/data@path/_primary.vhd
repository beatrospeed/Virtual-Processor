library verilog;
use verilog.vl_types.all;
entity dataPath is
    port(
        PCout           : in     vl_logic;
        Zlowout         : in     vl_logic;
        MDRout          : in     vl_logic;
        R2out           : in     vl_logic;
        R4out           : in     vl_logic;
        MARin           : in     vl_logic;
        Z_in            : in     vl_logic;
        PCin            : in     vl_logic;
        MDRin           : in     vl_logic;
        IRin            : in     vl_logic;
        Y_in            : in     vl_logic;
        IncPc           : in     vl_logic;
        load            : in     vl_logic;
        control         : in     vl_logic_vector(3 downto 0);
        R5in            : in     vl_logic_vector(3 downto 0);
        R2in            : in     vl_logic_vector(3 downto 0);
        R4in            : in     vl_logic_vector(3 downto 0);
        clk             : in     vl_logic_vector(3 downto 0);
        Mdatain         : in     vl_logic_vector(31 downto 0)
    );
end dataPath;
