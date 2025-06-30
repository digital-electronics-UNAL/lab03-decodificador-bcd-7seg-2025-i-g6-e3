module sum1b (

    input  A, // [definicion tamaño bit]
    input  B,
    input  Ci,
    output Cout,
    output S
  );
  
    reg [1:0] st;

  
    always @ ( * ) begin // (ejecuta cuando esta variable cambie) el asterisco toma todas las entradas
      st  =   A+B+Ci;
    end

    assign S = st[0];
    assign Cout = st[1];
    
  endmodule