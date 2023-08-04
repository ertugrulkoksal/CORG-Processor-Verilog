`timescale 1ns / 1ps

module ALU
 (    
      input [2:0] operation,     // ALU operation  
      input signed [15:0] a,     // src1  
      input signed [15:0] b,     // src2   
      output reg[15:0] result,   // ALU result       
      output zero  
 );  
	 reg multiplier_sign, multiplicand_sign;
	 reg signed [7:0] multiplier, multiplicand, product_upper, product_lower;
	 reg signed [15:0] multiplier_temp, multiplicand_temp, product;
	 integer i; 
	 
	 always @(operation, a, b)  
	 case(operation)   
		 3'b000: result = a + b; // add  
		 3'b001: result = b - a; // sub  
		 3'b010: result = a & b; // and  
		 3'b011: result = a | b; // or  
		 3'b111: begin 
						if (b<a) result = 16'd1;  // slt
						else result = 16'd0;  
					end 
		 3'b101: result = a << b; // sll
		 3'b110: result = a >> b; // srl	
		 
		 default: result = 16'b0;
	 endcase  
	 
	 assign zero = (result==16'd0) ? 1'b1: 1'b0;  
 endmodule
 