`timescale 1ns / 1ps


module controlunit_tb;

	// Inputs
	reg [4:0] opcode;

	// Outputs
	wire reg_dst;
	wire alu_src;
	wire reg_write;
	wire mem_read;
	wire mem_write;
	wire branch;
	wire [2:0] alu_op;
	wire jump_reg;
	wire jump;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.opcode(opcode), 
		.reg_dst(reg_dst), 
		.alu_src(alu_src), 
		.reg_write(reg_write), 
		.mem_read(mem_read), 
		.mem_write(mem_write), 
		.branch(branch), 
		.alu_op(alu_op), 
		.jump_reg(jump_reg), 
		.jump(jump)
	);

	initial begin
    $monitor("Opcode: %b, Reg_Dst: %b, ALU_Src: %b, Reg_Write: %b, Mem_Read: %b, Mem_Write: %b, Branch: %b, ALU_Op: %b, Jump_Reg: %b, Jump: %b",
             opcode, reg_dst, alu_src, reg_write, mem_read, mem_write, branch, alu_op, jump_reg, jump);
             
    // Test 1: jr 
    opcode = 5'b10101;
    #100;
    
    // Test 2: subi
    opcode = 5'b01010; 
    #100;
    
    // Test 3: beq
    opcode = 5'b10010; 
    #100;
    
    // Test 4: lw
    opcode = 5'b11010; 
    #100;
    
    // Test 5: j
    opcode = 5'b00001;
    #100;
    
    $finish;
  end
      
endmodule

