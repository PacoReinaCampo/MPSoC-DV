////////////////////////////////////////////////////////////////////////////////
//
// CLASS: peripheral_uvm_slave_driver
//
////////////////////////////////////////////////////////////////////////////////

class peripheral_uvm_slave_driver extends uvm_driver #(peripheral_uvm_transfer);

  // The virtual interface used to drive and view HDL signals.
  protected virtual peripheral_uvm_if vif;

  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_component_utils(peripheral_uvm_slave_driver)

  // new - constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual peripheral_uvm_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", {"virtual interface must be set for: ", get_full_name(), ".vif"});
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
    @(negedge vif.presetn);
    forever begin
      @(posedge vif.pclk);
      seq_item_port.get_next_item(req);
      respond_to_transfer(req);
      seq_item_port.item_done();
    end
  endtask : get_and_drive

  // reset_signals
  virtual protected task reset_signals();
    forever begin
      @(posedge vif.presetn);
      vif.pslverr <= 1'bz;
      vif.penable  <= 1'bz;
      vif.rw        <= 1'b0;
    end
  endtask : reset_signals

  // respond_to_transfer
  virtual protected task respond_to_transfer(peripheral_uvm_transfer resp);
    if (resp.read_write != NOP) begin
      vif.pslverr <= 1'b0;
      for (int i = 0; i < resp.size; i++) begin
        case (resp.read_write)
          READ: begin
            vif.rw     <= 1'b1;
            vif.prdata <= resp.data[i];
          end
          WRITE: begin
          end
        endcase
        if (resp.wait_state[i] > 0) begin
          vif.penable <= 1'b1;
          repeat (resp.wait_state[i]) @(posedge vif.pclk);
        end
        vif.penable <= 1'b0;
        @(posedge vif.pclk);
        resp.data[i] = vif.pwdata;
      end
      vif.rw      <= 1'b0;
      vif.penable <= 1'bz;
      vif.pslverr <= 1'bz;
    end
  endtask : respond_to_transfer

endclass : peripheral_uvm_slave_driver
