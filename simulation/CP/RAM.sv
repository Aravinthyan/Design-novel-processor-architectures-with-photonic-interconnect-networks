module RAM
#(
	parameter WIDTH = 1
)
(
	input logic clk,
	input logic memory_write_enable,
	input logic [WIDTH - 1:0]address_rw,
	input logic [WIDTH - 1:0]data_in,
	output logic [WIDTH - 1:0]data_out
);

	logic [WIDTH - 1:0]RAM[2**WIDTH - 1:0];

	always_comb
	begin
		data_out = RAM[address_rw];
	end

	always_ff@(posedge clk)
	begin
		if(memory_write_enable == 1'b1)
		begin
			RAM[address_rw] = data_in;
		end
	end

endmodule
