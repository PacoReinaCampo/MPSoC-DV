# COMBINATIONAL BUILDING BLOCKS

## COMBINATIONAL CIRCUITS

Combinational circuits in Chisel are circuits where outputs depend only on current inputs, with no memory or feedback.

## DECODER

A decoder converts an n-bit input into 2^n output lines. Here's an example of a 3-to-8 decoder in Chisel:

```scala
import chisel3._

class Decoder3to8 extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(3.W))
    val out = Output(Vec(8, Bool()))
  })

  for (i <- 0 until 8) {
    io.out(i) := (io.in === i.U)
  }
}
```

## ENCODER

An encoder performs the reverse of a decoder, converting multiple inputs into a smaller set of outputs. Here's a 4-to-2 encoder example:

```scala
import chisel3._

class Encoder4to2 extends Module {
  val io = IO(new Bundle {
    val in = Input(Vec(4, Bool()))
    val out = Output(UInt(2.W))
  })

  io.out := PriorityEncoder(io.in)
}
```

## ARBITER

An arbiter selects one of several inputs based on a priority scheme. Here's a simple round-robin arbiter example:

```scala
import chisel3._

class RoundRobinArbiter extends Module {
  val io = IO(new Bundle {
    val in = Input(Vec(2, UInt(8.W)))
    val out = Output(UInt(8.W))
  })

  val arbiter = RegInit(0.U(1.W))

  io.out := io.in(arbiter)

  when(io.out === io.in(0)) {
    arbiter := 1.U
  }.otherwise {
    arbiter := 0.U
  }
}
```

## PRIORITY ENCODER

A priority encoder outputs the highest-priority active input. Here's an example of a 4-to-2 priority encoder:

```scala
import chisel3._

class PriorityEncoder4to2 extends Module {
  val io = IO(new Bundle {
    val in = Input(Vec(4, Bool()))
    val out = Output(UInt(2.W))
  })

  io.out := PriorityEncoder(io.in)
}
```

## COMPARATOR

A comparator checks if two values are equal or their relationship (greater than, less than). Here's an example of an 8-bit comparator:

```scala
import chisel3._

class Comparator8bit extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(8.W))
    val b = Input(UInt(8.W))
    val eq = Output(Bool())
    val gt = Output(Bool())
    val lt = Output(Bool())
  })

  io.eq := (io.a === io.b)
  io.gt := (io.a > io.b)
  io.lt := (io.a < io.b)
}
```

## EXERCISE

Implement a 4-bit magnitude comparator in Chisel that outputs three signals: `eq` (equal), `gt` (greater than), and `lt` (less than), based on comparing two 4-bit inputs.

```scala
import chisel3._

class Comparator4bit extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(4.W))
    val b = Input(UInt(4.W))
    val eq = Output(Bool())
    val gt = Output(Bool())
    val lt = Output(Bool())
  })

  io.eq := (io.a === io.b)
  io.gt := (io.a > io.b)
  io.lt := (io.a < io.b)
}
```

This manual provides comprehensive examples and explanations of various combinational building blocks in Chisel, including decoders, encoders, arbiters, priority encoders, and comparators. Exercises are included to reinforce understanding and encourage practical application of Chisel concepts. Adjust examples based on specific design requirements and expand functionality as needed.
