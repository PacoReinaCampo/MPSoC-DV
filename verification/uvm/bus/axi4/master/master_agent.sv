class master_agent extends uvm_agent;
  `uvm_component_utils(master_agent)

  master_object m_cfg;

  master_monitor monh;
  master_sequencer m_sequencer;
  master_driver drvh;

  extern function new(string name = "master_agent", uvm_component parent = null);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
endclass

function master_agent::new(string name = "master_agent", uvm_component parent = null);
  super.new(name, parent);
endfunction

function void master_agent::build_phase(uvm_phase phase);
  super.build_phase(phase);
  // get the config object using uvm_config_db 

  if (!uvm_config_db#(master_object)::get(this, "", "set_from_master_top", m_cfg))
    `uvm_fatal("CONFIG", "cannot get() m_cfg from uvm_config_db. Have you set() it?")

  monh = master_monitor::type_id::create("monh", this);

  if (m_cfg.is_active == UVM_ACTIVE) begin
    drvh = master_driver::type_id::create("drvh", this);
    m_sequencer = master_sequencer::type_id::create("m_sequencer", this);
  end
endfunction

function void master_agent::connect_phase(uvm_phase phase);
  if (m_cfg.is_active == UVM_ACTIVE) begin
    drvh.seq_item_port.connect(m_sequencer.seq_item_export);
  end
endfunction
