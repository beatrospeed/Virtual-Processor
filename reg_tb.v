`timescale 1ns/10ps

module reg_tb();
	reg clk, clear, load;
	reg [31:0] q;
	wire [31:0] d;
	
	Reg32 reg32(d, clk, clear, load, q);
	
initial begin
    @(posedge clk);
    d <= 32'b1;
    @(posedge clk);
    d <= 32'b0;
    @(posedge clk);
    d <= 32'b1;
 end
//Clock in separate process
initial begin
  clk=1;
  forever begin
    #5 clk = ~clk;
  end
  end
endmodule

