class peripheral_uvm_monitor extends uvm_monitor;
  // Declaration of Virtual interface
  virtual peripheral_uvm_interface                vif;

  // Declaration of Analysis ports and exports 
  uvm_analysis_port #(peripheral_uvm_transaction) monitor2scoreboard_port;

  // Declaration of transaction item 
  peripheral_uvm_transaction                      act_transaction;

  // Declaration of component utils
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
      collect_trans();
      monitor2scoreboard_port.write(act_transaction);
    end
  endtask : run_phase

  // Method name : collect_actual_trans 
  // Description : run task for collecting peripheral_adder transactions
  task collect_trans();
    wait (!vif.reset);
    @(vif.rc_cb);
    @(vif.rc_cb);
    act_transaction.x    = vif.rc_cb.x;
    act_transaction.y    = vif.rc_cb.y;
    act_transaction.cin  = vif.rc_cb.cin;
    act_transaction.sum  = vif.rc_cb.sum;
    act_transaction.cout = vif.rc_cb.cout;
    `uvm_info(get_full_name(), $sformatf("TRANSACTION FROM MONITOR"), UVM_LOW);
    act_transaction.print();
  endtask
endclass : peripheral_uvm_monitor
