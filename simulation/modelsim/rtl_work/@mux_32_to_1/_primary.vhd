library verilog;
use verilog.vl_types.all;
entity Mux_32_to_1 is
    port(
        BusMuxOut       : out    vl_logic_vector(31 downto 0);
        R0in            : in     vl_logic_vector(31 downto 0);
        R1in            : in     vl_logic_vector(31 downto 0);
        R2in            : in     vl_logic_vector(31 downto 0);
        R3in            : in     vl_logic_vector(31 downto 0);
        R4in            : in     vl_logic_vector(31 downto 0);
        R5in            : in     vl_logic_vector(31 downto 0);
        R6in            : in     vl_logic_vector(31 downto 0);
        R7in            : in     vl_logic_vector(31 downto 0);
        R8in            : in     vl_logic_vector(31 downto 0);
        R9in            : in     vl_logic_vector(31 downto 0);
        R10in           : in     vl_logic_vector(31 downto 0);
        R11in           : in     vl_logic_vector(31 downto 0);
        R12in           : in     vl_logic_vector(31 downto 0);
        R13in           : in     vl_logic_vector(31 downto 0);
        R14in           : in     vl_logic_vector(31 downto 0);
        R15in           : in     vl_logic_vector(31 downto 0);
        HIoutin         : in     vl_logic_vector(31 downto 0);
        LOoutin         : in     vl_logic_vector(31 downto 0);
        Zhighoutin      : in     vl_logic_vector(31 downto 0);
        Zlowoutin       : in     vl_logic_vector(31 downto 0);
        PCoutin         : in     vl_logic_vector(31 downto 0);
        MDRoutin        : in     vl_logic_vector(31 downto 0);
        In_Portoutin    : in     vl_logic_vector(31 downto 0);
        Coutin          : in     vl_logic_vector(31 downto 0);
        Selectin        : in     vl_logic_vector(4 downto 0)
    );
end Mux_32_to_1;
