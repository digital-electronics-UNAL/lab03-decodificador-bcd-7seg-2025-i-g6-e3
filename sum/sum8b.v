`include "sum/sum1b.v"

module sum8b(
    input [7:0] A,
    input [7:0] B,
    input Ci,
    output CO,
    output [7:0] So
); // parentesis vacio porque no tiene entradas ni salidas


    wire CO1, CO2, CO3, CO4, CO5, CO6, CO7;

    wire hol;

    sum1b S1 ( 
        .A(A[0]),.B(B[0]),.Ci(Ci),.Cout(CO1),.S(So[0])
    ); 

    sum1b S2 ( 
        .A(A[1]),.B(B[1]),.Ci(CO1),.Cout(CO2),.S(So[1])
    ); 

    sum1b S3 ( 
        .A(A[2]),.B(B[2]),.Ci(CO2),.Cout(CO3),.S(So[2])
    ); 

    sum1b S4 ( 
        .A(A[3]),.B(B[3]),.Ci(CO3),.Cout(CO4),.S(So[3])
    ); 

    sum1b S5 ( 
        .A(A[4]),.B(B[4]),.Ci(CO4),.Cout(CO5),.S(So[4])
    ); 

    sum1b S6 ( 
        .A(A[5]),.B(B[5]),.Ci(CO5),.Cout(CO6),.S(So[5])
    ); 

    sum1b S7 ( 
        .A(A[6]),.B(B[6]),.Ci(CO6),.Cout(CO7),.S(So[6])
    ); 

    sum1b S8 ( 
        .A(A[7]),.B(B[7]),.Ci(CO7),.Cout(CO),.S(So[7])
    ); 

endmodule