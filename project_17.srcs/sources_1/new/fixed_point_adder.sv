`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2024 04:39:48 PM
// Design Name: 
// Module Name: fixed_point_adder
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


module fixed_point_adder#(

    parameter int n1 = 8,
    parameter int m1 = 4,
    parameter int n2 = 8,
    parameter int m2 = 3
)(
    input logic [n1-1:0] A,
    input logic [n2-1:0] B,
    output logic [(n1 > n2 ? n1 : n2) + (m1 > m2 ? m1 : m2)-1:0] Result
);
    logic [(n1 > n2 ? n1 : n2) + (m1 > m2 ? m1 : m2)-1:0] A_aligned;
    logic [(n1 > n2 ? n1 : n2) + (m1 > m2 ? m1 : m2)-1:0] B_aligned;

    always_comb begin
        A_aligned = {A, {(m1 > m2 ? m1 : m2) - m1{1'b0}}};
        B_aligned = {B, {(m1 > m2 ? m1 : m2) - m2{1'b0}}};
    end

    always_comb begin
        Result = A_aligned + B_aligned;
    end
endmodule
 
