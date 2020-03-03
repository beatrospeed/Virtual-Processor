library verilog;
use verilog.vl_types.all;
entity mdr_reg is
    port(
        Q               : out    vl_logic_vector(31 downto 0);
        mdata_in        : in     vl_logic_vector(31 downto 0);
        MDR_read        : in     vl_logic;
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        mdr_in          : in     vl_logic;
        BusMuxOut       : in     vl_logic_vector(31 downto 0)
    );
end mdr_reg;
