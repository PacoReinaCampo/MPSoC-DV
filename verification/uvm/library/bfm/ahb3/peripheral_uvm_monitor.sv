import peripheral_axi4_pkg::*;

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
      // Operate in a synchronous manner
      @(posedge vif.aclk);

      // Address Phase
      act_transaction.awid    <= vif.rc_cb.awid;
      act_transaction.awadr   <= vif.rc_cb.awadr;
      act_transaction.awvalid <= vif.rc_cb.awvalid;
      act_transaction.awlen   <= vif.rc_cb.awlen;
      act_transaction.awsize  <= vif.rc_cb.awsize;
      act_transaction.awburst <= vif.rc_cb.awburst;
      act_transaction.awlock  <= vif.rc_cb.awlock;
      act_transaction.awcache <= vif.rc_cb.awcache;
      act_transaction.awprot  <= vif.rc_cb.awprot;
      @(posedge vif.awready);

      // Data Phase
      act_transaction.awvalid <= vif.rc_cb.awvalid;
      act_transaction.awadr   <= vif.rc_cb.awadr;
      act_transaction.wid     <= vif.rc_cb.wid;
      act_transaction.wvalid  <= vif.rc_cb.wvalid;
      act_transaction.wrdata  <= vif.rc_cb.wrdata;
      act_transaction.wstrb   <= vif.rc_cb.wstrb;
      act_transaction.wlast   <= vif.rc_cb.wlast;
      @(posedge vif.wready);

      // Response Phase
      act_transaction.wid    <= vif.rc_cb.wid;
      act_transaction.wvalid <= vif.rc_cb.wvalid;
      act_transaction.wrdata <= vif.rc_cb.wrdata;
      act_transaction.wstrb  <= vif.rc_cb.wstrb;
      act_transaction.wlast  <= vif.rc_cb.wlast;
    end
  endtask

  task collect_read_transaction();
    begin
      // Address Phase
      act_transaction.arid    <= vif.rc_cb.arid;
      act_transaction.araddr  <= vif.rc_cb.awadr;
      act_transaction.arvalid <= vif.rc_cb.arvalid;
      act_transaction.arlen   <= vif.rc_cb.arlen;
      act_transaction.arsize  <= vif.rc_cb.arsize;
      act_transaction.arlock  <= vif.rc_cb.arlock;
      act_transaction.arcache <= vif.rc_cb.arcache;
      act_transaction.arprot  <= vif.rc_cb.arprot;
      act_transaction.rready  <= vif.rc_cb.rready;
      @(posedge vif.arready);

      // Data Phase
      act_transaction.arvalid <= vif.rc_cb.arvalid;
      act_transaction.rready  <= vif.rc_cb.rready;
      @(posedge vif.rvalid);

      act_transaction.rready <= vif.rc_cb.rready;
      act_transaction.rdata  <= vif.rc_cb.rdata;
      @(negedge vif.rvalid);

      act_transaction.araddr <= vif.rc_cb.araddr;
    end
  endtask
endclass : peripheral_uvm_monitor
