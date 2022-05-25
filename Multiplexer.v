`timescale 1ns / 1ps

module Multiplexer(seg0, seg1, seg2, seg3, sel, anode, segment);
    
    //inputs and outputs
    input seg0, seg1, seg2, seg3;
    input sel;
    output anode, segment;
    
    //inputs from each segment as well as the select bit
    wire [6:0] seg0, seg1, seg2, seg3;
    wire [1:0] sel;
    
    //outputs are the segment selected by the select bit aswell the anode chosen by the sel  
    reg [6:0] segment; 
    reg [3:0]anode;
    
    always@(sel)begin
        
        case(sel)
            2'b00:
                begin
                
                segment <= seg0; //if sel is "00" then select the first segment bus
                anode <= 4'b0111; //if sel is "00" display the segment output on AN0
                
                end
                
            2'b01:
                begin
                
                segment <= seg1;
                anode <= 4'b1011;
                
                end
           
           2'b10 :
                begin
                
                segment <= seg2;
                anode <= 4'b1101;
                
                end
           2'b11 :
                
                begin
                
                segment <= seg3;
                anode <= 4'b1110;
                
                end
                
        endcase
     end
              
endmodule
