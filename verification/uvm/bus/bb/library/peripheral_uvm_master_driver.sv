////////////////////////////////////////////////////////////////////////////////
//
// CLASS: peripheral_uvm_master_driver
//
////////////////////////////////////////////////////////////////////////////////

class peripheral_uvm_master_driver extends uvm_driver #(peripheral_uvm_transfer);

  // The virtual interface used to drive and view HDL signals.
  protected virtual peripheral_uvm_if vif;

  // Master Id
  protected int                       master_id;

  // Provide implmentations of virtual methods such as get_type_name and create
  `uvm_component_utils_begin(peripheral_uvm_master_driver)
    `uvm_field_int(master_id, UVM_DEFAULT)
  `uvm_component_utils_end

  // new - constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual peripheral_uvm_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal("NOVIF", {"virtual interface must be set for: ", get_full_name(), ".vif"});
    end
  endfunction : build_phase

  // run phase
  virtual task run_phase(uvm_phase phase);
    fork
      get_and_drive();
      reset_signals();
    join
  endtask : run_phase

  // get_and_drive 
  virtual protected task get_and_drive();
    @(negedge vif.sig_reset);
    forever begin
      @(posedge vif.sig_clock);
      seq_item_port.get_next_item(req);
      $cast(rsp, req.clone());
      rsp.set_id_info(req);
      drive_transfer(rsp);
      seq_item_port.item_done();
      seq_item_port.put_response(rsp);
    end
  endtask : get_and_drive

  // reset_signals
  virtual protected task reset_signals();
    forever begin
      @(posedge vif.sig_reset);
      vif.rw           <= 'h0;
      vif.sig_addr     <= 'hz;
      vif.sig_data_out <= 'hz;
      vif.sig_size     <= 'bz;
      vif.sig_read     <= 'bz;
      vif.sig_write    <= 'bz;
      vif.sig_bip      <= 'bz;
    end
  endtask : reset_signals

  // drive_transfer
  virtual protected task drive_transfer(peripheral_uvm_transfer trans);
    if (trans.transmit_delay > 0) begin
      repeat (trans.transmit_delay) @(posedge vif.sig_clock);
    end
    drive_address_phase(trans);
    drive_data_phase(trans);
  endtask : drive_transfer

  // drive_address_phase
  virtual protected task drive_address_phase(peripheral_uvm_transfer trans);
    vif.sig_addr <= trans.addr;
    drive_size(trans.size);
    drive_read_write(trans.read_write);
    @(posedge vif.sig_clock);
    vif.sig_addr  <= 32'bz;
    vif.sig_size  <= 2'bz;
    vif.sig_read  <= 1'bz;
    vif.sig_write <= 1'bz;
  endtask : drive_address_phase

  // drive_data_phase
  virtual protected task drive_data_phase(peripheral_uvm_transfer trans);
    bit err;
    for (int i = 0; i <= trans.size - 1; i++) begin
      if (i == (trans.size - 1)) begin
        vif.sig_bip <= 0;
      end else begin
        vif.sig_bip <= 1;
      end
      case (trans.read_write)
        READ:  read_byte(trans.data[i], err);
        WRITE: write_byte(trans.data[i], err);
      endcase
    end  // for loop
    vif.sig_data_out <= 8'bz;
    vif.sig_bip      <= 1'bz;
  endtask : drive_data_phase

  // read_byte
  virtual protected task read_byte(output bit [7:0] data, output bit error);
    vif.rw <= 1'b0;
    @(posedge vif.sig_clock iff vif.sig_wait === 0);
    data = vif.sig_data_in;
  endtask : read_byte

  // write_byte
  virtual protected task write_byte(bit [7:0] data, output bit error);
    vif.rw           <= 1'b1;
    vif.sig_data_out <= data;
    @(posedge vif.sig_clock iff vif.sig_wait === 0);
    vif.rw <= 'h0;
  endtask : write_byte

  // drive_size
  virtual protected task drive_size(int size);
    case (size)
      1: vif.sig_size <= 2'b00;
      2: vif.sig_size <= 2'b01;
      4: vif.sig_size <= 2'b10;
      8: vif.sig_size <= 2'b11;
    endcase
  endtask : drive_size

  // drive_read_write            
  virtual protected task drive_read_write(ubus_read_write_enum rw);
    case (rw)
      NOP: begin
        vif.sig_read  <= 0;
        vif.sig_write <= 0;
      end
      READ: begin
        vif.sig_read  <= 1;
        vif.sig_write <= 0;
      end
      WRITE: begin
        vif.sig_read  <= 0;
        vif.sig_write <= 1;
      end
    endcase
  endtask : drive_read_write

endclass : peripheral_uvm_master_driver
