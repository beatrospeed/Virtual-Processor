module SelectEncode (
output  [15:0] RinOut, RoutOut,
output  [31:0] c_sign_extended,
input [31:0] IRin, 
input Rin, Rout, BAout,GRA, GRB, GRC
);


wire [3:0] temp;
wire [15:0] OutputDecode;  
	
		assign temp = (IRin[26 : 23] & {4{GRA}}) 
						| (IRin[22 : 19] & {4{GRB}}) 
						| (IRin[18 : 15] & {4{GRC}});
	   assign c_sign_extended = { {14{IRin[18]}}, IRin[17:0]};
		
	 mux_decoder_4_16 decode16(temp, OutputDecode);
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : 
				encoder_loop
            assign RinOut[i] = OutputDecode[i] & Rin;
            assign RoutOut[i] = OutputDecode[i] & (Rout | BAout);
        end
    endgenerate
endmodule 

module mux_decoder_4_16(input [3:0] select , output reg [15:0] result);  
  always @(*)  
  begin  
    case (select)  
       4'b0000 : result = 16'b0000000000000001;  
       4'b0001 : result = 16'b0000000000000010;  
       4'b0010 : result = 16'b0000000000000100;  
       4'b0011 : result = 16'b0000000000001000;  
       4'b0100 : result = 16'b0000000000010000;  
       4'b0101 : result = 16'b0000000000100000;  
       4'b0110 : result = 16'b0000000001000000; 
		 4'b0111 : result = 16'b0000000010000000;  
       4'b1000 : result = 16'b0000000100000000;  
       4'b1001 : result = 16'b0000001000000000;  
       4'b1010 : result = 16'b0000010000000000;  
       4'b1011 : result = 16'b0000100000000000;  
       4'b1100 : result = 16'b0001000000000000;  
       4'b1101 : result = 16'b0010000000000000;  
		 4'b1110 : result = 16'b0100000000000000; 
		 4'b1111 : result = 16'b1000000000000000; 
		 default : result = 16'b0000000000000000; 
      
    endcase  
  end  
endmodule 