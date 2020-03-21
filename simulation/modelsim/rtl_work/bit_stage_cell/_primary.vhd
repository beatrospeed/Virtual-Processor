library verilog;
use verilog.vl_types.all;
entity bit_stage_cell is
    port(
        g               : out    vl_logic;
        p               : out    vl_logic;
        sum             : out    vl_logic;
        x               : in     vl_logic;
        y               : in     vl_logic;
        c_in            : in     vl_logic
    );
end bit_stage_cell;
