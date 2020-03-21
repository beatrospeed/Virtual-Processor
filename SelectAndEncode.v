module SelectEncode (
output reg [15:0] R0in, R1in,R2in, R3in,R4in,R5in, R6in, R7in, R8in,
	R9in, R10in, R11in, R12in, R13in, R14in, R15in, R0out, R1out,R2out, R3out,R4out, R5out, R6out, R7out, R8out, R9out,
	R10out, R11out, R12out, R13out, R14out, R15out,
output reg [31:0] c_sign_extended,
input [31:0] IRin, 
input Rin, Rout, BAout,GRA, GRB, GRC
);


reg [3:0] temp; 
integer i;
	always@(*)
	begin

		for ( i = 0 ; i < 13 ; i = i + 1) begin
	
		c_sign_extended[i] <= IRin [18]; 
	
		end
	
		c_sign_extended[17:0] <= IRin[17:0];
	
	
		if(GRA == 1)begin 
			temp [3:0] = IRin[26:23];
			end
		else if (GRB == 1)begin
			temp [3:0] = IRin[22:19];
			end
		else if (GRC == 1)begin 
			temp[3:0] = IRin[18:15]; 
		end

			
		
	if (Rin == 1)begin 
		case(temp)
		
			4'b0000 : R0in <= 1; 
			4'b0001 : R1in <= 1;
			4'b0010 : R2in <= 1;
			4'b0011 : R3in <= 1;
			4'b0100 : R4in <= 1;
			4'b0101 : R5in <= 1;
			4'b0110 : R6in <= 1;
			4'b0111 : R7in <= 1;
			4'b1000 : R8in <= 1;
			4'b1001 : R9in <= 1;
			4'b1010 : R10in <= 1;
			4'b1011 : R11in <= 1;
			4'b1100 : R12in <= 1;
			4'b1101 : R13in <= 1;
			4'b1110 : R14in <= 1;
			4'b1111 : R15in <= 1;
		endcase
		end
		
	if (BAout == 1)begin 
		if(temp == 4'b0000)begin
			R0out <= 1; 
			end 
	end 
	
	if (Rout == 1)begin 
		case(temp)
		
			4'b0000 : R0out <= 1; 
			4'b0001 : R1out <= 1;
			4'b0010 : R2out <= 1;
			4'b0011 : R3out <= 1;
			4'b0100 : R4out <= 1;
			4'b0101 : R5out <= 1;
			4'b0110 : R6out <= 1;
			4'b0111 : R7out <= 1;
			4'b1000 : R8out <= 1;
			4'b1001 : R9out <= 1;
			4'b1010 : R10out <= 1;
			4'b1011 : R11out <= 1;
			4'b1100 : R12out <= 1;
			4'b1101 : R13out <= 1;
			4'b1110 : R14out <= 1;
			4'b1111 : R15out <= 1;
		endcase
		end
	end 
endmodule
 