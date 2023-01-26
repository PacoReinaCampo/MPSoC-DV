class slave_object extends uvm_object;
  `uvm_object_utils(slave_object)

  virtual axi_if s_vif;

  uvm_active_passive_enum is_active = UVM_ACTIVE;

  static int mon_rcvd_xtn_cnt = 0;
  static int drv_data_sent_cnt = 0;

  extern function new(string name = "slave_object");
endclass

function slave_object::new(string name = "slave_object");
  super.new(name);
endfunction
