`include "../Datapath/datapath.sv"
`include "../Components/Control_Unit/control_unit.sv"

module processor
(
	input logic clk,
        input logic rst,
        // Instruction memory
        output logic [15:0]address_1,
        output logic [15:0]address_2,
        input logic [15:0]read_address_1,
        input logic [15:0]read_address_2,
        // Data memory
        output logic [15:0]address_rw,
        output logic [15:0]data_in,
        input logic [15:0]data_out,
	// Control Signals
	output logic memory_write_enable
);

        // Control signals
        logic stack_control;
	logic pc_increment_control;
        logic [1:0]pc_control;
        logic general_register_write_enable;
        logic stack_write_enable;
        logic write_data_enable;
        logic [1:0]ALU_soure_2;
        logic [1:0]ALU_control;
        logic branch;
        logic [1:0]general_register_result_select;

        datapath datapath_processor(clk,
                             	    rst,
                             	    address_1,
                             	    address_2,
                             	    read_address_1,
                             	    read_address_2,
                             	    address_rw,
                             	    data_in,
                             	    data_out,
                             	    stack_control,
				    pc_increment_control,
                             	    pc_control,
                             	    general_register_write_enable,
                             	    stack_write_enable,
                             	    write_data_enable,
                             	    ALU_soure_2,
                             	    ALU_control,
                             	    branch,
                             	    general_register_result_select);


	control_unit cu_processor (read_address_1[15:10],
                              	   stack_control,
				   pc_increment_control,
                              	   pc_control,
                              	   general_register_write_enable,
                              	   stack_write_enable,
                              	   write_data_enable,
                              	   ALU_soure_2,
                              	   ALU_control,
                              	   branch,
                              	   memory_write_enable,
                              	   general_register_result_select);

endmodule
