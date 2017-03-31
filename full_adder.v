`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2017 04:25:45 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    // full adder inputs and outputs
    input c_i,
    input f_i1, 
    input f_i2, 
    output f_c, 
    output f_s

    );
    
    wire w_c_top; 
    wire w_s_top; 
    wire w_c_bot;
    
    // half adder top
    half_adder ha_top(
    .i1(f_i1), 
    .i2(f_i2),
    .c_o(w_c_top),
    .s_o(w_s_top)
    );
    
    // half adder bottom
    half_adder ha_bot(
    .i1(c_i),
    .i2(w_s_top),
    .c_o(w_c_bot),
    .s_o(f_s)
    );
    
    assign f_c = w_c_bot | w_c_top;  
           
endmodule
