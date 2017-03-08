`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2017 02:43:42 PM
// Design Name: 
// Module Name: Controller
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


module Controller(
    input btnU,
    input btnL,
    input btnR,
    input btnD,
    input btnC,
    input clk,
    output [3:0] led
    );
    
    reg[3:0] state;

    always @(posedge clk)
        begin
        if(btnU == 1) state <= 4'b0001;
        else if(btnL == 1) state <= 4'b0010;
        else if(btnR == 1) state <= 4'b0100;
        else if(btnD == 1) state <= 4'b1000;
        else if(btnC == 1) state <= 4'b0000;
        end
        
        assign led = state;
        
endmodule
