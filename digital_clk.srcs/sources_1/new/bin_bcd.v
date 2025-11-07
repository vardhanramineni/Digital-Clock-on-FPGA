`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2025 18:39:48
// Design Name: 
// Module Name: bin_bcd
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
// //////////////////////////////////////////////////////////////////////////////////


module bin_bcd(in, out);
input [5:0] in;
output reg [7:0] out;
always@(*)
begin
    if(in<10)
         out=in;
    else if(in>=10 && in<20)
        out=in+6;
    else if(in>=20 && in<30)
        out=in+12;
    else if(in>=30 && in<40)
        out=in+18;
    else if(in>=40 && in<50)
        out=in+24;
    else if(in>=50 && in<60)
        out=in+30;
    else
        out=in+36;
end
endmodule


