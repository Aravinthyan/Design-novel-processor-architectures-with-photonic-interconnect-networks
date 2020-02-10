module comms_processor_tb;

	// commons signals
	logic clk;
	logic rst;
	shortint node_id;
	// control signals 
	shortint max_node;
	logic [31:0] control_rx_packet;
	logic enable_rtr;
	logic gpp_rtr_cp;
	logic [31:0] control_tx_packet;
	logic [15:0] data_rx_node_id;
	logic data_rx_flag;
	logic gpp_trf_cp;	// ALU src 1
	// data signals
	logic [31:0] data_rx_packet;
	logic gpp_rtr_dp;
	logic [15:0] RAM_rx_data_out;
	logic gpp_trf_dp;
	logic [15:0] gpp_tx_data;
	logic [31:0] data_tx_packet;

	comms_processor dut(clk,
			    rst,
			    node_id,
			    max_node,
			    control_rx_packet,
			    enable_rtr,
			    gpp_rtr_cp, 
			    control_tx_packet,
			    data_rx_node_id,
			    data_rx_flag,
			    gpp_trf_cp,	// ALU src 1
			    data_rx_packet,
			    gpp_rtr_dp,
			    RAM_rx_data_out,
			    gpp_trf_dp,
			    gpp_tx_data,
			    data_tx_packet);
			    
	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		// set constant values
		node_id = 1;
		max_node = 4;
		// set defualt values
		control_rx_packet = 32'h00000000;
		enable_rtr = 1'b0;
		gpp_rtr_cp = 1'b0;
		data_rx_packet = 32'h00000000;
		gpp_rtr_dp = 1'b0;
		gpp_trf_dp = 1'b0;
		gpp_tx_data = 16'h0000;
		rst = 1'b1;
		#100ps;
		rst = 1'b0;
		#100ps;
		
		// TX testing
		#100ps;
		#100ps;
		gpp_trf_dp = 1'b1;
		gpp_tx_data = 16'h000A;
		#100ps;
		gpp_tx_data = 16'h000B;
		#100ps;
		gpp_tx_data = 16'h000C;
		#100ps;
		gpp_tx_data = 16'h000D;
		#100ps;
		gpp_tx_data = 16'h0005;
		#100ps;
		gpp_trf_dp = 1'b0;
		#100ps;
		#100ps;
		#100ps;
		#100ps;
		#100ps;
		#100ps;
		#100ps;
		control_rx_packet = 32'h0001FFFF;
		#100ps;
		control_rx_packet = 32'h00010000;
	
		// RX testing
		//#100ps;
		//#100ps;
		//control_rx_packet = 32'h00010005;
		//#100ps;
		//control_rx_packet = 32'h00000000;
		//data_rx_packet = 32'h00010005;
		//#100ps;
		//data_rx_packet = 32'h0001000D;
		//#100ps;
		//data_rx_packet = 32'h0001000C;
		//#100ps;
		//data_rx_packet = 32'h0001000B;
		//#100ps;
		//data_rx_packet = 32'h0001000A;
		//#100ps;
		//data_rx_packet = 32'h00000000;
		//enable_rtr = 1'b1;
		//gpp_rtr_cp = 1'b1;
		//#100ps;
		//// gpp_rtr_dp = 1'b1;
		//control_rx_packet = 32'h00010005;
		//#100ps;
	end

endmodule
