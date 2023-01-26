class axi_test extends uvm_test;
  `uvm_component_utils(axi_test)

  axi_enviroment envh;

  master_sequence seqh1;
  slave_sequence seqh2;

  axi_object e_cfg;

  master_object m_cfg[];

  slave_object s_cfg[];

  int no_of_master_agent = 1;
  int no_of_slave_agent = 1;

  extern function new(string name = "axi_test", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void config_axi();
  extern task run_phase(uvm_phase phase);
endclass

function axi_test::new(string name = "axi_test", uvm_component parent);
  super.new(name, parent);
endfunction

function void axi_test::build_phase(uvm_phase phase);
  e_cfg = axi_object::type_id::create("e_cfg");

  e_cfg.m_cfg = new[no_of_master_agent];
  e_cfg.s_cfg = new[no_of_slave_agent];

  m_cfg = new[no_of_master_agent];
  s_cfg = new[no_of_slave_agent];

  foreach (m_cfg[i]) m_cfg[i] = master_object::type_id::create($sformatf("m_cfg[%0d]", i));

  foreach (s_cfg[i]) s_cfg[i] = slave_object::type_id::create($sformatf("s_cfg[%0d]", i));

  config_axi();

  super.build_phase(phase);

  envh = axi_enviroment::type_id::create("envh", this);
endfunction

function void axi_test::config_axi();
  foreach (m_cfg[i]) begin
    if (!uvm_config_db#(virtual axi_if)::get(this, "", "vif", m_cfg[i].m_vif))
      `uvm_fatal("VIF CONFIG", "cannot get()interface vif from uvm_config_db. Have you set() it?")

    m_cfg[i].is_active = UVM_ACTIVE;

    e_cfg.m_cfg[i] = m_cfg[i];
  end

  foreach (s_cfg[i]) begin
    if (!uvm_config_db#(virtual axi_if)::get(this, "", "vif", s_cfg[i].s_vif))
      `uvm_fatal("VIF CONFIG", "cannot get()interface vif from uvm_config_db. Have you set() it?")

    s_cfg[i].is_active = UVM_ACTIVE;

    e_cfg.s_cfg[i] = s_cfg[i];
  end

  e_cfg.no_of_master_agent = no_of_master_agent;
  e_cfg.no_of_slave_agent  = no_of_slave_agent;

  uvm_config_db#(axi_object)::set(this, "*", "axi_object", e_cfg);
endfunction

task axi_test::run_phase(uvm_phase phase);
  phase.raise_objection(this);
  seqh1 = master_sequence::type_id::create("seqh1");
  seqh2 = slave_sequence::type_id::create("seqh2");

  begin
    fork
      seqh1.start(envh.m_agenth_top.m_agenth[0].m_sequencer);

      seqh2.start(envh.s_agenth_top.s_agenth[0].m_sequencer);
      $display("##########################################1");
    join
  end

  phase.drop_objection(this);
endtask
