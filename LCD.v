`timescale 1ns / 1ps
  module LCD
(
	 input clk,
    input reset,
    input[15:0] data
 );

	 always @(posedge clk)
	 begin	
			$display("opp:%b imm:%b jum:%b",data[15:13], data[12], data[11]);
		 
	 end
endmodule
