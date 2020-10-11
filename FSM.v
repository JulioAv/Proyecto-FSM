module FFD1 (input wire clock, reset, input wire D, output reg Q);
  always @ (posedge clock or posedge reset) begin
    if (reset) begin
      Q <= 1'b0;
      end
    else begin
      Q <= D;
      end
      end
endmodule

module FSM (input wire clock, reset, input wire V0, V1, V2, B0, B1, B2, P0, P1, P2, P3, output wire V0o, V1o, V2o, B0o, B1o, B2o);
	assign S3o=(P3&~P2&~P1&~P0) | (~P3&P2&P1) | (~P3&P2&P0);
	assign S2o=(~P3&P2&~P1&~P0) | (~P3&~P2&P1) | (~P3&~P2&P0);
	assign S1o=(~S3&~S2&S1&S0&V2&~V1&~V0&~B1&~B0&~P2&~P1&~P0) | (~S3&~S2&S1&S0&V2&~V1&~V0&~B2&~P2&~P1&~P0) | (P3&~P2&~P1&~P0) | (~P3&P1&P0) | (~P3&P2&~P1&~P0);
	assign S0o=(~S3&~S2&~S1&S0&~V2&B2&~B1&~B0&~P3&~P0) | (~S3&~S2&S1&S0&V2&~V1&~V0&~B2&~P3&~P0) | (~S3&~S2&S0&V2&~V1&~V0&B2&~B1&~B0&~P3&~P0) | (P3&~P2&~P1&~P0) | (~P3&P2&~P0) | (~P3&P1&~P0);
	assign V2o=(~S3&~S2&S1&S0&V2&~V1&~V0&~B1&~B0&~P3&~P2&~P0) | (~S3&~S2&S1&S0&V2&~V1&~V0&~B2&~P3&~P2&~P0) | (~P3&~P2&P1&~P0);
	assign V1o=(~S3&~S2&~S1&S0&V2&~V1&~V0&B2&~B1&~B0&~P3&~P1&~P0) | (~S3&~S2&S0&~V2&V1&B2&~B1&~B0&~P3&~P1&~P0) | (~S3&~S2&~S1&~S0&~V2&V1&~B2&~P3&~P1&~P0) | (~S3&~S2&S1&S0&~V2&V1&~P3&~P1&~P0) | (~P3&~P2&P0) | (P3&~P2&~P1&~P0) | (~P3&P2&~P1&~P0);
	assign V0o=(~S2&~S1&S0&V2&~V1&~V0&B2&~B1&~B0&~P2&~P1&~P0) | (~S2&S0&~V2&V0&B2&~B1&~B0&~P2&~P1&~P0) | (~S2&~S1&~S0&~V2&V0&~B2&~P2&~P1&~P0) | (~S2&S1&S0&~V2&V0&~P2&~P1&~P0) | (S3&~S2&~P2&~P1&~P0) | (~S3&S2&~P2&~P1&~P0) | (P3&~P2&~P1&~P0) | (~P3&P2&P1)  | (~P3&~P2&P0);
	assign B2o=(~S3&~S2&~S1&S0&~V1&~V0&B2&~B1&~B0&~P3&~P2&~P1) | (~S3&~S2&~S1&S0&~V2&~B2&~B1&~B0&~P3&~P2&~P1) | (~P3&~P2&~P1&P0);
	assign B1o=(~S3&~S2&S1&S0&V2&~V1&~V0&B2&~B1&~B0&~P3&~P1&~P0) | (~S3&~S2&S0&V2&~V1&~V0&~B2&B1&~P3&~P1&~P0) | (~S3&~S2&~S1&~V2&~B2&B1&~P3&~P1&~P0) | (~S3&~S2&~S1&S0&~B2&B1&~P3&~P1&~P0) | (~P3&P2&~P1&~P0) | (~P3&P1&P0) | (~P3&~P2&P1);
	assign B0o=(~S2&S1&S0&V2&~V1&~V0&B2&~B1&~B0&~P2&~P1&~P0) | (~S2&S0&V2&~V1&~V0&~B2&B0&~P2&~P1&~P0) | (~S2&~S1&S0&~B2&B0&~P2&~P1&~P0) | (~S2&~S1&~V2&~B2&B0&~P2&~P1&~P0) | (S3&~S2&~P2&~P1&~P0) | (~S3&S2&~P2&~P1&~P0) | (P3&~P2&~P1&~P0) | (~P3&P1&~P0) | (~P3&~P2&P1);
	FFD1 m1(clock, reset, S3o, S3);
	FFD1 m2(clock, reset, S2o, S2);
	FFD1 m3(clock, reset, S1o, S1);
	FFD1 m4(clock, reset, S0o, S0);
endmodule	


