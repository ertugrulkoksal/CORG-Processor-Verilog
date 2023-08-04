`timescale 1ns / 1ps

module datamemo_tb;

	// Inputs
	reg clk;
	reg [3:0] address;
	reg [15:0] write_data;
	reg write_enable;
	reg read_enable;

	// Outputs
	wire [15:0] read_data;

	// Instantiate the Unit Under Test (UUT)
	data_memory uut (
		.clk(clk), 
		.address(address), 
		.write_data(write_data), 
		.write_enable(write_enable), 
		.read_enable(read_enable), 
		.read_data(read_data)
	);

	 initial begin
    $dumpfile("datamemo_tb.vcd");
    $dumpvars(0, datamemo_tb);

    clk = 0;
    address = 0;
    write_data = 0;
    write_enable = 0;
    read_enable = 0;
    
    #10;
    clk = 1;

    // Test 1: Write operation
    address = 4'b0000;
    write_data = 16'hA5A5;
    write_enable = 1;
    read_enable = 0;
    #20;
    
    // Test 2: Read operation
    address = 4'b0000;
    write_enable = 0;
    read_enable = 1;
    #10;

    // Test 3: Write operation to another address
    address = 4'b0101;
    write_data = 16'h1234;
    write_enable = 1;
    read_enable = 0;
    #20;
    
    // Test 4: Read operation from another address
    address = 4'b0101;
    write_enable = 0;
    read_enable = 1;
    #10;

    $finish;
  end

  always #5 clk = ~clk;

endmodule
