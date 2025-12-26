# BUILD (PACKAGE)

In DevOps, the "BUILD" phase refers to the process of transforming source code into a deployable artifact, such as a compiled binary, executable, or container image. This phase is essential for automating the creation of software components and ensuring consistency across different environments. Here's a breakdown of what typically happens during the BUILD phase:

1. **Compilation**: For applications written in compiled languages like Java, C++, or Go, the BUILD phase involves compiling the source code into executable binaries or libraries. This step ensures that the code is translated into machine-readable instructions that can be executed on the target platform.

2. **Packaging**: Once the source code is compiled, it needs to be packaged into a deployable format. This could involve creating JAR files for Java applications, executable files for native applications, or Docker images for containerized applications. Packaging ensures that the application and its dependencies are bundled together in a portable format.

3. **Dependency Management**: Managing dependencies is crucial during the BUILD phase to ensure that the application runs correctly in different environments. Dependency management tools like Maven, Gradle, or npm are used to download and manage libraries and frameworks required by the application. This helps maintain consistency and reproducibility across builds.

4. **Containerization**: In modern DevOps practices, containerization has become increasingly popular for packaging and deploying applications. During the BUILD phase, developers create Docker images containing the application code, runtime environment, and dependencies. These images can then be deployed consistently across different environments, from development to production.

5. **Automated Build Pipelines**: Automated build pipelines are used to orchestrate the BUILD phase as part of the CI/CD process. Continuous integration (CI) tools like Jenkins, GitLab CI/CD, or GitHub Actions automate the build process, triggering builds whenever new code is pushed to the version control repository. These pipelines typically include steps for compilation, testing, packaging, and artifact generation.

6. **Build Optimization**: Optimizing the build process is important for reducing build times and improving developer productivity. Techniques such as caching dependencies, parallelizing build tasks, and optimizing Dockerfile instructions can help speed up the BUILD phase and enable faster feedback loops.

7. **Build Artifacts Management**: Once the build is complete, the resulting artifacts need to be stored and managed. Artifact repositories like Nexus, Artifactory, or Docker Hub are used to store build artifacts securely and version them for future reference. These artifacts can then be deployed to various environments as part of the continuous delivery (CD) process.

By automating and standardizing the BUILD phase, DevOps teams can accelerate the software delivery process, improve code quality, and enable faster and more reliable deployments.

![User and Developer](assets/chapter3/user-developer.svg)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

![Management](assets/chapter3/management.svg)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## SIM

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### VHDL

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### GHDL

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### Gtkwave

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### Verilog

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### Icarus Verilog

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### Gtkwave

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## COMPILATION

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### 4004 GNU Compiler Collection

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### 4004 GNU C

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### 4004 GNU C++

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### 4004 GNU Go

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### 4004 GNU Rust

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### MSP430 GNU Compiler Collection

The MSP430 GNU Compiler Collection (GCC) comprises a suite of compilers and tools tailored for the MSP430 microcontroller family. It includes compilers for C, C++, Go, and Rust, providing developers with robust tools to build applications for MSP430-based systems.

#### MSP430 GNU C

The MSP430 GNU C compiler is part of the GNU Compiler Collection (GCC) tailored specifically for the MSP430 microcontroller family. It provides a robust, open-source toolchain for compiling C programs that can be executed on MSP430 devices. Known for its efficiency and optimization capabilities, the MSP430 GNU C compiler helps developers create compact and high-performance code suitable for the low-power and embedded applications that the MSP430 is designed for. This open-source tool is widely supported and continuously improved by a community of developers, ensuring it remains a reliable choice for MSP430 development.

#### MSP430 GNU C++

The MSP430 GNU C++ compiler extends the capabilities of the MSP430 GNU Compiler Collection by supporting the C++ programming language. This allows developers to leverage the object-oriented features of C++ to create more structured and reusable code for MSP430 microcontrollers. The MSP430 GNU C++ compiler provides comprehensive support for the C++ language standards, including advanced features such as templates and exception handling. By using this open-source tool, developers can benefit from a modern programming approach while maintaining compatibility with the low-power and embedded nature of MSP430 applications.

#### MSP430 GNU Go

The MSP430 GNU Go compiler enables the use of the Go programming language for MSP430 microcontrollers. Go, known for its simplicity and efficiency, is well-suited for concurrent programming and scalable applications. By integrating Go into the MSP430 GNU Compiler Collection, developers can write Go programs that are compiled into efficient machine code for execution on MSP430 devices. This open-source compiler brings the benefits of Go's modern syntax and powerful standard library to the MSP430 platform, expanding the range of programming languages available for embedded development.

#### MSP430 GNU Rust

The MSP430 GNU Rust compiler brings the safety and concurrency advantages of the Rust programming language to MSP430 microcontrollers. Rust is known for its emphasis on memory safety and performance, making it an excellent choice for embedded systems where reliability is crucial. The MSP430 GNU Rust compiler allows developers to write Rust programs that are compiled into optimized machine code for MSP430 devices. This open-source tool enhances the development of robust and secure applications on the MSP430 platform, leveraging Rust's features to prevent common programming errors such as null pointer dereferencing and data races.

### OpenRISC GNU Compiler Collection

The OpenRISC GNU Compiler Collection (GCC) provides a comprehensive set of compilers and development tools for the OpenRISC architecture. It supports multiple programming languages, facilitating software development for OpenRISC-based systems.

#### OpenRISC GNU C

The OpenRISC GNU C compiler is a key component of the GNU Compiler Collection tailored for the OpenRISC architecture. It provides an open-source toolchain for compiling C programs that can run on OpenRISC processors. The compiler is designed to produce highly optimized and efficient code, making it suitable for a wide range of applications from embedded systems to larger computing tasks. The OpenRISC GNU C compiler benefits from the extensive support and continuous development of the GCC community, ensuring reliability and performance for developers working with the OpenRISC platform.

#### OpenRISC GNU C++

The OpenRISC GNU C++ compiler enhances the OpenRISC GNU Compiler Collection by adding support for the C++ programming language. This allows developers to use C++'s advanced features, such as object-oriented programming, templates, and standard libraries, to create complex and maintainable software for OpenRISC processors. The OpenRISC GNU C++ compiler is an open-source tool that integrates seamlessly with the OpenRISC architecture, enabling the development of sophisticated applications that take full advantage of the capabilities of C++.

#### OpenRISC GNU Go

The OpenRISC GNU Go compiler introduces the Go programming language to the OpenRISC platform, allowing developers to write Go programs that can be compiled and executed on OpenRISC processors. Known for its concurrency support and simplicity, Go is an ideal language for developing scalable and efficient applications. The OpenRISC GNU Go compiler, as part of the GNU Compiler Collection, is open-source and benefits from community support and continuous improvements, making it a reliable tool for OpenRISC development.

#### OpenRISC GNU Rust

The OpenRISC GNU Rust compiler enables the use of the Rust programming language on OpenRISC processors, combining Rust's emphasis on safety and performance with the flexibility of the OpenRISC architecture. Rust's features, such as memory safety guarantees and concurrency support, make it an excellent choice for developing reliable and high-performance software. The OpenRISC GNU Rust compiler is an open-source tool that allows developers to compile Rust programs into efficient machine code for OpenRISC, expanding the programming options available to the OpenRISC community.

### RISC-V GNU Compiler Collection

The RISC-V GNU Compiler Collection (GCC) offers a comprehensive suite of compilers and tools for software development on the RISC-V instruction set architecture. It supports various programming languages and facilitates the creation of software for RISC-V processors.

#### RISC-V GNU C

The RISC-V GNU C compiler is a vital part of the GNU Compiler Collection specifically adapted for the RISC-V architecture. It provides an open-source toolchain for compiling C programs that can be executed on RISC-V processors. Renowned for its efficiency and ability to produce highly optimized code, the RISC-V GNU C compiler supports a broad range of applications, from embedded systems to high-performance computing. The open-source nature of this compiler ensures continuous enhancements and widespread community support, making it a cornerstone tool for RISC-V development.

#### RISC-V GNU C++

The RISC-V GNU C++ compiler extends the capabilities of the RISC-V GNU Compiler Collection by supporting the C++ programming language. This enables developers to utilize C++'s rich set of features, including object-oriented programming, templates, and the standard library, for developing applications on RISC-V processors. The RISC-V GNU C++ compiler is open-source and benefits from the extensive support and ongoing development efforts of the GCC community, providing a powerful and flexible tool for creating sophisticated software on the RISC-V platform.

#### RISC-V GNU Go

The RISC-V GNU Go compiler integrates the Go programming language into the RISC-V GNU Compiler Collection, allowing developers to write Go programs that can be compiled and executed on RISC-V processors. Go's simplicity, efficiency, and strong support for concurrent programming make it an excellent choice for scalable and high-performance applications. The open-source RISC-V GNU Go compiler leverages the community-driven development and support of GCC, ensuring robust and optimized code generation for the RISC-V architecture.

#### RISC-V GNU Rust

The RISC-V GNU Rust compiler brings the safety, concurrency, and performance benefits of the Rust programming language to the RISC-V platform. Rust's features, such as memory safety guarantees and efficient concurrency support, are particularly well-suited for developing reliable and high-performance software. The RISC-V GNU Rust compiler is an open-source tool that allows developers to compile Rust programs into optimized machine code for RISC-V processors, expanding the range of programming languages and tools available for RISC-V development. The compiler's integration into the GNU Compiler Collection ensures it benefits from continuous improvements and broad community support.

## SYNTHESIS

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### ASIC for Design

Application-Specific Integrated Circuits (ASICs) are custom-designed integrated circuits tailored for specific applications or functions, offering high performance and power efficiency. ASICs like those designed for the MSP430, OpenRISC, and RISC-V architectures are optimized for their respective instruction sets and intended uses, ranging from embedded systems to high-performance computing.

#### Yosys-Qflow

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
cd synthesis/qflow
source flow.sh
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### FPGA for Model

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### Yosys-SymbiFlow

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
cd synthesis/symbiflow
source flow.sh
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....
