`timescale 1ns / 1ps

module USRIC(Clk, R, J, K, PI, S, PO, Q);

input Clk, R, J, K, S;
input [3:0]PI;
input Q;
output reg [3:0]PO;
reg [3:0]reg_state;

//logic
always @(posedge Clk, posedge R)
begin
    
    if (R)
    begin
    PO <=0;
    reg_state <=0;
    end
    
    else if (S==0)
            begin
            // parrallel in parrallel out logic
            PO[3:0] = PI[3:0];
            end
            else
            begin
            // srial in parrallel out logic
            reg_state[0] <= Q;                        
            reg_state[1] <= reg_state[0];
            reg_state[2] <= reg_state[1];
            reg_state[3] <= reg_state[2];
                     
            PO = reg_state;
            end
end

endmodule
