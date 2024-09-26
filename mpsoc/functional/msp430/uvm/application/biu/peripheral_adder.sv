module peripheral_adder (
  input [3:0] x,
  input [3:0] y,
  input       cin,

  output [3:0] sum,
  output       cout
);

  wire c1, c2, c3;

  peripheral_full_adder fa1 (
    .x(x[0]),
    .y(y[0]),
    .cin(cin),
    .s(sum[0]),
    .cout(c1)
  );

  peripheral_full_adder fa2 (
    .x(x[1]),
    .y(y[1]),
    .cin(c1),
    .s(sum[1]),
    .cout(c2)
  );

  peripheral_full_adder fa3 (
    .x(x[2]),
    .y(y[2]),
    .cin(c2),
    .s(sum[2]),
    .cout(c3)
  );

  peripheral_full_adder fa4 (
    .x(x[3]),
    .y(y[3]),
    .cin(c3),
    .s(sum[3]),
    .cout(cout)
  );
endmodule
