`timescale 1ns / 1ps

module clk_divider(clkin, reset, clkout);

//inputs and outputs
input clkin,reset;
output clkout;

reg [15:0] count; //a reg of 16 bits is needed to count to 50,000
reg clkout; 

//wires for clkin and reset
wire clkin,reset;

//if posedge of the clk happens or the posedge of reset
always @(posedge clkin or posedge reset)
begin
    if(reset)
        begin
            count <= 0;
            clkout <=1'b0;
        end
            
    else if(count == 50000) //50,000 used to get to a 1 KHz clk
        begin
            count <= 0;
            clkout <= ~clkout; //toggle clk out
        end
    else
        count <= (count + 1);
 end
    
endmodule