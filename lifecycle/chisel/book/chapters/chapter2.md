# BASIC COMPONENTS

## CHISEL TYPES AND CONSTANTS

Chisel supports several types and constants that are essential for digital circuit design:

- **Numeric Types:** `UInt`, `SInt`, `Bool`
- **Constants:** Defined using Scala's syntax, e.g., `val myConst = 42.U`

## COMBINATIONAL CIRCUITS

### Multiplexer

A multiplexer (MUX) selects one of several input signals and forwards it to the output based on select lines.

```scala
import chisel3._

class MuxExample extends Module {
  val io = IO(new Bundle {
    val sel = Input(UInt(2.W))
    val in0 = Input(UInt(8.W))
    val in1 = Input(UInt(8.W))
    val out = Output(UInt(8.W))
  })

  io.out := MuxLookup(io.sel, io.in0, Array(
    (0.U) -> io.in0,
    (1.U) -> io.in1
  ))
}
```

## REGISTERS

### Counting

Registers in Chisel are defined using `Reg` and `RegInit`. Here's an example of a simple counter:

```scala
import chisel3._

class Counter extends Module {
  val io = IO(new Bundle {
    val enable = Input(Bool())
    val count = Output(UInt(8.W))
  })

  val reg = RegInit(0.U(8.W))

  when(io.enable) {
    reg := reg + 1.U
  }

  io.count := reg
}
```

## STRUCTURE WITH BUNDLE AND VEC

### Bundle

Bundles in Chisel allow grouping signals into a single object:

```scala
import chisel3._

class MyBundle extends Bundle {
  val foo = UInt(8.W)
  val bar = Bool()
}

class UseBundle extends Module {
  val io = IO(new Bundle {
    val in = Input(new MyBundle)
    val out = Output(new MyBundle)
  })

  io.out := io.in
}
```

### Vec

`Vec` allows creating an array of elements of the same type in Chisel:

```scala
import chisel3._

class VecExample extends Module {
  val io = IO(new Bundle {
    val in = Input(Vec(4, UInt(8.W)))
    val out = Output(UInt(8.W))
  })

  io.out := io.in(0) + io.in(1) + io.in(2) + io.in(3)
}
```

## WIRE, REG, AND IO

- **Wire:** Used for combinational logic connections.
- **Reg:** Used for storing values between clock cycles.
- **IO:** Declares the interface of a module, specifying inputs and outputs.

## CHISEL GENERATES HARDWARE

Chisel generates Verilog or other hardware description languages (HDLs) from Scala code using its own compiler. This generated HDL code can then be synthesized and implemented on FPGA or ASIC platforms.

## EXERCISES

1. Implement a 2-to-1 multiplexer in Chisel.
2. Create a 4-bit shift register in Chisel.
3. Design a module using `Bundle` to represent a simple calculator with add and subtract operations.

This manual covers foundational aspects of Chisel, including types, combinational circuits, registers, structured data types (`Bundle` and `Vec`), and the generation of hardware. Exercises are provided to reinforce understanding and encourage practical application of Chisel concepts. Adjust examples and exercises based on specific learning objectives and project requirements.
