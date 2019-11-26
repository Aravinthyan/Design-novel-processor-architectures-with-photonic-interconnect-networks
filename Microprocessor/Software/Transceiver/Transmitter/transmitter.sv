module transmitter
#(
	parameter ID_WIDTH = 1,
	parameter DATA_WIDTH = 1
)
(
	input logic [ID_WIDTH - 1:0] dest_id,
	input logic [DATA_WIDTH - 1:0] data,
	input logic [ID_WIDTH - 1:0] src_id,
	input logic enable,
	output logic [ID_WIDTH + DATA_WIDTH + ID_WIDTH- 1:0] tx_out
);

	// index variable
	genvar i;
	generate
		for(i = 0; i < ID_WIDTH; i++)
		begin : dest_id_tx
			and(tx_out[i], dest_id[i], enable);
		end
		for(i = ID_WIDTH; i < ID_WIDTH + DATA_WIDTH; i++)
		begin : data_tx
			and(tx_out[i], data[i - ID_WIDTH], enable);
		end
		for(i = ID_WIDTH + DATA_WIDTH; i < ID_WIDTH + DATA_WIDTH + ID_WIDTH; i++)
		begin : src_id_tx
			and(tx_out[i], src_id[i - (ID_WIDTH + DATA_WIDTH)], enable);
		end
	endgenerate

endmodule
