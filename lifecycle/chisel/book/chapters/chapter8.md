# FINITE-STATE MACHINES

## BASIC FINITE-STATE MACHINE

A basic FSM in Chisel transitions between states based on inputs and generates outputs. Here's an example of a simple 2-state FSM:

```scala
import chisel3._

class BasicFSM extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val out = Output(UInt(2.W))
  })

  // Define states
  val stateIdle :: stateActive :: Nil = Enum(2)
  val currentState = RegInit(stateIdle)

  // State transition logic
  switch(currentState) {
    is(stateIdle) {
      when(io.start) {
        currentState := stateActive
      }
    }
    is(stateActive) {
      when(!io.start) {
        currentState := stateIdle
      }
    }
  }

  // Output generation based on state
  io.out := currentState.asUInt()
}
```

## FASTER OUTPUT WITH A MEALY FSM

A Mealy FSM produces outputs based on both the current state and inputs:

```scala
import chisel3._

class MealyFSM extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val out = Output(UInt(2.W))
  })

  // Define states
  val stateIdle :: stateActive :: Nil = Enum(2)
  val currentState = RegInit(stateIdle)

  // State transition and output logic
  switch(currentState) {
    is(stateIdle) {
      when(io.start) {
        currentState := stateActive
        io.out := 1.U
      }.otherwise {
        io.out := 0.U
      }
    }
    is(stateActive) {
      when(!io.start) {
        currentState := stateIdle
        io.out := 2.U
      }.otherwise {
        io.out := 3.U
      }
    }
  }
}
```

## MOORE VERSUS MEALY

### Moore FSM

In a Moore FSM, outputs depend only on the current state:

```scala
import chisel3._

class MooreFSM extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val out = Output(UInt(2.W))
  })

  // Define states
  val stateIdle :: stateActive :: Nil = Enum(2)
  val currentState = RegInit(stateIdle)

  // State transition logic
  switch(currentState) {
    is(stateIdle) {
      when(io.start) {
        currentState := stateActive
      }
    }
    is(stateActive) {
      when(!io.start) {
        currentState := stateIdle
      }
    }
  }

  // Output generation based on state
  io.out := Mux(currentState === stateIdle, 0.U, 3.U)
}
```

### Mealy FSM

In a Mealy FSM, outputs depend on both the current state and inputs:

```scala
import chisel3._

class MealyFSM extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val out = Output(UInt(2.W))
  })

  // Define states
  val stateIdle :: stateActive :: Nil = Enum(2)
  val currentState = RegInit(stateIdle)

  // State transition and output logic
  switch(currentState) {
    is(stateIdle) {
      when(io.start) {
        currentState := stateActive
      }
      io.out := 0.U
    }
    is(stateActive) {
      when(!io.start) {
        currentState := stateIdle
      }
      io.out := 3.U
    }
  }
}
```

## EXERCISE

Implement a 3-state Mealy FSM in Chisel that controls a traffic light with outputs indicating `green`, `yellow`, and `red` states based on an external `clock` signal and a `reset` signal.

```scala
import chisel3._

class TrafficLightFSM extends Module {
  val io = IO(new Bundle {
    val clock = Input(Clock())
    val reset = Input(Bool())
    val light = Output(UInt(2.W))
  })

  // Define states
  val stateGreen :: stateYellow :: stateRed :: Nil = Enum(3)
  val currentState = RegInit(stateGreen)

  // State transition and output logic
  switch(currentState) {
    is(stateGreen) {
      when(io.reset) {
        currentState := stateRed
      }.elsewhen(clock.asUInt().toBool()) {
        currentState := stateYellow
      }
      io.light := 1.U
    }
    is(stateYellow) {
      when(io.reset) {
        currentState := stateRed
      }.elsewhen(!clock.asUInt().toBool()) {
        currentState := stateGreen
      }
      io.light := 2.U
    }
    is(stateRed) {
      when(io.reset) {
        currentState := stateGreen
      }.elsewhen(clock.asUInt().toBool()) {
        currentState := stateYellow
      }
      io.light := 0.U
    }
  }
}
```

This manual provides comprehensive examples and explanations of Finite-State Machines (FSMs) in Chisel, including basic FSMs, Mealy FSMs, Moore FSMs, and an exercise to reinforce understanding and encourage practical application of FSM concepts. Adjust examples based on specific design requirements and expand functionality as needed.
