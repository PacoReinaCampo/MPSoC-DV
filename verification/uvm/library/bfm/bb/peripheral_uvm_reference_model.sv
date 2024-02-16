class peripheral_uvm_reference_model extends uvm_component;
  // Declaration of component utils to register with factory
  `uvm_component_utils(peripheral_uvm_reference_model)

  // Declaration of Local Signals
  uvm_analysis_export #(peripheral_uvm_transaction)   rm_export;
  uvm_analysis_port #(peripheral_uvm_transaction)     rm2scoreboard_port;
  peripheral_uvm_transaction                          exp_transaction;
  peripheral_uvm_transaction                          rm_transaction;
  uvm_tlm_analysis_fifo #(peripheral_uvm_transaction) rm_exp_fifo;

  // Constructor
  function new(string name = "peripheral_uvm_reference_model", uvm_component parent);
    super.new(name, parent);
  endfunction

  // Method name : build-phase
  // Description : construct the components: driver, monitor, sequencer
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    rm_export          = new("rm_export", this);
    rm2scoreboard_port = new("rm2scoreboard_port", this);
    rm_exp_fifo        = new("rm_exp_fifo", this);
  endfunction : build_phase

  // Method name : connect_phase
  // Description : connect tlm ports ande exports (ex: analysis port/exports)
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    rm_export.connect(rm_exp_fifo.analysis_export);
  endfunction : connect_phase

  // Method name : run
  // Description : Driving the dut inputs
  task run_phase(uvm_phase phase);
    forever begin
      rm_exp_fifo.get(rm_transaction);
      get_expected_transaction(rm_transaction);
    end
  endtask

  // Method name : get_expected_transaction
  // Description : Expected transaction
  task get_expected_transaction(peripheral_uvm_transaction rm_transaction);
    this.exp_transaction = rm_transaction;
    `uvm_info(get_full_name(), $sformatf("EXPECTED TRANSACTION FROM REF MODEL"), UVM_LOW);
    exp_transaction.print();
    exp_transaction.ram_dout = exp_transaction.ram_din;
    rm2scoreboard_port.write(exp_transaction);
  endtask
endclass
