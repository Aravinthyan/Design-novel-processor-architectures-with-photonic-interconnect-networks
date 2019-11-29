module flags_register_file
#(
	parameter ADDR_WIDTH_RF = 1
)
(
	input logic clk,
	input logic rx_write_enable,
	input logic rtr_write_enable,
	input logic [ADDR_WIDTH_RF - 1:0] address_1,
	input logic [ADDR_WIDTH_RF - 1:0] address_2,
	input logic [ADDR_WIDTH_RF - 1:0] address_3,
	output logic read_data
);

	logic registers[2**ADDR_WIDTH_RF - 1:0];
	logic zero;
	logic one;

	always_comb
	begin	
		zero = 1'b0;
		one = 1'b1;
	end

	always_comb
	begin
		read_data = registers[address_3];
	end

	always_ff@(posedge clk)
	begin
		if(rx_write_enable == 1'b1)
		begin
			registers[address_1] <= one;
		end
		if(rtr_write_enable == 1'b1)
		begin
			registers[address_2] <= zero;
		end
	end	

endmodule
