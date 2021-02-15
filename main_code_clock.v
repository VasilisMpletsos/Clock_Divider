/*
                            Clock Divide by even number 2N

A clock Divide by 2N circuit has a clock as an input and it divides the clock input by 2N. So for 
example, if the frequency of the clock input is 50 MHz, and N = 5, the frequency of the output will 
be 5 MHz. In other words the time period of the outout clock will be 2N times time perioud of the 
clock input. 

To generate a clock frequency ny even number you only need to work on the rising edge of clock and 
hence the circuit is simplified and potentially free from the glitches that a clock divided by an 
odd number works. 

Problem - Write verilog code that has a clock and a reset as input. It has an output that can be 
called clk_out. The clk_out is also a clock that has a frequency that is 1/2N frequency of the 
input clock. It has synchronous reset and if there if the reset is 1, the outclock resets 
to 0. Write test bench to verify it. 
*/

module clk_div 
#( 
parameter WIDTH = 2, // Width of the register required
parameter N = 3// We will divide by 6 for example in this case
)
(clk,reset, clk_out);
 
input clk;
input reset;
output clk_out;
 
reg [WIDTH-1:0] r_reg;
wire [WIDTH-1:0] r_nxt;
reg clk_track;
 
always @(posedge clk or posedge reset)
 
begin
  if (reset)
     begin
        r_reg <= 0;
	clk_track <= 1'b0;
     end
 
  else if (r_nxt == N)
 	   begin
	     r_reg <= 0;
	     clk_track <= ~clk_track;
	   end
 
  else 
      r_reg <= r_nxt;
end
 
 assign r_nxt = r_reg+1;   	      
 assign clk_out = clk_track;
endmodule
