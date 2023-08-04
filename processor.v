`timescale 1ns / 1ps

`include "ALUtry.v"
`include "ControlUnit.v"
`include "data_memory.v"
`include "instruction_memory.v"
`include "register_file.v"
 
module processor
( 
      input clk, reset,  
	   output wire [15:0] pc_out, [15:0] instruction, //result alu_result
      output wire jump, branch, mem_read, mem_write, alu_src, 
						reg_write, reg_dst, jump_reg,  
		output wire [2:0] ALU_op
 );  
	
	 wire [15:0] result;
	 reg[15:0] pc_current;  
	 wire[15:0] pc_next, pc2; // pc artýþ
	 wire[2:0] reg_write_dest, reg_write_dest_1;  
	 wire[2:0] reg_read_addr_1;  //reg_file module
	 wire[2:0] reg_read_addr_2; 
	 wire signed [15:0] reg_write_data;  
	 wire signed [15:0] reg_read_data_1;
	 wire signed [15:0] reg_read_data_2; 
	 wire signed[15:0] mem_read_data; //data memory module
	 wire [2:0] read_data1; //a in ALU
	 wire [2:0] read_data2; //b in ALU
	 wire signed [3:0] ALU_out; //alu output

	 wire signed[15:0] sign_ext_imm, branch_address, jump_address, 
							 im_shift_1, pc_branch, pc_jump, pc_jump_reg;
	 wire [11:0] jump_shift_1; //jum
	 wire is_branch;  //for bne
	 
	 register_file reg_file(.clk(clk),.rst(reset),
									.write_enable(reg_write),  
									.write_destination(reg_write_dest),  
									.write_data(reg_write_data),  
									.read_address_1(reg_read_addr_1),  
									.read_data_1(reg_read_data_1),  
									.read_address_2(reg_read_addr_2),  
									.read_data_2(reg_read_data_2));
		 
	  data_memory data_memory(.clk(clk), 
									 .read_enable(mem_read),  
									 .write_enable(mem_write), 
									 .address(ALU_out),
								    .write_data(reg_read_data_2),
									 .read_data(mem_read_data)); 

	 
	  ALUtry ALUtry(.operation(ALU_op),.a(read_data1),.b(read_data2),.result(result));  

	  ControlUnit control_unit(.opcode(instruction[15:11]),
										.reg_dst(reg_dst),
										.alu_op(ALU_op), .jump(jump),.branch(branch),
										.mem_read(mem_read), .mem_write(mem_write),
										.alu_src(alu_src),.reg_write(reg_write),
										.jump_reg(jump_reg));  
 
    instruction_memory instruction_memory(.pc(pc_current),.instruction(instruction));
	 
	 always @(posedge clk or posedge reset)  //program counter
	 begin   
		 if(reset) 
			pc_current <= 16'd0;   
		 else  
			pc_current = pc_current + 1;  // PC+1 
	 end   
	  
	 assign reg_read_addr_1 = instruction[10:8]; //register file 
	 assign reg_read_addr_2 = instruction[7:5];  
	 assign reg_write_dest_1 = (reg_dst == 1'b1) ? instruction[4:2] : instruction[7:5];
 

	 assign reg_write_dest = (jump==1'b1) ? 3'b111 : reg_write_dest_1; //mux
	 
	 assign sign_ext_imm = {{11{instruction[4]}},instruction[4:0]}; 

  	 assign read_data1 = (alu_src==1'b1) ? sign_ext_imm : reg_read_data_2;
	 assign read_data2 =  reg_read_data_1;  

	 assign pc2 = pc_current + 16'd2; //pc+2
	 
	 assign im_shift_1 = {sign_ext_imm[14:0],1'b0}; 
  
	 assign jump_shift_1 = {instruction[10:0],1'b0};

	 assign jump_address = {{4{pc2[15]}},jump_shift_1};

	 assign branch_address = pc2 + im_shift_1;

	 assign is_branch = (branch && ~reg_dst)||(branch && reg_dst );  // bne
				
		 				  
	 assign pc_branch = (is_branch == 1'b1) ? branch_address : pc2;
	 assign pc_jump = (jump == 1'b1) ? jump_address : pc_branch;
	 assign pc_jump_reg = (jump_reg == 1'b1) ? reg_read_data_1 : pc_jump;
	 assign pc_next = pc_jump_reg;

  
	 assign pc_out = pc_current;  
 
	 assign reg_write_data = (jump == 1'b1) ? (pc_current + 16'd2) : 
						  ((mem_read == 1'b1) ? mem_read_data : ALU_out);
	 
	 
 endmodule  
