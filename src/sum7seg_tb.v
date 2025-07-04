//tb (test banch) banco de puebas
`timescale 1ns/1ps
`include "src/sum7seg.v"

module sum7seg_tb(); // parentesis vacio porque no tiene entradas ni salidas

    reg [7:0] A;
    reg [7:0] B;
    reg Sel;
    reg CLK_50;

    wire [0:6] SSeg; 
    wire [3:0] an;

    sum7seg uut ( 
        .CLK_50(CLK_50), .A(A), .B(B), .Sel(Sel), .SSeg(SSeg), .an(an)
    ); 

    always #5 CLK_50 = ~CLK_50;

    initial begin
        CLK_50 = 1'b0;
        A = 8'b00000000;
        B = 8'b11111111;
        Sel = 1'b1;
    end

    initial begin
        $dumpfile("sum7seg.vcd");
        $dumpvars(-1,uut);
      #90000 $finish;
    end

endmodule