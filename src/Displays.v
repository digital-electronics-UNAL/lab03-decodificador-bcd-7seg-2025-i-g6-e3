module DivFreq (
    input CLK_50,
    input [4:0] in, 
    output reg [0:6] SSeg, 
    output [3:0] an 
  );

  wire CLK2, [3:0] bcd, [3:0] Ani;

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