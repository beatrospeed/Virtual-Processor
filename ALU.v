module bit_stage_cell(output g, p, sum, input x,y,c_in);
	and(g,x,y);
	xor(p,x,y);
	xor(sum,p,c_in);
endmodule 

module four_bit_adder(output [3:0] sum,output g, output p, input [3:0] x, input [3:0] y, input c_0);

	wire g0, p0;
	bit_stage_cell b0(.g(g0), .p(p0), .sum(sum[0]), .x(x[0]), .y(y[0]), .c_in(c_0));
	
	
	wire c_1,p0c0;
	and(p0c0,p0,c_0);
	or(c_1,p0c0,g0);
	
	wire g1, p1;
	bit_stage_cell b1(g1, p1, sum[1], x[1], y[1], c_1);
	
	wire c_2,p1c1;
	and(p1c1,p1,c_1);
	or(c_2,p1c1,g1);
	
	wire g2, p2;
	bit_stage_cell b2(g2, p2, sum[2], x[2], y[2], c_2);
	
	
	wire c_3,p2c2;
	and(p2c2,p2,c_2);
	or(c_3,p2c2,g2);
	
	wire g3, p3;
	bit_stage_cell b3(g3, p3, sum[3], x[3], y[3], c_3);
	
	
	and(p,p3,p2,p1,p0);
	
	wire stage_1,stage_2,stage_3;
	and(stage_1,p3,g2);
	and(stage_2,p3,p2,g1);
	and(stage_3,p3,p2,p1,g0);
	or(g,g3,stage_1,stage_2,stage_3);
	
endmodule

module sixteen_bit_carry_adder(output [15:0] sum, output g, output p, input [15:0] x, input [15:0] y, input c_0);

	wire g0, p0;
	four_bit_adder f0(sum[3:0],g0, p0, x[3:0], y[3:0], c_0);
	
	
	wire c_1,p0c0;
	and(p0c0,p0,c_0);
	or(c_1,p0c0,g0);
	
	wire g1, p1;
	four_bit_adder f1(sum[7:4],g1, p1, x[7:4], y[7:4], c_1);
	
	wire c_2,p1c1;
	and(p1c1,p1,c_1);
	or(c_2,p1c1,g1);
	
	wire g2, p2;
	four_bit_adder f2(sum[11:8],g2, p2, x[11:8], y[11:8], c_2);
	
	
	wire c_3,p2c2;
	and(p2c2,p2,c_2);
	or(c_3,p2c2,g2);
	
	wire g3, p3;
	four_bit_adder f3(sum[15:12],g3, p3, x[15:12], y[15:12], c_3);
	
	
	and(p,p3,p2,p1,p0);
	
	wire stage_1,stage_2,stage_3;
	and(stage_1,p3,g2);
	and(stage_2,p3,p2,g1);
	and(stage_3,p3,p2,p1,g0);
	or(g,g3,stage_1,stage_2,stage_3);
endmodule 

module thirtytwo_bit_carry_adder(output [31:0] sum, input [31:0] x, input[31:0] y, input c_0);
	wire g0, p0;
	wire g1, p1;
	
	sixteen_bit_carry_adder s0(sum[15:0], g0, p0, x[15:0], y[15:0], c_0);
	
	wire c_1, p0c0;
	and(p0c0,p0,c_0);
	or(c_1, p0c0, g0);

	sixteen_bit_carry_adder s1(sum[31:16], g1, p1, x[31:16], y[31:16], c_1);

endmodule

module thirtytwo_bit_twos_complement(output [31:0] complement, input [31:0] num);

	wire [31:0] numComplement;
	assign numComplement = ~num;

	thirtytwo_bit_carry_adder ttb(complement, numComplement, 32'b00000000000000000000000000000001, 0);
	endmodule

module thirtytwo_bit_subtractor(output [31:0] out, input [31:0] num1, input [31:0] num2);
	wire [31:0] compNum;

	thirtytwo_bit_twos_complement compliment(compNum, num2);

	thirtytwo_bit_carry_adder sub(out, num1, compNum, 0);
endmodule

module thirtytwo_bit_booth_algorithm(output reg [63:0] out, input [31:0] m, input [31:0] q);

	wire [33:0] q_extend = {1'b0, q[31:0], 1'b0};
	wire [63:0] m_extend = {32'b0, m[31:0]};

	reg [63:0]temp;
	integer i;
	always @(*) begin
		out = 64'b0;
		for(i = 1; i < 32; i = i + 2) begin
			if(q_extend[i-1] == 1 && q_extend[i] == 0 && q_extend[i+1] == 0) begin
				temp = out+(m_extend<<(i-1));
				out = temp;
			end
			if(q_extend[i-1] == 0 && q_extend[i] == 1 && q_extend[i+1] == 0) begin
				temp = out+(m_extend<<(i-1));
				out = temp;
			end
			if(q_extend[i-1] == 1 && q_extend[i] == 1 && q_extend[i+1] == 0) begin
				temp = out+((m_extend << 1) << (i-1));
				out = temp;
			end
			if(q_extend[i-1] == 0 && q_extend[i] == 0 && q_extend[i+1] == 1) begin
				temp = out-((m_extend << 1) << (i-1));
				out = temp;
			end
			if(q_extend[i-1] == 1 && q_extend[i] == 0 && q_extend[i+1] == 1) begin
				temp = out-(m_extend<<(i-1));
				out = temp;
			end
			if(q_extend[i-1] == 0 && q_extend[i] == 1 && q_extend[i+1] == 1) begin
				temp = out-(m_extend<<(i-1));
				out = temp;
			end
			end
	end

endmodule


module nonrestoring_divison_algo(output reg [31:0] quotient, output reg[31:0] remainder, input [31:0] m, input [31:0] q);

	reg [31:0] a_register;

	reg [31:0] q_register;

	reg [31:0] m_register;

	reg [31:0] temp_q;

	integer i;

	always @(*) begin

		a_register = 32'b0;
		q_register = q;
		m_register = m;

		for(i = 0; i < 32; i = i + 1) begin

			a_register = a_register << 1;
			a_register[0] = q_register[31];
			
			q_register = q_register << 1;
			
			if(a_register[31] == 1)
				a_register = a_register + m_register;
			else 
				a_register = a_register - m_register;
			
			if(a_register[31] == 1)
				q_register[0] = 1'b0;
			else
				q_register[0] = 1'b1;
		end
			
		if(a_register[31] == 1) begin
			a_register = a_register + m_register;
		end
		
		quotient = q_register;
		remainder = a_register;
	end
endmodule



`timescale 1ns/10ps

module alu(output reg [63:0] z_Output, input [31:0] reg1, input [31:0] reg2, input [3:0] control, input inc_pc, input Clk);


	wire [31:0] complement;

	thirtytwo_bit_twos_complement c(complement, reg2);

	wire [31:0] add;

	thirtytwo_bit_carry_adder a(add, reg1, reg2, 0);

	wire [31:0] sub;

	thirtytwo_bit_subtractor s(sub, reg1, reg2);

	wire [63:0] multiply;

	thirtytwo_bit_booth_algorithm m(multiply, reg1, reg2);

	wire [31:0] divide_q;
	wire [31:0] divide_r;

	nonrestoring_divison_algo d(divide_q, divide_r, reg1, reg2);

	wire [31:0] pc_inc;

	thirtytwo_bit_carry_adder a2(pc_inc, reg2, 32'd1, 0);


	always @(negedge Clk) begin
	#5 //delay necessary to allow for control signals to get set on negative edge
	if(inc_pc == 1)
		z_Output[31:0] <=  pc_inc;
	else if(control == 0)
			z_Output[31:0] <= divide_q;
			z_Output[63:32] <= divide_r;
		if(control == 1)begin
			z_Output[31:0] <= multiply[31:0];
			z_Output[63:32] <= multiply[63:32];end
		else if(control == 2)
			z_Output[31:0] <= add;
		else if(control == 3)
			z_Output[31:0] <= sub;
		else if(control == 4)
			z_Output[31:0] <= reg1 << reg2;
		else if(control == 5)
			z_Output[31:0] <= reg1 >> reg2;
		else if(control == 6) 
			z_Output[31:0] <= (reg1 >> reg2) | (reg1 << (32-reg2));
		else if(control == 7) 	
			z_Output[31:0] <= (reg1 << reg2) | (reg1 >> (32-reg2));
		else if(control == 8)
			z_Output[31:0] <= reg1 | reg2;
		else if(control == 9)
			z_Output[31:0] <= complement;
		else if(control == 10) begin
			z_Output[31:0] <= reg1 & reg2;
		end
		else if(control == 11) begin
			z_Output[31:0] <= ~reg2;
			end
		end
endmodule
