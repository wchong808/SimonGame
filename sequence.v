`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2017 10:41:49 AM
// Design Name: 
// Module Name: sequence
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

//this generates a random sequence for the game
//this uses a perpetually running linear deedback shift register for seeding gernator
//if randomize is high, it will use the current LFSR value as the seed.
//efectively this results in choosing a new random sequence.
//if start_over is high this module moves to the start of the random sequence
//if next is high, it moves to the next element of the sequence
//seq outputs the current element of the sequence using a one-hot encoding.

module sequence(
    input clk,
    input randomize,
    input next,
    input start_over,
    output [3:0] seq
    );
    
    reg [17:0] counter = 18'b100110101011010111;
    reg [17:0] seed;
    reg [17:0] current;
    
    assign seq = 4'b1 << current [1:0];
    
    always @(posedge clk) begin
        counter <= {counter [15:0], counter [17:16] ^ counter[10:9]};
        if(randomize)
            seed <= counter;
        if(start_over)
            current <= seed;
        else if(next) 
            current <= {current [15:0], current [17:16] ^ current [10:9]};
        end    
endmodule
