`include "../Processor/processor.sv"
`include "../Components/Instruction_Memory/instruction_memory.sv"
`include "../Components/Data_Memory/data_memory.sv"

module computer
(
	input logic clk,
	input logic rst
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

	processor cpu(clk, 
		      rst,
        	      address_1,
        	      address_2,
        	      read_address_1,
        	      read_address_2,
		      address_rw,
        	      data_in,
        	      data_out,
        	      memory_write_enable);

	instruction_memory #(16, 16, "test.mem") im_computer(address_1,
                                                             address_2,
                                                             read_address_1,
                                                             read_address_2);

        data_memory #(16) dm_computer(clk,
                                      memory_write_enable,
                                      address_rw,
                                      data_in,
                                      data_out);


endmodule
