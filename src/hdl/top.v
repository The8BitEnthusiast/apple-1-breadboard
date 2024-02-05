`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2022 12:20:01 PM
// Design Name: 
// Module Name: top
// Project Name: Apple 1 Video Terminal Display 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Instantiation:
// 
//////////////////////////////////////////////////////////////////////////////////

module top(

    input clk,
    input [7:1] rd,
    input da,
    output rda,
    input clr_btn,
    output vid1,
    output vid2,
    output heartbeat,
    input ps2_clk, 
    input ps2_data,
    output ascii_new, 
    output [6:0] ascii_code
    );

    wire clk_out;
    wire clk_locked;
    wire locked;
    
    wire rda_n;
    
    assign rda = ~rda_n;

    clk_gen clk0 (.clk_in(clk), .clk_out(clk_out), .locked(locked));

    assign clk_locked = clk_out & locked;

    video_terminal vt0 (.clk(clk_locked), 
        .rd(rd), 
        .da(da), 
        .clr_btn(clr_btn),
        .rda_n(rda_n), 
        .vid1(vid1), 
        .vid2(vid2),
        .heartbeat(hearbeat));

    ps2_keyboard_to_ascii ps2ascii  (.clk(clk), .ps2_clk(ps2_clk),
                               .ps2_data(ps2_data), .ascii_code(ascii_code),
                               .ascii_new(ascii_new)) ;

endmodule
