# UBUS SPECIFICATION

## INTRODUCTION

### Motivation

The UBus (Universal Bus) protocol is designed to provide a flexible and efficient means of communication between different components in a system. It supports various types of data transfers and can be extended to include optional pipelining for improved performance.

### Bus Overview

UBus is a synchronous bus protocol that includes arbitration, address, and data phases. It supports multiple masters and slaves, ensuring fair access to shared resources through an arbitration mechanism.

## BUS DESCRIPTION

### Bus Signals

UBus consists of several signals that manage data transfer, address selection, and control functions:

- `clk`: The clock signal driving the synchronous operation of the bus.
- `reset`: Resets the bus and all connected devices.
- `addr[31:0]`: The 32-bit address bus.
- `data[31:0]`: The 32-bit data bus.
- `control[3:0]`: Control signals for various bus operations.
- `ready`: Indicates the slave's readiness to accept or provide data.
- `valid`: Indicates the master's validity of the address or data on the bus.

### Clocking

UBus is a synchronous protocol driven by a single clock signal. All bus transactions occur on the rising edge of the clock.

### Reset

The `reset` signal is used to initialize the bus and all connected devices to a known state. It is an active-high signal.

## ARBITRATION PHASE

The arbitration phase determines which master gains control of the bus. Each master competes for bus access, and a centralized arbiter grants access based on a predefined policy, such as round-robin or priority-based.

## ADDRESS PHASE

During the address phase, the master places the address of the target slave on the address bus.

### NOP Cycle

A No Operation (NOP) cycle occurs when no master is driving the bus, and all signals remain in their idle state.

### Normal Address Phase

In a normal address phase, the master asserts the address on the bus and sets the control signals to indicate the type of operation (read/write).

## DATA PHASE

The data phase follows the address phase and involves the actual data transfer between the master and the slave.

### Write Transfer

In a write transfer, the master places the data on the data bus, and the slave latches the data when the `ready` signal is asserted.

### Error during Write Transfer

If an error occurs during a write transfer, the slave can assert an error signal to indicate the failure.

### Read Transfer

In a read transfer, the master places the address on the address bus, and the slave returns the data on the data bus when the `ready` signal is asserted.

### Error during Read Transfer

If an error occurs during a read transfer, the slave can assert an error signal to indicate the failure.

## HOW DATA IS DRIVEN

Data is driven on the bus by the master during write operations and by the slave during read operations. The `valid` signal indicates that the data on the bus is valid and can be latched by the receiving device.

## OPTIONAL PIPELINING SCHEME

Pipelining improves bus performance by overlapping the arbitration, address, and data phases of multiple transactions.

### Pipelined Arbitration Phase

In the pipelined arbitration phase, the next master to gain control of the bus is determined while the current data transfer is still in progress.

### Pipelined Address Phase

The pipelined address phase allows the next address to be placed on the bus before the current data transfer is completed.

### Pipelined Data Phase

In the pipelined data phase, data transfers for different transactions overlap, with each phase (arbitration, address, data) occurring simultaneously for different transactions.

## EXAMPLE TIMING DIAGRAMS

Below are example timing diagrams illustrating different phases and operations in the UBus protocol.

### Normal Write Transfer
```
clk:    |____|‾‾‾‾|____|‾‾‾‾|____|‾‾‾‾|____|‾‾‾‾|
addr:   |--------| ADDR1 |--------| ADDR2 |----|
data:   |--------| DATA1 |--------| DATA2 |----|
control:|--------|WRITE|--------|WRITE|--------|
ready:  |--------|_____|‾‾‾‾|--------|_____|‾‾‾‾|
valid:  |--------|‾‾‾‾|_____|‾‾‾‾|--------|‾‾‾‾|
```

### Normal Read Transfer
```
clk:    |____|‾‾‾‾|____|‾‾‾‾|____|‾‾‾‾|____|‾‾‾‾|
addr:   |--------| ADDR1 |--------| ADDR2 |----|
data:   |--------|--------| DATA1 |--------| DATA2 |
control:|--------| READ |--------| READ |--------|
ready:  |--------|_____|‾‾‾‾|--------|_____|‾‾‾‾|
valid:  |--------|‾‾‾‾|_____|‾‾‾‾|--------|‾‾‾‾|
```

### Pipelined Transfers
```
clk:    |____|‾‾‾‾|____|‾‾‾‾|____|‾‾‾‾|____|‾‾‾‾|____|‾‾‾‾|____|‾‾‾‾|
addr:   |--------| ADDR1 |--------| ADDR2 |--------| ADDR3 |----|
data:   |--------|--------| DATA1 |--------| DATA2 |--------| DATA3 |
control:|--------|WRITE|--------|READ|--------|WRITE|--------|
ready:  |--------|_____|‾‾‾‾|_____|‾‾‾‾|_____|‾‾‾‾|--------|‾‾‾‾|
valid:  |--------|‾‾‾‾|_____|‾‾‾‾|_____|‾‾‾‾|________|‾‾‾‾|
```

This document outlines the UBus protocol, its phases, signal descriptions, and example timing diagrams, providing a comprehensive guide for implementing and verifying UBus in a hardware design.
