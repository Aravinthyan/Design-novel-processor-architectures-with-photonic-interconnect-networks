/***********************************************************************************
*	File name
				comms_processor.sv
*	Description
				This module describes how the control plane works.
*	Parameters
				NONE
*	Inputs
				clk - The clock for the system.

				rst - Signal to reset the system to the default values.
				
				node_id - This will be the id that will be given to the node in the system. NOTE: EACH NODE MUST HAVE A DIFFERENT ID OTHERWISE THERE WILL BE ISSUES IN TX/RX.
				
				max_node - This shows the maximum number of nodes in the ring topology.
				
				data_rx_complete_flag - This flag will reset the data_rx_flag. The value for this is sent from the data plane reciever.
				
				control_rx_packet - This is the packet that will be recieved on the control plane.

				data_tx_complete_flag - This flag will reset the data_tx_flag. The value for this is sent from the data plane transmitter.

				RAM_tx_data_out - This input has the value equal to the top of the RAM of the data plane tx RAM.

				sp_tx_current - This has the value of the stack pointer from the data plane tx RAM. This is used to see if the data plane tx RAM is empty or not.
				
				enable_rtr - This is a control signal that will allow the GPP to retrive data from the CP if it is possible.

				gpp_rtr_cp - This is a control signal that pauses rx from gpp so that gpp can retrive data from rx RAM.
*	Outputs	
				control_tx_packet - This is the packet that is transmitted on the control plane.

				data_rx_node_id - This is the value that is sent to a control unit which sets the wavelength/spatial channel of the reciever.

				data_tx_flag - This is a flag which indicates if the node is transmitting data on the data plane.

				data_rx_flag - This is used to show the control plane if data is being received on the data plane. Thus the control plane will not say yes for another ping if set. This is also a flag that is used by the GPP to see if it can retrive data from the data plane receiver. This will be connected to the ALU_src_1.

				gpp_trf_cp - this is a flag that is used by the GPP to transfer data from the GPP RAM to the data plane transmitter RAM. This will be connected to the ALU_src_1.
*	Author
				Sreethyan Aravinthan (UCL)
**********************************************************************************/

module Control_Plane
(
	input logic clk,
	input logic rst,
	input shortint node_id,
	input shortint max_node,
	input logic data_rx_complete_flag,	// ***
	input logic [31:0] control_rx_packet,
	input logic data_tx_complete_flag,	// ***
	input logic [15:0] RAM_tx_data_out,	// ***
	input logic [15:0] sp_tx_current,	// ***
	input logic enable_rtr,
	input logic gpp_rtr_cp,
	output logic [31:0] control_tx_packet,
	output logic [15:0] data_rx_node_id,
	output logic data_tx_flag,	// ***
	output logic data_rx_flag,
	output logic gpp_trf_cp
);

	// COMMENT ALL THE CODE AND MAKE SURE ALL THE VARIABLE NAMES ARE
	// SNESIBLE. FURTHERMORE THE VAIRABLES THAT ARE LINKED BETWEEN THE
	// MODULES SHOULD HAVE THE SAME NAME TO AVOID CONFUSION
	
	// MAKE SURE THE CORRECT CONTROL SIGNALS AND LOGIC IS APPLIED TO THE
	// SYSTEM. BELOW IS HOW TO DO IT FOR BOTH THE TX AND RX
	//
	// THEN MAKE THE LINK BETWEEN GPP AND COMMS_PROCESSOR
	//
	// THEN CREATE THE INSTRUCTIONS THAT ARE NECESSARY

	// HOW SHOULD THE DATA FROM THE GPP RAM BE PLACED INTO THE TX RAM
	// MAKE PHYSICAL CONNECTION BETWEEN GPP RAM AND TX RAM
	// OUTPUT FROM THE CONTROL PLANE IF THERE ARE ENOUGH CLOCK CYCLES TO
	// THIS RESULT SHOULD BE CONNECTED TO ALU SRC 1
	// UPON CHECKING IF IT IS OK TO TRANSMIT THEN TRANSFER THE DATA
	// ELSE DO NOT TRANSMIT AND TRY AGAIN LATER
	// NEED TO CREATE TWO INSTRUCTIONS
	// 1ST INSTR: TO COMPARE SEE IF THE NUMBER OF CYCLES ARE ENOUGH
	// 2ND INSTR: TRANSFER THE DATA FROM THE GPP RAM TO TX RAM

	/*
	* transfer_func:
	* 	cbt	# compare the value to see if data cane be transferred
	* 	jnz exit # if the result is not equal to zero then data cannot be
		     	   transfered
		# transfer 5 packet data
		trf
		trf
		trf
		trf
		trf
	* exit:
		return
	*/
      
       	// HOW SHOULD THE DATA FROM THE RX RAM O THE GPP RAM BE PLACED
	// MAKE THE CONNECTIONS BETWEEN THE GPP AND THE DATA RX
	// SET CONTROL SIGNAL FROM THE GPP TO THE CONTROL PLANE
	// THEN THIS WILL MAKE SURE NOT TO SET THE RX FLAG IF A PING COMES
	// THEN COMPARE THE RX FLAG OUTPUT FROM THE CONTROL PLANE TO SEE IF
	// THE DATA CAN BE RETRIEVED
	// IF THE COMPARISION LEADS TO THE CONCLUSION SUCH THAT IT CANNOT BE
	// RETRIVED NOW THEN DO NOT TRY TO RETRIVE NOW
	// IF THE COMPARISON LEADS TO THE CONCLUSION SUCH THAT THE DATA CAN BE
	// RETRIVED FROM THE DATA PLANE THEN RETRIVE THE PACKET
	// 4 INSTRUCTIONS NEED TO BE DESIGNED
	// 1ST INSTR: SET THE CONTROL SIGNAL TO PAUSE THE RECIEVE IN THE
	// CONTROL PLANE
	// 2ND INSTR: CHECK IF THE DATA CAN BE RETRIEVED FROM THE RX RAM
	// 3RD INSTR: RETRIEVE THE DATA FROM THE RX RAM TO THE GPP RAM
	// 4TH INSTR: RESUME RECEVING THE DATA ON THE CONTROL PLANE

	/*
	*	pr	# instruction 'pause recieving' this stops the control
	*		plane from saying yes if it receives a ping
	*	cbr	# instruction which sees if the data can be retrived
	*		# instruction is called 'can be retrived'
	*		# Remember the data_rx_flag is connected to the
	*		# gpp. specfically the ALU src 1
	*	jz exit # if the result is zero then this indicates that the
	*		data plane is reciving. therefore do not retrive the
	*		data. 
	*	rtr
	*	rtr
	*	rtr
	*	rtr
	*	rtr
	*exit:
	*	rr	# instruction 'resume receving'
	*	return
	*/

	// THINGS TO DO
	// PART 1

	// go through the design of the system and find out hot the control
	// signals from gpp should be connected with the control and data
	// plane
	// ADD CONTROL SIGNAL FROM GPP
	// OUTPUT THE DATA_RX_FLAG TO SEE IF THE GPP CAN GO AND RETIRVE THE
	// DATA FROM RAM
	// OUTPUT THE CURRENT SLOT AND TX_FLAG(ALREADY DONE AS DATA_TX_FLAG)
	// BOTH WILL BE USED TO SEE IF THE GPP CAN PUT DATA INTO THIS RAM
	// THIS IS DONE BY SEEING IF THE NUMBER OF CLOCK CYCLES IS GREATER
	// THAN THE MINIMUM NUMBER OF CYCLES REQUIRED TO TRANSFER THE DATA

	// variables
	
	// the system is desgined such that each slot on the control plane is
	// equal to n*clock_period. Therefore to count to n the variable count
	// exists which increases with each clock cycle and resets to 0 when
	// it hits the max value such that the count*clock_period ==
	// n*clock_period
	logic [1:0] count;
	// This variable holds the current slot on the control plane. By
	// default it will equal to 1. However, it will increment to the
	// maximum number of nodes in the network. therefore the type of this
	// variable is shortint as this is a 16bit value and our system aims
	// to hold 2^10 nodes
	shortint slot;
	// this is a flag and it is used so that a ping is not made more than
	// once in the allocated slot on the control plane for a specfic node
	logic control_tx_flag;
	// defining constants which are used for the ping response
	localparam [15:0] all_zero = 16'h0000;
	localparam [15:0] all_one = 16'hFFFF;
	shortint num_of_slots = 0;
	logic gpp_rtr = 1'b0;

	always_comb
	begin
		if(enable_rtr == 1'b1)
		begin
			gpp_rtr = gpp_rtr_cp;
		end
	end

	// increment counter for each clock cycle
	// 100 Gb/s transcieverer. Find the number of bits sending (32 bits). Math. Make as short as possible. nut limited by clock period of processor
	// 32 / 100*10^9 = 3.2*10^-10s: it takes this long to send a packet
	// therefore it will take 3.125*10^9 Hz
	// set clock speed to 3*10^9 Hz
	// let 1 slot to be 3 clock cycle

	// this logic deals with setting the value of the current slot. thus
	// indicating if the curent node can transmit on the control plane or not
	// provided reset is set to 0
	always_ff @(posedge clk)
	begin
		// this logic sets the default values of count and slot
		// provided reset is asserted
		if(rst == 1'b1)
		begin
			count <= 2'b00;
			slot <= 1;
		end
		else
		begin
			// this means one slot time has occured
			if(count == 2)
			begin
				// if the slot is equal to max number of nodes in the
				// network then reset the slot to 1
				if(slot == max_node)
				begin
					slot <= 1;
				end
				// otherwise just increment the slot by one to
				// show that the next node can now transmit
				else
				begin
					slot <= slot + 1;
				end
				// reset count to 0
				count <= 2'b00;
			end
			// increment the count value
			else
			begin
				count <= count + 1;
			end
		end
	end
	
	// control plane logic
	// provided reset is set to 0
	always_ff @(posedge clk)
	begin
		// this sets the default values of all the variables that is used
		// within the control plane
		// provided reset is set to 1
		if(rst == 1'b1)
		begin
			control_tx_packet <= 32'b0;
			data_rx_flag <= 1'b0;
			data_tx_flag <= 1'b0;
			control_tx_flag <= 1'b0;
			data_rx_node_id <= 16'h0000;
		end
		else
		begin
			// if the slot is equal to the node id then it means that this
			// node can now transmit on the control plane a packet
			// to another node saying that it wishes to transmit
			// data and wants to see if it is free
			if(slot == node_id)
			begin
				// provided the stack is not empty
				// and in this slot a transmission has not taken place
				// and provided the data plane is not tx to another
				// node
				if(sp_tx_current != 16'b0 && control_tx_flag == 1'b0 && data_tx_flag == 1'b0)
				begin
					// send a packet consisting of the dest_id
					// and src_id
					control_tx_packet <= {RAM_tx_data_out, node_id};
					control_tx_flag <= 1'b1;
				end
				// if it does not meet the above conditions then send
				// out 32'b0
				else
				begin
					control_tx_packet <= 32'b0;
				end
			end
			// if the slot is not equal to the node it then it means that
			// this node cannot ping another node but other nodes
			// may ping this node regarding data transfer
			// the response to this should be on the control plane
			else
			begin
				// reset the control_tx_flag for later
				control_tx_flag <= 1'b0;
				// compare the 16 most significant bits to the node id
				// if equal then the packet is meant for this node
				// if the packet is not meant for this node then drop
				// it
				// provided the lower 16 bits are not 0x0000 and
				// 0xFFFF this means that this node is being pinged
				// for a data transfer
				if((control_rx_packet[31:16] == node_id) && (control_rx_packet[15:0] != all_zero) && (control_rx_packet[15:0] != all_one))
				begin
					// if the data plane is not recieving and the gpp does not want to rtr the data from RAM
					// the node can accept data on the data plane 
					if((data_rx_flag == 1'b0) && (gpp_rtr_cp == 1'b0))
					begin
						// tell the data plane which node is
						// receving the data
						data_rx_node_id <= control_rx_packet[15:0];
						// set the flag which tells the data
						// plane that it can transmit
						data_rx_flag <= 1'b1;
						// tell the node that asked that it
						// can transmit to this node on the
						// data plane
						control_tx_packet <= {control_rx_packet[15:0], all_one};
					end
					// if the data plane is already recieving data
					// or if the flag is set from the gpp
					// then 
					// from another node then tell the
					// current node not now
					else // if(data_rx_flag == 1'b1 || gpp_rtr == 1'b1)
					begin
						control_tx_packet <= {control_rx_packet[15:0], all_zero};
					end
				end
				// if the packet was not meant for the node then drop
				// it and let the control_tx_packet equal to 0
				else
				begin
							control_tx_packet <= 32'b0;
				end
			end
			
			// this will reset the data_rx_flag if all the data has been received
			// the signal data_rx_complete_flag will go high from the data plane
			// indicating that the local flag for rx goes to zero
			// this is provided the rst is low
			if(data_rx_complete_flag == 1'b1)
			begin
				data_rx_flag <= 1'b0;
			end
			
			// this is the logic for ping response
			// provided reset is set to 0
			
			// provided the packet is meant for this node
			// and provided the packet has all zeros or all ones for the
			// lower 16 bits then this is packet is a ping response
			if(control_rx_packet[31:16] == node_id && (control_rx_packet[15:0] == all_zero || control_rx_packet[15:0] == all_one))
			begin
				// if the reponse is one then the requested node is
				// not busy and it can accept data on the data
				// plane
				if(control_rx_packet[15:0] == all_one)
				begin
					data_tx_flag <= 1'b1;
				end
			end
	
			// this will reset the data_tx_flag if all the data has been
			// transmitted
			// the signal data_tx_complete_flag will go high from the data plane
			// indicating that the local flag for tx goes to zero
			// this is provided the rst is low
			if(data_tx_complete_flag == 1'b1)
			begin
				data_tx_flag <= 1'b0;
			end
			
		end
	end
	
	// this logic is used to see if data can be transfered from the GPP to CP
	always_comb
	begin
		// check if data is being transmitted
		if(data_tx_flag == 1'b0)
		begin
			// logic to calcualte the number of slots depending on
			// the current slot, node id & max node in network
			if(node_id < slot)
			begin
				num_of_slots = max_node - slot + node_id - 1;
			end
			else if(node_id > slot)
			begin
				num_of_slots = node_id - slot - 1;
			end
			else // if(node_id == slot)
			begin
				num_of_slots = 0;
			end
		end
		// if not then set the flag to 0
		else
		begin
			gpp_trf_cp = 1'b0;
			num_of_slots = 0;
		end
		
		// if the number of slots is greater that or equal to
		// 2 then set the flag as there are enough
		// clock cycles
		if(num_of_slots >= 2)
		begin
			gpp_trf_cp = 1'b1;
		end
		else
		begin
			gpp_trf_cp = 1'b0;
		end
	end

endmodule
