interface design_if (
  input bit clk
);
  logic rst;
  logic in;
  logic out;

  clocking cb @(posedge clk);
    default input #1step output #3ns;
    input out;
    output in;
  endclocking
endinterface
