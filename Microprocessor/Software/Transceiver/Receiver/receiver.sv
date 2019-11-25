`include "../../Components/Comparator/comparator.sv"
`include "../../Components/ALU/ALU.sv"
`include "../../Components/Register/register.sv"

module reciever
#(
)
(
	input logic clk,
	input logic rst,
	input logic [31:0] rx_in,
	input logic [15:0] id,
	input logic [15:0] rx_stack_ptr,
	output logic comparator_reg_out,
	output logic [15:0] current_rx_data_out,
	output logic [15:0] rx_stack_pointer_new_val
);

	logic [31:0] rx_data;
	logic comparator_out;
	logic [15:0] data_reg_out;
	logic [15:0] address;
	logic [15:0] zero;
	logic [15:0] one;
	logic [15:0] constants [1:0];
	logic stack_addr_const_mux_out;
	logic [15:0] rx_stack_ptr_new_vals [1:0];
	logic [15:0] ALU_rx_stack_ptr_out;

	always_comb
	begin
		rx_data = rx_in;
		zero = 16'h0000;
		one = 16'h0001;
		constants[0] = one;
		constants[1] = zero;
		rx_stack_ptr_new_vals[0] = address;
		rx_stack_ptr_new_vals[1] = ALU_rx_stack_ptr_out;
	end

	always_comb
	begin
		// instantiate recieved register
		register #(32) rx_in_reg(clk, rst, rx_in, rx_data);
	
		// instantiate comparator
		comparator #(16) id_comparator([15:0] rx_data, id, comparator_out);
		
		// instantiate comparator register
		register #(32) comparator_reg(clk, rst, comparator_out, comparator_reg_out);
		
		// instantiate data register
		register #(32) data_reg(clk, rst, [31:16] rx_data, data_reg_out);

		// instantiate data memory
		data_memory #(16) data_mem_rx(clk, comparator_reg_out, address, data_reg_out, current_rx_data_out);
	
		// instantiate multilexer
		multiplexer #(1, 16) stack_addr_const_mux(comparator_reg_out, constants, stack_addr_const_mux_out);

		// instantiate ALU to read address from data memory
		ALU #(16) ALU_address_dm(rx_stack_ptr, stack_addr_const_mux_out, 2'b01, address);

		// instantiate ALU to update previous rx stack pointer
		ALU #(16) ALU_rx_stack_ptr(rx_stack_ptr, one, 2'b00, ALU_rx_stack_ptr_out);
		
		// instantiate multilexer
		multiplexer #(1, 16) rx_stack_ptr_mux(comparator_reg_out, rx_stack_ptr_new_vals, stack_addr_const_mux_out);
	end

endmodule
