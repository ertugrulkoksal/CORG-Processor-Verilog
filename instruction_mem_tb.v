`timescale 1ns / 1ps


module instruction_mem_tb;

	reg [15:0] pc;

	wire [15:0] instruction;

	instruction_memory uut (
		.pc(pc), 
		.instruction(instruction)
	);

	initial begin
		
	  pc = 0; 
    
    repeat (256) begin
      #100; 
      
      $display("Instruction at PC %d: %b", pc, instruction);
      
      pc = pc + 1; 
    end
    
    $finish; 
  end
      
endmodule

