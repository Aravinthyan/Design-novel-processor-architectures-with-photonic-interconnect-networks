module ALU_tb_2;

	logic clk;
	logic [1:0]src_a;
	logic [1:0]src_b;
	logic [1:0]ALU_Control;
	logic [1:0]ALU_out;
	logic zero_flag;
	logic carry_flag;
	logic sign_flag;
	logic overflow_flag;

	ALU_advanced #(2) ALU_test(src_a, src_b, ALU_Control, ALU_out, zero_flag, carry_flag, sign_flag, overflow_flag);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		ALU_Control = 2'b00;
		src_a = 0;
		src_b = 0;
		#100ps;
		src_a = 1;
		src_b = 2;
		#100ps;
		src_a = 3;
		src_b = 1;
		#100ps;
		src_a = 2;
		src_b = 3;
		#100ps;
		src_a = 3;
		src_b = 3;
		#100ps;
		
		ALU_Control = 2'b01;
		src_a = 0;
		src_b = 0;
		#100ps;
		src_a = 1;
		src_b = 2;
		#100ps;
		src_a = 3;
		src_b = 1;
		#100ps;
		src_a = 2;
		src_b = 3;
		#100ps;
		src_a = 3;
		src_b = 3;
		#100ps;

		ALU_Control = 2'b10;
		src_a = 0;
		src_b = 0;
		#100ps;
		src_a = 1;
		src_b = 2;
		#100ps;
		src_a = 3;
		src_b = 1;
		#100ps;
		src_a = 2;
		src_b = 3;
		#100ps;
		src_a = 3;
		src_b = 3;
		#100ps;

		ALU_Control = 2'b11;
		src_a = 0;
		src_b = 0;
		#100ps;
		src_a = 1;
		src_b = 2;
		#100ps;
		src_a = 3;
		src_b = 1;
		#100ps;
		src_a = 2;
		src_b = 3;
		#100ps;
		src_a = 3;
		src_b = 3;
		#100ps;

	end


endmodule
