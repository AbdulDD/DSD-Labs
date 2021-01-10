`timescale 1ns / 1ps
module mealy_sequence_detector_3_blocks(

  input clk,

  input ain,

  input reset,

  output reg yout

  );

   

  reg[1:0] state, nextstate;

   

  always @(posedge clk, posedge reset) // always block to update state

  begin

    if(reset)

      state = 2'b00;

    else

      state = nextstate;

  end

   

  always @(state or ain) // always block to compute nextstate

  begin

    case(state)

    2'b00:

      if(ain) 

        nextstate = 2'b01;

      else 

        nextstate = 2'b00;

    2'b01:

      if(ain) 

        nextstate = 2'b10;

      else 

        nextstate = 2'b00;

    2'b10:

      if(ain) 

        nextstate = 2'b00;

      else 

        nextstate = 2'b00;

    endcase

  end

   

  always @(posedge clk, posedge reset) // always block to compute output

  begin

    if(reset)

      yout = 0;

    else if(state == 2'b10 && ain == 1'b1)

      yout = 1;

    else 

      yout = 0;

  end



endmodule



module TB();

  reg clk,

  ain,

  reset;

  wire yout;




// Clk generation
initial
clk=0;

always
#5 clk = ~clk;

// procedural statements
initial
begin
    
    reset=1;
    @ (negedge clk) reset=1;
    @ (negedge clk) reset=0;
    @ (negedge clk) ain=1;
    @ (negedge clk) ain=1;
    repeat (6) @ (negedge clk) ain=0;
    repeat (5) @ (negedge clk) ain=1;
    repeat (2) @ (negedge clk) ain=0;
    repeat (2) @ (negedge clk) ain=1;
    @ (negedge clk) ain=1; reset=1;
    
    $finish;
end

// Module instantiation

mealy_sequence_detector_3_blocks ins1(clk, ain, reset, yout);
// end module

endmodule