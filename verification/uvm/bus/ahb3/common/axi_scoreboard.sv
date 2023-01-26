class axi_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(axi_scoreboard)

  uvm_tlm_analysis_fifo #(master_sequence_item) fifo_master;
  uvm_tlm_analysis_fifo #(slave_sequence_item) fifo_slave;

  static int no_of_write_packet;
  static int no_of_read_packet;
  static int no_of_data_verification_with_success;
  static int no_of_data_verification_with_failure;
  static int no_of_data_verification;
  static int no_of_trans_verification_with_success;
  static int no_of_trans_verification_with_faluare;

  master_sequence_item master_data;
  slave_sequence_item slave_data;

  extern function new(string name, uvm_component parent);
  extern task run_phase(uvm_phase phase);
  extern function void check_phase1();
endclass

function axi_scoreboard::new(string name, uvm_component parent);
  super.new(name, parent);

  fifo_master = new("fifo_master", this);
  fifo_slave  = new("fifo_slave", this);
endfunction

task axi_scoreboard::run_phase(uvm_phase phase);
  forever begin
    fork
      begin
        fifo_master.get(master_data);
        $display("write_data_receive in sb at time %0t", $time);
        no_of_write_packet++;
      end

      begin
        fifo_slave.get(slave_data);
        $display("read_data_0_receive in sb at time %0t", $time);
        no_of_read_packet++;
      end
    join

    $display("checking&&&&&&&&&*****sb got the wr and rd data at time %0d loading......", $time);
    check_phase1();
  end
endtask

function void axi_scoreboard::check_phase1();
  `uvm_info("scoreboard", $sformatf("wr_moniter at time %0t", $time), UVM_LOW)
  master_data.print;

  `uvm_info("scoreboard", $sformatf("rd_moniter at time %0t", $time), UVM_LOW)

  slave_data.print;

  foreach (master_data.MDATA[i]) begin
    if (master_data.MDATA[i] != slave_data.WDATA[i]) begin
      `uvm_info("axi_scoreboard", $sformatf("DATA mismatch[%0d]", i), UVM_LOW)
      no_of_data_verification_with_failure++;
      no_of_data_verification++;
    end
    else begin
      `uvm_info("axi_scoreboard", $sformatf("DATA match[%0d]", i), UVM_LOW)
      no_of_data_verification_with_success++;
      no_of_data_verification++;
    end
  end

  if (no_of_data_verification_with_success == no_of_data_verification)
    no_of_trans_verification_with_success++;
  else
    no_of_trans_verification_with_faluare++;

  $display("   ***************************** SCORE BOARD RESULT FOR PACKET: %0d *************************************", no_of_read_packet);
  $display("   *                                                                                                    *");
  $display("   *               TOTAL NO OF DATA VERIFIED WITH SUCCESS: %1d                                          *", no_of_data_verification_with_success);
  $display("   *               TOTAL NO OF DATA VERIFIED WITH FAILURE: %0d                                          *", no_of_data_verification_with_failure);
  $display("   *               NO OF TRANS RECEIVED FORM WR_MONITOR: %0d                                            *", no_of_write_packet);
  $display("   *               NO OF TRANS RECEIVED FROM RD_MONITOR: %0d                                            *", no_of_read_packet);
  $display("   *               NO OF TRANS VERIFIED WITH SUCCESS : %0d                                              *", no_of_trans_verification_with_success);
  $display("   *               NO OF TRANS VERIFIED WITH FAILURE: %0d                                               *", no_of_trans_verification_with_faluare);
  $display("   *                                                                                                    *");
  $display("   ********************************##############################****************************************\n \n");
endfunction
