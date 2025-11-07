`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.07.2025 17:38:24
// Design Name: 
// Module Name: controlpath
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

module controlpath(
input clk,
input rst,
input [5:0] sec,
input [5:0] min,
input [5:0] hr,
output reg inc_sec,
output reg inc_min,
output reg inc_hr,
output reg rst_sec,
output reg rst_min,
output reg rst_hr
);
    
    parameter s0=2'b00;
    parameter s1=2'b01;
    parameter s2=2'b10;
    parameter s3=2'b11;
    
    reg [1:0] c_state,n_state;
//    wire sec59,min59,hr23;
    


    always@(posedge clk or posedge rst) begin
        if(rst) begin
            c_state<=s0;
          
         end
        else begin
            c_state<=n_state;
        end 
    end 
    
    
   always@(*) begin
        case(c_state) 
            s0: begin
//            rst_sec=1;
//            rst_min=1;
//            rst_hr=1;
//            rst_hr=0;
//            rst_min=0;
//            rst_sec=0;
            n_state<=s1; end
            s1: begin 
                if(sec==6'd58&&min!=6'd59&&hr!=6'd24) n_state<=s2;
                else if(min==6'd59&&sec==6'd58&&hr!=6'd23) n_state<=s3;
                else if(hr==6'd23&&min==6'd59&&sec==6'd58) n_state<=s0;
                else n_state<=s1; end
            s2: n_state<=s1;  
            s3: n_state<=s1;
            default: n_state=s0;
        endcase
   end
   
   
   
   
   always@(*)
   begin
   case(c_state)
    s0:
    begin
        rst_sec=1;
        rst_min=1;
        rst_hr=1; 
        inc_sec=0;
        inc_min=0;
        inc_hr=0;
    end
        
    s1: begin
         inc_sec=1;
         inc_min=0;
         inc_hr=0;
         rst_sec=0;
         rst_min=0;
         rst_hr=0; 
    end
    s2: begin
        rst_sec=1;
        rst_min=0;
        rst_hr=0;
        inc_min=1;
        inc_sec=0;
        inc_hr=0;
        end
    s3: begin
        rst_sec=1;
        rst_min=1;
        inc_hr=1;
        inc_min=0;
        inc_sec=0;
        rst_hr=0;
        end
    default :   
    begin
        rst_sec=1;
        rst_min=1;
        rst_hr=1; 
        inc_min=0;
        inc_sec=0;
        inc_hr=0;
     end
 endcase
 end
 
    
endmodule
