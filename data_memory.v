`timescale 1ns / 1ps

module data_memory (
  input clk,
  input [3:0] address,
  input [15:0] write_data,
  input write_enable,
  input read_enable,
  output reg [15:0] read_data
);
  reg [15:0] memory [0:15];

  always @(posedge clk) begin
    if (write_enable)
      memory[address] <= write_data;
    if (read_enable)
      read_data <= memory[address];
  end

endmodule
