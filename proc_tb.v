`timescale 1ns / 1ps

`include "LCD.v"

module proc_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] pc_out;
	//wire [15:0] alu_result;
	wire [15:0] instruction;
	wire jump;
	wire branch;
	wire mem_read;
	wire mem_write;
	wire alu_src;
	wire reg_write;
	wire reg_dst;
	wire jump_reg;
	wire [2:0] ALU_op;

	// Instantiate the Unit Under Test (UUT)
	processor uut (
		.clk(clk), 
		.reset(reset), 
		.pc_out(pc_out),
		.instruction(instruction),
		//.result(alu_result), 
		.jump(jump), 
		.branch(branch), 
		.mem_read(mem_read), 
		.mem_write(mem_write), 
		.alu_src(alu_src), 
		.reg_write(reg_write), 
		.reg_dst(reg_dst), 
		.jump_reg(jump_reg), 
		.ALU_op(ALU_op)
	
	);
	LCD lcd (.clk(clk), .reset(reset), .data(instruction));
	
	always begin
    clk = 0;
    #5;
    clk = 1;
    #5;
  end

	initial begin
    reset = 1;
    #10;
    reset = 0;
    #100;
    $finish;
  end

 endmodule
 