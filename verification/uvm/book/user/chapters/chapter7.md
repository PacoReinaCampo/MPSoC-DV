# UBus Verification Component Example

## UBus Example

The UBus example demonstrates a complete UVM testbench for verifying a simple bus protocol called UBus. This example showcases the architecture, components, and interactions necessary for verifying a bus protocol.

## UBus Example Architecture

The UBus example architecture consists of several components that work together to verify the UBus protocol. These components include:

- UBus Top Module
- Test
- Testbench Environment
- UBus Environment
- UBus Master Agent
- UBus Master Sequencer
- UBus Driver
- UBus Agent Monitor
- UBus Bus Monitor
- UBus Interface

## UBus Top Module

The top module instantiates the DUT and connects it to the UVM testbench components. It provides the necessary signals and interfaces for the UBus protocol.

```systemverilog
module ubus_top;
  // Clock and reset signals
  reg clk;
  reg reset;

  // UBus signals
  wire [31:0] addr;
  wire [31:0] data;
  wire [3:0]  control;
  wire        ready;
  wire        valid;

  // Instantiate DUT
  ubus dut (
    .clk(clk),
    .reset(reset),
    .addr(addr),
    .data(data),
    .control(control),
    .ready(ready),
    .valid(valid)
  );

  // Instantiate UVM testbench
  initial begin
    run_test();
  end
endmodule
```

## The Test

A UVM test sets up the environment and specifies the sequences to be executed. It configures the UBus environment and starts the verification process.

```systemverilog
class ubus_test extends uvm_test;
  `uvm_component_utils(ubus_test)

  ubus_env env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = ubus_env::type_id::create("env", this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    // Start the sequence
    ubus_master_seq seq;
    seq = ubus_master_seq::type_id::create("seq");
    seq.start(env.masters[0].sequencer);

    phase.drop_objection(this);
  endtask
endclass
```

## Testbench Environment

The testbench environment instantiates and connects all the necessary components for verifying the UBus protocol. It includes agents, monitors, and scoreboards.

```systemverilog
class ubus_env extends uvm_env;
  `uvm_component_utils(ubus_env)

  ubus_master_agent masters[NUM_MASTERS];
  ubus_monitor      monitor;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    for (int i = 0; i < NUM_MASTERS; i++) begin
      masters[i] = ubus_master_agent::type_id::create($sformatf("master%d", i), this);
    end
    monitor = ubus_monitor::type_id::create("monitor", this);
  endfunction
endclass
```

## UBus Environment

The UBus environment is a specialized environment for the UBus protocol, integrating specific agents and monitors required for UBus verification.

```systemverilog
class ubus_env extends uvm_env;
  `uvm_component_utils(ubus_env)

  ubus_master_agent master_agent;
  ubus_monitor      bus_monitor;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    master_agent = ubus_master_agent::type_id::create("master_agent", this);
    bus_monitor = ubus_monitor::type_id::create("bus_monitor", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    master_agent.monitor.ap.connect(bus_monitor.analysis_export);
  endfunction
endclass
```

## UBus Master Agent

The UBus master agent contains the sequencer, driver, and monitor components necessary for generating and monitoring bus transactions from the master perspective.

```systemverilog
class ubus_master_agent extends uvm_agent;
  `uvm_component_utils(ubus_master_agent)

  ubus_master_sequencer sequencer;
  ubus_driver           driver;
  ubus_monitor          monitor;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sequencer = ubus_master_sequencer::type_id::create("sequencer", this);
    driver = ubus_driver::type_id::create("driver", this);
    monitor = ubus_monitor::type_id::create("monitor", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    driver.seq_item_port.connect(sequencer.seq_item_export);
  endfunction
endclass
```

## UBus Master Sequencer

The UBus master sequencer is responsible for managing sequences and providing transactions to the driver.

```systemverilog
class ubus_master_sequencer extends uvm_sequencer #(ubus_transaction);
  `uvm_component_utils(ubus_master_sequencer)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass
```

## UBus Driver

The UBus driver converts sequence items into pin-level activity on the bus interface.

```systemverilog
class ubus_driver extends uvm_driver #(ubus_transaction);
  `uvm_component_utils(ubus_driver)

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Driver-specific build logic
  endfunction

  virtual task run_phase(uvm_phase phase);
    forever begin
      ubus_transaction tr;
      seq_item_port.get_next_item(tr);
      // Drive the transaction on the bus
      seq_item_port.item_done();
    end
  endtask
endclass
```

## UBus Agent Monitor

The UBus agent monitor observes bus transactions and converts them into analysis transactions for further processing.

```systemverilog
class ubus_monitor extends uvm_monitor;
  `uvm_component_utils(ubus_monitor)

  uvm_analysis_port #(ubus_transaction) ap;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    // Monitor logic
  endtask
endclass
```

## UBus Bus Monitor

### Collecting Transfers from the Bus

The bus monitor collects transactions from the bus and converts them into analysis transactions.

### Number of Transfers

The monitor tracks the number of transfers and other relevant statistics.

### Notifiers Emitted by the UBus Bus Monitor

The monitor can emit notifications for specific events, such as errors or protocol violations.

### Checks and Coverage

The monitor performs protocol checks and collects coverage information, ensuring comprehensive verification of the bus protocol.

## UBus Interface

The UBus interface defines the signals and structure of the UBus protocol.

```systemverilog
interface ubus_if(input bit clk);
  logic [31:0] addr;
  logic [31:0] data;
  logic [3:0]  control;
  logic        ready;
  logic        valid;

  // Clocking block for synchronous signals
  clocking cb @(posedge clk);
    output addr;
    output data;
    output control;
    input  ready;
    output valid;
  endclocking
endinterface
```

This example provides a comprehensive overview of how to set up and utilize a UVM testbench for the UBus protocol, highlighting the key components and their interactions.
