module peripheral_testbench;
  reg clk;

  always #10 clk =~ clk;
  design_if _if (clk);

  fsm dut (
    .clk(clk),
    .rst(_if.rst),

    .in  (_if.in),
    .out (_if.out)
  );

  initial begin
    clk <= 0;
    uvm_config_db#(virtual design_if)::set(null, "uvm_test_top", "des_vif", _if);
    run_test("peripheral_sample");
  end
endmodule
