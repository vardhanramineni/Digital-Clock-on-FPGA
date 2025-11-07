`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.07.2025 16:56:23
// Design Name: 
// Module Name: reg5_bit
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


module reg5_bit(
input clk,
input rst,
input [4:0] in,
output reg [4:0] out);
    
    always@(posedge clk) begin
        if(rst) begin
            out<=0;
        end 
        else  begin
            out<=in;
        end
    
    end
    
    
endmodule
