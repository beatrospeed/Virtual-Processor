module RAM_tb();
    parameter ADDR_WIDTH = 9;
    parameter DATA_WIDTH = 32;
    parameter DEPTH = 512;

    reg clk;
    reg [ADDR_WIDTH-1:0] address;
    reg write_enable;    
    reg [DATA_WIDTH-1:0] data_in;
    wire [DATA_WIDTH-1:0] data_out;

    initial begin
        $display("sram test bench from timetoexplore.net.");
        clk = 1;

        #10 write_enable = 1;
        address = 0;
        data_in = 8'haa;  // 1010 1010
        #10 address = 1;
        data_in = 8'h55;  // 0101 0101

        #10 write_enable = 0;
        #10 $display("0x%02h", data_out);  // expect 0x55
        #10 address = 0;
        #10 $display("0x%02h", data_out);  // expect 0xaa
        #10 address = 1;
        #10 $display("0x%02h", data_out);  // expect 0x55

        #10 write_enable = 1;
        address = 1;
        data_in = 8'h2a;  // 0010 1010

        #10 write_enable = 0;
        #10 $display("0x%02h", data_out);  // expect 0x2a

        #40 $finish;
    end

    always begin
        #5 clk = ~clk;  // timescale is 1ns so #5 provides 100MHz clock
    end

    RAM sram_test (
        .clock(clk), 
        .Address(address), 
        .write(write_enable), 
        .data(data_in),
        .RAMout(data_out));
endmodule 