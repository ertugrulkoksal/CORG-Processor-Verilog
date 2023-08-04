`timescale 1ns / 1ps

  module ControlUnit (
  input [4:0] opcode,
  output reg reg_dst,
  output reg alu_src,
  output reg reg_write,
  output reg mem_read,
  output reg mem_write,
  output reg branch,
  output reg [2:0] alu_op,
  output reg jump_reg,
  output reg jump
);

  always @(*) begin
    case (opcode)
      
	//R-Type
		
		5'b00000: begin   //add
			reg_dst = 1;
			alu_src = 0;
			reg_write = 1;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			alu_op = 3'b000;  
			jump = 0;
			jump_reg = 0;
      end
		
		5'b00100: begin   //and
			reg_dst = 1;
			alu_src = 0;
			reg_write = 1;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			alu_op = 3'b001;  
			jump = 0;
			jump_reg = 0;
      end
		5'b01000: begin   //sub
			reg_dst = 1;
			alu_src = 0;
			reg_write = 1;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			alu_op = 3'b010;  
			jump = 0;
			jump_reg = 0;
      end
		5'b01100: begin   //or
			reg_dst = 1;
			alu_src = 0;
			reg_write = 1;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			alu_op = 3'b011;  
			jump = 0;
			jump_reg = 0;
      end
		5'b10000: begin   //xor
			reg_dst = 1;
			alu_src = 0;
			reg_write = 1;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			alu_op = 3'b100;  
			jump = 0;
			jump_reg = 0;
      end
		5'b11000: begin   //sll
			reg_dst = 1;
			alu_src = 0;
			reg_write = 1;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			alu_op = 3'b110;  
			jump = 0;
			jump_reg = 0;
      end
		5'b11100: begin   //srl
			reg_dst = 1;
			alu_src = 0;
			reg_write = 1;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			alu_op = 3'b111;  
			jump = 0;
			jump_reg = 0;
      end
				
		5'b10101: begin   //jr
			reg_dst = 1;
			alu_src = 0;
			reg_write = 1;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			alu_op = 3'b101;  
			jump_reg = 1;
      end
	
	//I-Type
	
     5'b00010: begin   //addi
			reg_dst = 0;
			alu_src = 1;
			reg_write = 1;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			alu_op = 3'b000;  
			jump = 0;
			jump_reg = 0;
      end
		5'b00110: begin   //andi
			reg_dst = 0;
			alu_src = 1;
			reg_write = 1;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			alu_op = 3'b001;  
			jump = 0;
			jump_reg = 0;
      end
		5'b01010: begin   //subi
			reg_dst = 0;
			alu_src = 1;
			reg_write = 1;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			alu_op = 3'b010;  
			jump = 0;
			jump_reg = 0;
      end
		5'b01110: begin   //ori
			reg_dst = 0;
			alu_src = 1;
			reg_write = 1;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			alu_op = 3'b011;  
			jump = 0;
			jump_reg = 0;
      end
		5'b10010: begin   //beq
			reg_dst = 0;
			alu_src = 0;
			reg_write = 0;
			mem_read = 0;
			mem_write = 0;
			branch = 1;
			alu_op = 3'b100;  
			jump = 0;
			jump_reg = 0;
      end
		5'b10110: begin   //bne
			reg_dst = 0;
			alu_src = 0;
			reg_write = 0;
			mem_read = 0;
			mem_write = 0;
			branch = 1;
			alu_op = 3'b101;  
			jump = 0;
			jump_reg = 0;
      end
		5'b11010: begin   //lw
			reg_dst = 0;
			alu_src = 1;
			reg_write = 1;
			mem_read = 1;
			mem_write = 0;
			branch = 0;
			alu_op = 3'b110;  
			jump = 0;
			jump_reg = 0;
      end
		5'b11110: begin   //sw
			reg_dst = 0;
			alu_src = 1;
			reg_write = 0;
			mem_read = 0;
			mem_write = 1;
			branch = 0;
			alu_op = 3'b111;  
			jump = 0;
			jump_reg = 0;
      end
		
		//J-Type
		
		5'b00001: begin   //j
			reg_dst = 0;
			alu_src = 0;
			reg_write = 0;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			alu_op = 3'b000;  
			jump = 1;
			jump_reg = 0;
      end
		5'b00101: begin   //jal
			reg_dst = 0;
			alu_src = 0;
			reg_write = 1;
			mem_read = 0;
			mem_write = 0;
			branch = 0;
			alu_op = 3'b001;  
			jump = 1;
			jump_reg = 0;
      end
		

      default: begin
        alu_op = 3'b000;   // default values
        alu_src = 0;
        reg_write = 0;
        jump_reg = 0;
        branch = 0;
        mem_read = 0;
        mem_write = 0;
        reg_dst = 0;
        jump = 0;
      end
    endcase
  end

endmodule

