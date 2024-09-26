module peripheral_full_adder (
  input x,
  input y,
  input cin,

  output s,
  output cout
);

  wire s1, c1, c2;

  peripheral_half_adder ha1 (
    .x(x),
    .y(y),
    .s(s1),
    .c(c1)
  );

  peripheral_half_adder ha2 (
    .x(cin),
    .y(s1),
    .s(s),
    .c(c2)
  );

  or (cout, c1, c2);
endmodule
