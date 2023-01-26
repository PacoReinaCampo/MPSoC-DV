class master_monitor extends uvm_monitor;
  `uvm_component_utils(master_monitor)

  virtual axi_if.M_MON_MP vif;

  master_object m_cfg;

  uvm_analysis_port #(master_sequence_item) monitor_port;

  master_sequence_item store[int][int];

  int ID[int];

  //------------------------------------------
  // METHODS
  //------------------------------------------

  // Standard UVM Methods:
  extern function new(string name = "master_monitor", uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task collect_data();
  extern task collect_resp();
  extern task collect();
  //extern function void report_phase(uvm_phase phase);
endclass

function master_monitor::new(string name = "master_monitor", uvm_component parent);
  super.new(name, parent);
  // create object for handle monitor_port using new
  monitor_port = new("monitor_port", this);
endfunction

function void master_monitor::build_phase(uvm_phase phase);
  // call super.build_phase(phase);
  super.build_phase(phase);

  if (!uvm_config_db#(master_object)::get(this, "", "set_from_master_top", m_cfg))
    `uvm_fatal("CONFIG", "cannot get() m_cfg from uvm_config_db. Have you set() it?")
endfunction

task master_monitor::run_phase(uvm_phase phase);
  //`uvm_info("MASTER_MONITOR","This is SLAVE monitor run_phase",UVM_LOW)

  forever begin
    collect;

    repeat (2) @(posedge vif.m_mon_cb);
  end
endtask

function void master_monitor::connect_phase(uvm_phase phase);
  vif = m_cfg.m_vif;
endfunction

task master_monitor::collect_data();
  master_sequence_item data_rcv;

  data_rcv = master_sequence_item::type_id::create("data_rcv");

  fork
    begin
      @(posedge vif.m_mon_cb.AWVALID) data_rcv.AWID = vif.m_mon_cb.AWID;
      data_rcv.AWADDR  = vif.m_mon_cb.AWADDR;
      data_rcv.AWLEN   = vif.m_mon_cb.AWLEN;
      data_rcv.AWBURST = vif.m_mon_cb.AWBURST;
      data_rcv.AWSIZE  = vif.m_mon_cb.AWSIZE;
    end

    begin
      while (~vif.m_mon_cb.WLAST) begin
        @(posedge vif.m_mon_cb.WREADY or posedge vif.m_mon_cb.WVALID or posedge vif.m_mon_cb.WLAST);
        wait (vif.m_mon_cb.WVALID && vif.m_mon_cb.WREADY) data_rcv.WID = vif.m_mon_cb.WID;
        data_rcv.WSTRB.push_back(vif.m_mon_cb.WSTRB);
        data_rcv.MDATA.push_back(vif.m_mon_cb.WDATA);
        @(vif.m_mon_cb);
      end
    end
  join

  store[data_rcv.AWADDR][data_rcv.AWID] = master_sequence_item::type_id::create($sformatf("data_rcv[%0d][%0d]", data_rcv.AWADDR, data_rcv.AWID));

  foreach (data_rcv.MDATA[i]) begin
    store[data_rcv.AWADDR][data_rcv.AWID].MDATA.push_back(data_rcv.MDATA[i]);
    store[data_rcv.AWADDR][data_rcv.AWID].WSTRB.push_back(data_rcv.WSTRB[i]);
  end

  `uvm_info("MASTER_MONITOR", $sformatf("printing from master monitor \n %s", store[data_rcv.AWADDR][data_rcv.AWID].sprint()), UVM_LOW)
endtask

task master_monitor::collect_resp();
  master_sequence_item data_rcv1;

  int a;

  repeat (data_rcv1.WRITE_DATA_TRANS) begin
    a = 0;
    @(posedge vif.m_mon_cb.BREADY or posedge vif.m_mon_cb.BVALID);

    wait (vif.m_mon_cb.BVALID && vif.m_mon_cb.BREADY) begin
      foreach (store[i, j]) begin : B2
        if (j == vif.m_mon_cb.BID) begin
          a++;

          if (a == 2) begin
            break;
          end

          ID[vif.m_mon_cb.BID]++;

          if (ID[vif.m_mon_cb.BID] == 2) begin
            break;
          end

          `uvm_info("MASTER_MONITOR", $sformatf("printing from master monitor according to the response send by slave driver  \n %s", store[i][j].sprint()), UVM_LOW)
          monitor_port.write(store[i][j]);
        end
      end
      @(vif.m_mon_cb);
    end
  end
endtask

task master_monitor::collect();
  semaphore s1 = new(1);
  semaphore s2 = new(1);

  master_sequence_item data_rcv2;

  //data_rcv2= master_sequence_item::type_id::create("data_rcv2");

  fork
    begin
      s1.get(1);
      collect_data;
      s1.put(1);
      s2.put(1);
    end

    begin
      s2.get(2);
      s1.get(1);

      if (data_rcv2.WRITE_DATA_TRANS == data_rcv2.NO_OF_TRANS) begin
        collect_resp;
        s2.put(2);
        s1.put(1);
      end
    end
  join
endtask
