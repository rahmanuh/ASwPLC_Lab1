`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2017 02:38:41 PM
// Design Name: 
// Module Name: d_flip_flop
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


module d_flip_flop(
    input d_in,
    input reset,
    input clk,  
    output d_out
    );
    
    reg d_out;
        
    always @(posedge clk)
    begin
        if(reset == 1'b1)
            d_out <= 1'b0;
        else 
            d_out <= d_in;
    end
    
endmodule
