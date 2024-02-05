`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2022 12:20:01 PM
// Design Name: 
// Module Name: video_terminal_tb
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


module merged_tb(
    );
   
    // video terminal signals
    reg vid_clk;
    reg [7:1] rd;
    reg da;
    wire rda;
    wire rda_n;
    reg clr_btn;
    wire vid1;
    wire vid2;
    wire heartbeat;

    // ps2-to-ascii converter signals
    wire [6:0] ascii_code;
    wire ascii_new;
    reg clk, ps2_clk, ps2_data;
    integer i;

    video_terminal DUT0 (.clk(vid_clk), .rd(rd), .da(da), .rda_n(rda_n), .clr_btn(clr_btn),
                 .vid1(vid1), .vid2(vid2), .heartbeat(heartbeat));

    ps2_keyboard_to_ascii DUT1  (.clk(clk), .ps2_clk(ps2_clk),
                               .ps2_data(ps2_data), .ascii_code(ascii_code),
                               .ascii_new(ascii_new)) ;

    assign rda = ~rda_n;

    always #35 vid_clk = ~vid_clk;
     
    // video terminal test vectors
    initial begin
        vid_clk <= 0;
        rd <= 7'b0000000;
        da <= 0;
        clr_btn <= 0;
        
        #5 clr_btn <= 1;
        #25000000 clr_btn <= 0;
        #2000000 rd <= 7'b1000001;
        #100 da<=1;
        
        @ (negedge rda_n);
        #70 da<=0;
        
    end
    
    // ps2-to-ascii test vectors
    always
    begin
        #10 clk <= ~clk;
    end

    initial
    begin
        clk <= 0;
        ps2_clk <= 1;
        ps2_data <= 1;

        for (i=0; i<2; i = i+1)
        begin
            // type in A
            #500000;
            ps2_data <= 0;
            #43200;
            ps2_clk <= 0;
            #43200;
            ps2_clk <= 1;
            ps2_data <= 0; // D0
            #43200;
            ps2_clk <= 0;
            #43200;
            ps2_clk <= 1;
            ps2_data <= 0; // D1
            #43200;
            ps2_clk <= 0;
            #43200;
            ps2_clk <= 1;
            ps2_data <= 1; // D2
            #43200;
            ps2_clk <= 0;
            #43200;
            ps2_clk <= 1;
            ps2_data <= 1; // D3
            #43200;
            ps2_clk <= 0;
            #43200;
            ps2_clk <= 1;
            ps2_data <= 1; // D4
            #43200;
            ps2_clk <= 0;
            #43200;
            ps2_clk <= 1;
            ps2_data <= 0; // D5
            #43200;
            ps2_clk <= 0;
            #43200;
            ps2_clk <= 1;
            ps2_data <= 0; // D6
            #43200;
            ps2_clk <= 0;
            #43200;
            ps2_clk <= 1;
            ps2_data <= 0; // D7
            #43200;
            ps2_clk <= 0;
            #43200;
            ps2_clk <= 1;
            ps2_data <= 0; // Parity
            #43200;
            ps2_clk <= 0;
            #43200;
            ps2_clk <= 1;
            ps2_data <= 1; // Stop
            #43200;
            ps2_clk <= 0;
            #43200;
            ps2_clk <= 1;
        end
    end



endmodule
