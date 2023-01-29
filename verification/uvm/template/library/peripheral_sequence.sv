class peripheral_sequence extends uvm_sequence;
  `uvm_object_utils(peripheral_sequence)
  function new(string name = "peripheral_sequence");
    super.new(name);
  endfunction

  rand int num;  // Configuration total number of items to be sent

  constraint c1 {soft num inside {[10 : 50]};}

  virtual task body();
    for (int i = 0; i < num; i++) begin
      peripheral_sequence_item m_item = peripheral_sequence_item::type_id::create("m_item");
      start_item(m_item);
      m_item.randomize();
      `uvm_info("SEQUENCE", $sformatf("Generate new item: %s", m_item.convert2str()), UVM_HIGH)
      finish_item(m_item);
    end
    `uvm_info("SEQUENCE", $sformatf("Done generation of %0d items", num), UVM_LOW)
  endtask
endclass
