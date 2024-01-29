////////////////////////////////////////////////////////////////////////////////
//
// CLASS: peripheral_uvm_environment
//
////////////////////////////////////////////////////////////////////////////////

class peripheral_uvm_environment extends uvm_env;

  // Virtual Interface variable
  protected virtual interface peripheral_uvm_if vif;

  // Control properties
  protected bit has_bus_monitor = 1;
  protected int num_masters = 0;
  protected int num_slaves = 0;

  // The following two bits are used to control whether checks and coverage are
  // done both in the bus monitor class and the interface.
  bit intf_checks_enable = 1; 
  bit intf_coverage_enable = 1;

  // Components of the environment
  peripheral_uvm_bus_monitor bus_monitor;
  peripheral_uvm_master_agent masters[];
  peripheral_uvm_slave_agent slaves[];

  // Provide implementations of virtual methods such as get_type_name and create
  `uvm_component_utils_begin(peripheral_uvm_environment)
    `uvm_field_int(has_bus_monitor, UVM_DEFAULT)
    `uvm_field_int(num_masters, UVM_DEFAULT)
    `uvm_field_int(num_slaves, UVM_DEFAULT)
    `uvm_field_int(intf_checks_enable, UVM_DEFAULT)
    `uvm_field_int(intf_coverage_enable, UVM_DEFAULT)
  `uvm_component_utils_end

  // new - constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

  // build_phase
  function void build_phase(uvm_phase phase);
    string inst_name;
    // set_phase_domain("uvm");
    super.build_phase(phase);
     if(!uvm_config_db#(virtual peripheral_uvm_if)::get(this, "", "vif", vif)) begin
       `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
     end
     
    if(has_bus_monitor == 1) begin
      bus_monitor = peripheral_uvm_bus_monitor::type_id::create("bus_monitor", this);
    end
    
    void'(uvm_config_db#(int)::get(this, "", "num_masters", num_masters));
   
    masters = new[num_masters];
    for(int i = 0; i < num_masters; i++) begin
      $sformat(inst_name, "masters[%0d]", i);
      masters[i] = peripheral_uvm_master_agent::type_id::create(inst_name, this);
      void'(uvm_config_db#(int)::set(this,{inst_name,".monitor"}, "master_id", i));
      void'(uvm_config_db#(int)::set(this,{inst_name,".driver"}, "master_id", i));
    end

    void'(uvm_config_db#(int)::get(this, "", "num_slaves", num_slaves));
    
    slaves = new[num_slaves];
    for(int i = 0; i < num_slaves; i++) begin
      $sformat(inst_name, "slaves[%0d]", i);
      slaves[i] = peripheral_uvm_slave_agent::type_id::create(inst_name, this);
    end
  endfunction : build_phase

  // set_slave_address_map
  function void set_slave_address_map(string slave_name, 
    int min_addr, int max_addr);
    peripheral_uvm_slave_monitor tmp_slave_monitor;
    if( bus_monitor != null ) begin
      // Set slave address map for bus monitor
      bus_monitor.set_slave_configs(slave_name, min_addr, max_addr);
    end
    // Set slave address map for slave monitor
    $cast(tmp_slave_monitor, lookup({slave_name, ".monitor"}));
    tmp_slave_monitor.set_addr_range(min_addr, max_addr);
  endfunction : set_slave_address_map

  // update_vif_enables
  protected task update_vif_enables();
    forever begin
      @(intf_checks_enable || intf_coverage_enable);
      vif.has_checks <= intf_checks_enable;
      vif.has_coverage <= intf_coverage_enable;
    end
  endtask : update_vif_enables

  // implement run task
  task run_phase(uvm_phase phase);
    fork
      update_vif_enables();
    join
  endtask : run_phase

endclass : peripheral_uvm_environment
