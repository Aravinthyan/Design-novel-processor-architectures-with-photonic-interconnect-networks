module data_plane_rx_tb;
	
	logic clk;
	logic rst;
	logic [31:0] data_rx_packet;
	logic [15:0] node_id;
	logic gpp_rtr_signal;
	logic data_rx_complete_flag;
	logic [15:0] RAM_rx_data_out;

	data_plane_rx dut(clk, rst, data_rx_packet, node_id, gpp_rtr_signal, data_rx_complete_flag, RAM_rx_data_out);

	initial
	begin
		clk = 0;
		forever #50ps clk=~clk;
	end

	initial
	begin
		rst = 1'b1;
		data_rx_packet = 32'h00000000;
		node_id = 16'h0001;
		gpp_rtr_signal = 1'b0;
		#100ps;
		rst = 1'b0;
		data_rx_packet = 32'h00000000;
		#100ps;
		data_rx_packet = 32'h0001000A;
		#100ps;
		data_rx_packet = 32'h00020003;
		#100ps;
		data_rx_packet = 32'h00010005;
		#100ps;
		data_rx_packet = 32'h00010002;
		#100ps;
		data_rx_packet = 32'h00010003;
		#100ps;
		data_rx_packet = 32'h00010008;
		#100ps;
		data_rx_packet = 32'h00020003;
		#100ps;
		#100ps;
		gpp_rtr_signal = 1'b1;
		#100ps;
		#100ps;
		#100ps;
		#100ps;
		#100ps;
		gpp_rtr_signal = 1'b0;
		#100ps;
		data_rx_packet = 32'h000121FE;
		#100ps;
		data_rx_packet = 32'h0001DEAD;
		#100ps;


	end

endmodule

