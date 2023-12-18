class peripheral_uvm_scoreboard extends uvm_scoreboard;
  // Declaration of component utils to register with factory
  `uvm_component_utils(peripheral_uvm_scoreboard)

  // Declaration of Analysis ports and exports
  uvm_analysis_export #(peripheral_uvm_transaction)   rm2scoreboard_export,          monitor2scoreboard_export;
  uvm_tlm_analysis_fifo #(peripheral_uvm_transaction) rm2scoreboard_export_fifo,     monitor2scoreboard_export_fifo;
  peripheral_uvm_transaction                          exp_transaction,               act_transaction;
  peripheral_uvm_transaction                          exp_trans_fifo            [$], act_trans_fifo                 [$];
  bit                                                 error;

  // Method name : new
  // Description : Constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  // Method name : build phase
  // Description : Constructor
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    rm2scoreboard_export           = new("rm2scoreboard_export", this);
    monitor2scoreboard_export      = new("monitor2scoreboard_export", this);
    rm2scoreboard_export_fifo      = new("rm2scoreboard_export_fifo", this);
    monitor2scoreboard_export_fifo = new("monitor2scoreboard_export_fifo", this);
  endfunction : build_phase

  // Method name : build phase
  // Description : Constructor
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    rm2scoreboard_export.connect(rm2scoreboard_export_fifo.analysis_export);
    monitor2scoreboard_export.connect(monitor2scoreboard_export_fifo.analysis_export);
  endfunction : connect_phase

  // Method name : run
  // Description : comparing peripheral_adder expected and actual transactions
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      monitor2scoreboard_export_fifo.get(act_transaction);
      if (act_transaction == null) $stop;
      act_trans_fifo.push_back(act_transaction);
      rm2scoreboard_export_fifo.get(exp_transaction);
      if (exp_transaction == null) $stop;
      exp_trans_fifo.push_back(exp_transaction);
      compare_trans();
    end
  endtask

  // Method name : compare_trans
  // Description : comparing peripheral_adder expected and actual transactions
  task compare_trans();
    peripheral_uvm_transaction exp_transaction, act_transaction;
    if (exp_trans_fifo.size != 0) begin
      exp_transaction = exp_trans_fifo.pop_front();
      if (act_trans_fifo.size != 0) begin
        act_transaction = act_trans_fifo.pop_front();
        `uvm_info(get_full_name(), $sformatf("expected peripheral_adder SUM =%d , actual adder_4_bit SUM =%d ", exp_transaction.sum, act_transaction.sum), UVM_LOW);
        `uvm_info(get_full_name(), $sformatf("expected peripheral_adder cout =%d , actual adder_4_bit cout =%d ", exp_transaction.cout, act_transaction.cout), UVM_LOW);
        if (exp_transaction.sum == act_transaction.sum) begin
          `uvm_info(get_full_name(), $sformatf("SUM MATCHES"), UVM_LOW);
        end else begin
          `uvm_error(get_full_name(), $sformatf("SUM MIS-MATCHES"));
          error = 1;
        end
        if (exp_transaction.cout == act_transaction.cout) begin
          `uvm_info(get_full_name(), $sformatf("COUT MATCHES"), UVM_LOW);
        end else begin
          `uvm_error(get_full_name(), $sformatf("COUT MIS-MATCHES"));
          error = 1;
        end
      end
    end
  endtask

  // Method name : report
  // Description : Report the testcase status PASS/FAIL
  function void report_phase(uvm_phase phase);
    if (error == 0) begin
      $write("%c[7;32m", 27);
      $display("-------------------------------------------------");
      $display("------ INFO : TEST CASE PASSED ------------------");
      $display("-----------------------------------------");
      $write("%c[0m", 27);
    end else begin
      $write("%c[7;31m", 27);
      $display("---------------------------------------------------");
      $display("------ ERROR : TEST CASE FAILED ------------------");
      $display("---------------------------------------------------");
      $write("%c[0m", 27);
    end
  endfunction
endclass : peripheral_uvm_scoreboard
