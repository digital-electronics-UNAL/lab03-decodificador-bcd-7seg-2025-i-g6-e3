`include "src/DivFreq.v"
`include "src/BCD.v"
`include "src/BCDtoSSeg.v"

module Displays (
    input CLK_50,
    input [4:0] in, 
    output [0:6] SSeg, 
    output [3:0] an 
  );

  wire CLK2;
  wire [3:0] bcd; 
  wire [3:0] Ani;

  DivFreq CLK ( 
        .CLK_50(CLK_50),.CLK2(CLK2)
  );

  BCD B ( 
        .CLK2(CLK2),.in(in),.BCD(bcd),.an_i(Ani)
  );

  BCDtoSSeg BtSeg ( 
        .BCD(bcd),.an_i(Ani),.SSeg(SSeg),.an(an)
  );

endmodule