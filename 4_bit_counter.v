`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2017 10:40:16 PM
// Design Name: 
// Module Name: counter_4_bit
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


module counter_4_bit(
    input value_i,
    input preset_i,
    input count_i,
    input clk,
    input reset,
    output value_o,
    output timeout_o
    );

    wire w_1b_mux_top_0;
    wire w_1b_mux_top_1;
    wire w_1b_mux_top_2;
    wire w_1b_mux_top_3;
    
    wire w_out_mux_bot;
    wire w_i_b_mux_mid;
    
    wire w_in_dff0;
    wire w_out_dff0;
    wire w_out_dff1;
    wire w_out_dff2;
    wire w_out_dff3;
    
    wire w_in_a_bot_mux;
    wire w_in_b_bot_mux;
    wire w_in_c_bot_mux;
    wire w_in_d_bot_mux;
    wire w_in_e_bot_mux;
    
    wire w_i2_ha0;
    wire w_i2_ha1;
    wire w_i2_ha2;
    wire w_i2_ha3;
    
    wire w_c_o_ha0;
    wire w_c_o_ha1;
    wire w_c_o_ha2;
    
    wire w_and0_out;
    wire w_and1_out;
    wire w_and2_out;
    wire w_and3_out;
    
    
    //------------------------------------------------------------------------------------//
    //  BLOCK TOP AND MIDDLE MUX  
    //------------------------------------------------------------------------------------//
    
    // MUX at top 
    multiplexer mux_top(.ia(w_out_mux_bot), 
                        .ib(i_and_1), 
                        .isel(count_i),
                        .out(w_i_b_mux_mid)
    );
    
    // MUX at middle
    multiplexer mux_mid(.ia(value_i),
                        .ib(w_i_b_mux_mid),
                        .isel(preset_i),
                        .out(w_in_dff0)
    ); 
    
    //------------------------------------------------------------------------------------//
    //  BLOCK COUNTER USING 4 DFF (DFF0, DFF1, DFF2, DFF3)
    //------------------------------------------------------------------------------------//
    
    // DFF 0 
    d_flip_flop dff0(.d_in(w_in_dff0),
                     .reset(reset),
                     .clk(clk),
                     .d_out(w_out_dff0)    
    );
    
    //DFF 1
    d_flip_flop dff1(.d_in(w_in_dff0),
                     .reset(reset),
                     .clk(clk),
                     .d_out(w_out_dff1)    
    );
    
    //DFF 2
    d_flip_flop dff2(.d_in(w_in_dff0),
                     .reset(reset),
                     .clk(clk),
                     .d_out(w_out_dff2)    
    );
    
    //DFF 3
    d_flip_flop dff3(.d_in(w_in_dff0),
                     .reset(reset),
                     .clk(clk),
                     .d_out(w_out_dff3)    
    );
    
    //------------------------------------------------------------------------------------//
    //  BLOCK HALF ADDER (HA0, HA1, HA2, HA3)
    //------------------------------------------------------------------------------------//
    
    // HALF ADDER 0
    half_adder ha0(.i1(w_out_dff0),
                   .i2(w_i2_ha0),
                   .s_o(w_in_b_bot_mux);
                   .c_o(w_i2_ha1);
    );
    
    assign w_i2_ha0 = 1'b1;
    
    // HALF ADDER 1
    half_adder ha1(.i1(w_out_dff1),
                   .i2(w_c_o_ha0),
                   .s_o(w_in_c_bot_mux);
                   .c_o(w_i2_ha2);
    );
    
    // HALF ADDER 2
    half_adder ha2(.i1(w_out_dff2),
                   .i2(w_c_o_ha1),
                   .s_o(w_in_d_bot_mux);
                   .c_o(w_i2_ha3);
    );
    
    // HALF ADDER 2
    half_adder ha3(.i1(w_out_dff3),
                   .i2(w_c_o_ha2),
                   .s_o(w_in_e_bot_mux);
                   .c_o();
    );
    
    
    //------------------------------------------------------------------------------------//
    //  BLOCK BOTTON MUX
    //------------------------------------------------------------------------------------//
    
    // BOTTOM MUX
    multiplexer end_mux(.ia(w_in_a_end_mux),
                        .ib(w_in_b_end_mux),
                        .sel(w_o_and_1),    // uncreated yet
                        .out(w_out_end_mux)
    );
    assign w_b_end_mux = 4'hf;
    
    //------------------------------------------------------------------------------------//
    //  BLOCK COMPARATOR (AND0, AND1, AND2, AND3, BOT_AND )
    //------------------------------------------------------------------------------------//
    
    // AND 
    assign w_and0_out = and(w_1b_mux_top_0, 1'b1);
    assign w_and1_out = and(w_ib_mux_top_1, 1'b1);
    assign w_and2_out = and(w_ib_mux_top_2, 1'b1);
    assign w_and3_out = and(w_ib_mux_top_3, 1'b1);
    
    assign w_bot_and = and(w_and0_out, w_and0_out, w_and0_out, w_and0_out);
    
endmodule
