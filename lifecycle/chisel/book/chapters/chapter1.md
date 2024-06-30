# INTRODUCTION

Chisel is a hardware description language embedded in Scala, designed to support digital circuit design and FPGA programming.

## INSTALLING CHISEL AND FPGA TOOLS

### macOS

1. **Install Scala:**
   - Download Scala from https://www.scala-lang.org/download/
   - Follow installation instructions.

2. **Install SBT (Scala Build Tool):**
   - Download SBT from https://www.scala-sbt.org/download.html
   - Follow installation instructions.

3. **Install Verilator (for Verilog simulation):**
   ```bash
   brew install verilator
   ```

4. **Install Chisel:**
   - Chisel can be added as a dependency to your SBT project:
     ```scala
     libraryDependencies += "edu.berkeley.cs" %% "chisel3" % "3.5.1"
     ```

### Linux/Ubuntu

1. **Install Scala:**
   ```bash
   sudo apt-get update
   sudo apt-get install scala
   ```

2. **Install SBT:**
   ```bash
   sudo apt-get install sbt
   ```

3. **Install Verilator:**
   ```bash
   sudo apt-get install verilator
   ```

4. **Install Chisel:**
   - Add Chisel as a dependency in your SBT project (similar to macOS).

### Windows

Chisel and its associated tools are primarily supported on Unix-based systems. Consider using a virtual machine or WSL (Windows Subsystem for Linux) for development.

### FPGA Tools

For FPGA development with Chisel, tools like Vivado or Quartus are commonly used. Install and configure these tools as per their respective documentation.

## HELLO WORLD

The traditional "Hello, World!" program introduces basic concepts in a simple context.

## CHISEL HELLO WORLD

Here’s a basic Chisel program to get started:

```scala
import chisel3._

class HelloWorld extends Module {
  val io = IO(new Bundle {
    val out = Output(UInt(8.W))
  })

  io.out := 42.U
}

object HelloWorld extends App {
  chisel3.Driver.execute(args, () => new HelloWorld)
}
```

## AN IDE FOR CHISEL

IDEs like IntelliJ IDEA with Scala plugin or VS Code with Scala Metals are suitable for Chisel development. Install Scala plugins and configure them for optimal usage.

## SOURCE ACCESS AND EBOOK FEATURES

Chisel’s source code is available on GitHub (https://github.com/freechipsproject/chisel3). Additional resources such as ebooks and tutorials are available on educational platforms.

## FURTHER READING

- Chisel Documentation: https://chisel-lang.org/documentation.html
- Chisel Bootcamp: https://github.com/freechipsproject/chisel-bootcamp

## EXERCISES

1. Write a Chisel module to implement a 4-bit counter.
2. Design a simple arithmetic logic unit (ALU) in Chisel.

This manual provides a comprehensive overview of Chisel, covering installation, basic usage, tools, and further resources for deeper learning. Adjust installation steps based on specific system configurations and ensure compatibility with chosen FPGA tools.
