//tb (test banch) banco de puebas
`timescale 1ns/1ps
`include "src/BCD.v"

module BCDtoSSeg_tb(); // parentesis vacio porque no tiene entradas ni salidas

    reg [4:0] in;
    reg CLK2;

    wire [3:0] BCD;

    BCD uut ( 
        .CLK2(CLK2), .in(in), .BCD(BCD)
    ); // uut:unit under test (Nombre arbitrario)

    always #5 CLK2 = ~CLK2;

    initial begin
        CLK2 = 1'b0;
        in = 5'b10101;
    end

    initial begin
        $dumpfile("BCD.vcd");
        $dumpvars(-1,uut);
        #100 $finish;
    end

endmodule