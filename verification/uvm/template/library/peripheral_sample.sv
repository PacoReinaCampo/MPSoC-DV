class peripheral_sample extends peripheral_test;
  `uvm_component_utils(peripheral_sample)
  function new(string name = "peripheral_sample", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    pattern = 4'b1011;
    super.build_phase(phase);
    seq.randomize() with {
      num inside {[300 : 500]};
    };
  endfunction
endclass
