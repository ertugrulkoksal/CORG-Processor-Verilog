`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:54:19 06/25/2023
// Design Name:   processor
// Module Name:   C:/Users/ertug/Desktop/Xilinix/ProcessorFirstTry/processor_tb.v
// Project Name:  ProcessorFirstTry
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module processor_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] pc_out;
	wire [15:0] alu_result;
	wire jump;
	wire branch;
	wire mem_read;
	wire mem_write;
	wire alu_src;
	wire reg_write;
	wire reg_dst;
	wire jump_reg;

	// Instantiate the Unit Under Test (UUT)
	processor uut (
		.clk(clk), 
		.reset(reset), 
		.pc_out(pc_out), 
		.alu_result(alu_result), 
		.jump(jump), 
		.branch(branch), 
		.mem_read(mem_read), 
		.mem_write(mem_write), 
		.alu_src(alu_src), 
		.reg_write(reg_write), 
		.reg_dst(reg_dst), 
		.jump_reg(jump_reg)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

