`include "../Transmitter/transmitter.sv"
`include "../Receiver/receiver.sv"

module transceiver
#(
	parameter ID_WIDTH = 1,
	parameter DATA_WIDTH = 1,
	parameter WIDTH = 1
)
(
	// transmitter
	input logic [ID_WIDTH - 1:0] dest_id,		// RD2
        input logic [DATA_WIDTH - 1:0] data,		// from data memory
        input logic enable,				// control signal
        output logic [ID_WIDTH + DATA_WIDTH + ID_WIDTH- 1:0] tx_out,	// output packet
	// receiver
	input logic clk,
        input logic rst,
        input logic [ID_WIDTH + DATA_WIDTH + ID_WIDTH - 1:0] rx_in,	// received packet
        input logic rtr_write_enable,			// control signal
        input logic [ID_WIDTH - 1:0] rx_addr,		// address you wish to check
        output logic [WIDTH - 1:0] flag_res,		// flag to see if the data has arrived
        output logic [DATA_WIDTH - 1:0] data_out,	// data read from rx_addr
	// common
	input logic [ID_WIDTH - 1:0] id		// from reg1 which holds the id
);

	// transmitter
	transmitter #(ID_WIDTH, DATA_WIDTH) tx(dest_id,
					       data,
				       	       id, 
				       	       enable,
				       	       tx_out);
	
	// receiver
	receiver #(ID_WIDTH, DATA_WIDTH, WIDTH) rx(clk,
        					   rst,
        					   rx_in,
        					   id,
        					   rtr_write_enable,
        					   rx_addr,
        					   flag_res,
        					   data_out);

endmodule
