//tb (test banch) banco de puebas
`timescale 1ns/1ps
`include "src/Displays.v"

module Displays_tb(); // parentesis vacio porque no tiene entradas ni salidas

    reg [4:0] in;
    reg CLK_50;

    wire [0:6] SSeg; 
    wire [3:0] an;

    Displays uut ( 
        .CLK_50(CLK_50), .in(in), .SSeg(SSeg), .an(an)
    ); 

    always #5 CLK_50 = ~CLK_50;

    initial begin
        CLK_50 = 1'b0;
        in = 5'b10101;
    end

    initial begin
        $dumpfile("Displays.vcd");
        $dumpvars(-1,uut);
        #90000000 $finish;
    end

endmodule