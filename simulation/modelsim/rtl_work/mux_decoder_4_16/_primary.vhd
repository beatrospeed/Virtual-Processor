library verilog;
use verilog.vl_types.all;
entity mux_decoder_4_16 is
    port(
        \select\        : in     vl_logic_vector(3 downto 0);
        result          : out    vl_logic_vector(15 downto 0)
    );
end mux_decoder_4_16;
