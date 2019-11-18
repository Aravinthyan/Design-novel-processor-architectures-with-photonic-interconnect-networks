module flags_register_tb_1;

	logic clk;	// clock signal
	logic rst;	// reset signal
	logic write_enable;	// write enable signal
	logic d[3:0];	// input signal
	logic q[3:0];	// output signal

        flags_register fr_test(clk, rst, write_enable, d, q);

        initial
        begin
                clk = 0;
                forever #50ps clk = ~clk;
        end

	initial
	begin
		rst = 1'b1;
		#100ps;
		rst = 1'b0;
		write_enable = 1'b1;
		d[3] = 1'b0;
		d[2] = 1'b0;
		d[1] = 1'b0;
		d[0] = 1'b0;
		#100ps;

		d[3] = 1'b0;
		d[2] = 1'b1;
		d[1] = 1'b0;
		d[0] = 1'b0;
		#100ps;
	
		d[3] = 1'b0;
		d[2] = 1'b0;
		d[1] = 1'b1;
		d[0] = 1'b0;
		#100ps;
		
		d[3] = 1'b0;
		d[2] = 1'b0;
		d[1] = 1'b0;
		d[0] = 1'b1;
		#100ps;
		
		d[3] = 1'b1;
		d[2] = 1'b0;
		d[1] = 1'b1;
		d[0] = 1'b0;
		#100ps;
		
		d[3] = 1'b0;
		d[2] = 1'b1;
		d[1] = 1'b0;
		d[0] = 1'b1;
		#100ps;

		d[3] = 1'b1;
		d[2] = 1'b1;
		d[1] = 1'b1;
		d[0] = 1'b1;
		#100ps;
	end

endmodule
