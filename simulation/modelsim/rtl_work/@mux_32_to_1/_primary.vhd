library verilog;
use verilog.vl_types.all;
entity Mux_32_to_1 is
    port(
        BusMuxOut       : out    vl_logic_vector(31 downto 0);
        R0in            : in     vl_logic;
        R1in            : in     vl_logic;
        R2in            : in     vl_logic;
        R3in            : in     vl_logic;
        R4in            : in     vl_logic;
        R5in            : in     vl_logic;
        R6in            : in     vl_logic;
        R7in            : in     vl_logic;
        R8in            : in     vl_logic;
        R9in            : in     vl_logic;
        R10in           : in     vl_logic;
        R11in           : in     vl_logic;
        R12in           : in     vl_logic;
        R13in           : in     vl_logic;
        R14in           : in     vl_logic;
        R15in           : in     vl_logic;
        HIoutin         : in     vl_logic;
        LOoutin         : in     vl_logic;
        Zhighoutin      : in     vl_logic;
        Zlowoutin       : in     vl_logic;
        PCoutin         : in     vl_logic;
        MDRoutin        : in     vl_logic;
        In_Portoutin    : in     vl_logic;
        Coutin          : in     vl_logic;
        Selectin        : in     vl_logic_vector(4 downto 0)
    );
end Mux_32_to_1;
