module jump_logic
(
	// control signals
	input logic jump_zero_control,
	input logic jump_below_control,
	input logic jump_below_equal_control,
	input logic jump_above_control,
	input logic jump_above_equal_control,
	input logic jump_greater_control,
	input logic jump_greater_equal_control,
	input logic jump_less_control,
	input logic jump_less_equal_control,
	// flags
	input logic zero_flag,
	input logic carry_flag,
	input logic sign_flag,
	input logic overflow_flag,
	output logic jump_logic_out
);

	logic jz_out;
	logic jb_out;
	logic jbe_out;
	logic jbe_1_out;
	logic ja_out;
	logic ja_1_out;
	logic jae_out;
	logic jae_1_out;
	logic jg_out;
	logic jg_1_out;
	logic jg_2_out;
	logic jg_3_out;
	logic jge_out;
	logic jge_1_out;
	logic jl_out;
	logic jl_1_out;
	logic jle_out;
	logic jle_1_out;
	logic jle_2_out;

	// instantiate logic for jump zero instruction
	and jz(jz_out, jump_zero_control, zero_flag);

	// isntantiate logic for jump below instrucion
	and jb(jb_out, jump_below_control, carry_flag);

	// instantiate logic doe the jump below equal instruction
	or jbe_1(jbe_1_out, carry_flag, zero_flag);
	and jbe(jbe_out, jump_below_equal_control, jbe_1_out);

	// instantiate logic for jump above instruction
	nand ja_1(ja_1_out, carry_flag, zero_flag);
	and ja(ja_out, jump_above_control, ja_1_out);

	// instantiate logic for jump above equal instruction
	not jae_1(jae_1_out, carry_flag);
	and jae(jae_out, jump_above_equal_control, jae_1_out);

	// instantiate logic for jump greater instruction
	not jg_1(jg_1_out, zero_flag);
	xnor jg_2(jg_2_out, sign_flag, overflow_flag);
	and jg_3(jg_3_out, jg_1_out, jg_2_out);
	and jg(jg_out, jump_greater_control, jg_3_out);

	// instantiate logic for jump greater equal instruction
	xnor jge_1(jge_1_out, sign_flag, zero_flag);
	and jge(jge_out, jump_greater_equal_control, jge_1_out);

	// instantiate logic for jump less instruction
	xor jl_1(jl_1_out, sign_flag, zero_flag);
	and jl(jl_out, jump_less_control, jl_1_out);

	// instantiate logic for jump less equal instruction
	xor jle_1(jle_1_out, sign_flag, carry_flag);
	or jle_2(jle_2_out, zero_flag, jle_1_out);
	and jle(jle_out, jump_less_equal_control, jle_2_out);

	or selctor(jump_logic_out, jz_out, jb_out, jbe_out, ja_out, jae_out, jg_out, jge_out, jl_out, jle_out);

endmodule
