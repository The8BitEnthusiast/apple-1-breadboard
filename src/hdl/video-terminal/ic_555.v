`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2023 12:40:10 PM
// Design Name: 
// Module Name: blinky
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
// Instantiation:
//     ic_555 timer0 ( .clk(), .out() );
// 
//////////////////////////////////////////////////////////////////////////////////


module ic_555(
    input clk,
    output out
    );
    
    reg [23:0] count = 0;
    
    assign out = count < 4961249 ? 1'b1 : 1'b0;
    
    always @ (posedge(clk))
    begin
        if (count == 7441874)
            count <= 0;
        else
            count <= count + 1;
    end
    
endmodule
