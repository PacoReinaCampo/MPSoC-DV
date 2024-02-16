`include "peripheral_uvm_transaction.sv"

import peripheral_axi4_pkg::*;

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
      write_drive();
      read_drive();
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
  task write_drive();
    begin
      // Operate in a synchronous manner
      @(posedge vif.aclk);

      // Address Phase
      vif.dr_cb.awid    <= 0;
      vif.dr_cb.awadr   <= req.address;
      vif.dr_cb.awvalid <= 1;
      vif.dr_cb.awlen   <= AXI_BURST_LENGTH_1;
      vif.dr_cb.awsize  <= AXI_BURST_SIZE_WORD;
      vif.dr_cb.awburst <= AXI_BURST_TYPE_FIXED;
      vif.dr_cb.awlock  <= AXI_LOCK_NORMAL;
      vif.dr_cb.awcache <= 0;
      vif.dr_cb.awprot  <= AXI_PROTECTION_NORMAL;
      @(posedge vif.awready);

      // Data Phase
      vif.dr_cb.awvalid <= 0;
      vif.dr_cb.awadr   <= 'bX;
      vif.dr_cb.wid     <= 0;
      vif.dr_cb.wvalid  <= 1;
      vif.dr_cb.wrdata  <= req.wrdata;
      vif.dr_cb.wstrb   <= 4'hF;
      vif.dr_cb.wlast   <= 1;
      @(posedge vif.wready);

      // Response Phase
      vif.dr_cb.wid    <= 0;
      vif.dr_cb.wvalid <= 0;
      vif.dr_cb.wrdata <= 'bX;
      vif.dr_cb.wstrb  <= 0;
      vif.dr_cb.wlast  <= 0;
    end
  endtask

  task read_drive();
    begin
      // Address Phase
      vif.dr_cb.arid      <= 0;
      vif.dr_cb.araddr    <= req.address;
      vif.dr_cb.arvalid   <= 1;
      vif.dr_cb.arlen     <= AXI_BURST_LENGTH_1;
      vif.dr_cb.arsize    <= AXI_BURST_SIZE_WORD;
      vif.dr_cb.arlock    <= AXI_LOCK_NORMAL;
      vif.dr_cb.arcache   <= 0;
      vif.dr_cb.arprot    <= AXI_PROTECTION_NORMAL;
      vif.dr_cb.rready    <= 0;
      @(posedge vif.arready);

      // Data Phase
      vif.dr_cb.arvalid <= 0;
      vif.dr_cb.rready  <= 1;
      @(posedge vif.rvalid);

      vif.dr_cb.rready <= 0;
      @(negedge vif.rvalid);

      vif.dr_cb.araddr <= 'bx;
    end
  endtask

  // Method name : reset
  // Description : Driving the dut inputs
  task reset();
    // Global Signals
    vif.dr_cb.aresetn <= 0;  // Active LOW

    // Write Address Channel
    vif.dr_cb.awid <= 0;     // Address Write ID
    vif.dr_cb.awadr <= 0;    // Write Address
    vif.dr_cb.awlen <= 0;    // Burst Length
    vif.dr_cb.awsize <= 0;   // Burst Size
    vif.dr_cb.awburst <= 0;  // Burst Type
    vif.dr_cb.awlock <= 0;   // Lock Type
    vif.dr_cb.awcache <= 0;  // Cache Type
    vif.dr_cb.awprot <= 0;   // Protection Type
    vif.dr_cb.awvalid <= 0;  // Write Address Valid

    // Write Data Channel
    vif.dr_cb.wid <= 0;     // Write ID
    vif.dr_cb.wrdata <= 0;  // Write Data
    vif.dr_cb.wstrb <= 0;   // Write Strobes
    vif.dr_cb.wlast <= 0;   // Write Last
    vif.dr_cb.wvalid <= 0;  // Write Valid

    // Write Response CHannel
    vif.dr_cb.bid <= 0;     // Response ID
    vif.dr_cb.bresp <= 0;   // Write Response
    vif.dr_cb.bvalid <= 0;  // Write Response Valid   

    // Read Address Channel
    vif.dr_cb.arid <= 0;     // Read Address ID
    vif.dr_cb.araddr <= 0;   // Read Address
    vif.dr_cb.arlen <= 0;    // Burst Length
    vif.dr_cb.arsize <= 0;   // Burst Size
    vif.dr_cb.arlock <= 0;   // Lock Type
    vif.dr_cb.arcache <= 0;  // Cache Type
    vif.dr_cb.arprot <= 0;   // Protection Type
    vif.dr_cb.arvalid <= 0;  // Read Address Valid

    // Read Data Channel
    vif.dr_cb.rready <= 0;  // Read Ready

    repeat (5) @(posedge vif.aclk);

    vif.dr_cb.aresetn <= 1;  // Inactive HIGH
  endtask
endclass : peripheral_uvm_driver
