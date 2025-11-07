`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2025 18:16:48
// Design Name: 
// Module Name: clk_div
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


module clk_div(
input clk,
input rst,
output reg clk1
    );
    reg [26:0] count;
    always@(posedge clk,posedge rst) begin
        if(rst) begin
            count<=0;
            clk1<=0;
        
        end
        else if(count==(50000000-1)) begin
            clk1<=~clk1;
            count<=0;
        
        end
        else begin
            count<=count+1;
        end
    
    end
endmodule