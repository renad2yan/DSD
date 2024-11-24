`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2024 04:34:37 PM
// Design Name: 
// Module Name: tb_fivetapFIRfilter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_fivetapFIRfilter;
// Parameters
    parameter data_WIDTH = 16;
    parameter coeff_WIDTH = 16;

    // Test signals
    logic clk;
    logic reset;
    logic [data_WIDTH-1:0] x_in;
    logic [data_WIDTH-1:0] y_out;

    // Instantiate the FIR filter
    fivetapFIRfilter #(data_WIDTH, coeff_WIDTH) dut (
        .clk(clk),
        .reset(reset),
        .x_in(x_in),
        .y_out(y_out)
    );

   
    always #5 clk = ~clk;

    initial begin
      
        clk = 0;
        reset = 1;
        x_in = 0;

       
        #10 reset = 0;

        // Apply inputs
        #10 x_in = 16'd32768; // 1.0 in Q1.15
        #10 x_in = 16'd16384; // 0.5 in Q1.15
        #10 x_in = 16'd4915;  // 0.15 in Q1.15
        #10 x_in = 16'd6553;  // 0.2 in Q1.15
        #10 x_in = 16'd8192;  // 0.25 in Q1.15

        #50 $finish;
    end

endmodule
    
