# TOOLCHAIN

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## HARDWARE

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
cd synthesis/yosys
source synthesize.sh
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### ASIC for Design

Application-Specific Integrated Circuits (ASICs) are custom-designed integrated circuits tailored for specific applications or functions, offering high performance and power efficiency. ASICs like those designed for the MSP430, OpenRISC, and RISC-V architectures are optimized for their respective instruction sets and intended uses, ranging from embedded systems to high-performance computing.

type:

```
cd synthesis/qflow
source flow.sh
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### 4004

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### MSP430

Application-Specific Integrated Circuit (ASIC) design for MSP430 involves creating customized silicon chips specifically optimized for the MSP430 microcontroller architecture. This process includes designing and fabricating circuits that implement the MSP430's instruction set, peripherals, and interfaces, tailored to meet specific application requirements. Utilizing ASICs for MSP430 enables high performance, reduced power consumption, and minimized physical footprint, making them ideal for applications where efficiency and space are critical, such as in portable and battery-operated devices.

#### OpenRISC

ASIC design for OpenRISC focuses on developing custom integrated circuits based on the OpenRISC architecture, a family of open-source RISC processor designs. This entails designing specialized hardware to implement OpenRISC's instruction set, memory hierarchy, and I/O functionalities, ensuring optimized performance for target applications. By leveraging ASIC technology for OpenRISC, developers can achieve significant enhancements in speed, power efficiency, and system integration, tailored to the specific needs of embedded systems, industrial automation, and other high-performance computing applications.

#### RISC-V

ASIC design for RISC-V involves creating dedicated hardware tailored to the RISC-V instruction set architecture, known for its open and extensible nature. This process includes developing custom circuits that provide optimized processing, memory management, and peripheral interfacing capabilities specific to RISC-V. Implementing ASICs for RISC-V allows for highly efficient and high-performance solutions, making it suitable for a wide range of applications from consumer electronics to advanced computing systems, benefiting from RISC-V's scalability and modularity.

### FPGA for Model

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
cd synthesis/symbiflow
source flow.sh
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### 4004

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### MSP430

Field-Programmable Gate Array (FPGA) modeling for MSP430 involves using reconfigurable hardware to emulate the MSP430 microcontroller architecture. This approach allows developers to prototype and test MSP430-based designs quickly and efficiently, without the need for custom silicon fabrication. FPGAs provide flexibility in modifying the design, enabling rapid iteration and validation of various configurations and features. FPGA modeling is particularly valuable for early-stage development, educational purposes, and experimental projects involving the MSP430.

#### OpenRISC

FPGA modeling for OpenRISC utilizes reconfigurable hardware to implement and test the OpenRISC architecture. This method allows for the rapid development and validation of OpenRISC-based systems, providing a flexible platform to explore different design choices and optimizations. Using FPGAs for OpenRISC modeling enables quick prototyping, debugging, and performance analysis, making it an essential tool for developers working on innovative projects, academic research, and complex embedded applications requiring customization and rapid deployment.

#### RISC-V

FPGA modeling for RISC-V involves using configurable logic blocks to emulate the RISC-V processor architecture, facilitating rapid prototyping and testing of RISC-V designs. This approach allows developers to experiment with various RISC-V configurations, extensions, and custom instructions in a flexible and reconfigurable environment. FPGA modeling provides a practical and efficient way to validate and optimize RISC-V implementations before committing to ASIC production, supporting the iterative design process and accelerating the development cycle for cutting-edge computing solutions.

## SOFTWARE

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### 4004

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### 4004 Tests

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### ISA 4

...

The ISA 4 tests for 4004 focus on validating the functionality and performance of the 4-bit instruction set architecture. These tests are crucial for ensuring that the 4004 microcontrollers execute instructions correctly and efficiently. They cover various aspects of the ISA, including arithmetic operations, control flow, and memory access, providing a comprehensive assessment of the microcontroller's capabilities. By rigorously testing the ISA 16, developers can identify and address any issues, ensuring reliable and predictable behavior in real-world applications.

#### 4004 BareMetal

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### C Language

...

The C language support for 4004 in a bare metal environment involves writing software that runs directly on the hardware without an underlying operating system. This approach provides maximum control over the microcontroller's resources and is ideal for developing highly optimized and efficient applications. Using the C language, developers can leverage its simplicity and widespread support to create robust and portable code, suitable for a wide range of embedded applications on 4004 devices.

Hello QueenField in C Language:

```c
#include <stdio.h>

int main() {
  printf("Hello QueenField!\n");
  return 0;
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### C++ Language

...

The C++ language support for 4004 in a bare metal environment enables developers to use object-oriented programming techniques while maintaining direct control over the hardware. This allows for more modular and maintainable code, benefiting from C++'s features such as classes, inheritance, and templates. Writing bare metal applications in C++ on 4004 combines the performance and efficiency of low-level programming with the flexibility and reusability of high-level abstractions, making it a powerful option for complex embedded systems.

Hello QueenField in C++ Language:

```cpp
#include <iostream>

int main() {
  std::cout << "Hello QueenField!\n";
  return 0;
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### MSP430

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### MSP430 Tests

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### ISA 16

...

The ISA 16 tests for MSP430 focus on validating the functionality and performance of the 16-bit instruction set architecture. These tests are crucial for ensuring that the MSP430 microcontrollers execute instructions correctly and efficiently. They cover various aspects of the ISA, including arithmetic operations, control flow, and memory access, providing a comprehensive assessment of the microcontroller's capabilities. By rigorously testing the ISA 16, developers can identify and address any issues, ensuring reliable and predictable behavior in real-world applications.

#### MSP430 BareMetal

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### C Language

...

The C language support for MSP430 in a bare metal environment involves writing software that runs directly on the hardware without an underlying operating system. This approach provides maximum control over the microcontroller's resources and is ideal for developing highly optimized and efficient applications. Using the C language, developers can leverage its simplicity and widespread support to create robust and portable code, suitable for a wide range of embedded applications on MSP430 devices.

Hello QueenField in C Language:

```c
#include <stdio.h>

int main() {
  printf("Hello QueenField!\n");
  return 0;
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### C++ Language

...

The C++ language support for MSP430 in a bare metal environment enables developers to use object-oriented programming techniques while maintaining direct control over the hardware. This allows for more modular and maintainable code, benefiting from C++'s features such as classes, inheritance, and templates. Writing bare metal applications in C++ on MSP430 combines the performance and efficiency of low-level programming with the flexibility and reusability of high-level abstractions, making it a powerful option for complex embedded systems.

Hello QueenField in C++ Language:

```cpp
#include <iostream>

int main() {
  std::cout << "Hello QueenField!\n";
  return 0;
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### Go Language

...

The Go language support for MSP430 in a bare metal context allows developers to write applications that are compiled directly to run on MSP430 hardware without an operating system. Go's simplicity and strong support for concurrency make it an attractive option for embedded systems programming. Bare metal programming with Go on MSP430 provides an efficient way to develop scalable and maintainable applications, leveraging Go's modern syntax and robust standard library.

Hello QueenField in Go Language:

```go
package main

import "fmt"
func main() {
  fmt.Println("Hello QueenField!")
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### Rust Language

...

Rust language support for MSP430 in a bare metal environment brings the benefits of safety and concurrency to embedded programming. Rust's strong emphasis on memory safety and its ability to prevent common programming errors such as null pointer dereferencing and data races make it an ideal choice for developing reliable and secure applications. Writing bare metal applications in Rust on MSP430 ensures that developers can create high-performance code with confidence in its correctness and safety.

Hello QueenField in Rust Language:

```rust
fn main() {
  println!("Hello QueenField!");
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### OpenRISC

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### OpenRISC Tests

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### ISA 32

...

The ISA 32 tests for OpenRISC focus on evaluating the 32-bit instruction set architecture, ensuring that the processor correctly executes a wide range of instructions. These tests are essential for verifying the functionality, performance, and reliability of OpenRISC processors. By thoroughly testing the ISA 32, developers can identify potential issues and optimize the processor's performance, ensuring that it meets the demands of various applications, from embedded systems to more complex computing tasks.

##### ISA 64

...

The ISA 64 tests for OpenRISC extend the evaluation to the 64-bit instruction set architecture, providing a comprehensive assessment of its capabilities. These tests cover all aspects of the 64-bit ISA, including arithmetic, control flow, and memory operations. By conducting rigorous ISA 64 tests, developers can ensure that OpenRISC processors deliver the necessary performance and reliability for high-performance computing and advanced applications, addressing the needs of more demanding computational tasks.

#### OpenRISC BareMetal

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### C Language

...

C language support for OpenRISC in a bare metal environment involves developing software that runs directly on the hardware without an operating system. This approach provides maximum control over the processor's resources, enabling the creation of highly optimized and efficient applications. Writing bare metal code in C for OpenRISC allows developers to leverage the simplicity and portability of the C language, ensuring robust and reliable software for a wide range of embedded and real-time applications.

Hello QueenField in C Language:

```c
#include <stdio.h>

int main() {
  printf("Hello QueenField!\n");
  return 0;
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
rm -rf hello_c.elf
rm -rf hello_c.hex

export PATH=/opt/or1k-elf-gcc/bin:${PATH}

or1k-elf-gcc -o hello_c.elf hello_c.c
or1k-elf-objcopy -O ihex hello_c.elf hello_c.hex
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
export PATH=/opt/or1k-elf-gcc/bin:${PATH}

or1k-sim -f or1ksim.cfg hello_c.elf
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### C++ Language

...

C++ language support for OpenRISC in a bare metal environment enables developers to utilize object-oriented programming techniques while maintaining direct hardware control. This facilitates the creation of modular, maintainable, and reusable code, leveraging C++'s advanced features such as classes, inheritance, and templates. Bare metal programming in C++ on OpenRISC combines the performance and efficiency of low-level programming with the flexibility and abstraction of high-level language constructs, making it suitable for complex embedded systems.

Hello QueenField in C++ Language:

```cpp
#include <iostream>

int main() {
  std::cout << "Hello QueenField!\n";
  return 0;
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
rm -rf hello_cpp.elf
rm -rf hello_cpp.hex

export PATH=/opt/or1k-elf-g++/bin:${PATH}

or1k-elf-gcc -o hello_cpp.elf hello_cpp.cpp
or1k-elf-objcopy -O ihex hello_cpp.elf hello_cpp.hex
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
export PATH=/opt/or1k-elf-g++/bin:${PATH}

or1k-sim -f or1ksim.cfg hello_cpp.elf
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### Go Language

...

Go language support for OpenRISC in a bare metal context allows developers to write efficient and scalable applications that run directly on OpenRISC hardware without an operating system. Go's simplicity and strong support for concurrent programming make it well-suited for embedded systems development. Bare metal programming in Go on OpenRISC enables the creation of robust and maintainable software, taking advantage of Go's modern syntax and extensive standard library.

Hello QueenField in Go Language:

```go
package main

import "fmt"
func main() {
  fmt.Println("Hello QueenField!")
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### Rust Language

...

Rust language support for OpenRISC in a bare metal environment brings the advantages of memory safety and concurrency to embedded programming. Rust's emphasis on preventing common programming errors, such as null pointer dereferencing and data races, makes it an ideal choice for developing reliable and secure applications. Writing bare metal applications in Rust on OpenRISC ensures high performance and correctness, providing developers with confidence in the safety and efficiency of their code.

Hello QueenField in Rust Language:

```rust
fn main() {
  println!("Hello QueenField!");
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### OpenRISC Operating System

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### GNU Linux

...

GNU Linux support for OpenRISC provides a full-featured operating system environment, offering a rich set of tools and libraries for application development. This enables the development of complex and sophisticated applications on OpenRISC processors, leveraging the extensive Linux ecosystem. Running GNU Linux on OpenRISC facilitates the creation of networked, multitasking, and user-space applications, significantly expanding the range of potential use cases for OpenRISC.

##### GNU Hurd

...

GNU Hurd support for OpenRISC offers an alternative operating system environment based on the GNU Mach microkernel. Hurd provides a modular and flexible architecture, allowing fine-grained control over system resources. Running GNU Hurd on OpenRISC enables developers to explore advanced system programming concepts and create highly customizable operating system components, opening new possibilities for innovative embedded applications on the OpenRISC platform.

#### OpenRISC Distribution

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### GNU Debian

...

GNU Debian distribution for OpenRISC provides a comprehensive package management system, simplifying the installation, updating, and management of software on OpenRISC devices. Debian's extensive repository of precompiled packages ensures that developers have access to a wide range of tools and libraries, enhancing productivity and simplifying development. The Debian distribution for OpenRISC supports robust and scalable application development, leveraging the stability and reliability of the Debian ecosystem.

##### GNU Fedora

...

GNU Fedora distribution for OpenRISC offers a cutting-edge platform with the latest software and technologies tailored for OpenRISC processors. Fedora's emphasis on innovation and rapid updates ensures that developers have access to the newest features and improvements. Using the Fedora distribution on OpenRISC, developers can build and deploy modern, high-performance applications, benefiting from the extensive community support and rich documentation provided by the Fedora project.

### RISC-V

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### RISC-V Tests

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
export PATH=/opt/riscv-elf-gcc/bin:${PATH}

rm -rf tests
rm -rf riscv-tests

mkdir tests
mkdir tests/dump
mkdir tests/hex

git clone --recursive https://github.com/riscv/riscv-tests
cd riscv-tests

autoconf
./configure --prefix=/opt/riscv-elf-gcc/bin
make

cd isa

source ../../elf2hex.sh

mv *.dump ../../tests/dump
mv *.hex ../../tests/hex

cd ..

make clean
```

##### ISA 32

...

The ISA 32 tests for RISC-V focus on evaluating the 32-bit instruction set architecture, ensuring that the processor executes a wide range of instructions correctly and efficiently. These tests are essential for verifying the functionality, performance, and reliability of RISC-V processors. By rigorously testing the ISA 32, developers can identify and address potential issues, optimizing the processor's performance and ensuring that it meets the demands of various applications, from embedded systems to more complex computing tasks.

elf2hex.sh:

```
riscv32-unknown-elf-objcopy -O ihex rv32mi-p-breakpoint rv32mi-p-breakpoint.hex
riscv32-unknown-elf-objcopy -O ihex rv32mi-p-csr rv32mi-p-csr.hex

...
riscv32-unknown-elf-objcopy -O ihex rv32um-v-remw rv32um-v-remw.hex
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
export PATH=/opt/riscv-elf-gcc/bin:${PATH}

spike rv32mi-p-breakpoint
spike rv32mi-p-csr

...
spike rv32um-v-remw
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### ISA 64

...

The ISA 64 tests for RISC-V extend the evaluation to the 64-bit instruction set architecture, providing a comprehensive assessment of its capabilities. These tests cover all aspects of the 64-bit ISA, including arithmetic, control flow, and memory operations. Conducting rigorous ISA 64 tests ensures that RISC-V processors deliver the necessary performance and reliability for high-performance computing and advanced applications, addressing the needs of more demanding computational tasks.

elf2hex.sh:

```
riscv64-unknown-elf-objcopy -O ihex rv64mi-p-breakpoint rv64mi-p-breakpoint.hex
riscv64-unknown-elf-objcopy -O ihex rv64mi-p-csr rv64mi-p-csr.hex

...
riscv64-unknown-elf-objcopy -O ihex rv64um-v-remw rv64um-v-remw.hex
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
export PATH=/opt/riscv-elf-gcc/bin:${PATH}

spike rv64mi-p-breakpoint
spike rv64mi-p-csr

...
spike rv64um-v-remw
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### ISA 128

...

The ISA 128 tests for RISC-V focus on the 128-bit instruction set architecture, designed to support larger address spaces and higher precision computations than the 64-bit variant. These tests evaluate the functionality and performance of the 128-bit ISA, ensuring that it meets the requirements of advanced scientific computing, cryptographic applications, and other data-intensive tasks. By thoroughly testing the ISA 128, developers can ensure that RISC-V processors are future-proofed and capable of handling emerging computational demands.

elf2hex.sh:

```
riscv128-unknown-elf-objcopy -O ihex rv128mi-p-breakpoint rv128mi-p-breakpoint.hex
riscv128-unknown-elf-objcopy -O ihex rv128mi-p-csr rv128mi-p-csr.hex

...
riscv128-unknown-elf-objcopy -O ihex rv128um-v-remw rv128um-v-remw.hex
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
export PATH=/opt/riscv-elf-gcc/bin:${PATH}

spike rv128mi-p-breakpoint
spike rv128mi-p-csr

...
spike rv128um-v-remw
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### RISC-V BareMetal

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### C Language

...

C language support for RISC-V in a bare metal environment involves developing software that runs directly on the hardware without an operating system. This approach provides maximum control over the processor's resources, enabling the creation of highly optimized and efficient applications. Writing bare metal code in C for RISC-V allows developers to leverage the simplicity and portability of the C language, ensuring robust and reliable software for a wide range of embedded and real-time applications.

Hello QueenField in C Language:

```c
#include <stdio.h>

int main() {
  printf("Hello QueenField!\n");
  return 0;
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
rm -rf hello_c.elf
rm -rf hello_c.hex

export PATH=/opt/riscv-elf-gcc/bin:${PATH}

riscv64-unknown-elf-gcc -o hello_c.elf hello_c.c
riscv64-unknown-elf-objcopy -O ihex hello_c.elf hello_c.hex
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
export PATH=/opt/riscv-elf-gcc/bin:${PATH}

spike pk hello_c.elf
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### C++ Language

...

C++ language support for RISC-V in a bare metal environment enables developers to utilize object-oriented programming techniques while maintaining direct hardware control. This facilitates the creation of modular, maintainable, and reusable code, leveraging C++'s advanced features such as classes, inheritance, and templates. Bare metal programming in C++ on RISC-V combines the performance and efficiency of low-level programming with the flexibility and abstraction of high-level language constructs, making it suitable for complex embedded systems.

Hello QueenField in C++ Language:

```cpp
#include <iostream>

int main() {
  std::cout << "Hello QueenField!\n";
  return 0;
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
rm -rf hello_cpp.elf
rm -rf hello_cpp.hex

export PATH=/opt/riscv-elf-gcc/bin:${PATH}

riscv64-unknown-elf-g++ -o hello_cpp.elf hello_cpp.cpp
riscv64-unknown-elf-objcopy -O ihex hello_cpp.elf hello_cpp.hex
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
export PATH=/opt/riscv-elf-gcc/bin:${PATH}

spike pk hello_cpp.elf
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### Go Language

...

Go language support for RISC-V in a bare metal context allows developers to write efficient and scalable applications that run directly on RISC-V hardware without an operating system. Go's simplicity and strong support for concurrent programming make it well-suited for embedded systems development. Bare metal programming in Go on RISC-V enables the creation of robust and maintainable software, taking advantage of Go's modern syntax and extensive standard library.

Hello QueenField in Go Language:

```go
package main

import "fmt"
func main() {
  fmt.Println("Hello QueenField!")
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
rm -rf hello_go.elf
rm -rf hello_go.hex

export PATH=/opt/riscv-elf-gcc/bin:${PATH}
export PATH=/opt/riscv-go/bin:${PATH}

GOOS=linux GOARCH=riscv64 go build -o hello_go.elf hello_go.go
riscv64-unknown-elf-objcopy -O ihex hello_go.elf hello_go.hex
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### Rust Language

...

Rust language support for RISC-V in a bare metal environment brings the advantages of memory safety and concurrency to embedded programming. Rust's emphasis on preventing common programming errors, such as null pointer dereferencing and data races, makes it an ideal choice for developing reliable and secure applications. Writing bare metal applications in Rust on RISC-V ensures high performance and correctness, providing developers with confidence in the safety and efficiency of their code.

Hello QueenField in Rust Language:

```rust
fn main() {
  println!("Hello QueenField!");
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### RISC-V Operating System

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### GNU Linux

...

GNU Linux support for RISC-V provides a full-featured operating system environment, offering a rich set of tools and libraries for application development. This enables the development of complex and sophisticated applications on RISC-V processors, leveraging the extensive Linux ecosystem. Running GNU Linux on RISC-V facilitates the creation of networked, multitasking, and user-space applications, significantly expanding the range of potential use cases for RISC-V.

**Building BusyBox**

type:

```
export PATH=/opt/riscv-elf-gcc/bin:${PATH}

git clone --recursive https://git.busybox.net/busybox

cd busybox
make CROSS_COMPILE=riscv64-unknown-linux-gnu- defconfig
make CROSS_COMPILE=riscv64-unknown-linux-gnu-
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

**Building Linux**

type:

```
export PATH=/opt/riscv-elf-gcc/bin:${PATH}

git clone --recursive https://github.com/torvalds/linux

cd linux
make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- defconfig
make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu-
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

**Running Linux**

type:

```
export PATH=/opt/riscv-elf-gcc/bin:${PATH}

qemu-system-riscv64 -nographic -machine virt \
-kernel Image -append "root=/dev/vda ro console=ttyS0" \
-drive file=busybox,format=raw,id=hd0 \
-device virtio-blk-device,drive=hd0
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

**Running Linux RISC-V 32 bit with Buildroot**

type:

```
export PATH=/opt/riscv-elf-gcc/bin:${PATH}

git clone --recursive https://github.com/buildroot/buildroot

cd buildroot
make qemu_riscv32_virt_defconfig
make

qemu-system-riscv32 \
-M virt \
-nographic \
-bios output/images/fw_jump.elf \
-kernel output/images/Image \
-append "root=/dev/vda ro" \
-drive file=output/images/rootfs.ext2,format=raw,id=hd0 \
-device virtio-blk-device,drive=hd0 \
-netdev user,id=net0 \
-device virtio-net-device,netdev=net0
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

**Running Linux RISC-V 64 bit with Buildroot**

type:

```
export PATH=/opt/riscv-elf-gcc/bin:${PATH}

git clone --recursive https://github.com/buildroot/buildroot

cd buildroot
make qemu_riscv64_virt_defconfig
make

qemu-system-riscv64 \
-M virt \
-nographic \
-bios output/images/fw_jump.elf \
-kernel output/images/Image \
-append "root=/dev/vda ro" \
-drive file=output/images/rootfs.ext2,format=raw,id=hd0 \
-device virtio-blk-device,drive=hd0 \
-netdev user,id=net0 \
-device virtio-net-device,netdev=net0
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### GNU Hurd

...

GNU Hurd support for RISC-V offers an alternative operating system environment based on the GNU Mach microkernel. Hurd provides a modular and flexible architecture, allowing fine-grained control over system resources. Running GNU Hurd on RISC-V enables developers to explore advanced system programming concepts and create highly customizable operating system components, opening new possibilities for innovative embedded applications on the RISC-V platform.

#### RISC-V Distribution

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### GNU Debian

...

GNU Debian distribution for RISC-V provides a comprehensive package management system, simplifying the installation, updating, and management of software on RISC-V devices. Debian's extensive repository of precompiled packages ensures that developers have access to a wide range of tools and libraries, enhancing productivity and simplifying development. The Debian distribution for RISC-V supports robust and scalable application development, leveraging the stability and reliability of the Debian ecosystem.

##### GNU Fedora

...

 Fedora distribution for RISC-V offers a cutting-edge platform with the latest software and technologies tailored for RISC-V processors. Fedora's emphasis on innovation and rapid updates ensures that developers have access to the newest features and improvements. Using the Fedora distribution on RISC-V, developers can build and deploy modern, high-performance applications, benefiting from the extensive community support and rich documentation provided by the Fedora project.

**Running Fedora**

type:

```
export PATH=/opt/riscv-elf-gcc/bin:${PATH}

qemu-system-riscv64 \
-nographic \
-machine virt \
-smp 4 \
-m 2G \
-kernel Fedora-RISCV.elf \
-bios none \
-object rng-random,filename=/dev/urandom,id=rng0 \
-device virtio-rng-device,rng=rng0 \
-device virtio-blk-device,drive=hd0 \
-drive file=Fedora-RISCV.raw,format=raw,id=hd0 \
-device virtio-net-device,netdev=usernet \
-netdev user,id=usernet,hostfwd=tcp::10000-:22
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....
