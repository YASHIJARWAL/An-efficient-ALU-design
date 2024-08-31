`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2023 23:08:57
// Design Name: 
// Module Name: grayALU
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


module grayALU(
    input [7:0] A,
    input [7:0] B,
    inout [7:0] a,
    inout [7:0] b,
    input[3:0] Select,
    input clk,
    input enable,
    output [7:0] result,
    output Zout,
    output Cout ,
    output Sout,
    output Pout
);

GrayEncoder8Bit gray1(A,a);
GrayEncoder8Bit gray2(B,b);
ALU8bit alu1(  .A(a),.B(b),.Select(Select),.clk(clk),.enable(enable),.out(result),.Z(Zout),.C(Cout),.S(Sout),.P(Pout));
endmodule
