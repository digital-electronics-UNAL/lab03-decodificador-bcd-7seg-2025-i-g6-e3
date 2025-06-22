module BCD (
    input CLK2,
    input [4:0] in, 
    output reg [3:0] BCD,
    output reg [3:0] an_i
  );

  reg algo;

  initial begin
    algo = 1'b0;
    BCD = 4'b0000;
    an_i = 4'b0000;
  end

  always @ (posedge CLK2) begin
    case (algo)
      1'b0: begin
        BCD <= in%10; 
        algo <= 1'b1;
        an_i <= 4'b0000;
      end
      
  	  1'b1: begin
        BCD <= (in - in%10)/10;
        algo <= 1'b0;
        an_i <= 4'b0001;
      end
    endcase
  end

endmodule