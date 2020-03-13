library verilog;
use verilog.vl_types.all;
entity RAM_tb is
    generic(
        ADDR_WIDTH      : integer := 9;
        DATA_WIDTH      : integer := 32;
        DEPTH           : integer := 512
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
end RAM_tb;
