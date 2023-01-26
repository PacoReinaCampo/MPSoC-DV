class slave_monitor extends uvm_monitor;
  `uvm_component_utils(slave_monitor)

  virtual axi_if.S_MON_MP vif;

  slave_object m_cfg;

  uvm_analysis_port #(slave_sequence_item) monitor_port;

  slave_sequence_item store[int][int];

  int ID[int];

  //------------------------------------------
  // METHODS
  //------------------------------------------

  // Standard UVM Methods:
  extern function new(string name = "slave_monitor", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task collect_data();
  extern task collect_resp();
  extern task collect();

  //extern function void report_phase(uvm_phase phase);
endclass

function void slave_monitor::connect_phase(uvm_phase phase);
  vif = m_cfg.s_vif;
endfunction

function slave_monitor::new(string name = "slave_monitor", uvm_component parent);
  super.new(name, parent);
  // create object for handle monitor_port using new
  monitor_port = new("monitor_port", this);
endfunction

function void slave_monitor::build_phase(uvm_phase phase);
  // call super.build_phase(phase);
  super.build_phase(phase);

  if (!uvm_config_db#(slave_object)::get(this, "", "set_from_slave_top", m_cfg))
    `uvm_fatal("CONFIG", "cannot get() m_cfg from uvm_config_db. Have you set() it?")
endfunction

task slave_monitor::run_phase(uvm_phase phase);
  `uvm_info("SLAVE_MONITOR", "This is SLAVE monitor run_phase", UVM_LOW)
  forever begin
    collect;

    repeat (2) @(posedge vif.s_mon_cb);
  end
endtask

task slave_monitor::collect();
  semaphore s1 = new(1);
  semaphore s2 = new(1);

  slave_sequence_item data_rcv2;

  fork
    begin
      s1.get(1);
      collect_data;
      s1.put(1);
      s2.put(1);
    end

    begin
      s1.get(1);
      s2.get(2);
      if (data_rcv2.WRITE_DATA_TRANS == data_rcv2.NO_OF_TRANS) collect_resp;
      s1.put(1);
      s2.put(2);
    end
  join
endtask

task slave_monitor::collect_data();
  slave_sequence_item data_rcv;

  data_rcv = slave_sequence_item::type_id::create("data_rcv");

  fork
    begin
      @(posedge vif.s_mon_cb.AWREADY or posedge vif.s_mon_cb.AWVALID);
      wait (vif.s_mon_cb.AWREADY && vif.s_mon_cb.AWVALID) data_rcv.AWID = vif.s_mon_cb.AWID;
      data_rcv.AWADDR  = vif.s_mon_cb.AWADDR;
      data_rcv.AWLEN   = vif.s_mon_cb.AWLEN;
      data_rcv.AWBURST = vif.s_mon_cb.AWBURST;
      data_rcv.AWSIZE  = vif.s_mon_cb.AWSIZE;
    end

    begin
      while (~vif.s_mon_cb.WLAST) begin : B1
        @(posedge vif.s_mon_cb.WREADY or posedge vif.s_mon_cb.WVALID or posedge vif.s_mon_cb.WLAST);
        if (vif.s_mon_cb.WLAST) begin
          wait (vif.s_mon_cb.WREADY && vif.s_mon_cb.WVALID) begin
            data_rcv.WID = vif.s_mon_cb.WID;
            data_rcv.WSTRB.push_back(vif.s_mon_cb.WSTRB);
            data_rcv.WDATA.push_back(vif.s_mon_cb.WDATA);
            @(vif.s_mon_cb);
          end

          disable B1;
        end
        else
          wait (vif.s_mon_cb.WREADY && vif.s_mon_cb.WVALID) begin
            // $display("HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH at time %0t",$time);
            data_rcv.WID = vif.s_mon_cb.WID;
            data_rcv.WSTRB.push_back(vif.s_mon_cb.WSTRB);
            data_rcv.WDATA.push_back(vif.s_mon_cb.WDATA);
            //repeat(2)
            @(vif.s_mon_cb);
          end
      end
    end
  join

  store[data_rcv.AWADDR][data_rcv.AWID] = slave_sequence_item::type_id::create($sformatf("data_rcv[%0d][%0d]", data_rcv.AWADDR, data_rcv.AWID));

  foreach (data_rcv.WDATA[i]) begin
    store[data_rcv.AWADDR][data_rcv.AWID].WDATA.push_back(data_rcv.WDATA[i]);
    store[data_rcv.AWADDR][data_rcv.AWID].WSTRB.push_back(data_rcv.WSTRB[i]);
  end

  `uvm_info("SLAVE_MONITOR", $sformatf("printing from slave monitor \n %s", store[data_rcv.AWADDR][data_rcv.WID].sprint()), UVM_LOW)
endtask

task slave_monitor::collect_resp();
  slave_sequence_item data_rcv1;
  int a;

  repeat (data_rcv1.WRITE_DATA_TRANS) begin
    a = 0;
    @(posedge vif.s_mon_cb.BVALID);
    begin
      foreach (store[i, j]) begin : B1
        if (j == vif.s_mon_cb.BID) begin
          a++;

          $display("SLAVE A %0d", a);

          if (a == 2) begin
            break;
          end

          ID[vif.s_mon_cb.BID]++;

          if (ID[vif.s_mon_cb.BID] == 2) begin
            break;
          end

          `uvm_info("SLAVE_MONITOR", $sformatf("printing from slave monitor according to the response send by slave driver  \n %s", store[i][j].sprint()), UVM_LOW)
          monitor_port.write(store[i][j]);
        end
      end

      @(vif.s_mon_cb);
    end
  end
endtask
