`timescale 1ns / 1ps


module Top_Level(left_switch, clk, btn, reset, right_switch, anode, segment);

    input  left_switch;
    input clk;
    input btn;
    input reset;
    input right_switch;
    output anode;
    output segment;
    
    wire W1, W2; //wire for clk divider and debouncer output
    wire [6:0] W3, W4, W5, W6; //wires for seg decoder outputs
    wire [1:0] W7; //wires for 2 bit counter output
    
    wire [3:0] left_switch, right_switch, anode;
    wire clk, btn, reset;
    wire [6:0] segment;
    
    reg[3:0] ground = 4'b0000;
    
    //clock divider and debouncer
    clk_divider C1(clk, reset, W1);
    Debouncer D1(btn, clk, reset, W2);
    
    //Segment Decoders
    Seg_Decoder1 S1(W2, ground, W3);
    Seg_Decoder1 S2(W2, left_switch, W4);
    Seg_Decoder1 S3(W2, ground, W5);
    Seg_Decoder1 S4(W2, right_switch, W6);
    
    //Two_bit_counter
    Two_bit_counter T1(W1, reset, W7);
    
    //Multiplexer
    Multiplexer M1(W3, W4, W5, W6, W7, anode, segment);
    
endmodule
