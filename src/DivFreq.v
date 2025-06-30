module DivFreq (
    input CLK_50,
    input rst,
    output reg CLK2 
  );

  reg [$clog2(200000)-1:0] counter;

  initial begin
    counter = 'd00;
    CLK2 = 1'b0;
  end

  always @ (posedge CLK_50) begin
    if (counter == 200000) begin
        counter = 0;
        CLK2 <= ~CLK2;
    end
    else begin
        counter = counter +1;
    end 
  end

endmodule