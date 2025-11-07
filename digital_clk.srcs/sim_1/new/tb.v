//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.07.2025 18:51:29
// Design Name: 
// Module Name: tb
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


module tb();
    reg clk,rst;
    wire [4:0] hour;
    wire [5:0] min,sec;
    
    digital_clk dut(.clk(clk),.rst(rst),.hour(hour),.min(min),.sec(sec));
    
    initial begin
        clk=0;
        forever #5 clk=~clk;
    end
    
    
    initial begin
        rst=1;
        #20;
        rst=0;
        $display("reset done");
    end
    
    initial begin 
        #1000;
        $display("simulation finished");
        $finish();
    end
    
endmodule
