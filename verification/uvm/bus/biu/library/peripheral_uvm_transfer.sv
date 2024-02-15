////////////////////////////////////////////////////////////////////////////////
// peripheral_uvm transfer enums, parameters, and events
////////////////////////////////////////////////////////////////////////////////

typedef enum {
  NOP,
  READ,
  WRITE
} ubus_read_write_enum;

////////////////////////////////////////////////////////////////////////////////
// CLASS: peripheral_uvm_transfer
////////////////////////////////////////////////////////////////////////////////

class peripheral_uvm_transfer extends uvm_sequence_item;

  rand bit                  [31:0] addr;
  rand ubus_read_write_enum        read_write;
  rand int unsigned                size;
  rand bit                  [31:0] data          [];
  rand bit                  [ 3:0] wait_state    [];
  rand int unsigned                error_pos;
  rand int unsigned                transmit_delay    = 0;
  string                           master            = "";
  string                           slave             = "";

  constraint c_read_write {read_write inside {READ, WRITE};}
  constraint c_size {size inside {1, 2, 4, 8};}
  constraint c_data_wait_size {
    data.size() == size;
    wait_state.size() == size;
  }
  constraint c_transmit_delay {transmit_delay <= 10;}

  `uvm_object_utils_begin(peripheral_uvm_transfer)
    `uvm_field_int(addr, UVM_DEFAULT)
    `uvm_field_enum(ubus_read_write_enum, read_write, UVM_DEFAULT)
    `uvm_field_int(size, UVM_DEFAULT)
    `uvm_field_array_int(data, UVM_DEFAULT)
    `uvm_field_array_int(wait_state, UVM_DEFAULT)
    `uvm_field_int(error_pos, UVM_DEFAULT)
    `uvm_field_int(transmit_delay, UVM_DEFAULT)
    `uvm_field_string(master, UVM_DEFAULT | UVM_NOCOMPARE)
    `uvm_field_string(slave, UVM_DEFAULT | UVM_NOCOMPARE)
  `uvm_object_utils_end

  // new - constructor
  function new(string name = "peripheral_uvm_transfer_inst");
    super.new(name);
  endfunction : new

endclass : peripheral_uvm_transfer
