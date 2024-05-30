# Using Verification Components

## Creating a Top-Level Environment

A top-level environment encapsulates all the components needed for verification. This environment includes agents, scoreboards, monitors, and other verification components. It provides a cohesive structure to manage the interactions between these components.

```systemverilog
class top_env extends uvm_env;
  my_agent agent;
  my_scoreboard scoreboard;

  `uvm_component_utils(top_env)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = my_agent::type_id::create("agent", this);
    scoreboard = my_scoreboard::type_id::create("scoreboard", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agent.mon.ap.connect(scoreboard.analysis_export);
  endfunction
endclass
```

## Instantiating Verification Components

Verification components such as drivers, sequencers, monitors, and agents are instantiated within the top-level environment. These components are configured and connected during the build and connect phases.

## Creating Test Classes

Test classes define specific verification scenarios. Each test class inherits from `uvm_test` and configures the environment, sequences, and other parameters needed for the test.

```systemverilog
class base_test extends uvm_test;
  top_env env;

  `uvm_component_utils(base_test)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = top_env::type_id::create("env", this);
  endfunction

  virtual function void run_phase(uvm_phase phase);
    phase.raise_objection(this);
    // Run the test sequences here
    phase.drop_objection(this);
  endfunction
endclass
```

## Verification Component Configuration

### Verification Component Configurable Parameters

Configurable parameters allow for dynamic control of verification components. These parameters can be set through the UVM configuration database.

### Verification Component Configuration Mechanism

Configuration is typically done using `uvm_config_db`. Parameters can be set and retrieved using this database, allowing for flexible and reusable configurations.

### Choosing between `uvm_resource_db` and `uvm_config_db`

- **uvm_resource_db**: Suitable for global settings that are rarely changed.
- **uvm_config_db**: Preferred for flexible, dynamic configurations that may vary between tests.

### Using a Configuration Class

A configuration class encapsulates all the parameters needed for a component. This class is then used to configure the component during the build phase.

```systemverilog
class my_config extends uvm_object;
  bit enable_error_injection;
  int max_transactions;

  `uvm_object_utils(my_config)

  function new(string name = "my_config");
    super.new(name);
  endfunction
endclass

class my_agent extends uvm_agent;
  my_config cfg;

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(my_config)::get(this, "", "my_config", cfg))
      `uvm_fatal("NOCFG", "No configuration found")
  endfunction
endclass
```

## Creating and Selecting a User-Defined Test

### Creating the Base Test

The base test class sets up the environment and provides common functionality for derived test classes.

### Creating Tests from a Test-Family Base Class

Derived test classes extend the base test and implement specific scenarios.

```systemverilog
class my_test extends base_test;
  `uvm_component_utils(my_test)

  function void run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    // Specific test sequence
    phase.drop_objection(this);
  endfunction
endclass
```

### Test Selection

Tests are selected at runtime, typically through command-line arguments or a test management framework.

## Creating Meaningful Tests

### Constraining Data Items

Constraining data items ensures that generated transactions meet the required conditions.

### Data Item Definitions

Data items are defined using `uvm_sequence_item` and constrained using SystemVerilog constraints.

### Creating a Test-Specific Frame

Test-specific frames define the context and conditions for the test, ensuring meaningful verification scenarios.

## Virtual Sequences

### Creating a Virtual Sequencer

A virtual sequencer coordinates multiple sequencers, allowing for complex, multi-interface tests.

```systemverilog
class my_virtual_sequencer extends uvm_sequencer;
  my_sequencer seq1;
  my_sequencer seq2;

  `uvm_component_utils(my_virtual_sequencer)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass
```

### Creating a Virtual Sequence

A virtual sequence orchestrates other sequences, providing a higher level of control over the verification process.

```systemverilog
class my_virtual_sequence extends uvm_sequence;
  `uvm_object_utils(my_virtual_sequence)

  function new(string name = "my_virtual_sequence");
    super.new(name);
  endfunction

  task body();
    my_sequence seq1;
    my_sequence seq2;
    // Start sequences on different sequencers
    fork
      seq1.start(p_sequencer.seq1);
      seq2.start(p_sequencer.seq2);
    join
  endtask
endclass
```

### Controlling Other Sequencers

The virtual sequencer controls other sequencers by starting and managing their sequences.

### Connecting a Virtual Sequencer to Subsequencers

Virtual sequencers are connected to subsequencers during the build phase.

## Checking for DUT Correctness

Correctness checks ensure the DUT behaves as expected. These checks are implemented in scoreboards and monitors.

## Scoreboards

### Creating the Scoreboard

The scoreboard collects and compares results, ensuring the DUT's output matches expected values.

```systemverilog
class my_scoreboard extends uvm_scoreboard;
  uvm_analysis_export#(base_transaction) analysis_export;

  `uvm_component_utils(my_scoreboard)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    analysis_export = new("analysis_export", this);
  endfunction

  virtual function void write(base_transaction t);
    // Compare the transaction with expected values
  endfunction
endclass
```

### Adding Exports to `uvm_scoreboard`

Exports are added to connect the scoreboard to other components.

### Requirements of the TLM Implementation

The TLM implementation ensures smooth communication between components, allowing for data exchange and synchronization.

### Defining the Action Taken

The action taken by the scoreboard involves comparing actual results with expected values and reporting discrepancies.

### Adding the Scoreboard to the Environment

The scoreboard is instantiated and connected in the environment.

## Implementing a Coverage Model

### Selecting a Coverage Method

Coverage methods can be functional or code-based. Functional coverage captures specific conditions and scenarios, while code coverage measures exercised code paths.

### Implementing a Functional Coverage Model

Functional coverage models are implemented using SystemVerilog covergroups and coverpoints.

```systemverilog
class my_coverage extends uvm_subscriber#(base_transaction);
  covergroup cg;
    coverpoint trans.address;
    coverpoint trans.data;
  endgroup

  `uvm_component_utils(my_coverage)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    cg = new();
  endfunction

  virtual function void write(base_transaction t);
    cg.sample();
  endfunction
endclass
```

### Enabling and Disabling Coverage

Coverage can be enabled or disabled using configuration settings, allowing for targeted analysis.

By following these steps, you can effectively use verification components to create robust and reusable verification environments. These practices ensure comprehensive verification of the DUT, leveraging the modularity and flexibility provided by UVM.
