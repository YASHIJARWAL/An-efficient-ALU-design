`timescale 1ns/1ps

/////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2023 11:40:25
// Design Name: 
// Module Name: GrayEncoder8Bit
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


module GrayEncoder8Bit(
    input [7:0] data, // 8 Bit data
    output [7:0] out // output grey code
    );
    
    genvar i;
    generate 
        for (i = 0;i < 7;i = i+1) begin: xoring
            assign out[i] = data[i]^ data[i+1];
        end

        
    endgenerate 
    assign out[7] = data[7];
        
endmodule
