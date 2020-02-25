module data_plane_rx
(
	// the clock for this system
	input logic clk,
	// signal to reset the system
	input logic rst,
	// this is the packet that is recieved on the data plane
	input logic [31:0] data_rx_packet,
	// this will contain the node id
	input shortint node_id,
	// this is a control signal that comes from the gpp and it is set if
	// the gpp wants to retrive data from the RAM
	input logic gpp_rtr_dp,
	// this is a flag that is set for one clock cycle which will reset the
	// data_rx_flag on the control plane
	output logic data_rx_complete_flag,
	// this is the output of the RAM and it is connected to the gpp to
	// transfer the recevied data
	output logic [15:0] RAM_rx_data_out
);

	// RAM will be part of the data plane
	// there will be two lots of RAMs
	// RAM1: for transmitting data
	// RAM2: for recieving data
	
	// variables
	// this is a control signal that allows data to be written to the RAM
	// if the received packet is for this node
	logic rx_enable;
	// this holds the next sp value. Also is the input for the register
	logic [15:0] sp_rx_next;
	// this is the current sp value and it is the output of the register
	logic [15:0] sp_rx_current;
	// this will hold current sp value - one
	logic [15:0] sp_rx_current_plus_one;
	// this will hold current sp value - one
	logic [15:0] sp_rx_current_minus_one;
	// this is used to add to subtract from the stack pointer
	localparam [15:0] one = 16'h0001;
	// this is the data that will be written into the RAM
	logic [15:0] data_rx_current;
	// this is the RAM address that will be accessed
	logic [15:0] RAM_address;
	// this will hold the data that is fed into the sp multiplexer
	// there are three values
	// same value as earlier
	// sp + 1
	// sp - 1
	logic [15:0] sp_rx_mux_data [3:0];	
	// this will be the control signals of the sp multiplexer
	logic [1:0] sp_rx_mux_control;
	// this will contain the RAM addresses that can be accessed and are
	// the inputs to the multiplexer for the RAM address choice
	logic [15:0] RAM_rx_address_mux_data [1:0];
	// this is used to see if the number of data packets received is equal to
	// the fixed packet length	
	logic [2:0] count = 3'b000;

	// wire up the control signal for the stack pointer multiplexer
	assign sp_rx_mux_control = {gpp_rtr_dp, rx_enable};
		
	// this combinational logic sets the values for all the multiplexer
	// data
	always_comb
	begin
		// stack pointer multiplexer data being set
		sp_rx_mux_data[0] = sp_rx_current;
		sp_rx_mux_data[1] = sp_rx_current_plus_one;
		sp_rx_mux_data[2] = sp_rx_current_minus_one;
	
		// set the RAM address multiplexer data
		RAM_rx_address_mux_data[0] = sp_rx_current;
		RAM_rx_address_mux_data[1] = sp_rx_current_plus_one;
	end

	// instantiate multiplexer to choose the next stack pointer
	Multiplexer #(2, 16) sp_rx_mux(sp_rx_mux_control, sp_rx_mux_data, sp_rx_next);
	
	// instantiate register for stack pointer rx
	Register #(16) sp_rx_reg(clk, rst, sp_rx_next, sp_rx_current);

	// ALU for stack pointer increment to point to the latest data that
	// has been added
	ALU #(16) sp_increment(sp_rx_current, one, 2'b00, sp_rx_current_plus_one);

	// ALU for stack pointer decrement. this is needed if the data is
	// retrived from the RAM
	ALU #(16) sp_decrement(sp_rx_current, one, 2'b01, sp_rx_current_minus_one);
	
	// multiplexer for choosing the most appropriate address
	Multiplexer #(1, 16) RAM_rx_address_mux(rx_enable, RAM_rx_address_mux_data, RAM_address);

	// instantiate RAM modules
	RAM RAM_rx (RAM_address, clk, data_rx_current, rx_enable, RAM_rx_data_out);

	// instantiate register for stack pointer rx
	Register #(16) data_rx_reg(clk, rst, data_rx_packet[15:0], data_rx_current);
	
	// this logic deals with how to deal with a packet that is recieved
	// provided the reset state is 0	
	always_ff @(posedge clk)
	begin
		// this logic will deal with what the default values should be
		// provided reset is set to 1
		if(rst == 1'b1)
		begin
			rx_enable <= 1'b0;
			count <= 3'b000;
			data_rx_complete_flag <= 1'b0;
		end
		else
		begin
			// if the destination id on the rx packet is equal to the node
			// id then the packet is for this node
			if(data_rx_packet[31:16] == node_id)
			begin
				// save in RAM and change stack pointer value
				// set the rx_enable flag to 1
				rx_enable <= 1'b1;
				// if count is equal to 4 - indicates the entire data
				// is sent from the source node
				if(count == 3'b100)
				begin
					// reset count
					count <= 3'b000;
					// set this flag to 1 thus allowing the the
					// rx_flag at the control plane to be reset
					data_rx_complete_flag <= 1'b1;
				end
				// if the count is not equal to 4 then the number of
				// packets recieved is not right
				else
				begin
					// increment count
					count <= count + 1;
				end
			end
			// if the dest id does not match the node id then set
			// rx_enable to 0 preventing a write into RAM
			else
			begin
				rx_enable <= 1'b0;
			end
			// this logic will deal with ensuring that the data_rx_complete_flag
			// is set to 1 for only 1 clock cycle if it is set
			// provided the reset state is 0
			if(data_rx_complete_flag == 1'b1)
			begin
				// reset the flag
				data_rx_complete_flag <= 1'b0;
			end
		end
	end

endmodule
