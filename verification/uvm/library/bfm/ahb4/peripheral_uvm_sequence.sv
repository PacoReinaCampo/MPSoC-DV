class peripheral_uvm_sequence extends uvm_sequence #(peripheral_uvm_transaction);
  // Declaration of component utils to register with factory
  `uvm_object_utils(peripheral_uvm_sequence)

  // Method name : new
  // Description : sequence constructor
  function new(string name = "peripheral_uvm_sequence");
    super.new(name);
  endfunction

  // Method name : body
  // Description : Body of sequence to send randomized transaction through
  // Sequencer to driver
  virtual task body();
    for (int i = 0; i < 10; i++) begin
      req = peripheral_uvm_transaction::type_id::create("req");
      start_item(req);
      assert (req.randomize());
      `uvm_info(get_full_name(), $sformatf("RANDOMIZED TRANSACTION FROM SEQUENCE"), UVM_LOW);
      req.print();
      finish_item(req);
      get_response(rsp);
    end
  endtask
endclass
