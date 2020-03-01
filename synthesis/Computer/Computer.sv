module Computer
(
	input logic clk,
	input logic rst,
	output logic [15:0] ALU_out_
);

   // Instruction memory
	logic [15:0]address_1;
   logic [15:0]address_2;
   logic [15:0]read_address_1;
   logic [15:0]read_address_2;
   // Data memory
   logic [15:0]address_rw;
   logic [15:0]data_in;
   logic [15:0]data_out;
	// Control Signals
	logic memory_write_enable;

	GPP cpu(clk,
        	rst,
			ALU_out_,
        	address_1,
        	address_2,
        	read_address_1,
        	read_address_2,
        	address_rw,
        	data_in,
        	data_out,
			memory_write_enable);
			
	Instruction_Memory #(5, 16, "out.mem") im_computer(address_1[4:0],
																		address_2[4:0],
																		read_address_1,
																		read_address_2);

   RAM dm_computer(address_rw[4:0],
						 clk,
                   data_in,
						 memory_write_enable,
                   data_out);


endmodule
