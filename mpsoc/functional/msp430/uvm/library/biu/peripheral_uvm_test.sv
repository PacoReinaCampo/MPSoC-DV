class peripheral_uvm_test extends uvm_test;
  // Declaration of component utils to register with factory
  `uvm_component_utils(peripheral_uvm_test)

  peripheral_uvm_entironment env;
  peripheral_uvm_sequence    seq;

  // Method name : new
  // Decription: Constructor 
  function new(string name = "peripheral_uvm_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  // Method name : build_phase 
  // Decription: Construct the components and objects 
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    env = peripheral_uvm_entironment::type_id::create("env", this);
    seq = peripheral_uvm_sequence::type_id::create("seq");
  endfunction : build_phase

  // Method name : run_phase 
  // Decription: Trigger the sequences to run 
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.start(env.agent.sequencer);
    phase.drop_objection(this);
  endtask : run_phase
endclass : peripheral_uvm_test
