class slave_enviroment extends uvm_env;
  `uvm_component_utils(slave_enviroment);

  slave_agent s_agenth[];

  axi_object e_cfg;

  extern function new(string name = "slave_enviroment", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
endclass

function slave_enviroment::new(string name = "slave_enviroment", uvm_component parent);
  super.new(name, parent);

  if (!uvm_config_db#(axi_object)::get(this, "", "axi_object", e_cfg))
    `uvm_fatal("SLAVE_AGT_TOP", "Cannot get configuration db from the test")
endfunction

function void slave_enviroment::build_phase(uvm_phase phase);
  super.build_phase(phase);

  s_agenth = new[e_cfg.no_of_slave_agent];

  foreach (s_agenth[i]) begin
    s_agenth[i] = slave_agent::type_id::create($sformatf("s_agenth[%0d]", i), this);
    uvm_config_db#(slave_object)::set(this, $sformatf("s_agenth[%0d]*", i), "set_from_slave_top", e_cfg.s_cfg[i]);
  end
endfunction

task slave_enviroment::run_phase(uvm_phase phase);
  uvm_top.print_topology;
endtask
