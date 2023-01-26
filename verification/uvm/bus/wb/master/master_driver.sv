class master_driver extends uvm_driver #(master_sequence_item);
  // Factory Registration
  `uvm_component_utils(master_driver)

  master_sequence_item q1[$];
  master_sequence_item q2[$];
  master_sequence_item q3[$];
  master_sequence_item q4[$];
  master_sequence_item q5[$];
 
  bit [3:0] d_delay;
  bit [3:0] BID[$];

  virtual axi_if.M_DRV_MP vif;

  // Declare virtual interface handle with WDR_MP as modport
  // virtual ram_if.WDR_MP vif;

  // Declare the ram_wr_agent_config handle as "m_cfg"
  // master_object m_cfg;
  master_object m_cfg;

  //------------------------------------------
  // METHODS
  //------------------------------------------

  // Standard UVM Methods:
  extern function new(string name = "master_driver", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task send_to_dut(master_sequence_item xtn);

  extern task write_addr(master_sequence_item xtn);
  extern task write_data(master_sequence_item xtn);
  extern task write_resp(master_sequence_item xtn);
  extern task read_addr(master_sequence_item xtn);
  extern task read_data(master_sequence_item xtn);

  //extern function void report_phase(uvm_phase phase);
endclass

function master_driver::new(string name = "master_driver", uvm_component parent);
  super.new(name, parent);
endfunction

function void master_driver::build_phase(uvm_phase phase);
  super.build_phase(phase);
  // get the config object using uvm_config_db 
  if (!uvm_config_db#(master_object)::get(this, "", "set_from_master_top", m_cfg))
    `uvm_fatal("CONFIG", "cannot get() m_cfg from uvm_config_db. Have you set() it?")

  //$display("##################CFG CLASS PROPERTY %p",m_cfg);
endfunction

function void master_driver::connect_phase(uvm_phase phase);
  vif = m_cfg.m_vif;
endfunction

task master_driver::run_phase(uvm_phase phase);
  `uvm_info("MASTER_DRIVER", "This is MASTER DRIVER run_phase", UVM_LOW)

  forever begin
    seq_item_port.get_next_item(req);
    send_to_dut(req);
    seq_item_port.item_done();
  end
endtask

task master_driver::send_to_dut(master_sequence_item xtn);
  semaphore s1 = new(1);
  semaphore s2 = new(1);
  semaphore s3 = new(1);
  semaphore s4 = new(1);
  semaphore s5 = new(1);
  semaphore s6 = new(1);

  q1.push_front(xtn);
  q2.push_front(xtn);
  q3.push_front(xtn);
  q4.push_front(xtn);
  q5.push_front(xtn);

  fork
    begin
      s1.get(1);
      write_addr(q1.pop_back);
      s1.put(1);
      s3.put(1);
    end

    begin
      s2.get(1);
      write_data(q2.pop_back);
      s2.put(1);
    end

    begin
      s3.get(2);
      s2.get(1);
      if (xtn.WRITE_DATA_TRANS == xtn.NO_OF_TRANS) begin
        write_resp(q3.pop_back);
        s3.put(2);
        s2.put(1);
      end
    end

    begin
      s4.get(1);
      read_addr(q4.pop_back);
      s4.put(2);
    end

    begin
      s4.get(2);
      read_data(q5.pop_back);
      s4.put(1);
    end
  join_none

  #10000;
endtask

task master_driver::write_addr(master_sequence_item xtn);
  repeat (xtn.a_delay) @(vif.m_drv_cb);

  vif.m_drv_cb.AWVALID <= 1'b1;
  vif.m_drv_cb.AWID <= xtn.AWID;
  vif.m_drv_cb.AWLEN <= xtn.AWLEN;
  vif.m_drv_cb.AWSIZE <= xtn.AWSIZE;
  vif.m_drv_cb.AWBURST <= xtn.AWBURST;
  vif.m_drv_cb.AWADDR <= xtn.AWADDR;
  wait (vif.m_drv_cb.AWREADY) @(vif.m_drv_cb);
  vif.m_drv_cb.AWVALID <= 1'b0;
endtask

task master_driver::write_data(master_sequence_item xtn);
  for (int i = 0; i < xtn.Burst_Length; i++) begin
    repeat (xtn.d_delay[i]) @(vif.m_drv_cb);

    vif.m_drv_cb.WVALID <= 1'b1;

    vif.m_drv_cb.WID <= xtn.WID;

    if (i == xtn.Burst_Length - 1) begin
      vif.m_drv_cb.WLAST <= 1'b1;
    end
    else
      vif.m_drv_cb.WLAST <= 1'b0;

    vif.m_drv_cb.WSTRB <= xtn.WSTRB[i];

    case (xtn.WSTRB[i])
      4'b0001: vif.m_drv_cb.WDATA <= xtn.WDATA[i][7:0];
      4'b0011: vif.m_drv_cb.WDATA <= xtn.WDATA[i][15:0];
      4'b1111: vif.m_drv_cb.WDATA <= xtn.WDATA[i][31:0];
      4'b1100: vif.m_drv_cb.WDATA[31:16] <= xtn.WDATA[i][31:16];
      4'b0010: vif.m_drv_cb.WDATA[15:8] <= xtn.WDATA[i][15:8];
      4'b0100: vif.m_drv_cb.WDATA[23:16] <= xtn.WDATA[i][23:16];
      4'b1000: vif.m_drv_cb.WDATA[31:24] <= xtn.WDATA[i][31:24];
    endcase

    wait (vif.m_drv_cb.WREADY) @(vif.m_drv_cb);

    vif.m_drv_cb.WDATA  <= 32'b0;

    vif.m_drv_cb.WVALID <= 1'b0;

    vif.m_drv_cb.WLAST  <= 1'b0;
  end
endtask

task master_driver::write_resp(master_sequence_item xtn);
  d_delay = $urandom;

  repeat (xtn.WRITE_DATA_TRANS) begin

    repeat (d_delay) @(vif.m_drv_cb);
    vif.m_drv_cb.BREADY <= 1'b1;

    wait (vif.m_drv_cb.BVALID) begin
      BID.push_back(vif.m_drv_cb.BID);
      @(vif.m_drv_cb);
      vif.m_drv_cb.BREADY <= 1'b0;

      d_delay = $urandom;
      if (d_delay == 0)
        d_delay = 2;
    end
  end
endtask

task master_driver::read_addr(master_sequence_item xtn);
  repeat (xtn.rd_a_delay) @(vif.m_drv_cb);

  vif.m_drv_cb.ARVALID <= 1'b1;

  vif.m_drv_cb.ARID <= xtn.ARID;
  vif.m_drv_cb.ARADDR <= xtn.ARADDR;
  vif.m_drv_cb.ARLEN <= xtn.ARLEN;
  vif.m_drv_cb.ARSIZE <= xtn.ARSIZE;
  vif.m_drv_cb.ARBURST <= xtn.ARBURST;
endtask

task master_driver::read_data(master_sequence_item xtn);
  repeat (xtn.rd_d_delay) @(vif.m_drv_cb);
  vif.m_drv_cb.RREADY <= 1'b1;
endtask
