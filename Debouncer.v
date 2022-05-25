`timescale 1ns / 1ps

module Debouncer(btn_in, clk, reset, btn_out);

input btn_in, clk, reset;
output btn_out;

//set initial state to 000
reg[2:0]state = 3'b000;
reg btn_out;

wire btn_in, clk, reset;

always@(posedge clk) 
begin

if(btn_in)
    begin
    
        //state machine that will act as a debouncer
        case(state)
        
        //initial state
        3'b000 : 
        if(btn_in == 1'b1) //if the button is pressed
            begin
                state <= 3'b001; //go to next state
                btn_out <= 1'b0; //button out is still 0
            end
        
        //second state    
        3'b001 : 
        if(btn_in == 1'b1) //if the button is STILL pressed 
            begin
                state <= 3'b000; //go back to initial state
                btn_out <= 1'b1; //but button out is now 1
            end
        else
            begin
                state <= 3'b000; //otherwise the button is no longer pressed so go back to initial state
                btn_out <= 1'b0; //and button out is now 0
            end
             
       endcase
    end

//else statement needed if button in is 0    
else

begin
    
    btn_out <= 1'b0; //set button out to 0
    
end

end
    
endmodule
