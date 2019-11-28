module transceiver_tb;

	// transmitter
	logic [1:0] dest_id;		// RD2
        logic [1:0] data;		// from data memory
        logic enable;				// control signal
        logic [5:0] tx_out;	// output packet
	// receiver
	logic clk;
        logic rst;
        logic [5:0] rx_in;	// received packet
        logic rtr_write_enable;			// control signal
        logic [1:0] rx_addr;		// address you wish to check
        logic [1:0] flag_res;		// flag to see if the data has arrived
        logic [1:0] data_out;	// data read from rx_addr
	// common
	logic [1:0] id;		// from reg1 which holds the id

	transceiver #(2, 2, 2) txrx(
				    // transmitter
				    dest_id,		// RD2
        			    data,		// from data memory
        			    enable,				// control signal
        			    tx_out,	// output packet
				    // receiver
				    clk,
        			    rst,
        			    rx_in,	// received packet
        			    rtr_write_enable,			// control signal
        			    rx_addr,		// address you wish to check
        			    flag_res,		// flag to see if the data has arrived
        			    data_out,	// data read from rx_addr
				    // common
				    id		// from reg1 which holds the id
				    );

	initial
	begin
		clk = 0;
		forever #50ps clk = ~clk;
	end

	initial
	begin
		rst = 1'b1;
		#100ps;
		rst = 1'b0;
		enable = 1'b1;
		id = 2'b10;

		dest_id = 2'b00;
		data = 2'b01;

		#100ps;

		rx_in = 6'b100110;
		#100ps;
		#100ps;
		rx_addr = 2'b10;
		#100ps;
		rtr_write_enable = 1'b1;
		#100ps;
	end

endmodule
