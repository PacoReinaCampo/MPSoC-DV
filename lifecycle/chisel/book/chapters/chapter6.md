# SEQUENTIAL BUILDING BLOCKS

## REGISTERS

Registers in Chisel are used for storing state between clock cycles. Here's an example of a simple 8-bit register:

```scala
import chisel3._

class MyRegister extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(8.W))
    val out = Output(UInt(8.W))
    val load = Input(Bool())
  })

  val reg = RegInit(0.U(8.W))

  when(io.load) {
    reg := io.in
  }

  io.out := reg
}
```

## COUNTERS

### Counting Up and Down

A counter example that counts up and down:

```scala
import chisel3._

class UpDownCounter extends Module {
  val io = IO(new Bundle {
    val up = Input(Bool())
    val down = Input(Bool())
    val out = Output(UInt(8.W))
  })

  val count = RegInit(0.U(8.W))

  when(io.up) {
    count := count + 1.U
  }.elsewhen(io.down) {
    count := count - 1.U
  }

  io.out := count
}
```

### Generating Timing with Counters

Example of generating timing with a counter:

```scala
import chisel3._

class Timer extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val done = Output(Bool())
  })

  val counter = RegInit(0.U(8.W))
  val maxCount = 100.U

  when(io.start && !io.done) {
    counter := counter + 1.U
    when(counter === maxCount) {
      io.done := true.B
    }
  }.otherwise {
    counter := 0.U
    io.done := false.B
  }
}
```

### The Nerd Counter

A more complex counter example:

```scala
import chisel3._

class NerdCounter extends Module {
  val io = IO(new Bundle {
    val enable = Input(Bool())
    val out = Output(UInt(8.W))
  })

  val count = RegInit(0.U(8.W))

  when(io.enable) {
    count := count + 1.U
  }

  io.out := count
}
```

### A Timer

Implementing a timer in Chisel:

```scala
import chisel3._

class Timer extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val tick = Output(Bool())
  })

  val counter = RegInit(0.U(32.W))
  val maxCount = (100000000 - 1).U

  io.tick := false.B

  when(io.start) {
    counter := counter + 1.U
    when(counter === maxCount) {
      io.tick := true.B
      counter := 0.U
    }
  }
}
```

### Pulse-Width Modulation (PWM)

An example of PWM using a counter:

```scala
import chisel3._

class PWMGenerator extends Module {
  val io = IO(new Bundle {
    val period = Input(UInt(16.W))
    val dutyCycle = Input(UInt(8.W))
    val pwmOut = Output(Bool())
  })

  val counter = RegInit(0.U(16.W))
  val pwmReg = RegInit(false.B)

  when(counter < io.period) {
    counter := counter + 1.U
  }.otherwise {
    counter := 0.U
    pwmReg := !pwmReg
  }

  io.pwmOut := counter < (io.period * io.dutyCycle / 255.U)
}
```

## SHIFT REGISTERS

### Shift Register with Parallel Output

Example of a shift register with parallel output:

```scala
import chisel3._

class ShiftRegisterParallelOut extends Module {
  val io = IO(new Bundle {
    val in = Input(Bool())
    val shift = Input(Bool())
    val parallelOut = Output(UInt(4.W))
  })

  val shiftReg = RegInit(0.U(4.W))

  when(io.shift) {
    shiftReg := Cat(io.in, shiftReg(3, 1))
  }

  io.parallelOut := shiftReg
}
```

### Shift Register with Parallel Load

Example of a shift register with parallel load:

```scala
import chisel3._

class ShiftRegisterParallelLoad extends Module {
  val io = IO(new Bundle {
    val parallelIn = Input(UInt(4.W))
    val load = Input(Bool())
    val shift = Input(Bool())
    val parallelOut = Output(UInt(4.W))
  })

  val shiftReg = RegInit(0.U(4.W))

  when(io.load) {
    shiftReg := io.parallelIn
  }.elsewhen(io.shift) {
    shiftReg := Cat(io.shift, shiftReg(3, 1))
  }

  io.parallelOut := shiftReg
}
```

## MEMORY

Chisel supports memory constructs like `Mem` and `Vec` for implementing memory elements. Example usage involves defining and initializing memories in Chisel code.

## EXERCISES

1. Implement a 4-bit synchronous up-counter in Chisel.
2. Create a module that generates a PWM signal based on input period and duty cycle parameters.
3. Develop a shift register that supports both parallel load and serial shift operations.

This manual provides comprehensive examples and explanations of sequential building blocks in Chisel, including registers, counters (up, down, and timed), shift registers (parallel output and parallel load), and a brief mention of memory constructs. Exercises are included to reinforce understanding and encourage practical application of Chisel concepts. Adjust examples based on specific design requirements and expand functionality as needed.
