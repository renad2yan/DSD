`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2024 04:42:17 PM
// Design Name: 
// Module Name: tb_fixed_point_adder
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


module tb_fixed_point_adder;

    // Parameters for the fixed-point adder
    parameter int n1 = 8;
    parameter int m1 = 4;
    parameter int n2 = 8;
    parameter int m2 = 3;

    // Inputs and Outputs
    logic [n1-1:0] A;
    logic [n2-1:0] B;
    logic [(n1 > n2 ? n1 : n2) + (m1 > m2 ? m1 : m2)-1:0] Result;

    // Instantiate the fixed-point adder module
    fixed_point_adder #(n1, m1, n2, m2) uut (
        .A(A),
        .B(B),
        .Result(Result)
    );

    // Test Procedure
    initial begin
        $display("Starting Fixed-Point Adder Testbench...");
        
        // Test Case 1
        A = 8'b00011010; // 1.625 in Q4.4
        B = 8'b00010100; // 1.25 in Q5.3
        #10;
        $display("Test Case 1: A = %0.4f, B = %0.3f, Result = %0.5f",
                 A / (1 << m1), B / (1 << m2), Result / (1 << (m1 > m2 ? m1 : m2)));

        // Test Case 2
        A = 8'b00100000; // 2.0 in Q4.4
        B = 8'b00011000; // 1.5 in Q5.3
        #10;
        $display("Test Case 2: A = %0.4f, B = %0.3f, Result = %0.5f",
                 A / (1 << m1), B / (1 << m2), Result / (1 << (m1 > m2 ? m1 : m2)));

        // Test Case 3
        A = 8'b00110000; // 3.0 in Q4.4
        B = 8'b00100100; // 2.25 in Q5.3
        #10;
        $display("Test Case 3: A = %0.4f, B = %0.3f, Result = %0.5f",
                 A / (1 << m1), B / (1 << m2), Result / (1 << (m1 > m2 ? m1 : m2)));

        // Test Case 4
        A = 8'b00011011; // 1.6875 in Q4.4
        B = 8'b00001110; // 0.875 in Q5.3
        #10;
        $display("Test Case 4: A = %0.4f, B = %0.3f, Result = %0.5f",
                 A / (1 << m1), B / (1 << m2), Result / (1 << (m1 > m2 ? m1 : m2)));

        $display("All Test Cases Completed!");
        $finish;
    end
endmodule
