`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2022 05:14:17 PM
// Design Name: 
// Module Name: ic_2504x4
// Project Name: Apple 1 Video Display Terminal
// Target Devices: 
// Tool Versions: 
// Description: A Verilog implementation of the Signetics 2504 Shift Register 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Instantation: ic_2504x8 u0 ( .clk(), .si(), .so() );
// 
//////////////////////////////////////////////////////////////////////////////////

module ic_2504x8(
    input clk,
    input [7:0] si,
    output [7:0] so
    );
    
    reg [9:0] waddr;
    wire [9:0] raddr;
    assign raddr = waddr + 1;

    ram #(
        .addr_width(10),  // 2^10 = 1024 depth
        .data_width(8)   // 8-bit data width
    ) ram0 (.din(si), .waddr(waddr), 
              .write_en(1'b1), .wclk(clk), 
              .raddr(raddr), .rclk(clk), .dout(so));
    
    always @(posedge clk)
    begin
        waddr <= waddr + 1; 
    end
    
    // simulation initial state
    initial begin
        waddr <= 0;
    end
    
endmodule
