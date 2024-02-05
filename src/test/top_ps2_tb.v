module top_ps2_tb();

    wire [6:0] ascii_code;
    wire ascii_new;

    reg clk, ps2_clk, ps2_data;

    integer i;

    top DUT (.clk(clk), .ps2_clk(ps2_clk),
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
