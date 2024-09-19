module peripheral_half_adder (
  input x,
  input y,

  output s,
  output c
);

  xor (s, x, y);
  and (c, x, y);
endmodule
