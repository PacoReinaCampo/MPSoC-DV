`include "peripheral_uvm_transaction.sv"

class peripheral_uvm_driver extends uvm_driver #(peripheral_uvm_transaction);
  // Declaration of component utils to register with factory
  peripheral_uvm_transaction       transaction;

  // Declaration of Virtual interface
  virtual peripheral_uvm_interface vif;

  // Declaration of component utils to register with factory
  `uvm_component_utils(peripheral_uvm_driver)

  uvm_analysis_port #(peripheral_uvm_transaction) driver2rm_port;

  // Method name : new
  // Description : constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  // Method name : build_phase
  // Description : construct the components
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual peripheral_uvm_interface)::get(this, "", "intf", vif)) begin
      `uvm_fatal("NO_VIF", {"virtual interface must be set for: ", get_full_name(), ".vif"});
    end
    driver2rm_port = new("driver2rm_port", this);
  endfunction : build_phase

  // Method name : run_phase
  // Description : Drive the transaction info to DUT
  virtual task run_phase(uvm_phase phase);
    reset();
    forever begin
      seq_item_port.get_next_item(req);
      drive();
      `uvm_info(get_full_name(), $sformatf("TRANSACTION FROM DRIVER"), UVM_LOW);
      req.print();
      @(vif.dr_cb);
      $cast(rsp, req.clone());
      rsp.set_id_info(req);
      driver2rm_port.write(rsp);
      seq_item_port.item_done();
      seq_item_port.put(rsp);
    end
  endtask : run_phase

  // Method name : drive
  // Description : Driving the dut inputs
  task drive();
    wait (!vif.reset);
    @(vif.dr_cb);
    vif.dr_cb.x   <= req.x;
    vif.dr_cb.y   <= req.y;
    vif.dr_cb.cin <= req.cin;
  endtask

  // Method name : reset
  // Description : Driving the dut inputs
  task reset();
    vif.dr_cb.x   <= 0;
    vif.dr_cb.y   <= 0;
    vif.dr_cb.cin <= 0;
  endtask
endclass : peripheral_uvm_driver
