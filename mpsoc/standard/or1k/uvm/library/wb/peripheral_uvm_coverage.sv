class peripheral_uvm_coverage #(type T = peripheral_uvm_transaction) extends uvm_subscriber #(T);
  // Declaration of Local fields
  peripheral_uvm_transaction cov_transaction;

  // Declaration of component utils to register with factory
  `uvm_component_utils(peripheral_uvm_coverage)

  // Functional coverage: covergroup for peripheral_adder
  covergroup peripheral_uvm_cg;
    option.per_instance = 1;
    option.goal = 100;

    peripheral_uvm_x: coverpoint cov_transaction.x {
      bins x_values[] = {[0 : $]};
    }

    peripheral_uvm_y: coverpoint cov_transaction.y {
      bins y_values[] = {[0 : $]};
    }

    peripheral_uvm_cin: coverpoint cov_transaction.cin {
      bins cin_1 = {1};
      bins cin_0 = {0};
    }

    peripheral_uvm_sum: coverpoint cov_transaction.sum {
      bins sum_values[] = {[0 : $]};
    }

    peripheral_uvm_cout: coverpoint cov_transaction.cout {
      bins low = {0};
      bins high = {1};
    }
  endgroup

  // Constructor
  function new(string name = "peripheral_uvm_reference_model", uvm_component parent);
    super.new(name, parent);
    peripheral_uvm_cg = new();
    cov_transaction   = new();
  endfunction

  // Method name : sample
  // Description : sampling peripheral_adder coverage
  function void write(T t);
    this.cov_transaction = t;
    peripheral_uvm_cg.sample();
  endfunction
endclass
