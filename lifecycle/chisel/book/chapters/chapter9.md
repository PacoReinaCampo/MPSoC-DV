# COMMUNICATING STATE MACHINES

## A LIGHT FLASHER EXAMPLE

A simple example of a light flasher using a state machine in Chisel:

```scala
import chisel3._

class LightFlasher extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val blink = Output(Bool())
  })

  // Define states
  val stateOff :: stateOn :: Nil = Enum(2)
  val currentState = RegInit(stateOff)

  // State transition and output logic
  switch(currentState) {
    is(stateOff) {
      when(io.start) {
        currentState := stateOn
      }
      io.blink := false.B
    }
    is(stateOn) {
      when(!io.start) {
        currentState := stateOff
      }
      io.blink := true.B
    }
  }
}
```

## STATE MACHINE WITH DATAPATH

An example of a state machine with a datapath to compute Fibonacci numbers:

```scala
import chisel3._

class FibonacciMachine extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val fibonacciNumber = Output(UInt(8.W))
  })

  // Define states
  val stateInit :: stateCompute :: Nil = Enum(2)
  val currentState = RegInit(stateInit)

  // Datapath registers
  val fib0 = RegInit(0.U(8.W))
  val fib1 = RegInit(1.U(8.W))
  val count = RegInit(0.U(8.W))

  // State machine and datapath logic
  switch(currentState) {
    is(stateInit) {
      when(io.start) {
        currentState := stateCompute
      }
    }
    is(stateCompute) {
      count := count + 1.U
      fib0 := fib1
      fib1 := fib0 + fib1

      when(count === 7.U) {  // Compute Fibonacci number 7
        currentState := stateInit
      }
    }
  }

  // Output the computed Fibonacci number
  io.fibonacciNumber := fib1
}
```

## READY/VALID INTERFACE

Implementing a ready/valid interface for communication between modules:

```scala
import chisel3._
import chisel3.util._

class ReadyValidInterface extends Module {
  val io = IO(new Bundle {
    val input = Flipped(Decoupled(UInt(8.W)))
    val output = Decoupled(UInt(8.W))
  })

  // Define states
  val stateIdle :: stateProcess :: stateDone :: Nil = Enum(3)
  val currentState = RegInit(stateIdle)

  // Ready/valid interface logic
  val readyReg = RegInit(false.B)
  val validReg = RegInit(false.B)
  val dataReg = Reg(UInt(8.W))

  // State machine for processing
  switch(currentState) {
    is(stateIdle) {
      when(io.input.valid) {
        dataReg := io.input.bits
        readyReg := true.B
        currentState := stateProcess
      }
    }
    is(stateProcess) {
      when(readyReg && io.output.ready) {
        validReg := true.B
        currentState := stateDone
      }
    }
    is(stateDone) {
      when(io.output.valid) {
        readyReg := false.B
        validReg := false.B
        currentState := stateIdle
      }
    }
  }

  // Connect ready/valid signals
  io.input.ready := currentState === stateIdle
  io.output.valid := currentState === stateDone
  io.output.bits := dataReg
}
```

This manual provides comprehensive examples and explanations of communicating state machines in Chisel, including basic state machine examples, state machines with datapaths for computations, and implementation of a ready/valid interface for inter-module communication. Adjust examples based on specific design requirements and expand functionality as needed.
