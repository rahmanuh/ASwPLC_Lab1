`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2017 03:37:55 PM
// Design Name: 
// Module Name: half_adder_behave
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


module half_adder_behave(
    input i1,
    input i2,
    output s_o,
    output c_o
    );
    
    reg s_o, c_o;
    
    always @ (i1 or i2) begin
        s_o = i1 ^ i2;
        c_o = i1 & i2;
    end
    
endmodule
