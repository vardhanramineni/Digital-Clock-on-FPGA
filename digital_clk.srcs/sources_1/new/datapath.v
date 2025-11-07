`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.07.2025 17:09:31
// Design Name: 
// Module Name: datapath
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


module datapath(
input clk,
input rst,
input inc_hr,
input inc_min,
input inc_sec,
input rst_sec,
input rst_min,
input rst_hr,
output [5:0] hr,
output [5:0] min,
output [5:0] sec);
    wire [5:0] add_1;
    wire [5:0] mux_1;
    
    wire [5:0] add_2;
    wire [5:0] mux_2;
    
    wire [5:0] add_3;
    wire [5:0] mux_3;
    
    ////sec 
    adder a(sec,add_1);
    
    mux2_1 m1(sec,add_1,inc_sec,mux_1);
    
    reg6_bit r1(clk,rst,rst_sec,mux_1,sec);
    
    ////mins
    
    adder b(min,add_2);
    
    mux2_1 m2(min,add_2,inc_min,mux_2);
    
    reg6_bit r2(clk,rst,rst_min,mux_2,min);
    
    //// hrs
    
    
    adder c(hr,add_3);
    
    mux2_1 m3(hr,add_3,inc_hr,mux_3);
    
    reg6_bit r3(clk,rst,rst_hr,mux_3,hr);
    
    
    
    
endmodule
