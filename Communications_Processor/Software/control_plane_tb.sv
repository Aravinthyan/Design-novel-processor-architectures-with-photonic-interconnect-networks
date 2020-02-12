module comms_processor_tb;

	logic clk;
	logic rst;
	shortint node_id;
	shortint max_node;
	logic data_rx_complete_flag;
	logic [31:0] control_rx_packet;
	logic tx_flag;
	logic [15:0] top_of_stack;
	logic [15:0] stack_pointer;
	logic gpp_rtr;
	logic [31:0] control_tx_packet;
	logic [15:0] data_rx_node_id;
	logic data_tx_flag_out;
	logic data_rx_flag_out;
	logic gpp_trf;

	control_plane dut(clk, rst, node_id, max_node, data_rx_complete_flag, control_rx_packet, tx_flag, top_of_stack, stack_pointer, gpp_rtr, control_tx_packet, data_rx_node_id, data_tx_flag_out, data_rx_flag_out, gpp_trf);

	initial
	begin
		clk = 0;
		forever #50ps clk=~clk;
	end

	initial
	begin
		stack_pointer = 16'b10;
		top_of_stack = 16'hA5;
		control_rx_packet = 32'h0001000F;
		node_id = 1;
		max_node = 4;
		data_rx_complete_flag = 1'b0;
		tx_flag = 1'b0;
		rst = 1'b1;
		gpp_rtr = 1'b0;
		#100ps;
		rst = 1'b0;
		#100ps;
		#100ps;
		#100ps;
		#100ps;
		#100ps;
		#100ps;
		control_rx_packet = 32'h000AF0F0;
		data_rx_complete_flag = 1'b1;
		#100ps;
		data_rx_complete_flag = 1'b0;
		#100ps;
		#100ps;	

	end

endmodule
