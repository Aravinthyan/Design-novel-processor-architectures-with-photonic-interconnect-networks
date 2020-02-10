module data_plane_tx
(
	// the clock for this system
	input logic clk,
	// signal to reset the system
	input logic rst,
	// a control signal from the gpp to transfer data from the gpp RAM to
	// the data plane tx RAM
	// this will be a control signal and it will be part of an instruction
	input logic gpp_trf_dp,
	// this will be the data that will be written to the RAM
	input logic [15:0] gpp_tx_data,
	// this will be the node's id
	input shortint node_id,
	// this will be a flag from the control plane which indicates the data
	// plane for a transmission to happen
	input logic data_tx_flag,
	// this will be flag that will be sent from the data plane to the
	// control plane to indicate that the transmission has completed. Thus
	// reseting the flag at the control plane and allowing a new
	// transmission if needed
	output logic data_tx_complete_flag,
	// this is the data packet that is getting transmitted to the rx node
	// on the data plane
	output logic [31:0] data_tx_packet,
	// this holds the output of the RAM
	output logic [15:0] RAM_tx_data_out,
	// this will be the output value from the register
	output logic [15:0] sp_tx_current
);
	
	// this is used to see if the number of data packets sent is equal to
	// the fixed packet length
	logic [2:0] count;
	// this holds the current dest node that all the packets need to be
	// transmitted to
	logic [15:0] current_dest_node;
	// this is a flag that is used to transmit a special packet to the
	// destination node
	// this special packet consists of the destination node and the src
	// node id
	logic first_flag;
	// this is used to add to subtract from the stack pointer
	localparam [15:0] one = 16'h0001;
	// this will hold the data that is fed into the sp multiplexer
	// there are three values
	// same value as earlier
	// sp + 1
	// sp - 1
	logic [15:0] sp_tx_mux_data [3:0];
	// this will hold the next sp value that will be the input to the
	// register
	logic [15:0] sp_tx_next;
	// this contains the sp plus 1
	logic [15:0] sp_tx_current_plus_one;
	// this contains the sp minus 1
	logic [15:0] sp_tx_current_minus_one;
	// this will be the control signals of the sp multiplexer
	logic [1:0] sp_tx_mux_control;
	// this will contain the RAM addresses that can be accessed and are
	// the inputs to the multiplexer for the RAM address choice
	logic [15:0] RAM_tx_address_mux_data [1:0];
	// This is RAM address that is currently being accessed
	logic [15:0] RAM_address;
	// this is a flag that is used within the data plane to indicate if
	// there should be a transmission
	logic tx;

	// this combinational logic sets the values for all the multiplexer
	// data
	always_comb
	begin
		// stack pointer multiplexer data being set
		sp_tx_mux_data[0] = sp_tx_current;
		sp_tx_mux_data[1] = sp_tx_current_plus_one;
		sp_tx_mux_data[2] = sp_tx_current_minus_one;
	
		// set the RAM address multiplexer data
		RAM_tx_address_mux_data[0] = sp_tx_current;
		RAM_tx_address_mux_data[1] = sp_tx_current_plus_one;
	end
	
	// wire up the control signal for the stack pointer multiplexer
	assign sp_tx_mux_control = {tx, gpp_trf_dp};
	// 0 0 - same
	// 0 1 - plus 1
	// 1 0 - minus 1
	
	// instantiate multiplexer to choose the next stack pointer
	multiplexer #(2, 16) sp_tx_mux(sp_tx_mux_control, sp_tx_mux_data, sp_tx_next);
	
	// instantiate register for stack pointer tx
	register #(16) sp_tx_reg(clk, rst, sp_tx_next, sp_tx_current);

	// ALU for stack pointer increment to point to the latest data that
	// has been added
	ALU #(16) sp_increment(sp_tx_current, one, 2'b00, sp_tx_current_plus_one);

	// ALU for stack pointer decrement. this is needed if the data is
	// retrived from the RAM
	ALU #(16) sp_decrement(sp_tx_current, one, 2'b01, sp_tx_current_minus_one);
	
	// multiplexer for choosing the most appropriate address
	multiplexer #(1, 16) RAM_tx_address_mux(gpp_trf_dp, RAM_tx_address_mux_data, RAM_address);

	// instantiate RAM modules
	RAM #(16) RAM_tx(clk, gpp_trf_dp, RAM_address, gpp_tx_data, RAM_tx_data_out);

	// need to set a variable and not depend on the data_tx_flag_out
	// not good due to the clock cycles required to reset it as well


	// get the destination node from the top of
	// the node
	always_comb
	begin
		// provided the data plane is not transmitting get the value
		if(tx == 1'b0)
		begin
			current_dest_node = RAM_tx_data_out;
		end
	end

	// On the positive edge of the clock set the tx
	// value to 0
	// provided the reset state is set to 1
	always_ff @(posedge clk iff rst == 1'b1)
	begin
		tx <= 1'b0;
	end
	
	// On the positive edge of data_tx_flag set tx to 1
	// provided the reset state is set to 0
	always_ff @(posedge data_tx_flag iff rst == 1'b0)
	begin
		tx <= 1'b1;
	end

	// if reset is set then set the flag to 0
	always_ff @(posedge clk iff rst == 1'b1)
	begin
		// set the flag to 0
		data_tx_complete_flag <= 1'b0;
	end
	
	// logic for sending out a pulse for one clock cycle after a packet
	// has been transmitted
	// provided the system is not in the reset state
	always_ff @(posedge clk iff rst == 1'b0)
	begin
		if(data_tx_complete_flag == 1'b1)
		begin
			// reset the flag
			data_tx_complete_flag <= 1'b0;
		end
		//else	// for other values set to 0
		//begin
		//	data_tx_complete_flag <= 1'b0;
		//end
	end

	// if the system is in the reset state
	// then transmit a packet with all zeros and set all variables and
	// flags to 0
	// provided the reset state is 1
	always_ff @(posedge clk iff rst == 1'b1)
	begin
		data_tx_packet <= 32'h0000;
		count <= 3'b000;
		first_flag <= 1'b0;
		tx <= 1'b0;
	end

	// logic for what packet should be transmitted on each clock edge on
	// the data plane tx
	// provided the reset state is 0
	always_ff @(posedge clk iff rst == 1'b0)
	begin
		// if the tx flag has been set then it means the
		// system can now transmit the packet
		if(tx == 1'b1)
		begin
			// this logic is used for the first packet
			// that is sent
			// it is special as it sends the current nodes
			// id in the packet which will be useful for
			// the rx processor
			if(first_flag == 1'b0)
			begin
				// set the flag so that the next time
				// the correct packet is sent
				first_flag <= 1'b1;
				// send this packet in this clock
				// cycle where it contains the dest
				// node id and the current node id
				data_tx_packet <= {current_dest_node, node_id};
			end
			// if the flag is set then the 1st packet is
			// sent
			else
			begin
				// send the packet containing the
				// follwoing format
				// destination node id and data at the
				// top of stack
				data_tx_packet <= {current_dest_node, RAM_tx_data_out};
				
				// if the count is equal to 3 then all
				// the packets have been sent
				// this is because in the
				// system design we have
				// decided to use fix packet
				// length
				if(count == 3)
				begin
					// rest all the flags
					first_flag <= 1'b0;
					count <= 0;
					tx <= 1'b0;
					// set this flag to reset the
					// flag at the control plane
					data_tx_complete_flag <= 1'b1;
				end
				// if the count does not equal to
				// 3 then all the packets have
				// not been sent to the rx
				// node
				else
				begin
					count <= count + 1;
				end
			end
		end
		// if the transmit signal is not given then 
		else	
		begin
			data_tx_packet <= 32'h0000;
		end
	end

endmodule
