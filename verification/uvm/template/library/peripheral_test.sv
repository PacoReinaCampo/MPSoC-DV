class peripheral_test extends uvm_test;
  `uvm_component_utils(peripheral_test)
  function new(string name = "peripheral_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  peripheral_environment enviroment;
  bit [`LENGTH-1:0] pattern = 4'b1011;
  peripheral_sequence seq;
  virtual design_if vif;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    // Create the environment
    enviroment = peripheral_environment::type_id::create("enviroment", this);

    // Get virtual IF handle from top level and pass it to everything
    // in peripheral_environment level
    if (!uvm_config_db#(virtual design_if)::get(this, "", "des_vif", vif))
      `uvm_fatal("TEST", "Did not get vif")
    uvm_config_db#(virtual design_if)::set(this, "enviroment.agent.*", "des_vif", vif);

    // Setup pattern queue and place into config db
    uvm_config_db#(bit [`LENGTH-1:0])::set(this, "*", "ref_pattern", pattern);

    // Create sequence and randomize it
    seq = peripheral_sequence::type_id::create("seq");
    seq.randomize();
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    apply_reset();
    seq.start(enviroment.agent.sequencer);
    #200;
    phase.drop_objection(this);
  endtask

  virtual task apply_reset();
    vif.rst <= 0;
    vif.in  <= 0;
    repeat (5) @(posedge vif.clk);
    vif.rst <= 1;
    repeat (10) @(posedge vif.clk);
  endtask
endclass
