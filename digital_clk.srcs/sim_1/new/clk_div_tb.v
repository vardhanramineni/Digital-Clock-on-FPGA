`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2025 18:21:24
// Design Name: 
// Module Name: clk_div_tb
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
//////////////////////////////////////////////////////////////////////////////////545454546


module clk_div_tb;
reg clk,rst;
wire clk1;

clk_div dut(clk,rst,clk1); //// positional 

initial begin
    clk=0;
    forever #1 clk=~clk;
end 

initial begin
    rst=1;
    #20;
    rst=0;

end
initial begin
   
  ///

end
endmodule
