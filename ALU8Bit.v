`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04.10.2023 15:22:25
// Design Name:
// Module Name: 8 bit alu
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


module ALU8bit(
    input [7:0] A,
    input [7:0] B,
    input[3:0] Select,
    input clk,
    input enable,
    output reg[7:0] out = 0,
    output reg Z = 0,
    output reg C = 0,
    output reg S = 0,
    output reg P = 0
);

reg k = 0;

always @(posedge clk & enable)
    begin
    case(Select)
   
    4'h0:
        begin
            out = 0;
        end
    4'h1:
        begin
            out = B;
        end
    4'h2:
        begin
            out = ~B;
        end
    4'h3:  
        begin
            out = A;
        end
    4'h4:  
        begin
            out = ~A;
        end
    4'h5:  
        begin
            out = A + 1;
        end
    4'h6:
        begin
            out = A - 1;
        end  
    4'h7:
        begin
           out = A << B;
        end    
    4'h8:
        begin
            out = A + B;
            Z = (out == 8'b0)?1:0;
            C = (out == 8'b0)?1:0;
            k = ~^out;        //Odd Parity, XNOR of all the bits. If its 0 then Odd else Even
            if (k == 1'b0)
                P = 1;
            else
                P = 0;
        end
    4'h9:
        begin
            out = A - B;
            if(B > A)
                S = 1;
            Z = (out == 8'b0)?1:0;
            C = (out == 8'b0)?1:0;
            k = ~^out;
            if (k == 1'b0)
                P = 1;
            else
                P = 0;
           
        end
    4'hA:
        begin
            out = A + B;
            C = (out == 8'b0)?1:0;
            out = out + C;
            Z = (out == 8'b0)?1:0;
            k = ~^out;
            if (k == 1'b0)
                P = 1;
            else
                P = 0;
        end
    4'hB:
        begin
            out = A - B;
            if(B > A)
                S = 1;
            C = (out == 8'b0)?1:0;
            out = out - C;
            Z = (out == 8'b0)?1:0;
            k = ~^out;
            if (k == 1'b0)
                P = 1;
            else
                P = 0;
        end
    4'hC:
        begin
            out = A & B;
            C = (out == 8'b0)?1:0;
            out = out - C;
            Z = (out == 8'b0)?1:0;
            k = ~^out;
            if (k == 1'b0)
                P = 1;
            else
                P = 0;
        end        
    4'hD:
        begin
            out = A | B;
            C = (out == 8'b0)?1:0;
            out = out - C;
            Z = (out == 8'b0)?1:0;
            k = ~^out;
            if (k == 1'b0)
                P = 1;
            else
                P = 0;
        end      
    4'hE:
        begin
            out = A ^ B;
            C = (out == 8'b0)?1:0;
            out = out - C;
            Z = (out == 8'b0)?1:0;
            k = ~^out;
            if (k == 1'b0)
                P = 1;
            else
                P = 0;
        end  
     
    4'hF:
        begin
            out = ~(A ^ B);
            C = (out == 8'b0)?1:0;
            out = out - C;
            Z = (out == 8'b0)?1:0;
            k = ~^out;
            if (k == 1'b0)
                P = 1;
            else
                P = 0;
        end  
        default: out = 0;
    endcase
    end

endmodule
