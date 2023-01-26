class slave_driver extends uvm_driver #(slave_sequence_item);
  // Factory Registration
  `uvm_component_utils(slave_driver)

  slave_sequence_item q1[$];
  slave_sequence_item q2[$];
  slave_sequence_item q3[$];
  slave_sequence_item q4[$];
  slave_sequence_item q5[$];

  virtual axi_if.S_DRV_MP vif;

  slave_object m_cfg;

  bit [31:0] data;
  bit [3:0] strobe;
  bit [3:0] d_delay;
  bit [3:0] BID[$];

  //------------------------------------------
  // METHODS
  //------------------------------------------

  // Standard UVM Methods:
  extern function new(string name = "slave_driver", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task send_to_dut(slave_sequence_item xtn);

  extern task write_addr(slave_sequence_item xtn);
  extern task write_data(slave_sequence_item xtn);
  extern task write_resp(slave_sequence_item xtn);
  // extern task read_addr(slave_sequence_item xtn);
  // extern task read_data(slave_sequence_item xtn);

  // extern function void report_phase(uvm_phase phase);
endclass

function slave_driver::new(string name = "slave_driver", uvm_component parent);
  super.new(name, parent);
endfunction

function void slave_driver::build_phase(uvm_phase phase);
  super.build_phase(phase);
  // get the config object using uvm_config_db 
  if (!uvm_config_db#(slave_object)::get(this, "", "set_from_slave_top", m_cfg))
    `uvm_fatal("CONFIG", "cannot get() m_cfg from uvm_config_db. Have you set() it?")
endfunction

function void slave_driver::connect_phase(uvm_phase phase);
  vif = m_cfg.s_vif;
endfunction

task slave_driver::run_phase(uvm_phase phase);
  forever begin
    seq_item_port.get_next_item(req);
    send_to_dut(req);
    seq_item_port.item_done();
  end
  `uvm_info("SLAVE_DRIVER", "This is SLAVE DRIVER run_phase", UVM_LOW)
endtask

task slave_driver::send_to_dut(slave_sequence_item xtn);
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
    end

    begin
      s2.get(1);
      write_data(q2.pop_back);
      s2.put(1);
      s3.put(1);
    end

    begin
      s3.get(2);
      s1.get(1);
      if (xtn.WRITE_DATA_TRANS == xtn.NO_OF_TRANS) begin
        write_resp(q3.pop_back);
        s3.put(2);
        s2.put(1);
      end
    end
  join_none

  #10000;
endtask

task slave_driver::write_addr(slave_sequence_item xtn);
  repeat (xtn.a_delay) @(vif.s_drv_cb);

  vif.s_drv_cb.AWREADY <= 1'b1;

  wait (vif.s_drv_cb.AWVALID) xtn.AWID = vif.s_drv_cb.AWID;

  BID.push_back(xtn.AWID);

  xtn.AWADDR  = vif.s_drv_cb.AWADDR;

  xtn.AWLEN   = vif.s_drv_cb.AWLEN;

  xtn.AWSIZE  = vif.s_drv_cb.AWSIZE;

  xtn.AWBURST = vif.s_drv_cb.AWBURST;

  @(vif.s_drv_cb);

  vif.s_drv_cb.AWREADY <= 1'b0;
endtask

task slave_driver::write_data(slave_sequence_item xtn);
  d_delay = $urandom;

  while (!vif.s_drv_cb.WLAST) begin
    repeat (d_delay) @(vif.s_drv_cb);

    vif.s_drv_cb.WREADY <= 1'b1;

    wait (vif.s_drv_cb.WVALID) begin
      data = vif.s_drv_cb.WDATA;

      xtn.WDATA.push_front(data);

      strobe = vif.s_drv_cb.WSTRB;

      xtn.WSTRB.push_front(strobe);

      @(vif.s_drv_cb);

      vif.s_drv_cb.WREADY <= 1'b0;

      d_delay = $urandom;
    end
  end

  d_delay = $urandom;

  repeat (d_delay) vif.s_drv_cb.WREADY <= 1'b1;

  wait (vif.s_drv_cb.WVALID) begin
    data = vif.s_drv_cb.WDATA;

    xtn.WDATA.push_front(data);

    strobe = vif.s_drv_cb.WSTRB;
  end

  @(vif.s_drv_cb);

  vif.s_drv_cb.WREADY <= 1'b0;
endtask

task slave_driver::write_resp(slave_sequence_item xtn);
  BID.shuffle();

  foreach (BID[i]) begin

    repeat (d_delay) @(vif.s_drv_cb);

    vif.s_drv_cb.BVALID <= 1;

    vif.s_drv_cb.BID <= BID[i];

    wait (vif.s_drv_cb.BREADY) @(vif.s_drv_cb);

    vif.s_drv_cb.BID <= 4'b0;

    vif.s_drv_cb.BVALID <= 0;

    d_delay = $urandom;

    if (d_delay == 0)
      d_delay = 2;
  end
endtask
