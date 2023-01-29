class peripheral_driver extends uvm_driver #(peripheral_sequence_item);
  `uvm_component_utils(peripheral_driver)
  function new(string name = "peripheral_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual design_if vif;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual design_if)::get(this, "", "des_vif", vif))
      `uvm_fatal("DRIVER", "Could not get vif")
  endfunction

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      peripheral_sequence_item m_item;
      `uvm_info("DRIVER", $sformatf("Wait for item from sequencer"), UVM_HIGH)
      seq_item_port.get_next_item(m_item);
      drive_item(m_item);
      seq_item_port.item_done();
    end
  endtask

  virtual task drive_item(peripheral_sequence_item m_item);
    @(vif.cb);
    vif.cb.in <= m_item.in;
  endtask
endclass
