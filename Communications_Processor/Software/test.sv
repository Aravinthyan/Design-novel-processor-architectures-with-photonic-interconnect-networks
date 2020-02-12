module test
(
	input logic clk,
	input logic rst,
	output logic [7:0] out
);

	always_ff @(posedge clk)
	begin
		if(rst == 1'b1)
		begin
			out <= 7'b0;
		end
		else
		begin
			if(out == 5)
			begin
				out <= 7'b0;
			end
			else
			begin
				out <= out + 1;
			end
		end
	end

endmodule
