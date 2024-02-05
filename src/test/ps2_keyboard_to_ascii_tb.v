module ps2_keyboard_to_ascii_tb();

    wire [6:0] ascii_code;
    wire ascii_new;

    reg clk, ps2_clk, ps2_data;

    integer i;

    ps2_keyboard_to_ascii DUT (.clk(clk), .ps2_clk(ps2_clk),
                               .ps2_data(ps2_data), .ascii_code(ascii_code),
                               .ascii_new(ascii_new)) ;

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
            #29412;
            ps2_clk <= 0;
            #29412;
            ps2_clk <= 1;
            ps2_data <= 0; // D0
            #29412;
            ps2_clk <= 0;
            #29412;
            ps2_clk <= 1;
            ps2_data <= 0; // D1
            #29412;
            ps2_clk <= 0;
            #29412;
            ps2_clk <= 1;
            ps2_data <= 1; // D2
            #29412;
            ps2_clk <= 0;
            #29412;
            ps2_clk <= 1;
            ps2_data <= 1; // D3
            #29412;
            ps2_clk <= 0;
            #29412;
            ps2_clk <= 1;
            ps2_data <= 1; // D4
            #29412;
            ps2_clk <= 0;
            #29412;
            ps2_clk <= 1;
            ps2_data <= 0; // D5
            #29412;
            ps2_clk <= 0;
            #29412;
            ps2_clk <= 1;
            ps2_data <= 0; // D6
            #29412;
            ps2_clk <= 0;
            #29412;
            ps2_clk <= 1;
            ps2_data <= 0; // D7
            #29412;
            ps2_clk <= 0;
            #29412;
            ps2_clk <= 1;
            ps2_data <= 0; // Parity
            #29412;
            ps2_clk <= 0;
            #29412;
            ps2_clk <= 1;
            ps2_data <= 1; // Stop
            #29412;
            ps2_clk <= 0;
            #29412;
            ps2_clk <= 1;
        end
    end

endmodule
