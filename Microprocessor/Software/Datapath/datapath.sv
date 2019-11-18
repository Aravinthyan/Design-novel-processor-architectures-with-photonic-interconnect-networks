`include "../Components/ALU/ALU.sv"
`include "../Components/ALU_advanced/ALU_advanced.sv"
`include "../Components/Multiplexer/multiplexer.sv"
`include "../Components/Register/register.sv"
`include "../Components/Register_File/register_file.sv"
`include "../Components/Flags_Register/flags_register.sv"
`include "../Components/Jump_Logic/jump_logic.sv"

// inputs are the outputs of other components

module datapath
(
	input logic clk,
	input logic rst,
	// Instruction memory
	output logic [15:0]address_1,
	output logic [15:0]address_2,
	input logic [15:0]read_address_1,
	input logic [15:0]read_address_2,
	// Data memory
        output logic [15:0]address_rw,
        output logic [15:0]data_in,
        input logic [15:0]data_out,
	// Control signals
	input logic pc_increment_control,
	input logic [1:0] pc_control,
	input logic general_register_write_enable,
	input logic stack_write_enable,
	input logic stack_control,
	input logic write_data_enable,
	input logic [1:0] ALU_soure_2,
	input logic [1:0] ALU_control,
	input logic flags_write_enable,
	input logic jump_zero_control,
	input logic jump_below_control,
	input logic jump_below_equal_control,
	input logic jump_above_control,
	input logic jump_above_equal_control,
	input logic jump_greater_control,
	input logic jump_greater_equal_control,
	input logic jump_less_control,
	input logic jump_less_equal_control,
	input logic [1:0] general_register_result_select
);

	// constants
	logic [15:0] zero = 16'h0000;
	logic [15:0] one = 16'h0001;
	logic [15:0] two = 16'h0002;

	// signals
	logic [15:0] branch_mux_data[1:0];
	logic [15:0] branch_mux_out;
	logic [15:0] general_register_result_select_out;
	logic [15:0] pc_control_data_mux [3:0];
	logic [15:0] next_PC;
	logic branch_result;
	logic pc_increment_choose_out;
	logic [15:0] pc_increment_mux_out;
	logic [15:0] pc_increment_data_mux [1:0];
	logic [15:0] ALU_out;
	logic [15:0] WD_control_data_mux[1:0];
	logic [15:0] ALU_source_2_data_mux[3:0];
	logic [15:0] ALU_source_2_mux_out;
	logic zero_flag;
	logic carry_flag;
	logic sign_flag;
	logic overflow_flag;
	logic ALU_zero_flag;
	logic [15:0] general_register_result_select_data_mux [3:0];
	logic [15:0] reg_read_data_1;
	logic [15:0] stack_control_data_mux [1:0];
	logic [15:0] stack_control_mux_out;
	logic flags_in [3:0];
	logic flags_out [3:0];

	always_comb
	begin
		branch_mux_data[1] = read_address_2;
	
		pc_control_data_mux[0] = branch_mux_out;
		pc_control_data_mux[1] = read_address_2;	
		pc_control_data_mux[2] = general_register_result_select_out;
		// pc_control_data_mux[3] = ;
	
		pc_increment_data_mux[0] = one;
		pc_increment_data_mux[1] = two;
	
		ALU_source_2_data_mux[0] = data_in;
		ALU_source_2_data_mux[1] = read_address_2;
		ALU_source_2_data_mux[2] = one;
		// ALU_source_2_data_mux
		
		general_register_result_select_data_mux[0] = data_out;
		general_register_result_select_data_mux[1] = ALU_out;
		general_register_result_select_data_mux[2] = reg_read_data_1;
		general_register_result_select_data_mux[3] = read_address_2;

		stack_control_data_mux[0] = zero;
		stack_control_data_mux[1] = one;

		flags_in[3] = zero_flag;
		flags_in[2] = carry_flag;
		flags_in[1] = sign_flag;
		flags_in[0] = overflow_flag;
	end

	// instantiating branch multiplexer
	multiplexer #(1, 16) branch_multiplexer(branch_result, branch_mux_data, branch_mux_out);
	
	// instantiating pc control multiplexer
	multiplexer #(2, 16) pc_control_multiplexer(pc_control, pc_control_data_mux, next_PC);

	// instantiate pc register
	register #(16) pc_register(clk, rst, next_PC, address_1);

	// instantiate adder to see the next instruction
	ALU #(16) pc_adder(address_1, one, 2'b00, address_2);

	// instantiate xor for which will be the control for choosing if the increment is 1 or 2
	xor pc_increment_choose(pc_increment_choose_out, branch_result, pc_increment_control);

	// instantiate pc increment multiplexer
	multiplexer #(1, 16) pc_increment_multiplexer(pc_increment_choose_out, pc_increment_data_mux, pc_increment_mux_out);

	// instantiate pc increment adder
	ALU #(16) pc_increment_adder(address_1, pc_increment_mux_out, 2'b00, branch_mux_data[0]);

	// instantiate register file
	register_file #(5, 16) register_file_0(clk, general_register_write_enable, stack_write_enable, read_address_1[9:5], read_address_1[4:0], read_address_1[4:0], general_register_result_select_out, ALU_out, reg_read_data_1, WD_control_data_mux[0]);

	// instantiate stack control multiplexer
	multiplexer #(1, 16) stack_control_multiplexer(stack_control, stack_control_data_mux, stack_control_mux_out);

	// instantiate a subber for correct stack access
	ALU #(16) stack_access_subber(reg_read_data_1, stack_control_mux_out, 2'b01, address_rw);

	// instantiate WD control multiplexer
	multiplexer #(1, 16) WD_control_multiplexer(write_data_enable, WD_control_data_mux, data_in);

	// instantiate adder for return address
	ALU #(16) return_address_adder(address_2, one, 2'b00, WD_control_data_mux[1]);

	// instantiate ALU source 2 multiplexer
	multiplexer #(2, 16) ALU_source_2_multiplexer(ALU_soure_2, ALU_source_2_data_mux, ALU_source_2_mux_out);

	// instantiate ALU
	ALU_advanced #(16) ALU_0(reg_read_data_1, ALU_source_2_mux_out, ALU_control, ALU_out, zero_flag, carry_flag, sign_flag, overflow_flag);
	
	// instantiate zero register
	flags_register flag_reg(clk, rst, flags_write_enable, flags_in, flags_out);

	// instantiate jump logic
	jump_logic jump_logic_0(jump_zero_control, jump_below_control, jump_below_equal_control, jump_above_control, jump_above_equal_control, jump_greater_control, jump_greater_equal_control, jump_less_control, jump_less_equal_control, flags_out[3], flags_out[2], flags_out[1], flags_out[0], branch_result);
	
	// instantiate general register result selector
	multiplexer #(2, 16) general_register_result_select_multiplexer(general_register_result_select, general_register_result_select_data_mux, general_register_result_select_out);

endmodule
