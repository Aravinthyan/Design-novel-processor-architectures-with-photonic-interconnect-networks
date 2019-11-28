`include "../Components/Comparator/comparator.sv"
`include "../Components/Register/register.sv"
`include "../Components/Data_Register_File/data_register_file.sv"
`include "../Components/Flags_Register_File/flags_register_file.sv"
`include "../Components/Sign_Extension/sign_extension.sv"

module receiver
#(
        parameter ID_WIDTH = 1,
        parameter DATA_WIDTH = 1,
	parameter WIDTH = 1
)
(
	input logic clk,
	input logic rst,
	input logic [ID_WIDTH + DATA_WIDTH + ID_WIDTH - 1:0] rx_in,
	input logic [ID_WIDTH - 1:0] id,
	input logic rtr_write_enable,
	input logic [ID_WIDTH - 1:0] rx_addr,
	output logic [WIDTH - 1:0] flag_res,
	output logic [DATA_WIDTH - 1:0] data_out
);

	logic [ID_WIDTH + DATA_WIDTH + ID_WIDTH - 1:0] rx_data;
	logic comp_out;
	logic flag;

		// instantiate recieved register
		register #(ID_WIDTH + DATA_WIDTH + ID_WIDTH) rx_in_reg(clk, rst, rx_in, rx_data);
	
		// instantiate comparator
		comparator #(ID_WIDTH) comp(rx_data[ID_WIDTH - 1:0], id, comp_out);

		// instantiate flags register file
		flags_register_file #(ID_WIDTH) flags(clk, 
						      comp_out, 
						      rtr_write_enable, 
						      rx_data[ID_WIDTH + DATA_WIDTH + ID_WIDTH - 1:DATA_WIDTH + ID_WIDTH],
					      	      rx_addr,
					      	      flag);
		// instantiate sign extension
		sign_extension #(1, WIDTH) sign_ex(flag, flag_res);

		// instantiate data register file
		data_register_file #(ID_WIDTH, DATA_WIDTH) data(clk,
								comp_out,
								rx_data[ID_WIDTH + DATA_WIDTH + ID_WIDTH - 1:DATA_WIDTH + ID_WIDTH],
								rx_addr,
								rx_data[DATA_WIDTH + ID_WIDTH - 1:ID_WIDTH],
								data_out);

endmodule
