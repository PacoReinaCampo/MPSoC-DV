import peripheral_bb_pkg::*;

class peripheral_uvm_monitor extends uvm_monitor;
  // Declaration of Virtual interface
  virtual peripheral_uvm_interface                vif;

  // Declaration of Analysis ports and exports
  uvm_analysis_port #(peripheral_uvm_transaction) monitor2scoreboard_port;

  // Declaration of transaction item
  peripheral_uvm_transaction                      act_transaction;

  // Declaration of component utils to register with factory
  `uvm_component_utils(peripheral_uvm_monitor)

  // Method name : new
  // Description : constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
    act_transaction         = new();
    monitor2scoreboard_port = new("monitor2scoreboard_port", this);
  endfunction : new

  // Method name : build_phase
  // Description : construct the components
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual peripheral_uvm_interface)::get(this, "", "intf", vif)) begin
      `uvm_fatal("NOVIF", {"virtual interface must be set for: ", get_full_name(), ".vif"});
    end
  endfunction : build_phase

  // Method name : run_phase
  // Description : Extract the info from DUT via interface
  virtual task run_phase(uvm_phase phase);
    forever begin
      collect_write_transaction();
      collect_read_transaction();
      monitor2scoreboard_port.write(act_transaction);
    end
  endtask : run_phase

  // Method name : collect_actual_trans
  // Description : run task for collecting peripheral_adder transactions
  task collect_write_transaction();
    begin
      @(posedge vif.ram_clk);

      act_transaction.ram_addr <= vif.rc_cb.ram_addr;
      act_transaction.ram_din  <= vif.rc_cb.ram_din;
      act_transaction.ram_dout <= vif.rc_cb.ram_dout;
      act_transaction.ram_cen  <= vif.rc_cb.ram_cen;
      act_transaction.ram_wen  <= vif.rc_cb.ram_wen;

      @(posedge vif.ram_clk);
      act_transaction.ram_cen  <= vif.rc_cb.ram_cen;
    end
  endtask

  task collect_read_transaction();
    begin
      act_transaction.ram_addr <= vif.rc_cb.ram_addr;
      act_transaction.ram_din  <= vif.rc_cb.ram_din;
      act_transaction.ram_dout <= vif.rc_cb.ram_dout;
      act_transaction.ram_cen  <= vif.rc_cb.ram_cen;
      act_transaction.ram_wen  <= vif.rc_cb.ram_wen;

      @(posedge vif.ram_clk);
      act_transaction.ram_cen  <= vif.rc_cb.ram_cen;
    end
  endtask
endclass : peripheral_uvm_monitor
