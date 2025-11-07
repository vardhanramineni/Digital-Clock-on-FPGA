`timescale 1ns /1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2025 18:12:36
// Design Name: 
// Module Name: digital_clk
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


module digital_clk(
input clk,
input rst,

output  [7:0] seven_seg_en,seven_seg_out
 );
    wire [5:0] hour;
    wire [5:0] min;
    wire [5:0] sec;
    wire inc_hr,inc_min,inc_sec,rst_hr,rst_min,rst_sec;
    ////clk division
    wire clk1;
    wire [7:0] bcd_hour,bcd_min,bcd_sec;
    
    clk_div cd(clk,rst,clk1);
    
    
    ///// datapath
    datapath d(clk1,rst,inc_hr,inc_min,inc_sec,rst_sec,rst_min,rst_hr,hour,min,sec);
    
    
    
    ///////// control path
    controlpath c(clk1,rst,sec,min,hour,inc_sec,inc_min,inc_hr,rst_sec,rst_min,rst_hr);
 
    bin_bcd b1(hour,bcd_hour);
    bin_bcd b2(min,bcd_min);
    bin_bcd b3(sec,bcd_sec);
    
    seven_seg s1(clk,3'b110,0,0,bcd_hour[7:4],bcd_hour[3:0],bcd_min[7:4],bcd_min[3:0],bcd_sec[7:4],bcd_sec[3:0],seven_seg_en,seven_seg_out);
    
    
endmodule
