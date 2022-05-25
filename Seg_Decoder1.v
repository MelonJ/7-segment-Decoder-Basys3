`timescale 1ns / 1ps

module Seg_Decoder1(btn, switch, segment_out);

//inputs and outputs
input switch, btn;
output segment_out;

wire [3:0]switch; //switch input of 4 bits, 1 per physical switch
wire btn;
reg [6:0] segment_out = 7'b0000001; //7 segment output, starts at 0

always@(switch)begin
    if(btn)
        begin
        
        //case statement to see which switches are switched
        case(switch)                 //abcdefg
            4'b0000: segment_out <= 7'b0000001; //0
            4'b0001: segment_out <= 7'b1001111; //1
            4'b0010: segment_out <= 7'b0010010; //2
            4'b0011: segment_out <= 7'b0000110; //3
            4'b0100: segment_out <= 7'b1001100; //4
            4'b0101: segment_out <= 7'b0100100; //5
            4'b0110: segment_out <= 7'b0100000; //6
            4'b0111: segment_out <= 7'b0001111; //7
            4'b1000: segment_out <= 7'b0000000; //8
            4'b1001: segment_out <= 7'b0001100; //9
        
            4'b1010: segment_out <= 7'b0001000; //A
            4'b1011: segment_out <= 7'b1100000; //B
            4'b1100: segment_out <= 7'b0110001; //C
            4'b1101: segment_out <= 7'b1000010; //D
            4'b1110: segment_out <= 7'b0110000; //E
            4'b1111: segment_out <= 7'b0111000; //F
        endcase
        
        end
        
    end
endmodule
