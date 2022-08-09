`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2022 23:16:29
// Design Name: 
// Module Name: vote
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


module vote(b1,b2,b3,b4,s1,s2,clk,l1,l2,l3,l4,rgb,c0,show,candidate);

input b1,b2,b3,b4,s1,s2,clk;
output reg l1,l2,l3,l4;
output c0;
output reg [2:0]rgb;
output [6:0]show;
output [6:0]candidate;

reg [27:0] count = 0;

assign c0 = count[25];
reg [3:0] res1,res2,res3,res4;
reg [3:0]time_count;

result r1(c0,s1,s2,res1,res2,res3,res4,show,candidate);

initial
begin
    time_count = 4'b0000;
    res1 = 4'b0000;
    res2 = 4'b0000;
    res3 = 4'b0000;
    res4 = 4'b0000;
    rgb = 3'b010;
end

always @(posedge clk)
begin
    count <= count +1 ;
end
 
always @(posedge c0)
begin
    if(s1 == 0 && s2 == 1)
    begin
        rgb = 3'b100;
    end
    if(s1 == 1 && s2 == 1)
    begin
        time_count = 4'b0000;
        res1 = 4'b0000;
        res2 = 4'b0000;
        res3 = 4'b0000;
        res4 = 4'b0000;
        rgb = 3'b010;
        l1 = 0;l2=0;l3=0;l4=0;
    end
    if(s1 == 0 && s2 == 0)
    begin
        if(time_count < 12 && rgb == 3'b010)
        begin
            if(b1)
            begin
                res1 = res1 + 1;
                l1 = 1;l2 = 0;l3 = 0;l4 = 0;
                rgb = 3'b100;
            end
            else if(b2)
            begin
                res2 = res2 + 1;
                l1 = 0;l2 = 1;l3 = 0;l4 = 0;
                rgb = 3'b100;
            end
            else if(b3)
            begin
                res3 = res3 + 1;
                l1 = 0;l2 = 0;l3 = 1;l4 = 0;
                rgb = 3'b100;
            end
            else if(b4)
            begin
                res4 = res4 + 1;
                l1 = 0;l2 = 0;l3 = 0;l4 = 1;
                rgb = 3'b100;
            end
        end
        else if(time_count >= 12)
        begin
            rgb = 3'b001;
        end
    end
    
    if(time_count < 12 && rgb == 3'b010 && s1 == 0 && s2 == 0)
        time_count = time_count + 1;
        
    if(rgb == 3'b001 || rgb == 3'b100)
    begin
        if(s1 == 1 && s2 == 0)
        begin
            rgb = 3'b010;
            time_count = 0;
            l1 = 0;l2=0;l3=0;l4=0;
        end
    end
end

endmodule
