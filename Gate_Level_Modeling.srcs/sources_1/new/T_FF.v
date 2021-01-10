// Gate level modeling of Toggle flip flop (primitive construct)

`timescale 1ns / 1ps                    // Compiler/simulation directive

module T_FF(input E, T, output Q, Qdesh);

wire NandO1, NandO2;

// logic (primitive construct)
nand(NandO1, Qdesh, E, T);
nand(NandO2, E, T, Q);
nand(Q, NandO1, Qdesh);
nand(Qdesh, Q, NandO2);

//end module
endmodule


module TB();

// reg and wire
reg E, T;
wire Q, Qdesh;

// Procedural statement (initial construct)
initial
begin
    #00 E=0; T=0;
    #10 E=1; T=0;
    #10 E=0; T=1;
    #10 E=1; T=1;
    #10 $stop;                  // System directive
end

// instantiation module
T_FF tff(E, T, Q, Qdesh);

//end module
endmodule
