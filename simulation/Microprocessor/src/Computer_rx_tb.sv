module Computer_rx_tb;

	logic clk;
	logic rst;
	shortint node_id;
	shortint max_node;
	logic [31:0] control_rx_packet;
	logic [31:0] control_tx_packet;
	logic [15:0] data_rx_node_id;
	logic [31:0] data_rx_packet;
	logic [31:0] data_tx_packet;

	Computer dut	(clk,
					rst,
					node_id,
					max_node,
					control_rx_packet,
					control_tx_packet,
					data_rx_node_id,
					data_rx_packet,
					data_tx_packet);

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		node_id = 1;
		max_node = 4;
		rst = 1'b1;
        #100ps;
		rst = 1'b0;		
		#350ps;
		control_rx_packet = 32'h00010004;
		#100ps;
		control_rx_packet = 32'h00000000;
		#100ps;
		data_rx_packet = 32'h00010004;
		#100ps;
		data_rx_packet = 32'h0001000A;
		#100ps;
		data_rx_packet = 32'h0001000B;
		#100ps;
		data_rx_packet = 32'h0001000C;
		#100ps;
		data_rx_packet = 32'h0001000D;
		#100ps;
		data_rx_packet = 32'h00000000;
		#100ps;
	end


endmodule
