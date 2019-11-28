module ALU_tb_1;

	logic clk;
	logic src_a;
	logic src_b;
	logic [1:0]ALU_Control;
	logic ALU_out;
	logic zero;

	ALU #(1) ALU_test(src_a, src_b, ALU_Control, ALU_out, zero);

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
		src_b = 0;
		#100ps;
		src_a = 0;
		src_b = 1;
		#100ps;
		src_a = 1;
		src_b = 1;
		#100ps;
		
		ALU_Control = 2'b01;
		src_a = 0;
		src_b = 0;
		#100ps;
		src_a = 1;
		src_b = 0;
		#100ps;
		src_a = 0;
		src_b = 1;
		#100ps;
		src_a = 1;
		src_b = 1;
		#100ps;

		ALU_Control = 2'b10;
		src_a = 0;
		src_b = 0;
		#100ps;
		src_a = 1;
		src_b = 0;
		#100ps;
		src_a = 0;
		src_b = 1;
		#100ps;
		src_a = 1;
		src_b = 1;
		#100ps;

		ALU_Control = 2'b11;
		src_a = 0;
		src_b = 0;
		#100ps;
		src_a = 1;
		src_b = 0;
		#100ps;
		src_a = 0;
		src_b = 1;
		#100ps;
		src_a = 1;
		src_b = 1;
		#100ps;

	end

endmodule
