module top_ps2(input wire clk, input wire ps2_clk, input wire ps2_data,
           output wire ascii_new, output wire [6:0] ascii_code);

    ps2_keyboard_to_ascii ps2ascii  (.clk(clk), .ps2_clk(ps2_clk),
                               .ps2_data(ps2_data), .ascii_code(ascii_code),
                               .ascii_new(ascii_new)) ;



endmodule
