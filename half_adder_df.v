`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2017 03:30:18 PM
// Design Name: 
// Module Name: half_adder_df
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


module half_adder_df(
    input i1,
    input i2,
    output s_o,
    output c_o
    );
    
    assign s_o = i1 ^ i2;   // not using wire
    assign c_o = i1 & i2;   // not using wire
    
endmodule
