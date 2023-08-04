`timescale 1ns / 1ps

module register_file_tb;

	// Inputs
	reg clk;
	reg rst;
	reg write_enable;
	reg [2:0] write_destination;
	reg [15:0] write_data;
	reg [2:0] read_address_1;
	reg [2:0] read_address_2;

	// Outputs
	wire [15:0] read_data_1;
	wire [15:0] read_data_2;

	// Instantiate the Unit Under Test (UUT)
	register_file uut (
		.clk(clk), 
		.rst(rst), 
		.write_enable(write_enable), 
		.write_destination(write_destination), 
		.write_data(write_data), 
		.read_address_1(read_address_1), 
		.read_data_1(read_data_1), 
		.read_address_2(read_address_2), 
		.read_data_2(read_data_2)
	);

	 initial begin
    clk = 0;
    rst = 1;
    write_enable = 0;
    write_destination = 0;
    write_data = 0;
    read_address_1 = 0;
    read_address_2 = 0;
    
    #10 rst = 0; // Deassert reset
    
    // Write operation
    #20 write_enable = 1;
    write_destination = 1;
    write_data = 16'b0000100110100101;
    
    // Read operation
    #30 read_address_1 = 1;
    
    // Write operation
    #40 write_enable = 1;
    write_destination = 2;
    write_data = 16'b1010001101010111;
    
    // Read operation
    #50 read_address_1 = 1;
    read_address_2 = 2;
    
    // Add more test cases as needed
    
    #100 $finish; // End simulation
  end
  
  always begin
    #5 clk = ~clk; // Toggle clock every 5 time units
  end
      
endmodule

