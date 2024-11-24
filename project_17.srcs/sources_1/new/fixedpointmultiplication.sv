`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2024 01:46:31 PM
// Design Name: 
// Module Name: fixedpointmultiplication
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


module fixedpointmultiplication#(parameter n1=3, parameter m1 =5, parameter n2=3, parameter m2=5)(
input logic [n1+m1-1:0]a,
input logic [n2+m2-1:0]b,
output logic [n1+m1+n2+m2-1:0] prod

    );
    assign prod = a*b;
endmodule
