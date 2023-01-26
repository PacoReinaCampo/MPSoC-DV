class master_enviroment extends uvm_env;
  `uvm_component_utils(master_enviroment);

  master_agent m_agenth[];

  axi_object e_cfg;

  extern function new(string name = "master_enviroment", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
endclass

function master_enviroment::new(string name = "master_enviroment", uvm_component parent);
  super.new(name, parent);

  if (!uvm_config_db#(axi_object)::get(this, "", "axi_object", e_cfg))
    `uvm_fatal("MASTER_AGT_TOP", "Cannot get configuration db from the test")

  $display("$$$$$$$$$$$$$$$$$ %0p", e_cfg);
endfunction

function void master_enviroment::build_phase(uvm_phase phase);
  super.build_phase(phase);

  m_agenth = new[e_cfg.no_of_master_agent];

  foreach (m_agenth[i]) begin
    uvm_config_db#(master_object)::set(this, $sformatf("m_agenth[%0d]*", i), "set_from_master_top", e_cfg.m_cfg[i]);

    m_agenth[i] = master_agent::type_id::create($sformatf("m_agenth[%0d]", i), this);
  end
endfunction

task master_enviroment::run_phase(uvm_phase phase);
  uvm_top.print_topology;
endtask
