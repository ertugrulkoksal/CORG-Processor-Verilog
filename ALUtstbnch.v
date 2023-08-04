`timescale 1ns / 1ps

module ALUtstbnch;

	// Inputs
	reg [2:0] operation;
	reg [15:0] a;
	reg [15:0] b;
	reg clk;
	
	
	// Outputs
	wire [15:0] result;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ALUtry uut (
		.operation(operation), 
		.a(a), 
		.b(b), 
		.result(result), 
	);
	 always begin
    #5;
    clk = ~clk;
  end
	initial begin
    // Initialize inputs
    operation = 3'b000; // Addition
    a = 16'b0101010101010101;
    b = 16'b0011001100110011;

    #10;

    // Test case 2: Bitwise AND
    operation = 3'b001;
    a = 16'b0101010101010101;
    b = 16'b1010101010101010;
    #10;

    // Test case 3: Subtraction
    operation = 3'b010;
    a = 16'b1001100110011001;
    b = 16'b0011001100110011;
    #10;

    // Test case 4: Bitwise OR
    operation = 3'b011;
    a = 16'b0101010101010101;
    b = 16'b1010101010101010;
    #10;

    // Test case 5: Bitwise XOR
    operation = 3'b100;
    a = 16'b0101010101010101;
    b = 16'b1010101010101010;
    #10;

    // Test case 6: Shift Left Logical
    operation = 3'b101;
    a = 16'b0101010101010101;
    b = 16'b0011;
    #10;

    // Test case 7: Set Less Than
    operation = 3'b110;
    a = 16'b0101010101010101;
    b = 16'b1010101010101010;
    #10;

    // End of simulation
    //$finish;
  end
      
endmodule

