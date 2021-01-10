`timescale 1ns / 1ps                            // Compiler/Simulation Directive

module SevenSagmentDisplay(A, O);

//input and output decleration
input [3:0] A;
output reg [6:0] O;

// logic: Procedural statemnet (always construct)
always@ (*)
begin
    
    casex (A)
    
    0: begin O = 7'b0000001; end
    1: begin O = 7'b1001111; end
    2: begin O = 7'b0010010; end
    3: begin O = 7'b0000110; end
    4: begin O = 7'b1001100; end
    5: begin O = 7'b0100100; end
    6: begin O = 7'b0100000; end
    7: begin O = 7'b0001111; end
    8: begin O = 7'b0000000; end
    9: begin O = 7'b0001100; end
    default: begin O = 7'bzzzzzzz; end
    
    endcase
end

// end module
endmodule


module TB();

// reg and wire decleration
reg [3:0] A;
wire [6:0] O;

// logic Procedural statemnet (initial construct)
initial
begin
    
    # 00 A= 4'b0000;
    # 10 A= 4'b0001;
    # 10 A= 4'b0010;
    # 10 A= 4'b0011;
    # 10 A= 4'b0100;
    # 10 A= 4'b0101;
    # 10 A= 4'b0110;
    # 10 A= 4'b0111;
    # 10 A= 4'b1000;
    # 10 A= 4'b1001;
    # 10 A= 4'b1x1x;
    # 10 $stop;             // system directive
end

// module instantiation
SevenSagmentDisplay SSD1(A, O);

// end module
endmodule


