`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.07.2025 17:00:59
// Design Name: 
// Module Name: reg6_bit
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


module reg6_bit(
input clk,
input rst,
input rst2,
input [5:0] in,
output reg [5:0] out);
    
    always@(posedge clk or posedge rst) begin
        if(rst || rst2) begin
            out<=0;
        end 
        else begin
            out<=in;
        end
        
    end
    
    
endmodule