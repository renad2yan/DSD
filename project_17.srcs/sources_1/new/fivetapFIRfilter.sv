`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2024 03:32:50 PM
// Design Name: 
// Module Name: fivetapFIRfilter
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


module fivetapFIRfilter#(
    parameter data_WIDTH = 16,  //  input data
    parameter coeff_WIDTH = 16 // coefficients
)(
    input logic clk,
    input logic reset,
    input logic [data_WIDTH-1:0] x_in, // input
    output logic [data_WIDTH-1:0] y_out // output
);

    // Coefficients
    logic signed [coeff_WIDTH-1:0] h[4:0] = {
        16'd795,   // 0.0243 in Q1.15
        16'd491,   // 0.0150 in Q1.15
        16'd32768, // 1.0 in Q1.15
        16'd491,   // 0.0150 in Q1.15
        16'd795    // 0.0243 in Q1.15
    };
    // Registers 
    logic signed [data_WIDTH-1:0] x[4:0];

    // Intermediate products
    logic signed [data_WIDTH+coeff_WIDTH-1:0] products[4:0];

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset registers
            x[0] <= 0;
            x[1] <= 0;
            x[2] <= 0;
            x[3] <= 0;
            x[4] <= 0;
          
        end else begin
            // Shift inputs
            x[4] <= x[3];
            x[3] <= x[2];
            x[2] <= x[1];
            x[1] <= x[0];
            x[0] <= x_in;

            // Multiply and accumulate
            products[0] <= x[0] * h[0];
            products[1] <= x[1] * h[1];
            products[2] <= x[2] * h[2];
            products[3] <= x[3] * h[3];
            products[4] <= x[4] * h[4];
            
            y_out <= products[0] +products[1] +products[2] +products[3] +products[4];    
            
    end 
    end
endmodule