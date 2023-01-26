class axi_enviroment extends uvm_env;
  // Factory Registration
  `uvm_component_utils(axi_enviroment)

  master_enviroment m_agenth_top;
  slave_enviroment s_agenth_top;
  axi_scoreboard sb;

  axi_object e_cfg;

  extern function new(string name = "axi_enviroment", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
endclass

function axi_enviroment::new(string name = "axi_enviroment", uvm_component parent);
  super.new(name, parent);
endfunction

function void axi_enviroment::build_phase(uvm_phase phase);
  if (!uvm_config_db#(axi_object)::get(this, "", "axi_object", e_cfg))
    `uvm_fatal("CONFIG", "cannot get() m_cfg from uvm_config_db. Have you set() it?")

  if (e_cfg.has_master_agent) begin
    // uvm_config_db #(master_object)::set(this,"*","master_object",e_cfg.m_cfg);
    m_agenth_top = master_enviroment::type_id::create("m_agenth_top", this);
  end

  if (e_cfg.has_slave_agent) begin
    // uvm_config_db #(slave_object)::set(this,"*","slave_object",e_cfg.s_cfg);
    s_agenth_top = slave_enviroment::type_id::create("s_agenth_top", this);
  end

  // if(e_cfg.has_virtual_sequencer)
  //  // Create the instance of v_sequencer handle 
  //  v_sequencer=ram_virtual_sequencer::type_id::create("v_sequencer",this);

  if (e_cfg.has_scoreboard)
    // Create the instance of v_sequencer handle 
    sb = axi_scoreboard::type_id::create("sb", this);

  super.build_phase(phase);
endfunction

function void axi_enviroment::connect_phase(uvm_phase phase);
  if (e_cfg.has_scoreboard) begin
    if (e_cfg.has_master_agent) begin
      for (int i = 0; i < e_cfg.no_of_master_agent; i++)
        m_agenth_top.m_agenth[i].monh.monitor_port.connect(sb.fifo_master.analysis_export);
    end

    if (e_cfg.has_slave_agent) begin
      for (int i = 0; i < e_cfg.no_of_slave_agent; i++)
        s_agenth_top.s_agenth[i].monh.monitor_port.connect(sb.fifo_slave.analysis_export);
    end
  end
endfunction
