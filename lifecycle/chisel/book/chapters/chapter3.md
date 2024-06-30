# BUILD PROCESS AND TESTING

## BUILDING YOUR PROJECT WITH SBT

### Source Organization

Typically, Chisel projects are organized with the following structure:

```
project/
  build.sbt        // SBT build configuration
src/
  main/
    scala/         // Main Chisel source files
  test/
    scala/         // Test files (ChiselTest or ScalaTest)
```

### Running sbt

To run SBT for your Chisel project:

1. Navigate to your project directory containing `build.sbt`.
2. Open a terminal and run:
   ```bash
   sbt
   ```
   This starts the SBT shell.

### Generating Verilog

To generate Verilog from Chisel code using SBT:

1. Inside the SBT shell, use the `run` command followed by your main Chisel module:
   ```bash
   run MainModuleName
   ```
   Replace `MainModuleName` with the name of your Chisel module.

2. Verilog files will be generated in the `target/` directory.

### Tool Flow

The typical tool flow for a Chisel project involves:
- Editing Chisel source files (`*.scala`).
- Running SBT to compile and generate Verilog.
- Using Verilator or other tools for simulation or synthesis.

## TESTING WITH CHISEL

### ScalaTest

ScalaTest can be used for unit testing Chisel components. Example:

```scala
import org.scalatest._

class MyModuleSpec extends FlatSpec with Matchers {
  behavior of "MyModule"

  it should "perform addition correctly" in {
    assertTesterPasses { new MyModule } { c =>
      c.io.in.poke(5.U)
      c.clock.step()
      c.io.out.expect(10.U)
    }
  }
}
```

### ChiselTest

ChiselTest provides specific utilities for testing Chisel designs:

```scala
import chisel3._
import chiseltest._

class MyModuleTest extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "MyModule"

  it should "perform addition correctly" in {
    test(new MyModule) { c =>
      c.io.in.poke(5.U)
      c.clock.step()
      c.io.out.expect(10.U)
    }
  }
}
```

### Waveforms

To generate waveforms for debugging:

1. Use `--generate-vcd-output on` with SBT to enable waveform generation.

2. View waveforms using GTKWave or a compatible viewer.

### printf Debugging

Chisel supports printf-style debugging for quick checks:

```scala
import chisel3._

class MyModule extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(8.W))
    val out = Output(UInt(8.W))
  })

  printf("Input: %d\n", io.in)

  io.out := io.in + 1.U
}
```

## EXERCISES

### A Minimal Project

Create a minimal Chisel project that implements a simple counter.

### Using a GitHub Template

Explore a Chisel project template on GitHub, clone it, and modify it to add a new functionality.

### A Testing Exercise

Write tests using both ScalaTest and ChiselTest for a small Chisel module, ensuring correctness and functionality.

This manual provides comprehensive guidance on building Chisel projects using SBT, testing methodologies with ScalaTest and ChiselTest, waveform generation, printf debugging, and practical exercises to reinforce learning. Adjust examples and exercises based on specific project requirements and learning objectives.
