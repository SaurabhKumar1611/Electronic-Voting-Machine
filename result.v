`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2022 10:21:48
// Design Name: 
// Module Name: result
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


module result(c0,s1,s2,res1,res2,res3,res4,out,candidate);

input c0,s1,s2;
input [3:0] res1,res2,res3,res4;
output reg [6:0] out;
output reg [6:0]candidate;

reg [4:0] res_count=0;

always@(posedge c0)
begin
    if(s1 == 0 && s2 == 1)
    begin
        res_count = res_count + 1;
    end
    else
    begin
        res_count = 0;
    end
    if( res_count >= 15)
    begin
        res_count = 0;        
    end
end

always@(res_count,res1,res2,res3,res4)
begin
    if(res_count == 0)
    begin
        out = 7'b0000001;
        candidate = 7'b0000001;
    end
    if(res_count < 4 && res_count > 0)
    begin
        candidate = 7'b0001000;
        case(res1)
            0: out = 7'b0000001;
    //        0: out = 7'b1111110;
            1: out = 7'b1001111;
    //        1: out = 7'b0110000;
            2: out = 7'b0010010;
    //        2: out = 7'b1101101;
            3: out = 7'b0000110;
    //        3: out = 7'b1111001;
            4: out = 7'b1001100;
    //        4: out = 7'b0110011;
            5: out = 7'b0100100;
    //        5: out = 7'b1011011;
            6: out = 7'b0100000;
    //        6: out = 7'b1011111;
            7: out = 7'b0000110;
    //        7: out = 7'b1111001;
            8: out = 7'b0000000;
    //        8: out = 7'b1111111;
            9: out = 7'b0000100;
    //        9: out = 7'b1111011;
            default : out = 7'b0000001; 
        endcase
    end
    else if(res_count < 8 && res_count > 0)
    begin
        candidate = 7'b1100000;
        case(res2)
            0: out = 7'b0000001;
            1: out = 7'b1001111;
            2: out = 7'b0010010;
            3: out = 7'b0000110;
            4: out = 7'b1001100;
            5: out = 7'b0100100;
            6: out = 7'b0100000;
            7: out = 7'b0000110;
            8: out = 7'b0000000;
            9: out = 7'b0000100;
            default : out = 7'b0000001; 
        endcase
    end
    else if(res_count < 11 && res_count > 0)
    begin
        candidate = 7'b0110001;
        case(res3)
            0: out = 7'b0000001;
            1: out = 7'b1001111;
            2: out = 7'b0010010;
            3: out = 7'b0000110;
            4: out = 7'b1001100;
            5: out = 7'b0100100;
            6: out = 7'b0100000;
            7: out = 7'b0000110;
            8: out = 7'b0000000;
            9: out = 7'b0000100;
            default : out = 7'b0000001; 
        endcase
    end
    else if(res_count < 16 && res_count > 0)
    begin
        candidate = 7'b1000010;
        case(res4)
            0: out = 7'b0000001;
            1: out = 7'b1001111;
            2: out = 7'b0010010;
            3: out = 7'b0000110;
            4: out = 7'b1001100;
            5: out = 7'b0100100;
            6: out = 7'b0100000;
            7: out = 7'b0000110;
            8: out = 7'b0000000;
            9: out = 7'b0000100;
            default : out = 7'b0000001; 
        endcase
    end
end

endmodule
