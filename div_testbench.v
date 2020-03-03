`timescale 1ns/10ps

module div_testbench();
	reg[31:0] m, q;
	wire[31:0] quotient, remainder;
	
	nonrestoring_divison_algo div(quotient, remainder, m, q);
	
initial begin
	#100 $finish;
end
initial begin
    #10 m = 32'd54; q = 32'd91; //remainder should be 37 (100101)
 end
endmodule
