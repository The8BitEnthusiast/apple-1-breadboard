module clk_gen (
    input clk_in,
    output reg clk_out,
    output locked
);

wire pll_clk_out;

// create 28.xxx Mhz clock
pll_12_29 pll0 (.clock_in(clk_in), .clock_out(pll_clk_out), .locked(locked));

// divide by 2 to get 14.xx Mhz clock
always @(posedge pll_clk_out)
begin
    clk_out <= ~clk_out;
end

// initialization for simulation
initial
begin
    clk_out = 0;
end

endmodule



