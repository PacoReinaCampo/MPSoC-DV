class peripheral_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(peripheral_sequence_item)
  rand bit in;
  bit out;

  virtual function string convert2str();
    return $sformatf("in=%0d, out=%0d", in, out);
  endfunction

  function new(string name = "peripheral_sequence_item");
    super.new(name);
  endfunction

  constraint c1 {
    in dist {
      0 :/ 20,
      1 :/ 80
    };
  }
endclass
