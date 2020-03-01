module PC_set
(
	input logic rst,
	input logic [15:0] PC_in,
	output logic [15:0] PC_out
);

	always_comb
	begin
		if(rst == 1'b1)
		begin
			PC_out = 16'h0000;
		end
		else
		begin
			PC_out = PC_in;
		end
	end

endmodule
