#include <stdio.h>
// include other header files that are required

int slots = 1;
char control_rx_1 = 0;
char control_rx_2 = 0;
uint16_t control_rx_1_flag = 1;
char slots_flag = 0;
char data_rx = 0;

void main(void)
{
	// perform the necessary settings
	// look at the slots value and set the timmers count appropriately
	
	/*
	 * there are two states the comms system can be
	 * state 1: the node pings another node in the ring network to see if it is free to be transmitted on the data plane. Checks RAM to see if there is anything to be sent. This will be done on the control plane.
	 * state 2: Wait for a ping from another node and accept the data if this node is not recieving from another node at that point in time. The ping is done on the control plane and the data is recieved on the data plane.*/
	while(1)
	{
		// check if the node can ping another node to see if it can accept data
		if(slots == 1 && control_rx_1 == 0 && slots_flag == 0 && get_data)
		{
			// data format
			// dest addr
			// src addr
			transmit_on_control_plane(get_node_addr+src_node_addr);
			slots_flag = 1;
		}
		else if(slots == 1 && control_rx_1 == 1)
		{
			if(control_rx_1_flag == 0xFFFF)
			{
				// transmit on the data plane
				// therefore set the control signal for the data plane to 1
				control_signal_data_plane = 1;
				// the specfic hardware for the data plane will transmit if the control signal is 1
				control_rx_1 = 0;
			}
		}
		if(slots == 3 && control_rx_2 == 1)
		{	
			if(data_rx == 0)
			{
				transmit_on_control_plane(src_addr+0xFFFF);
				data_rx = 1;
				set_data_plane_control_signals(src_addr);
			}
			else if(data_rx == 1)
			{
				transmit_on_control_plane(src_addr+0x0000);	
			}
			control_rx_2 = 0;
		}
	}
}

void timer_ISR(void)
{
	// _ _ _ | | | | | | | | | _ _ _
	// this is means that the node was transmitting to see if a node is free to accept data
	// 100 Gb/s transcieverer. Find the number of bits sending (32 bits). Math. Make as short as possible. nut limited by clock period of processor
	// 32 / 100*10^9 = 3.2*10^-10s: it takes this long to send a packet
	// therefore it will take 3.125*10^9 Hz
	// set clock speed to 
	if(slots == 1) 
	{
		set_count_time(slots=3);
		slots_flag = 0;
		slots = 3;
	}
	// this means the node was recieving data until now
	else if(slots == 3)
	{	
		set_count_time(slots=1);
		slots = 1;
	}
}

void control_rx_ISR(void)
{
	// data is rx when slots == 1
	if(slots == 1)
	{
		// rx data format
		// dest addr: which is this nodes addr
		// flag: which states if it can tx or not. values are 0xFFFF (for yes) or 0x0000 (for no)
		// if the rx data is meant for this node then check if the node can transmit on the data plane
		if(dest_addrr == this_nodes_addr)
		{
			control_rx_1 = 1;
			control_rx_1_flag = flag;
		}
	}
	else if(slots == 3)
	{
		// rx data format
		// dest addr
		// src addr
		if(dest_addr == this_node_addr)
		{
			control_rx_2 = 1;
		}
	}
}

// 2 questions
// 1) how to tackle putting data on the control processor ram from gpp
// 2) how to retrive data from the data processor ram to gpp whilst there may be incoming data
