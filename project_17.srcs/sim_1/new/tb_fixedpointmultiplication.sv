`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2024 02:23:07 PM
// Design Name: 
// Module Name: tb_fixedpointmultiplication
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

module tb_fixedpointmultiplication;

    // Parameters
    parameter n1 = 3;
    parameter m1 = 5;
    parameter n2 = 3;
    parameter m2 = 5;

    // Inputs and Outputs
    logic [n1+m1-1:0] a;
    logic [n2+m2-1:0] b;
    logic [n1+n2+m1+m2-1:0] prod0;

    // Instantiate the module
    fixedpointmultiplication #(n1, m1, n2, m2) dut0 (
        .a(a),
        .b(b),
        .prod(prod)
    );
    
    // Instantiate the module
    // Inputs and Outputs
    logic [n1+m1-1:0] a1;
    logic [n2+m2-1:0] b1;
    logic [n1+n2+m1+m2-1:0] prod1;
    fixedpointmultiplication #(7, 8, 3, 9) dut1 (
        .a(a1),
        .b(b1),
        .prod(prod1)
    );
    

    // Test Procedure
    initial begin
        //Example 
        a = 8'b00011010; // 1.625 in Q3.4
        b = 8'b00010100; // 1.25 in Q3.4
//2.03125 
        #10
   ;  

        $display("Test Case 1:");
        $display("a: %0.4f, b: %0.4f, prod: %0.8f", 
                 a / (1 << m1), b / (1 << m2), prod / (1 << (m1 + m2)));

        $finish;
    end

endmodule
   
