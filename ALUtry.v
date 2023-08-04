`timescale 1ns / 1ps

module ALUtry
 (    
      input [2:0] operation,     // ALU operation 
		input signed [15:0] a,     //first  
      input signed [15:0] b,     //second    
      output reg[15:0] result   // result of ALU
 );   
	 
	 reg [1:0] shift_amt;
	  
	 always @(operation, a, b)  begin
		case(operation)   
		
			3'b000: result = a + b; // add  
			3'b001: result = a & b; // and
			3'b010: result = b - a; // sub  
			3'b011: result = a | b; // or  
			3'b100: result = a ^ b; //xor
			3'b101: result = a << b; // sll
			3'b110: result = a >> shift_amt; // srl
		 
			default: result = 16'b0;
	
	  endcase  	
  
	end	
		always @(b) begin
			case (operation)
				3'b110: shift_amt = b[1:0];   // assign shift amount for srl
				default: shift_amt = 0;       // default shift amount
			endcase
	end
 
 endmodule
 