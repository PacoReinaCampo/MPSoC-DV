class peripheral_environment extends uvm_env;
  `uvm_component_utils(peripheral_environment)
  function new(string name = "peripheral_environment", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  peripheral_agent      agent;  // Agent handle
  peripheral_scoreboard scoreboard;  // Scoreboard handle

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = peripheral_agent::type_id::create("agent", this);
    scoreboard = peripheral_scoreboard::type_id::create("scoreboard", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agent.monitor.mon_analysis_port.connect(scoreboard.m_analysis_imp);
  endfunction
endclass
