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
	logic pc_increment_control;
        logic [1:0] pc_control;
        logic general_register_write_enable;
        logic stack_write_enable;
        logic stack_control;
        logic write_data_enable;
        logic [1:0] ALU_soure_2;
        logic [1:0] ALU_control;
        logic flags_write_enable;
        logic jump_zero_control;
        logic jump_below_control;
        logic jump_below_equal_control;
        logic jump_above_control;
        logic jump_above_equal_control;
        logic jump_greater_control;
        logic jump_greater_equal_control;
        logic jump_less_control;
        logic jump_less_equal_control;
        logic [1:0] general_register_result_select;

        datapath datapath_processor(clk,
                             	    rst,
                             	    address_1,
                             	    address_2,
                             	    read_address_1,
                             	    read_address_2,
                             	    address_rw,
                             	    data_in,
                             	    data_out,
				    pc_increment_control,
        			    pc_control,
        			    general_register_write_enable,
        			    stack_write_enable,
        			    stack_control,
        			    write_data_enable,
        			    ALU_soure_2,
        			    ALU_control,
        			    flags_write_enable,
        			    jump_zero_control,
        			    jump_below_control,
        			    jump_below_equal_control,
        			    jump_above_control,
        			    jump_above_equal_control,
        			    jump_greater_control,
        			    jump_greater_equal_control,
        			    jump_less_control,
        			    jump_less_equal_control,
        			    general_register_result_select);


	control_unit cu_processor (read_address_1[15:10],
			    	   pc_increment_control,
        			   pc_control,
        			   general_register_write_enable,
        			   stack_write_enable,
        			   stack_control,
        			   write_data_enable,
        			   ALU_soure_2,
        			   ALU_control,
        			   flags_write_enable,
        			   jump_zero_control,
        			   jump_below_control,
        			   jump_below_equal_control,
        			   jump_above_control,
        			   jump_above_equal_control,
        			   jump_greater_control,
        			   jump_greater_equal_control,
        			   jump_less_control,
        			   jump_less_equal_control,
				   memory_write_enable,
        			   general_register_result_select);

endmodule
