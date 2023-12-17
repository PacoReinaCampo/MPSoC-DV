module peripheral_adder (
  input [3:0] x,
  input [3:0] y,
  input       cin,

  output [3:0] sum,
  output       cout
);

  wire c1, c2, c3;

  peripheral_full_adder fa1 (
    x[0],
    y[0],
    cin,
    sum[0],
    c1
  );

  peripheral_full_adder fa2 (
    x[1],
    y[1],
    c1,
    sum[1],
    c2
  );

  peripheral_full_adder fa3 (
    x[2],
    y[2],
    c2,
    sum[2],
    c3
  );

  peripheral_full_adder fa4 (
    x[3],
    y[3],
    c3,
    sum[3],
    cout
  );
endmodule
