module DivFreq (
    input CLK_50,
    input rst,
    output reg CLK2 
  );

  reg [4:0] counter;

  initial begin
    counter = 5'b00000;
    CLK2 = 1'b0;
  end

  always @ (posedge CLK_50) begin
    if (counter == 25) begin
        counter = 0;
        CLK2 <= ~CLK2;
    end
    else begin
        counter = counter +1;
    end 
  end

endmodule