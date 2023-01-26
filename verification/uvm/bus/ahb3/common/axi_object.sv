class axi_object extends uvm_object;
  `uvm_object_utils(axi_object)

  bit has_scoreboard = 1;

  bit has_master_agent = 1;

  bit has_slave_agent = 1;

  int no_of_master_agent = 1;
  int no_of_slave_agent = 1;

  master_object m_cfg[];

  slave_object s_cfg[];

  extern function new(string name = "axi_object");
endclass

function axi_object::new(string name = "axi_object");
  super.new(name);
endfunction
