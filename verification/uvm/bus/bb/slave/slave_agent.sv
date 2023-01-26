class slave_agent extends uvm_agent;
  `uvm_component_utils(slave_agent)

  slave_object s_cfg;

  slave_monitor monh;
  slave_sequencer m_sequencer;
  slave_driver drvh;

  extern function new(string name = "slave_agent", uvm_component parent = null);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);

  function slave_agent::new(string name = "slave_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction 
  
  function void slave_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);
    // get the config object using uvm_config_db 

    if (!uvm_config_db#(slave_object)::get(this, "", "set_from_slave_top", s_cfg))
      `uvm_fatal("CONFIG", "cannot get() m_cfg from uvm_config_db. Have you set() it?")

    monh = slave_monitor::type_id::create("monh", this);

    if (s_cfg.is_active == UVM_ACTIVE) begin
      drvh = slave_driver::type_id::create("drvh", this);
      m_sequencer = slave_sequencer::type_id::create("m_sequencer", this);
    end
  endfunction

  function void slave_agent::connect_phase(uvm_phase phase);
    if (s_cfg.is_active == UVM_ACTIVE) begin
      drvh.seq_item_port.connect(m_sequencer.seq_item_export);
    end
  endfunction
endclass
