`timescale 1ns / 1ps

module Two_bit_counter(clk, reset, count);

input clk, reset;
output count;

wire clk, reset;
reg [1:0]count = 2'b00; //counter variable 

always@(posedge clk) begin

if(reset) 
    begin

        //counter goes to 0 if reset button is pressed
        count <=2'b00;
    
    end

else

    begin
        
        //state machine to count up the count variable
        case(count)
    
            2'b00: count <= 2'b01;
        
            2'b01: count <= 2'b10;
        
            2'b10: count <= 2'b11;
        
            2'b11: count <= 2'b00;
        endcase
    end
 end
        
endmodule
