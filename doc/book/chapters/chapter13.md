# HARDWARE VERIFICATION

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

$$Verification(UVM): Design(HDL)=Model(HDL)?$$

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

$$FormalVerification(UVM): DESIGN(HDL)=Requirements(PSL)?$$

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

![Hardware Verification](assets/chapter13/hardware-verification.svg)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## OVERVIEW

The Universal Verification Methodology (UVM) is a standardized methodology for verifying integrated circuits, particularly in the field of System-on-Chip (SoC) design. UVM is built on SystemVerilog and provides a robust framework for creating reusable and modular verification environments. Below is a detailed explanation of UVM and its components.

UVM aims to provide a structured and reusable approach to verification, facilitating the development of testbenches that can be easily maintained and adapted to various verification scenarios. Its key features include the ability to create complex verification environments, stimulate designs under test (DUT) with various scenarios, and check the DUT's behavior against expected results.

### Typical UVM Testbench Architecture

The typical UVM testbench architecture is composed of several key components, each with a specific role in the verification process. The hierarchy of a UVM testbench is designed to be modular, allowing each component to be developed, tested, and reused independently.

![UVM-Verilog Diagram Overview](assets/chapter13/uvm-testbench.svg)

#### UVM Testbench

...

The UVM testbench is the top-level module in a UVM environment. It instantiates all other components and coordinates the overall verification process. The testbench is responsible for setting up the DUT, initializing the UVM environment, and running the tests.

#### UVM Test

...

The UVM test is a specific scenario or set of scenarios used to verify the DUT. Each UVM test inherits from the `uvm_test` base class and typically configures the environment and sequences to be used. It may override configuration settings, instantiate specific sequences, and control the execution flow.

#### UVM Environment

...

The UVM environment is a container for the various agents, scoreboards, and other components needed for verification. It typically includes one or more agents, a scoreboard for result checking, and any necessary interfaces. The environment class inherits from `uvm_env`.

#### UVM Scoreboard

...

The UVM scoreboard is responsible for checking the DUT's output against expected results. It collects data from various monitors and compares it to expected values, flagging any discrepancies. The scoreboard is crucial for functional verification, ensuring that the DUT behaves as intended.

#### UVM Agent

...

A UVM agent is a modular component that encapsulates the functionality required to stimulate and monitor a specific interface of the DUT. It typically includes a sequencer, driver, and monitor. An agent can be active, generating stimuli and driving them onto the interface, or passive, simply monitoring the interface.

#### UVM Sequencer

...

The UVM sequencer controls the flow of sequences to the driver. It manages the order and timing of transaction generation, ensuring that the correct sequences are sent to the DUT. The sequencer class inherits from `uvm_sequencer`.

#### UVM Sequence

...

A UVM sequence is a series of transactions or operations to be performed on the DUT. Sequences are defined by inheriting from the `uvm_sequence` base class and can be composed to create complex stimulus scenarios. Sequences are executed by the sequencer and can be randomized to improve test coverage.

#### UVM Driver

...

The UVM driver receives sequences from the sequencer and drives them onto the DUT's interface. It converts high-level transactions into pin-level activity, ensuring that the DUT receives the correct stimuli. The driver class inherits from `uvm_driver`.

#### UVM Monitor

...

The UVM monitor observes the DUT's interface, capturing data for analysis by the scoreboard and other components. It is typically passive, meaning it does not influence the DUT's behavior. The monitor class inherits from `uvm_monitor`.

### UVM Class Library

The UVM class library provides a comprehensive set of base classes and utilities for building verification environments. It includes classes for components (such as the test, environment, agent, sequencer, sequence, driver, and monitor), as well as utilities for configuration, reporting, messaging, and more.

Key classes and utilities in the UVM class library include:

- **uvm_component**: Base class for all UVM components.
- **uvm_test**: Base class for tests.
- **uvm_env**: Base class for environments.
- **uvm_agent**: Base class for agents.
- **uvm_sequencer**: Base class for sequencers.
- **uvm_sequence**: Base class for sequences.
- **uvm_driver**: Base class for drivers.
- **uvm_monitor**: Base class for monitors.
- **uvm_config_db**: Utility for configuration and parameterization.
- **uvm_report_server**: Utility for reporting and messaging.
- **uvm_factory**: Utility for component creation and management.

These classes and utilities provide a standardized way to construct verification environments, ensuring consistency and reusability across different projects and teams.

## TRANSACTION-LEVEL MODELING (TLM)

Transaction-Level Modeling (TLM) is a high-level approach to modeling the communication between components in a system, focusing on the transactions rather than the lower-level signal details. TLM abstracts the details of the communication, making it easier to develop, understand, and simulate complex systems.

### Overview

TLM is widely used in system-level design and verification, providing a higher abstraction level than traditional register-transfer level (RTL) modeling. It allows for faster simulations and easier debugging, as well as better reuse of models. TLM is particularly beneficial in early stages of design for architectural exploration and software development.

### TLM, TLM-1, and TLM-2.0

TLM has evolved over time, leading to different versions with varying levels of abstraction and capabilities:

- **TLM**: The initial concept of transaction-level modeling, focusing on abstracting communication into transactions.
- **TLM-1**: The first standard version, providing basic mechanisms for transaction-level communication, focusing on the communication itself rather than timing accuracy.
- **TLM-2.0**: An advanced version that introduces standardized interfaces and protocols, supporting more detailed timing and communication mechanisms. TLM-2.0 is more comprehensive and includes features for interoperability and more accurate modeling of timing and synchronization.

### TLM-1 Implementation

#### Basics

...

TLM-1 provides the foundation for transaction-level modeling. It abstracts communication into transactions, which are data structures representing read or write operations. Components communicate by passing these transactions rather than manipulating signals directly.

#### Encapsulation and Hierarchy

...

In TLM-1, components are typically encapsulated in a hierarchical manner. This encapsulation helps manage complexity and promotes modularity. Each component can be a master, slave, or intermediary, initiating or responding to transactions.

#### Analysis Communication

...

Analysis communication in TLM-1 involves observing and analyzing transactions as they pass through the system. Monitors or analysis components can be attached to observe transactions, enabling the collection of statistics, performance analysis, and functional verification without affecting the communication itself.

### TLM-2.0 Implementation

TLM-2.0 builds on the concepts introduced in TLM-1, adding more detailed and standardized features for improved modeling accuracy and interoperability.

#### Generic Payload

...

The generic payload in TLM-2.0 is a standardized transaction data structure that includes fields for address, data, command (read/write), response status, and other attributes. This standardization simplifies communication and promotes reuse across different models and platforms.

#### Core Interfaces and Ports

...

TLM-2.0 defines core interfaces and ports for communication:

- **tlm_fw_transport_if**: Forward transport interface for initiating transactions.
- **tlm_bw_transport_if**: Backward transport interface for receiving responses.
- **tlm_initiator_socket**: Socket used by initiators to send transactions.
- **tlm_target_socket**: Socket used by targets to receive transactions.

#### Blocking Transport

...

Blocking transport in TLM-2.0 involves transactions that complete before control is returned to the caller. This is useful for simple and immediate communication scenarios. The `b_transport` method is used for blocking transport, ensuring that a transaction is fully processed before moving on.

#### Nonblocking Transport

...

Nonblocking transport allows transactions to be initiated without waiting for their completion, enabling more complex and asynchronous communication. The `nb_transport_fw` and `nb_transport_bw` methods are used for forward and backward nonblocking transport, respectively.

#### Sockets

...

Sockets in TLM-2.0 facilitate the connection between initiators and targets. They encapsulate the interfaces and provide a standardized way to connect components. Sockets support both blocking and nonblocking transport methods, promoting flexibility and ease of use.

#### Time

...

TLM-2.0 includes mechanisms for modeling timing and delays, allowing for more accurate simulation of system behavior. Time annotations can be added to transactions to represent communication delays, processing times, and synchronization points.

#### Use Models

...

TLM-2.0 supports various use models, including:

- **Loosely-timed (LT) models**: Focus on functionality with approximate timing. Suitable for early software development and high-level architectural exploration.
- **Approximately-timed (AT) models**: Provide more detailed timing information, suitable for performance analysis and detailed design exploration.
- **Timed models**: Capture precise timing details for accurate hardware simulation and verification.

In summary, TLM-2.0 provides a rich set of features and standardized mechanisms for high-level system modeling, supporting a range of use cases from early design exploration to detailed performance analysis and verification.

## DEVELOPING REUSABLE VERIFICATION COMPONENTS

Creating reusable verification components is crucial for an efficient and effective verification process. This involves building modular, flexible, and highly configurable components that can be reused across different projects and verification environments.

### Modeling Data Items for Generation

#### Inheritance and Constraint Layering

...

Modeling data items involves defining the structure and properties of the transactions that will be used in verification. In UVM, data items are typically modeled as classes that extend from `uvm_sequence_item`. Inheritance allows for creating base transaction classes with common fields and methods, which can then be extended to create specific transaction types.

Constraint layering is used to apply constraints to randomize the fields of the data items. Constraints can be layered to apply different sets of constraints based on the context or scenario.

```systemverilog
class base_transaction extends uvm_sequence_item;
  rand bit [7:0] address;
  rand bit [31:0] data;

  `uvm_object_utils(base_transaction)

  function new(string name = "base_transaction");
    super.new(name);
  endfunction

  // Define constraints here
  constraint valid_address { address < 128; }
endclass

class specific_transaction extends base_transaction;
  rand bit [3:0] control_flags;

  `uvm_object_utils(specific_transaction)

  function new(string name = "specific_transaction");
    super.new(name);
  endfunction

  // Additional constraints for specific transaction
  constraint control_constraint { control_flags != 4'b0000; }
endclass
```

#### Defining Control Fields ("Knobs")

...

Control fields, or "knobs", are used to adjust the behavior of the verification components dynamically. These fields can be configured through the UVM configuration database, enabling flexibility in controlling the verification environment without modifying the code.

```systemverilog
class transaction_knobs extends uvm_object;
  bit enable_error_injection;
  bit [15:0] max_transactions;

  `uvm_object_utils(transaction_knobs)

  function new(string name = "transaction_knobs");
    super.new(name);
  endfunction
endclass
```

### Transaction-Level Components

Transaction-level components are responsible for generating, processing, and monitoring transactions. These components include drivers, sequencers, and monitors.

### Creating the Driver

The driver is responsible for driving the transactions onto the DUT's interface. It extends from `uvm_driver` and implements the `run_phase` method to fetch transactions from the sequencer and drive them onto the interface.

```systemverilog
class my_driver extends uvm_driver<base_transaction>;
  virtual dut_if dut_interface;

  `uvm_component_utils(my_driver)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual dut_if)::get(this, "", "dut_interface", dut_interface))
      `uvm_fatal("NOVIF", "Virtual interface not found")
  endfunction

  task run_phase(uvm_phase phase);
    base_transaction trans;
    forever begin
      seq_item_port.get_next_item(trans);
      // Drive transaction onto DUT
      dut_interface.addr = trans.address;
      dut_interface.data = trans.data;
      seq_item_port.item_done();
    end
  endtask
endclass
```

### Creating the Sequencer

The sequencer manages the flow of transactions. It generates or selects transactions to be sent to the driver.

```systemverilog
class my_sequencer extends uvm_sequencer<base_transaction>;
  `uvm_component_utils(my_sequencer)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass
```

### Connecting the Driver and Sequencer

#### Basic Sequencer and Driver Interaction

...

The driver and sequencer interact through TLM ports and exports. The sequencer generates transactions, which the driver then processes.

#### Querying for the Randomized Item

...

The sequencer generates randomized items, which the driver fetches and processes.

#### Fetching Consecutive Randomized Items

...

The driver fetches consecutive transactions from the sequencer, ensuring continuous operation.

#### Sending Processed Data back to the Sequencer

...

Processed data can be sent back to the sequencer if needed, typically using TLM analysis ports.

#### Using TLM-Based Drivers

...

TLM-based drivers use TLM interfaces for more abstract communication.

### Creating the Monitor

The monitor observes the DUT's interface and collects data for analysis. It extends from `uvm_monitor` and typically implements the `run_phase` method to capture transactions from the DUT.

```systemverilog
class my_monitor extends uvm_monitor;
  virtual dut_if dut_interface;
  uvm_analysis_port#(base_transaction) ap;

  `uvm_component_utils(my_monitor)

  function new(string name, uvm_component parent);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual dut_if)::get(this, "", "dut_interface", dut_interface))
      `uvm_fatal("NOVIF", "Virtual interface not found")
  endfunction

  task run_phase(uvm_phase phase);
    base_transaction trans;
    forever begin
      // Capture transaction from DUT
      trans = base_transaction::type_id::create("trans");
      trans.address = dut_interface.addr;
      trans.data = dut_interface.data;
      ap.write(trans);
    end
  endtask
endclass
```

### Instantiating Components

Components are instantiated in the testbench, and their connections are configured using the UVM configuration database.

### Creating the Agent

#### Operating Modes

...

An agent can operate in active or passive mode. In active mode, it generates and drives transactions. In passive mode, it only monitors transactions.

#### Connecting Components

...

The agent instantiates and connects the driver, sequencer, and monitor.

```systemverilog
class my_agent extends uvm_agent;
  my_driver drv;
  my_sequencer seqr;
  my_monitor mon;

  `uvm_component_utils(my_agent)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = my_driver::type_id::create("drv", this);
    seqr = my_sequencer::type_id::create("seqr", this);
    mon = my_monitor::type_id::create("mon", this);
  endfunction

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
endclass
```

### Creating the Environment

#### Environment Class

...

The environment class encapsulates agents and other components, creating a complete verification environment.

```systemverilog
class my_env extends uvm_env;
  my_agent agent;

  `uvm_component_utils(my_env)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = my_agent::type_id::create("agent", this);
  endfunction
endclass
```

#### Invoking build_phase

...

The `build_phase` method is used to instantiate and configure components.

### Enabling Scenario Creation

#### Declaring User-Defined Sequences

...

User-defined sequences extend from `uvm_sequence` and define specific transaction scenarios.

#### Sending Subsequences and Sequence Items

...

Subsequences and sequence items can be sent to the sequencer to create complex scenarios.

#### Starting a Sequence on a Sequencer

...

Sequences are started on the sequencer using the `start` method.

#### Overriding Sequence Items and Sequences

...

Sequence items and sequences can be overridden to customize the scenarios.

### Managing End of Test

Managing the end of the test involves detecting when all transactions are complete and stopping the simulation.

### Implementing Checks and Coverage

#### Implementing Checks and Coverage in Classes

...

Checks and coverage can be implemented in verification components to ensure the DUT behaves as expected and to measure verification progress.

#### Implementing Checks and Coverage in Interfaces

...

Interfaces can also include checks and coverage points to capture detailed information about the DUT's behavior.

#### Controlling Checks and Coverage

...

Checks and coverage can be controlled through configuration settings, allowing for flexible and targeted verification efforts.

By following these guidelines, you can develop reusable and robust verification components that can be easily integrated and adapted to different verification environments, improving efficiency and effectiveness in the verification process.

## USING VERIFICATION COMPONENTS

### Creating a Top-Level Environment

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

### Instantiating Verification Components

Verification components such as drivers, sequencers, monitors, and agents are instantiated within the top-level environment. These components are configured and connected during the build and connect phases.

### Creating Test Classes

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

### Verification Component Configuration

#### Verification Component Configurable Parameters

...

Configurable parameters allow for dynamic control of verification components. These parameters can be set through the UVM configuration database.

#### Verification Component Configuration Mechanism

...

Configuration is typically done using `uvm_config_db`. Parameters can be set and retrieved using this database, allowing for flexible and reusable configurations.

#### Choosing between `uvm_resource_db` and `uvm_config_db`

...

- **uvm_resource_db**: Suitable for global settings that are rarely changed.
- **uvm_config_db**: Preferred for flexible, dynamic configurations that may vary between tests.

#### Using a Configuration Class

...

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

### Creating and Selecting a User-Defined Test

#### Creating the Base Test

...

The base test class sets up the environment and provides common functionality for derived test classes.

#### Creating Tests from a Test-Family Base Class

...

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

#### Test Selection

...

Tests are selected at runtime, typically through command-line arguments or a test management framework.

### Creating Meaningful Tests

#### Constraining Data Items

...

Constraining data items ensures that generated transactions meet the required conditions.

#### Data Item Definitions

...

Data items are defined using `uvm_sequence_item` and constrained using SystemVerilog constraints.

#### Creating a Test-Specific Frame

...

Test-specific frames define the context and conditions for the test, ensuring meaningful verification scenarios.

### Virtual Sequences

#### Creating a Virtual Sequencer

...

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

#### Creating a Virtual Sequence

...

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

#### Controlling Other Sequencers

...

The virtual sequencer controls other sequencers by starting and managing their sequences.

#### Connecting a Virtual Sequencer to Subsequencers

...

Virtual sequencers are connected to subsequencers during the build phase.

### Checking for DUT Correctness

Correctness checks ensure the DUT behaves as expected. These checks are implemented in scoreboards and monitors.

### Scoreboards

#### Creating the Scoreboard

...

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

#### Adding Exports to `uvm_scoreboard`

...

Exports are added to connect the scoreboard to other components.

#### Requirements of the TLM Implementation

...

The TLM implementation ensures smooth communication between components, allowing for data exchange and synchronization.

#### Defining the Action Taken

...

The action taken by the scoreboard involves comparing actual results with expected values and reporting discrepancies.

#### Adding the Scoreboard to the Environment

...

The scoreboard is instantiated and connected in the environment.

### IMPLEMENTING A COVERAGE MODEL

#### Selecting a Coverage Method

...

Coverage methods can be functional or code-based. Functional coverage captures specific conditions and scenarios, while code coverage measures exercised code paths.

#### Implementing a Functional Coverage Model

...

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

#### Enabling and Disabling Coverage

...

Coverage can be enabled or disabled using configuration settings, allowing for targeted analysis.

By following these steps, you can effectively use verification components to create robust and reusable verification environments. These practices ensure comprehensive verification of the DUT, leveraging the modularity and flexibility provided by UVM.

## USING THE REGISTER LAYER CLASSES

The Register Layer in UVM provides a robust framework for modeling and verifying the configuration and state registers of a design. It offers a structured way to define, access, and verify the registers and memories in a device under test (DUT).

### Overview

The UVM register layer simplifies the modeling of registers and memories, offering mechanisms for defining the structure, accessing the values, and verifying the correctness of the data. It supports both front-door (via bus transactions) and back-door (direct access) mechanisms for register operations.

### Usage Model

#### Mirroring

...

Mirroring refers to keeping a software model (the register model) synchronized with the actual hardware state of the DUT. This synchronization can be done using front-door accesses (through the DUT's bus interface) or back-door accesses (directly accessing the DUT's internal state).

#### Memories are not Mirrored

...

Unlike registers, memories are typically not mirrored. This is because memory contents can be large and constantly changing, making it impractical to maintain an exact software copy. Instead, specific memory locations can be accessed and verified as needed.

### Access API

The UVM register layer provides a rich API for accessing and manipulating register and memory contents.

#### read / write

...

These methods are used to perform front-door access to the registers through the bus interface.

```systemverilog
reg_model.REG1.write(status, value);
reg_model.REG1.read(status, value);
```

#### peek / poke

...

These methods are used for back-door access, directly accessing the register value without going through the bus interface.

```systemverilog
reg_model.REG1.peek(value);
reg_model.REG1.poke(value);
```

#### get / set

...

These methods are used to get or set the register field values in the register model without actually accessing the hardware.

```systemverilog
reg_model.REG1.FIELD1.set(value);
value = reg_model.REG1.FIELD1.get();
```

#### randomize

...

This method randomizes the field values of a register according to their constraints.

```systemverilog
reg_model.REG1.randomize();
```

#### update

...

This method writes the current values from the register model to the hardware using front-door access.

```systemverilog
reg_model.REG1.update(status);
```

#### mirror

...

This method reads the current values from the hardware into the register model, ensuring synchronization.

```systemverilog
reg_model.REG1.mirror(status);
```

#### Concurrent Accesses

...

The UVM register layer handles concurrent accesses by serializing them, ensuring data integrity.

### Coverage Models

#### Predefined Coverage Identifiers

...

The register layer provides predefined coverage identifiers for register and field accesses, allowing users to collect coverage data for verification purposes.

#### Controlling Coverage Model Construction and Sampling

...

Coverage model construction and sampling can be controlled through UVM configuration settings, enabling users to focus on specific areas of interest.

### Constructing a Register Model

#### Field Types

...

Fields are the smallest unit in a register model, representing individual bits or groups of bits with specific attributes like access type (read/write).

#### Register Types

...

Registers are collections of fields, representing a single register in the hardware. They can have attributes such as address, access type, and reset value.

#### Register File Types

...

Register files are collections of registers grouped together for organizational purposes.

#### Memory Types

...

Memories are large storage elements, modeled separately from registers due to their size and access patterns.

#### Block Types

...

Blocks are top-level containers for register files, registers, and memories, representing an entire addressable block of the DUT.

#### Packaging a Register Model

...

A register model is packaged by defining all its components (fields, registers, register files, memories, and blocks) and linking them together.

#### Maximum Data Size

...

The maximum data size for register fields and memories is determined by the specific implementation and limitations of the hardware and software tools used.

### Back-door Access

#### Back-door read/write vs. peek/poke

...

Back-door read/write methods use hierarchical HDL paths to directly access the hardware, while peek/poke methods access the register model.

#### Hierarchical HDL Paths

...

Back-door access relies on hierarchical HDL paths to directly reference and manipulate hardware states.

#### VPI-based Back-door Access

...

VPI (Verilog Procedural Interface) provides a standard way to implement back-door access in Verilog-based designs.

#### User-defined Back-door Access

...

Users can define custom back-door access methods to suit specific needs or hardware configurations.

#### Back-door Access for Protected Memories

...

Protected memories require special handling to ensure security and data integrity during back-door accesses.

#### Active Monitoring

...

Active monitoring involves continuously checking the DUT's state to detect and report any discrepancies between the register model and the actual hardware.

### Special Registers

#### Pre-defined Special Registers

...

Certain registers have predefined roles and behaviors, such as status registers or control registers.

#### Unmapped Registers and Memories

...

Unmapped registers and memories are those that do not have a direct correspondence in the hardware but are included in the model for completeness or simulation purposes.

#### Aliased Registers

...

Aliased registers share the same address space but serve different purposes based on context or mode of operation.

#### Unimplemented Registers

...

Unimplemented registers are placeholders for future expansion or optional features not currently present in the hardware.

#### RO and WO Registers Sharing the Same Address

...

Read-only (RO) and write-only (WO) registers can share the same address if they represent different aspects of the same hardware location.

### Integrating a Register Model in a Verification Environment

### Integrating a Register Model

#### Transaction Adapter

...

The transaction adapter translates high-level register operations into low-level bus transactions compatible with the DUT's bus protocol.

#### Integrating Bus Sequencers

...

Bus sequencers control the sequence of bus transactions, coordinating with the register model to perform reads and writes.

#### Integrating the Register Model with a Bus Monitor

...

A bus monitor observes bus transactions and updates the register model to reflect changes in the DUT's state, ensuring consistency and correctness.

### Randomizing Field Values

Randomizing field values allows for extensive testing of different register states and transitions, uncovering edge cases and potential issues.

```systemverilog
reg_model.REG1.randomize();
```

### Pre-defined Sequences

Pre-defined sequences provide common register access patterns and scenarios, facilitating efficient and thorough verification.

```systemverilog
class my_reg_sequence extends uvm_sequence;
  `uvm_object_utils(my_reg_sequence)

  function new(string name = "my_reg_sequence");
    super.new(name);
  endfunction

  task body();
    // Define sequence of register operations
  endtask
endclass
```

By leveraging the capabilities of the UVM register layer, verification engineers can create comprehensive, flexible, and reusable register models that enhance the effectiveness and efficiency of the verification process.

## ADVANCED TOPICS

### `UVM_COMPONENT` BASE CLASS

The `uvm_component` base class is a fundamental building block in UVM, providing a framework for building modular, reusable verification components. It serves as the base class for all hierarchical components in a UVM testbench.

Key features of `uvm_component` include:
- **Phases**: UVM components participate in predefined simulation phases such as `build_phase`, `connect_phase`, `run_phase`, etc.
- **Factory Registration**: Allows components to be created dynamically using the UVM factory.
- **Configuration Database**: Enables flexible configuration of component properties.

Example:

```systemverilog
class my_component extends uvm_component;
  `uvm_component_utils(my_component)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Component build logic
  endfunction

  virtual function void run_phase(uvm_phase phase);
    phase.raise_objection(this);
    // Component run logic
    phase.drop_objection(this);
  endfunction
endclass
```

### Built-In Factory and Overrides

#### About the Factory

...

The UVM factory is a mechanism for creating objects and components dynamically at runtime. It supports object-oriented principles such as polymorphism and abstraction, enabling flexibility and reusability.

#### Factory Registration

...

To use the factory, components and objects must be registered using macros such as `uvm_component_utils` and `uvm_object_utils`.

```systemverilog
class my_component extends uvm_component;
  `uvm_component_utils(my_component)
  // ...
endclass
```

#### Component Overrides

...

Overrides allow one component or object type to be replaced with another at runtime, facilitating easier configuration changes and extending testbenches without modifying the original code.

```systemverilog
uvm_factory::set_type_override_by_type(original_type::get_type(), override_type::get_type());
```

### Callbacks

#### Use Model

...

Callbacks are a mechanism to add custom behavior to UVM components without modifying their source code. They enable a flexible way to extend and customize components.

#### Example

...

```systemverilog
class my_callback extends uvm_callback;
  `uvm_object_utils(my_callback)

  function new(string name = "my_callback");
    super.new(name);
  endfunction

  virtual function void post_write(uvm_reg reg, uvm_reg_data_t data);
    // Custom behavior after a register write
  endfunction
endclass

class my_component extends uvm_component;
  `uvm_component_utils(my_component)

  my_callback cb;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    cb = my_callback::type_id::create("cb");
    uvm_reg::get().add_callback(cb);
  endfunction
endclass
```

### Sequence Library

The UVM sequence library provides a framework for creating, managing, and executing sequences. It allows for defining complex transaction flows and reuse across different tests and environments.

### Advanced Sequence Control

#### Implementing Complex Scenarios

...

Complex scenarios can be implemented by composing sequences from simpler sequences, controlling the order, timing, and conditions of execution.

#### Protocol Layering

...

Protocol layering involves creating sequences that operate at different levels of abstraction, enabling a layered approach to verification.

#### Generating the Item or Sequence in Advance

...

Sequences can pre-generate items before sending them to the sequencer, allowing for more complex pre-processing or timing control.

#### Executing Sequences and Items on Other Sequencers

...

Sequences can target different sequencers, enabling coordination between multiple protocol layers or functional units.

```systemverilog
task body();
  my_seq1.start(p_sequencer);
  my_seq2.start(other_sequencer);
endtask
```

### Command Line Interface (CLI)

#### Introduction

...

The UVM CLI allows users to pass arguments to the simulation, controlling various aspects of the verification environment.

#### Getting Started

...

To use the CLI, UVM provides built-in macros and functions to parse and handle command-line arguments.

#### UVM-aware Command Line Processing

...

UVM-aware command-line processing involves using the UVM configuration database and factory to set up the environment based on CLI arguments.

```systemverilog
if ($test$plusargs("enable_feature")) begin
  uvm_config_db#(bit)::set(null, "uvm_test_top", "enable_feature", 1);
end
```

### Macros in UVM

UVM provides a variety of macros to simplify the creation and management of verification components. Some commonly used macros include:

- `uvm_component_utils`: Registers a component with the UVM factory.
- `uvm_object_utils`: Registers an object with the UVM factory.
- `uvm_info`, `uvm_warning`, `uvm_error`, `uvm_fatal`: Logging and messaging macros.

Example:

```systemverilog
`uvm_info("MY_TAG", "This is an informational message", UVM_LOW)
`uvm_warning("MY_TAG", "This is a warning message")
`uvm_error("MY_TAG", "This is an error message")
`uvm_fatal("MY_TAG", "This is a fatal message")
```

By mastering these advanced topics, verification engineers can create highly flexible, reusable, and robust verification environments, leveraging the full power of UVM.

## UBUS VERIFICATION COMPONENT EXAMPLE

### UBus Example

The UBus example demonstrates a complete UVM testbench for verifying a simple bus protocol called UBus. This example showcases the architecture, components, and interactions necessary for verifying a bus protocol.

### UBus Example ARCHITECTURE

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

### UBus Top Module

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

### Test

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

### TestBENCH ENVIRONMENT

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

### UBus Environment

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

### UBus Master Agent

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

### UBus Master Sequencer

The UBus master sequencer is responsible for managing sequences and providing transactions to the driver.

```systemverilog
class ubus_master_sequencer extends uvm_sequencer #(ubus_transaction);
  `uvm_component_utils(ubus_master_sequencer)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass
```

### UBus Driver

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

### UBus Agent Monitor

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

### UBus Bus Monitor

#### Collecting Transfers from the Bus

...

The bus monitor collects transactions from the bus and converts them into analysis transactions.

#### Number of Transfers

...

The monitor tracks the number of transfers and other relevant statistics.

#### Notifiers Emitted by the UBus Bus Monitor

...

The monitor can emit notifications for specific events, such as errors or protocol violations.

#### Checks and Coverage

...

The monitor performs protocol checks and collects coverage information, ensuring comprehensive verification of the bus protocol.

### UBus Interface

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

## UBUS SPECIFICATION

### Introduction

#### Motivation

...

The UBus (Universal Bus) protocol is designed to provide a flexible and efficient means of communication between different components in a system. It supports various types of data transfers and can be extended to include optional pipelining for improved performance.

#### Bus Overview

...

UBus is a synchronous bus protocol that includes arbitration, address, and data phases. It supports multiple masters and slaves, ensuring fair access to shared resources through an arbitration mechanism.

### Bus Description

#### Bus Signals

...

UBus consists of several signals that manage data transfer, address selection, and control functions:

- `clk`: The clock signal driving the synchronous operation of the bus.
- `reset`: Resets the bus and all connected devices.
- `addr[31:0]`: The 32-bit address bus.
- `data[31:0]`: The 32-bit data bus.
- `control[3:0]`: Control signals for various bus operations.
- `ready`: Indicates the slave's readiness to accept or provide data.
- `valid`: Indicates the master's validity of the address or data on the bus.

#### Clocking

...

UBus is a synchronous protocol driven by a single clock signal. All bus transactions occur on the rising edge of the clock.

#### Reset

...

The `reset` signal is used to initialize the bus and all connected devices to a known state. It is an active-high signal.

### Arbitration Phase

The arbitration phase determines which master gains control of the bus. Each master competes for bus access, and a centralized arbiter grants access based on a predefined policy, such as round-robin or priority-based.

### Address Phase

During the address phase, the master places the address of the target slave on the address bus.

#### NOP Cycle

...

A No Operation (NOP) cycle occurs when no master is driving the bus, and all signals remain in their idle state.

#### Normal Address Phase

...

In a normal address phase, the master asserts the address on the bus and sets the control signals to indicate the type of operation (read/write).

### Data Phase

The data phase follows the address phase and involves the actual data transfer between the master and the slave.

#### Write Transfer

...

In a write transfer, the master places the data on the data bus, and the slave latches the data when the `ready` signal is asserted.

#### Error during Write Transfer

...

If an error occurs during a write transfer, the slave can assert an error signal to indicate the failure.

#### Read Transfer

...

In a read transfer, the master places the address on the address bus, and the slave returns the data on the data bus when the `ready` signal is asserted.

#### Error during Read Transfer

...

If an error occurs during a read transfer, the slave can assert an error signal to indicate the failure.

### How Data is Driven

Data is driven on the bus by the master during write operations and by the slave during read operations. The `valid` signal indicates that the data on the bus is valid and can be latched by the receiving device.

### Optional Pipelining Scheme

Pipelining improves bus performance by overlapping the arbitration, address, and data phases of multiple transactions.

#### Pipelined Arbitration Phase

...

In the pipelined arbitration phase, the next master to gain control of the bus is determined while the current data transfer is still in progress.

#### Pipelined Address Phase

...

The pipelined address phase allows the next address to be placed on the bus before the current data transfer is completed.

#### Pipelined Data Phase

...

In the pipelined data phase, data transfers for different transactions overlap, with each phase (arbitration, address, data) occurring simultaneously for different transactions.

### Example Timing Diagrams

Below are example timing diagrams illustrating different phases and operations in the UBus protocol.

This document outlines the UBus protocol, its phases, signal descriptions, and example timing diagrams, providing a comprehensive guide for implementing and verifying UBus in a hardware design.
