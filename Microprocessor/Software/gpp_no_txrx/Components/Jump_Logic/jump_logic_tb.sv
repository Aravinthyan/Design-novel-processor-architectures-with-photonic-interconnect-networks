module jump_logic_tb;

	logic clk;
	logic jump_zero_control;
	logic jump_below_control;
	logic jump_below_equal_control;
	logic jump_above_control;
	logic jump_above_equal_control;
	logic jump_greater_control;
	logic jump_greater_equal_control;
	logic jump_less_control;
	logic jump_less_equal_control;
	logic zero_flag;
	logic carry_flag;
	logic sign_flag;
	logic overflow_flag;
	logic jump_logic_out;

	jump_logic jl_test(jump_zero_control, jump_below_control, jump_below_equal_control, jump_above_control, jump_above_equal_control, jump_greater_control, jump_greater_equal_control, jump_less_control, 	jump_less_equal_control, zero_flag, carry_flag, sign_flag, overflow_flag, jump_logic_out);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		jump_zero_control = 1'b1;
		jump_below_control = 1'b0;
		jump_below_equal_control = 1'b0;
		jump_above_control = 1'b0;
		jump_above_equal_control = 1'b0;
		jump_greater_control = 1'b0;
		jump_greater_equal_control = 1'b0;
		jump_less_control = 1'b0;
		jump_less_equal_control = 1'b0;
		zero_flag = 1'b1;
		carry_flag = 1'b0;
		sign_flag = 1'b0;
		overflow_flag = 1'b0;
		#100ps;

		jump_zero_control = 1'b0;
		jump_below_control = 1'b1;
		jump_below_equal_control = 1'b0;
		jump_above_control = 1'b0;
		jump_above_equal_control = 1'b0;
		jump_greater_control = 1'b0;
		jump_greater_equal_control = 1'b0;
		jump_less_control = 1'b0;
		jump_less_equal_control = 1'b0;
		zero_flag = 1'b0;
		carry_flag = 1'b1;
		sign_flag = 1'b0;
		overflow_flag = 1'b0;
		#100ps;
		
		jump_zero_control = 1'b0;
		jump_below_control = 1'b0;
		jump_below_equal_control = 1'b1;
		jump_above_control = 1'b0;
		jump_above_equal_control = 1'b0;
		jump_greater_control = 1'b0;
		jump_greater_equal_control = 1'b0;
		jump_less_control = 1'b0;
		jump_less_equal_control = 1'b0;
		zero_flag = 1'b1;
		carry_flag = 1'b1;
		sign_flag = 1'b0;
		overflow_flag = 1'b0;
		#100ps;
	
		jump_zero_control = 1'b0;
		jump_below_control = 1'b0;
		jump_below_equal_control = 1'b0;
		jump_above_control = 1'b1;
		jump_above_equal_control = 1'b0;
		jump_greater_control = 1'b0;
		jump_greater_equal_control = 1'b0;
		jump_less_control = 1'b0;
		jump_less_equal_control = 1'b0;
		zero_flag = 1'b0;
		carry_flag = 1'b0;
		sign_flag = 1'b0;
		overflow_flag = 1'b0;
		#100ps;

		jump_zero_control = 1'b0;
		jump_below_control = 1'b0;
		jump_below_equal_control = 1'b0;
		jump_above_control = 1'b0;
		jump_above_equal_control = 1'b1;
		jump_greater_control = 1'b0;
		jump_greater_equal_control = 1'b0;
		jump_less_control = 1'b0;
		jump_less_equal_control = 1'b0;
		zero_flag = 1'b0;
		carry_flag = 1'b0;
		sign_flag = 1'b0;
		overflow_flag = 1'b0;
		#100ps;
	
		jump_zero_control = 1'b0;
		jump_below_control = 1'b0;
		jump_below_equal_control = 1'b0;
		jump_above_control = 1'b0;
		jump_above_equal_control = 1'b0;
		jump_greater_control = 1'b1;
		jump_greater_equal_control = 1'b0;
		jump_less_control = 1'b0;
		jump_less_equal_control = 1'b0;
		zero_flag = 1'b0;
		carry_flag = 1'b0;
		sign_flag = 1'b0;
		overflow_flag = 1'b0;
		#100ps;
	
		jump_zero_control = 1'b0;
		jump_below_control = 1'b0;
		jump_below_equal_control = 1'b0;
		jump_above_control = 1'b0;
		jump_above_equal_control = 1'b0;
		jump_greater_control = 1'b0;
		jump_greater_equal_control = 1'b1;
		jump_less_control = 1'b0;
		jump_less_equal_control = 1'b0;
		zero_flag = 1'b0;
		carry_flag = 1'b0;
		sign_flag = 1'b0;
		overflow_flag = 1'b0;
		#100ps;
		
		jump_zero_control = 1'b0;
		jump_below_control = 1'b0;
		jump_below_equal_control = 1'b0;
		jump_above_control = 1'b0;
		jump_above_equal_control = 1'b0;
		jump_greater_control = 1'b0;
		jump_greater_equal_control = 1'b0;
		jump_less_control = 1'b1;
		jump_less_equal_control = 1'b0;
		zero_flag = 1'b0;
		carry_flag = 1'b0;
		sign_flag = 1'b1;
		overflow_flag = 1'b0;
		#100ps;
	
		jump_zero_control = 1'b0;
		jump_below_control = 1'b0;
		jump_below_equal_control = 1'b0;
		jump_above_control = 1'b0;
		jump_above_equal_control = 1'b0;
		jump_greater_control = 1'b0;
		jump_greater_equal_control = 1'b0;
		jump_less_control = 1'b0;
		jump_less_equal_control = 1'b1;
		zero_flag = 1'b0;
		carry_flag = 1'b0;
		sign_flag = 1'b0;
		overflow_flag = 1'b0;
		#100ps;
	end
		
endmodule
