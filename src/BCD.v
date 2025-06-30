module BCD (
    input CLK2,
    input [7:0] in, 
    output reg [3:0] BCD,
    output reg [3:0] an_i
  );

  reg [1:0] algo;

  initial begin
    algo = 2'b00;
    BCD = 4'b0000;
    an_i = 4'b1111;
  end

  always @ (posedge CLK2) begin
    case (algo)
      2'b00: begin
        BCD <= in%10; 
        algo <= 2'b01;
        an_i <= 4'b1110;
      end
      
  	  2'b01: begin
        BCD <= ((in - in%10)/10)%10;
        algo <= 2'b10;
        an_i <= 4'b1101;
      end

      2'b10: begin
        BCD <= ((in - in%100)/100)%100;
        algo <= 2'b00;
        an_i <= 4'b1011;
      end
    endcase
  end

endmodule