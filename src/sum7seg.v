`include "src/Displays.v"
`include "sum/sumyrest.v"

module sum7seg (
    input [7:0] A,
    input [7:0] B,
    input Sel,
    input CLK_50,
    output [0:6] SSeg, 
    output [3:0] an
  );

  wire CO;

  wire [7:0] in;

  sumyrest sum ( 
        .A(A),.B(B),.Sel(Sel),.CO(CO),.S0(in)
  );

  Displays Disp ( 
        .CLK_50(CLK_50),.in({CO, in}),.SSeg(SSeg),.an(an)
  );
  

endmodule