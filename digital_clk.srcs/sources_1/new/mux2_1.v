`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.07.2025 16:51:01
// Design Name: 
// Module Name: mux2_1
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


module mux2_1(
input[5:0] in1,in2,
input  sel,
output reg[5:0] out
);
    always@(*) begin
        case(sel)
            1'b0:out=in1;
            1'b1:out=in2;
            default:out=0;
        endcase
    end
endmodule
