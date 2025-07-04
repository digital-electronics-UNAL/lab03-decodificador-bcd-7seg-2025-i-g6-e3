module BCD (
    input CLK2,
    input [8:0] in, 
    input sel,
    output reg [3:0] BCD,
    output reg [3:0] an_i
  );

  reg [1:0] algo;

  initial begin
    algo = 2'b00;
    BCD = 4'b0000;
    an_i = 4'b1111;
  end

  wire [8:0] new_input;
  wire neg;

  assign new_input = (sel)? {1'b0, in[7:0]} : in;
  assign neg = (sel)? ~in[8] : 1'b0;

  always @ (posedge CLK2) begin
    case (algo)
      2'b00: begin
        BCD <= new_input%10; 
        algo <= 2'b01;
        an_i <= 4'b1110;
      end
      
  	  2'b01: begin
        BCD <= ((new_input - new_input%10)/10)%10;
        algo <= 2'b10;
        an_i <= 4'b1101;
      end

      2'b10: begin
        BCD <= ((new_input - new_input%100)/100)%100;
        algo <= (neg)? 2'b11 : 2'b00;
        an_i <= 4'b1011;
      end

      2'b11: begin
        BCD <= 4'ha;
        an_i <= 4'b0111;
        algo <= 2'b00;
      end
    endcase
  end

endmodule