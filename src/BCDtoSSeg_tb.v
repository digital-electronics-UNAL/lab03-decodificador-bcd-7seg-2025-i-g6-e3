//tb (test banch) banco de puebas
`timescale 1ns/1ps
`include "src/BCDtoSSeg.v"

module BCDtoSSeg_tb(); // parentesis vacio porque no tiene entradas ni salidas

    reg [3:0] in;

    wire [6:0] SSeg;
    wire [3:0] an;

    BCDtoSSeg uut ( 
        .BCD(A_tb)
    ); // uut:unit under test (Nombre arbitrario)

    initial begin
        in = b0000;
        #10
        in = b0000;
        in = b0001;
        in = b0010;
        in = b0011;
        in = b0100;
        in = b0101;
        in = b0110;
        in = b0111;
        in = b1000;
        in = b1001;
        in = ha; 
        in = hb;
        in = hc;
        in = hd;
        in = he;
        in = hf;
    end

    initial begin
        $dumpfile("BCDtoSSeg.vcd");
        $dumpvars(-1,uut);
        #5120 $finish;
    end

endmodule