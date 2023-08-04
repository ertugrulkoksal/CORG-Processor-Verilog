`timescale 1ns / 1ps

module instruction_memory (
  input [15:0] pc,
  output reg [15:0] instruction
);
  reg [15:0] instructions [255:0];
  integer i;
  
  initial begin
    // Initialize memory with default instruction
    
    for (i = 0; i < 256; i = i + 1) begin
			instructions[i] = 16'b1111100000000000;
		end

    // Assign specific instructions to memory locations
	 //0 add $t2, $t1,$t0     
	 //1 addi $t2, $a0, 5    
	 //2 sub $t0, $t1, $t2 
	 //3 subi $t0, $t1, 2   
	 //4 xor $t3, $t1, $t2    
	 //5 and $sp, $t1, $t2
	 //6 or $v0, $t1, $t2
	 //7 jal label
	 //8 addi $t0, $t0, 15
	 //9 label: addi $t1, $t0, 25
	 
    /*instructions[0] = 16'b0000000101000000;
    instructions[1] = 16'b0001010001000101;
	 instructions[2] = 16'b0100000101000000;
	 instructions[3] = 16'b0101000100000010;
	 instructions[4] = 16'b1000000101001100;
	 instructions[5] = 16'b0010000101011000;
	 instructions[6] = 16'b0110000101011100;
	 instructions[7] = 16'b0010100000001001;
	 instructions[8] = 16'b0001000000001111;
	 instructions[9] = 16'b0001000000111001;*/
	  
	 instructions[0] = 16'b0000010001101000;
    instructions[1] = 16'b0001010000100101;
	 instructions[2] = 16'b0100001001110000;
	 instructions[3] = 16'b0101001001100010;
	 instructions[4] = 16'b1000010101110000;
	 instructions[5] = 16'b0010011001110000;
	 instructions[6] = 16'b0110000001110000;
	 instructions[7] = 16'b0010100000010010;
	 instructions[8] = 16'b0001001001001111;
	 instructions[9] = 16'b0001001101011001;
	 
   
    // Add more instructions as needed
  end

  always @(pc) begin
    if (pc < 256)
      instruction = instructions[pc];
    else
      instruction = 16'd0;
  end

endmodule
