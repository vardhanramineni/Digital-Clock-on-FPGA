`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2025 19:17:18
// Design Name: 
// Module Name: seven_seg
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

module seven_seg(clk,count_dig,in7,in6,in5,in4,in3,in2,in1,in0,AN,out);
input clk;
input [2:0]count_dig;
input [3:0] in7,in6,in5,in4,in3,in2,in1,in0;
output reg [7:0] AN,out;
integer i;
reg clk_ref;
// Refresh Counter clk
always @(posedge clk)
begin
    if(i==49999)
    begin
        i<=0;
        clk_ref<=~clk_ref;
    end
    else
        i<=i+1;
end
// Refresh Counter
reg[2:0] count;
always @(posedge clk_ref)
begin
    if(count==count_dig-1)
        count<=0;
    else
        count<=count+1;        
end
reg [3:0] temp;
always @(posedge clk_ref)
begin
    case(count)
    3'b000: begin
            AN<=8'b11111110;
            temp<=in0;
            end
    3'b001: begin
                AN<=8'b11111101;
                temp<=in1;
            end
    3'b010: begin
                AN<=8'b11111011;
                temp<=in2;
            end
    3'b011: begin
                AN<=8'b11110111;
                temp<=in3;
            end
    3'b100: begin
                AN<=8'b11101111;
                temp<=in4;
            end
    3'b101: begin
                AN<=8'b11011111;
                temp<=in5;
            end
    3'b110: begin
                AN<=8'b10111111;
                temp<=in6;
            end
    3'b111: begin
                AN<=8'b01111111;
                temp<=in7;
            end
    default:    begin
                    AN<=1;
                    temp<=0;
                end
    endcase
end

always @(clk_ref or temp) begin
    case (temp)
        4'b0000: out = 8'b00000011;  
        4'b0001: out = 8'b10011111;  
        4'b0010: out = 8'b00100101;  
        4'b0011: out = 8'b00001101;  
        4'b0100: out = 8'b10011001; 
        4'b0101: out = 8'b01001001;  
        4'b0110: out = 8'b01000001; 
        4'b0111: out = 8'b00011111; 
        4'b1000: out = 8'b00000001;  
        4'b1001: out = 8'b00001001; 
        4'b1010: out = 8'b00010001;
        4'b1011: out = 8'b11000001; 
        4'b1100: out = 8'b01100011;  
        4'b1101: out = 8'b10000101; 
        4'b1110: out = 8'b01100001; 
        4'b1111: out = 8'b01110001;  
    endcase
end
endmodule

