`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2022 01:09:01
// Design Name: 
// Module Name: test_vote
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


module test_vote;

reg b1,b2,b3,b4,s1,s2,clk;
wire l1,l2,l3,l4,c0;


wire[6:0] show;
wire [2:0]rgb;

vote v1(b1,b2,b3,b4,s1,s2,l1,l2,l3,l4,clk,rgb,c0,show);

always #1 clk = ~clk;

initial
begin
    clk = 1'b0;s1=1'b0;s2=1'b0;b1 = 1'b0;b2 = 1'b0;b3 = 1'b0;b4 = 1'b0;
    #3 b1 = 1'b1;b2 = 1'b0;b3 = 1'b0;b4 = 1'b0;
    #3 b2 = 1'b1;b1 = 1'b0;b3 = 1'b0;b4 = 1'b0;
    #3 s1 = 1'b1;b2=1'b0;
    #3 b2 = 1'b1;b1 = 1'b0;b3 = 1'b0;b4 = 1'b0;
    #3 s1 = 1'b0;b2=1'b0;
    #6 b2 = 1'b1;b1 = 1'b0;b3 = 1'b0;b4 = 1'b0;
    #3 s1 = 1'b1;b2=1'b0;
    #3 s1 = 1'b0;
    #50 b2 = 1'b1;
    #3 s1 = 1'b1;b2=1'b0;
    #3 s1 = 1'b0;
    #3 b1 = 1'b1;b2 = 1'b0;b3 = 1'b0;b4 = 1'b0;
    #50 s1 = 1'b0; s2 = 1'b1;
end

initial #400 $finish;

endmodule
