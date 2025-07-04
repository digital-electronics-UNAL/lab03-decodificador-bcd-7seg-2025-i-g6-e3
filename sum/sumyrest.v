`include "sum/sum8b.v"

module sumyrest(
    input [7:0] A,
    input [7:0] B,
    input Sel,
    output CO,
    output neg,
    output [7:0] So
); // parentesis vacio porque no tiene entradas ni salidas


    wire X0, X1, X2, X3, X4, X5, X6, X7;
    wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;
    wire [7:0] B2;
    wire sel_next,co;
    wire [7:0] S_temp, S_temp2;

    xor(X0,Sel,B[0]);
    xor(X1,Sel,B[1]);
    xor(X2,Sel,B[2]);
    xor(X3,Sel,B[3]);
    xor(X4,Sel,B[4]);
    xor(X5,Sel,B[5]);
    xor(X6,Sel,B[6]);
    xor(X7,Sel,B[7]);

    assign B2[0] = X0;
    assign B2[1] = X1;
    assign B2[2] = X2;
    assign B2[3] = X3;
    assign B2[4] = X4;
    assign B2[5] = X5;
    assign B2[6] = X6;
    assign B2[7] = X7;
    
    sum8b S1 ( 
        .A(A),.B(B2),.Ci(Sel),.CO(co),.So(S_temp)
    ); 

    assign CO = co;

    and(sel_next,~co,Sel);
    assign neg = sel_next;

    xor(Y0,sel_next,S_temp[0]);
    xor(Y1,sel_next,S_temp[1]);
    xor(Y2,sel_next,S_temp[2]);
    xor(Y3,sel_next,S_temp[3]);
    xor(Y4,sel_next,S_temp[4]);
    xor(Y5,sel_next,S_temp[5]);
    xor(Y6,sel_next,S_temp[6]);
    xor(Y7,sel_next,S_temp[7]);

    assign S_temp2[0] = Y0;
    assign S_temp2[1] = Y1;
    assign S_temp2[2] = Y2;
    assign S_temp2[3] = Y3;
    assign S_temp2[4] = Y4;
    assign S_temp2[5] = Y5;
    assign S_temp2[6] = Y6;
    assign S_temp2[7] = Y7;

    sum8b S2 ( 
        .A(S_temp2),.B(8'b00000000),.Ci(sel_next),.CO(),.So(So)
    ); 

endmodule