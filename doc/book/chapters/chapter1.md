# INTRODUCTION

The philosophy of open source, encompassing both software and hardware, stands as a beacon of collaborative innovation and transparency in the digital age. At its core, open source advocates for unrestricted access to source code and design schematics, empowering developers, engineers, and enthusiasts worldwide to study, modify, and distribute improvements freely. This ethos not only fosters a culture of shared knowledge and community-driven development but also democratizes technology by dismantling barriers to entry and promoting inclusivity. By embracing open source principles, individuals and organizations contribute to a dynamic ecosystem where creativity flourishes, standards evolve, and solutions emerge through collective ingenuity rather than proprietary constraints. This introduction sets the stage for exploring how open source philosophy transforms industries, empowers individuals, and shapes the future of technology.

| `Philosophy Architecture` | `Harvard` | `von-Neumann`  |
| ------------------------- | :-------- | :------------- |
| `Open`                    | `RISC-V ` | `OpenRISC`     |
| `Close`                   | `i4004`   | `MSP430`       |
: Philosophy Architecture

## OPEN SOURCE PHILOSOPHY

The open source philosophy revolves around the idea of making source code freely available for others to view, modify, and distribute. Here are some key principles and aspects of open source philosophy:

1. **Transparency and Accessibility**: Open source promotes transparency by making source code accessible to anyone who wants to inspect it. This openness fosters trust and enables scrutiny by a broader community.

2. **Collaboration and Community**: Open source encourages collaboration among developers worldwide. Anyone can contribute improvements, report issues, or suggest new features, creating a community-driven approach to software development.

3. **Freedom to Modify and Distribute**: Users are free to modify open source software to suit their needs and redistribute it. This freedom fosters innovation and allows software to evolve rapidly based on user feedback and contributions.

4. **Licensing**: Open source projects typically use licenses that ensure the software remains open and free to use, modify, and distribute. Popular licenses include the MIT License, GNU General Public License (GPL), Apache License, and more.

5. **Meritocracy**: Open source projects often operate on a meritocratic basis, where contributions are evaluated based on their technical merit rather than on factors such as seniority or affiliation. This allows talented individuals from diverse backgrounds to contribute meaningfully.

6. **Quality and Security**: The collective scrutiny and contributions from the community often result in higher-quality software with fewer bugs and vulnerabilities. Many eyes reviewing the code can help identify and fix issues more quickly than in closed-source projects.

7. **Ecosystem and Standards**: Open source software often forms the basis of larger ecosystems and standards, promoting interoperability and reducing vendor lock-in. This benefits both developers and users by fostering innovation and compatibility.

Overall, the open source philosophy emphasizes collaboration, transparency, and community-driven development to create high-quality software that is freely accessible to all.

**For Windows Users!**

1. Settings → Apps → Apps & features → Related settings, Programs and Features → Turn Windows features on or off → Windows Subsystem for Linux

2. Microsoft Store → INSTALL UBUNTU

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
sudo apt update
sudo apt upgrade
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### Open Source Hardware

Open source hardware refers to electronic or computer hardware whose design specifications are publicly accessible. This openness allows anyone to study, modify, distribute, and manufacture the hardware based on the design. It encourages collaborative development and innovation within the hardware community.

#### MSP430 Processing Unit

The MSP430 is a mixed-signal microcontroller family from Texas Instruments, designed primarily for low-power embedded applications. It features a 16-bit RISC architecture, which allows for efficient processing and low power consumption. The MSP430 series is popular in a variety of applications, ranging from simple sensors and battery-operated devices to complex industrial control systems. As an open-source hardware component, the MSP430's specifications and design guidelines are freely available, enabling developers to modify and adapt the hardware for specific needs while fostering innovation and collaboration within the tech community.

#### OpenRISC Processing Unit

OpenRISC is an open-source hardware project aimed at developing a free and open central processing unit (CPU) architecture. The OpenRISC architecture is designed to be highly configurable and suitable for a wide range of applications, from embedded systems to high-performance computing. It features a 32-bit or 64-bit RISC instruction set architecture, which supports efficient instruction execution and parallel processing. The open-source nature of OpenRISC allows developers to access the design and implementation details freely, encouraging experimentation, customization, and contributions from the global community, thereby advancing the state of open-source hardware development.

#### RISC-V Processing Unit

RISC-V is an open standard instruction set architecture (ISA) that is based on the principles of reduced instruction set computing (RISC). Unlike proprietary ISAs, RISC-V is freely available under open-source licenses, which means that anyone can use, modify, and distribute the architecture without royalties. This has led to a significant amount of interest and investment from both academia and industry. RISC-V's modular and extensible design allows for a wide range of implementations, from small microcontrollers to high-performance processors. The open-source ecosystem surrounding RISC-V has rapidly expanded, with a growing community contributing to software tools, development platforms, and a diverse array of hardware implementations, making it a pivotal element in the future of open-source hardware innovation.

### Open Source Software

Open source software (OSS) is computer software whose source code is available under a license that allows users to study, modify, and distribute the software freely. It embodies principles of transparency, collaboration, and community-driven development.

#### MSP430 GNU Compiler Collection

The MSP430 GNU Compiler Collection (GCC) comprises a suite of compilers and tools tailored for the MSP430 microcontroller family. It includes compilers for C, C++, Go, and Rust, providing developers with robust tools to build applications for MSP430-based systems.

##### MSP430 GNU C

The MSP430 GNU C compiler is part of the GNU Compiler Collection (GCC) tailored specifically for the MSP430 microcontroller family. It provides a robust, open-source toolchain for compiling C programs that can be executed on MSP430 devices. Known for its efficiency and optimization capabilities, the MSP430 GNU C compiler helps developers create compact and high-performance code suitable for the low-power and embedded applications that the MSP430 is designed for. This open-source tool is widely supported and continuously improved by a community of developers, ensuring it remains a reliable choice for MSP430 development.

##### MSP430 GNU C++

The MSP430 GNU C++ compiler extends the capabilities of the MSP430 GNU Compiler Collection by supporting the C++ programming language. This allows developers to leverage the object-oriented features of C++ to create more structured and reusable code for MSP430 microcontrollers. The MSP430 GNU C++ compiler provides comprehensive support for the C++ language standards, including advanced features such as templates and exception handling. By using this open-source tool, developers can benefit from a modern programming approach while maintaining compatibility with the low-power and embedded nature of MSP430 applications.

##### MSP430 GNU Go

The MSP430 GNU Go compiler enables the use of the Go programming language for MSP430 microcontrollers. Go, known for its simplicity and efficiency, is well-suited for concurrent programming and scalable applications. By integrating Go into the MSP430 GNU Compiler Collection, developers can write Go programs that are compiled into efficient machine code for execution on MSP430 devices. This open-source compiler brings the benefits of Go's modern syntax and powerful standard library to the MSP430 platform, expanding the range of programming languages available for embedded development.

##### MSP430 GNU Rust

The MSP430 GNU Rust compiler brings the safety and concurrency advantages of the Rust programming language to MSP430 microcontrollers. Rust is known for its emphasis on memory safety and performance, making it an excellent choice for embedded systems where reliability is crucial. The MSP430 GNU Rust compiler allows developers to write Rust programs that are compiled into optimized machine code for MSP430 devices. This open-source tool enhances the development of robust and secure applications on the MSP430 platform, leveraging Rust's features to prevent common programming errors such as null pointer dereferencing and data races.

#### OpenRISC GNU Compiler Collection

The OpenRISC GNU Compiler Collection (GCC) provides a comprehensive set of compilers and development tools for the OpenRISC architecture. It supports multiple programming languages, facilitating software development for OpenRISC-based systems.

##### OpenRISC GNU C

The OpenRISC GNU C compiler is a key component of the GNU Compiler Collection tailored for the OpenRISC architecture. It provides an open-source toolchain for compiling C programs that can run on OpenRISC processors. The compiler is designed to produce highly optimized and efficient code, making it suitable for a wide range of applications from embedded systems to larger computing tasks. The OpenRISC GNU C compiler benefits from the extensive support and continuous development of the GCC community, ensuring reliability and performance for developers working with the OpenRISC platform.

type:

```
sudo apt install git libgmp-dev libmpfr-dev libmpc-dev zlib1g-dev texinfo \
build-essential flex bison
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
git clone https://github.com/openrisc/binutils-gdb.git binutils-gdb
git clone https://github.com/openrisc/or1k-gcc.git gcc
git clone https://github.com/openrisc/newlib.git newlib

export PATH=/opt/or1k-elf-gcc/bin:${PATH}

mkdir build-binutils; cd build-binutils
../binutils-gdb/configure --target=or1k-elf --prefix=/opt/or1k-elf-gcc \
--disable-itcl --disable-tk --disable-tcl --disable-winsup --disable-gdbtk \
--disable-libgui --disable-rda --disable-sid --disable-sim --disable-gdb \
--with-sysroot --disable-newlib --disable-libgloss --with-system-zlib
make
sudo make install
cd ..

mkdir build-gcc-stage1; cd build-gcc-stage1
../gcc/configure --target=or1k-elf --prefix=/opt/or1k-elf-gcc \
--enable-languages=c --disable-shared --disable-libssp
make
sudo make install
cd ..

mkdir build-newlib; cd build-newlib
../newlib/configure --target=or1k-elf --prefix=/opt/or1k-elf-gcc
make
sudo make install
cd ..

mkdir build-gcc-stage2; cd build-gcc-stage2
../gcc/configure --target=or1k-elf --prefix=/opt/or1k-elf-gcc \
--enable-languages=c,c++ --disable-shared --disable-libssp --with-newlib
make
sudo make install
cd ..

mkdir build-gdb; cd build-gdb
../binutils-gdb/configure --target=or1k-elf --prefix=/opt/or1k-elf-gcc --disable-itcl \
--disable-tk --disable-tcl --disable-winsup --disable-gdbtk --disable-libgui \
--disable-rda --disable-sid --with-sysroot --disable-newlib --disable-libgloss \
--disable-gas --disable-ld --disable-binutils --disable-gprof --with-system-zlib
make
sudo make install
cd ..
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### OpenRISC GNU C++

The OpenRISC GNU C++ compiler enhances the OpenRISC GNU Compiler Collection by adding support for the C++ programming language. This allows developers to use C++'s advanced features, such as object-oriented programming, templates, and standard libraries, to create complex and maintainable software for OpenRISC processors. The OpenRISC GNU C++ compiler is an open-source tool that integrates seamlessly with the OpenRISC architecture, enabling the development of sophisticated applications that take full advantage of the capabilities of C++.

##### OpenRISC GNU Go

The OpenRISC GNU Go compiler introduces the Go programming language to the OpenRISC platform, allowing developers to write Go programs that can be compiled and executed on OpenRISC processors. Known for its concurrency support and simplicity, Go is an ideal language for developing scalable and efficient applications. The OpenRISC GNU Go compiler, as part of the GNU Compiler Collection, is open-source and benefits from community support and continuous improvements, making it a reliable tool for OpenRISC development.

##### OpenRISC GNU Rust

The OpenRISC GNU Rust compiler enables the use of the Rust programming language on OpenRISC processors, combining Rust's emphasis on safety and performance with the flexibility of the OpenRISC architecture. Rust's features, such as memory safety guarantees and concurrency support, make it an excellent choice for developing reliable and high-performance software. The OpenRISC GNU Rust compiler is an open-source tool that allows developers to compile Rust programs into efficient machine code for OpenRISC, expanding the programming options available to the OpenRISC community.

#### RISC-V GNU Compiler Collection

The RISC-V GNU Compiler Collection (GCC) offers a comprehensive suite of compilers and tools for software development on the RISC-V instruction set architecture. It supports various programming languages and facilitates the creation of software for RISC-V processors.

##### RISC-V GNU C

The RISC-V GNU C compiler is a vital part of the GNU Compiler Collection specifically adapted for the RISC-V architecture. It provides an open-source toolchain for compiling C programs that can be executed on RISC-V processors. Renowned for its efficiency and ability to produce highly optimized code, the RISC-V GNU C compiler supports a broad range of applications, from embedded systems to high-performance computing. The open-source nature of this compiler ensures continuous enhancements and widespread community support, making it a cornerstone tool for RISC-V development.

type:

```
sudo apt install autoconf automake autotools-dev curl python3 libmpc-dev \
libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf \
libtool patchutils bc zlib1g-dev libexpat-dev
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
git clone --recursive https://github.com/riscv/riscv-gnu-toolchain

cd riscv-gnu-toolchain

./configure --prefix=/opt/riscv-elf-gcc
sudo make clean
sudo make

./configure --prefix=/opt/riscv-app-gcc --enable-multilib
sudo make clean
sudo make linux
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### RISC-V GNU C++

The RISC-V GNU C++ compiler extends the capabilities of the RISC-V GNU Compiler Collection by supporting the C++ programming language. This enables developers to utilize C++'s rich set of features, including object-oriented programming, templates, and the standard library, for developing applications on RISC-V processors. The RISC-V GNU C++ compiler is open-source and benefits from the extensive support and ongoing development efforts of the GCC community, providing a powerful and flexible tool for creating sophisticated software on the RISC-V platform.

##### RISC-V GNU Go

The RISC-V GNU Go compiler integrates the Go programming language into the RISC-V GNU Compiler Collection, allowing developers to write Go programs that can be compiled and executed on RISC-V processors. Go's simplicity, efficiency, and strong support for concurrent programming make it an excellent choice for scalable and high-performance applications. The open-source RISC-V GNU Go compiler leverages the community-driven development and support of GCC, ensuring robust and optimized code generation for the RISC-V architecture.

##### RISC-V GNU Rust

The RISC-V GNU Rust compiler brings the safety, concurrency, and performance benefits of the Rust programming language to the RISC-V platform. Rust's features, such as memory safety guarantees and efficient concurrency support, are particularly well-suited for developing reliable and high-performance software. The RISC-V GNU Rust compiler is an open-source tool that allows developers to compile Rust programs into optimized machine code for RISC-V processors, expanding the range of programming languages and tools available for RISC-V development. The compiler's integration into the GNU Compiler Collection ensures it benefits from continuous improvements and broad community support.

## INSTRUCTION SET ARCHITECTURE

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### RISC-V ISA

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### ISA Bases

The RISC-V Instruction Set Architecture (ISA) offers multiple base configurations, including RISC-V 32, RISC-V 64, and RISC-V 128. Each base specifies the width of the general-purpose registers and address space, catering to a spectrum of computing needs from embedded systems to high-performance computing.

##### RISC-V 32

RISC-V 32 refers to the 32-bit base integer instruction set architecture (ISA) for RISC-V processors. This ISA is designed for simplicity and efficiency, making it ideal for small, low-power devices such as microcontrollers and embedded systems. The 32-bit ISA provides a fundamental set of instructions for performing basic operations, which can be extended with additional features through optional extensions. Its straightforward design ensures ease of implementation and verification, promoting widespread adoption and innovation within the RISC-V community.

**RV32I : Base Integer Instruction Set (32 bit)**

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

| `RV32I`             | `31:25`    | `24:20`  | `19:15`  | `14:12` | `11:7`   | `6:0`     |
|  -------------------|  :------:  |  :----:  |  :----:  |  :---:  |  :----:  |  :------: |
| `LUI   RD, IMM`     | `IIIIIII`  | `IIIII`  | `IIIII`  | `III`   | `RD4:0`  | `0110111` |
| `AUPIC RD, IMM`     | `IIIIIII`  | `IIIII`  | `IIIII`  | `III`   | `RD4:0`  | `0010111` |
| `JAL   RD, IMM`     | `IIIIIII`  | `IIIII`  | `IIIII`  | `III`   | `RD4:0`  | `1101111` |
| `JALR  RD,RS1,IMM`  | `IIIIIII`  | `IIIII`  | `RS14:0` | `000`   | `RD4:0`  | `1101111` |
| `BEQ   RS1,RS2,IMM` | `IIIIIII`  | `RS24:0` | `RS14:0` | `000`   | `IIIII`  | `1100011` |
| `BNE   RS1,RS2,IMM` | `IIIIIII`  | `RS24:0` | `RS14:0` | `001`   | `IIIII`  | `1100011` |
| `BLT   RS1,RS2,IMM` | `IIIIIII`  | `RS24:0` | `RS14:0` | `100`   | `IIIII`  | `1100011` |
| `BGE   RS1,RS2,IMM` | `IIIIIII`  | `RS24:0` | `RS14:0` | `101`   | `IIIII`  | `1100011` |
| `BLTU  RS1,RS2,IMM` | `IIIIIII`  | `RS24:0` | `RS14:0` | `110`   | `IIIII`  | `1100011` |
| `BGEU  RS1,RS2,IMM` | `IIIIIII`  | `RS24:0` | `RS14:0` | `111`   | `IIIII`  | `1100011` |
| `LB    RD, RS1`     | `IIIIIII`  | `IIIII`  | `RS14:0` | `000`   | `RD4:0`  | `0000011` |
| `LH    RD, RS1`     | `IIIIIII`  | `IIIII`  | `RS14:0` | `001`   | `RD4:0`  | `0000011` |
| `LW    RD, RS1`     | `IIIIIII`  | `IIIII`  | `RS14:0` | `010`   | `RD4:0`  | `0000011` |
| `LBU   RD, RS1`     | `IIIIIII`  | `IIIII`  | `RS14:0` | `100`   | `RD4:0`  | `0000011` |
| `LHU   RD, RS1`     | `IIIIIII`  | `IIIII`  | `RS14:0` | `101`   | `RD4:0`  | `0000011` |
| `SB    RS2,RS1`     | `IIIIIII`  | `RS24:0` | `RS14:0` | `000`   | `IIIII`  | `0100011` |
| `SH    RS2,RS1`     | `IIIIIII`  | `RS24:0` | `RS14:0` | `001`   | `IIIII`  | `0100011` |
| `SW    RS2,RS1`     | `IIIIIII`  | `RS24:0` | `RS14:0` | `010`   | `IIIII`  | `0100011` |
| `ADDI  RD,RS1,IMM`  | `IIIIIII`  | `IIIII`  | `RS14:0` | `000`   | `RD4:0`  | `0010011` |
| `SLTI  RD,RS1,IMM`  | `IIIIIII`  | `IIIII`  | `RS14:0` | `010`   | `RD4:0`  | `0010011` |
| `SLTIU RD,RS1,IMM`  | `IIIIIII`  | `IIIII`  | `RS14:0` | `011`   | `RD4:0`  | `0010011` |
| `XORI  RD,RS1,IMM`  | `IIIIIII`  | `IIIII`  | `RS14:0` | `100`   | `RD4:0`  | `0010011` |
| `ORI   RD,RS1,IMM`  | `IIIIIII`  | `IIIII`  | `RS14:0` | `110`   | `RD4:0`  | `0010011` |
| `ANDI  RD,RS1,IMM`  | `IIIIIII`  | `IIIII`  | `RS14:0` | `111`   | `RD4:0`  | `0010011` |
| `SLLI  RD,RS1,IMM`  | `0000000`  | `IIII`   | `RS14:0` | `001`   | `RD4:0`  | `0010011` |
| `SRLI  RD,RS1,IMM`  | `0000000`  | `IIII`   | `RS14:0` | `101`   | `RD4:0`  | `0010011` |
| `SRAI  RD,RS1,IMM`  | `0100000`  | `IIII`   | `RS14:0` | `101`   | `RD4:0`  | `0010011` |
| `ADD   RD,RS1,RS2`  | `0000000`  | `RS24:0` | `RS14:0` | `000`   | `RD4:0`  | `0110011` |
| `SUB   RD,RS1,RS2`  | `0100000`  | `RS24:0` | `RS14:0` | `000`   | `RD4:0`  | `0110011` |
| `SLL   RD,RS1,RS2`  | `0000000`  | `RS24:0` | `RS14:0` | `001`   | `RD4:0`  | `0110011` |
| `SLT   RD,RS1,RS2`  | `0000000`  | `RS24:0` | `RS14:0` | `010`   | `RD4:0`  | `0110011` |
| `SLTU  RD,RS1,RS2`  | `0000000`  | `RS24:0` | `RS14:0` | `011`   | `RD4:0`  | `0110011` |
| `XOR   RD,RS1,RS2`  | `0000000`  | `RS24:0` | `RS14:0` | `100`   | `RD4:0`  | `0110011` |
| `SRL   RD,RS1,RS2`  | `0000000`  | `RS24:0` | `RS14:0` | `101`   | `RD4:0`  | `0110011` |
| `SRA   RD,RS1,RS2`  | `0100000`  | `RS24:0` | `RS14:0` | `101`   | `RD4:0`  | `0110011` |
| `OR    RD,RS1,RS2`  | `0000000`  | `RS24:0` | `RS14:0` | `110`   | `RD4:0`  | `0110011` |
| `AND   RD,RS1,RS2`  | `0000000`  | `RS24:0` | `RS14:0` | `111`   | `RD4:0`  | `0110011` |
| `FENCE PRED,SUCC`   | `0000PPP`  | `PSSSS`  | `00000`  | `000`   | `00000`  | `0001111` |
| `FENCE.I`           | `0000P00`  | `00000`  | `00000`  | `001`   | `00000`  | `0001111` |
| `ECALL`             | `0000000`  | `00000`  | `00000`  | `000`   | `00000`  | `1110011` |
| `EBREAK`            | `0000000`  | `00001`  | `00000`  | `000`   | `00000`  | `1110011` |
: RV32I - Base Integer Instruction Set (32 bit)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### RISC-V 64

RISC-V 64 is the 64-bit base integer instruction set architecture for RISC-V processors, aimed at providing enhanced performance and addressing capabilities over its 32-bit counterpart. The 64-bit ISA is suitable for a wide range of applications, from high-performance computing to servers and desktops, as it allows for larger memory addressing and more complex computations. The RISC-V 64 architecture builds on the simplicity and modularity of RISC-V 32, offering a scalable solution that meets the needs of more demanding computational tasks.

**RV64I : Base Integer Instruction Set (64 bit)**

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

| `RV64I`             | `31:25`    | `24:20`  | `19:15`  | `14:12` | `11:7`   | `6:0`     |
|  -------------------|  :------:  |  :----:  |  :----:  |  :---:  |  :----:  |  :------: |
| `LWU   RD, RS1`     | `IIIIIII`  | `IIIII`  | `RS14:0` | `110`   | `RD4:0`  | `0000011` |
| `LD    RD, RS1`     | `IIIIIII`  | `IIIII`  | `RS14:0` | `011`   | `RD4:0`  | `0000011` |
| `SD    RD, RS1,RS2` | `IIIIIII`  | `RS24:0` | `RS14:0` | `011`   | `IIIII`  | `0000011` |
| `SLLI  RD, RS1,IMM` | `0000000`  | `IIIII`  | `RS14:0` | `001`   | `RD4:0`  | `0010011` |
| `SRLI  RD, RS1,IMM` | `0000000`  | `IIIII`  | `RS14:0` | `001`   | `RD4:0`  | `0010011` |
| `SRAI  RD, RS1,IMM` | `0100000`  | `IIIII`  | `RS14:0` | `001`   | `RD4:0`  | `0010011` |
| `ADDIW RD, RS1`     | `IIIIIII`  | `IIIII`  | `RS14:0` | `000`   | `RD4:0`  | `0011011` |
| `SLLIW RD, RS1`     | `0000000`  | `IIIII`  | `RS14:0` | `001`   | `RD4:0`  | `0011011` |
| `SRLIW RD, RS1`     | `0000000`  | `IIIII`  | `RS14:0` | `101`   | `RD4:0`  | `0011011` |
| `SRAIW RD, RS1`     | `0100000`  | `IIIII`  | `RS14:0` | `101`   | `RD4:0`  | `0011011` |
| `ADDW  RD, RS1,RS2` | `0000000`  | `RS24:0` | `RS14:0` | `000`   | `RD4:0`  | `0111011` |
| `SUBW  RD, RS1,RS2` | `0100000`  | `RS24:0` | `RS14:0` | `000`   | `RD4:0`  | `0111011` |
| `SLIW  RD, RS1,RS2` | `0000000`  | `RS24:0` | `RS14:0` | `001`   | `RD4:0`  | `0111011` |
| `SRLW  RD, RS1,RS2` | `0000000`  | `RS24:0` | `RS14:0` | `101`   | `RD4:0`  | `0111011` |
| `SRAW  RD, RS1,RS2` | `0100000`  | `RS24:0` | `RS14:0` | `101`   | `RD4:0`  | `0111011` |
: RV64I - Base Integer Instruction Set (64 bit)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### RISC-V 128

RISC-V 128 represents the 128-bit base integer instruction set architecture for RISC-V processors, designed to support even larger address spaces and higher precision computations than the 64-bit variant. This ISA is intended for future-proofing and accommodating applications that require extensive data processing capabilities, such as advanced scientific computing and cryptographic applications. While still in the early stages of adoption, the 128-bit RISC-V ISA embodies the flexibility and extensibility of the RISC-V architecture, ensuring it can evolve to meet emerging computational demands.

#### ISA Extensions

RISC-V extends its base ISAs with a variety of standard extensions, enhancing functionality beyond basic integer operations. These include extensions for integer multiply and divide operations, atomic instructions for concurrency control, and support for single and double-precision floating-point arithmetic.

##### Standard Extension for Integer Multiply and Divide

The Standard Extension for Integer Multiply and Divide (M) adds support for integer multiplication and division operations to the RISC-V base ISA. This extension includes instructions for signed and unsigned multiplication, as well as division and remainder operations. The M extension enhances the computational capabilities of RISC-V processors, making them suitable for a broader range of applications that require efficient arithmetic processing, such as digital signal processing and complex algorithm implementations.

**RV32M : Standard Extension for Integer Multiply and Divide (32 bit)**

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

| `RV32M`             | `31:25`    | `24:20`  | `19:15`  | `14:12` | `11:7`   | `6:0`     |
|  -------------------|  :------:  |  :----:  |  :----:  |  :---:  |  :----:  |  :------: |
| `MUL    RD,RS1,RS2` | `0000001`  | `RS24:0` | `RS14:0` | `000`   | `RD4:0`  | `0110011` |
| `MULH   RD,RS1,RS2` | `0000001`  | `RS24:0` | `RS14:0` | `001`   | `RD4:0`  | `0110011` |
| `MULHSU RD,RS1,RS2` | `0000001`  | `RS24:0` | `RS14:0` | `010`   | `RD4:0`  | `0110011` |
| `MULHU  RD,RS1,RS2` | `0000001`  | `RS24:0` | `RS14:0` | `011`   | `RD4:0`  | `0110011` |
| `DIV    RD,RS1,RS2` | `0000001`  | `RS24:0` | `RS14:0` | `100`   | `RD4:0`  | `0110011` |
| `DIVU   RD,RS1,RS2` | `0000001`  | `RS24:0` | `RS14:0` | `101`   | `RD4:0`  | `0110011` |
| `REM    RD,RS1,RS2` | `0000001`  | `RS24:0` | `RS14:0` | `110`   | `RD4:0`  | `0110011` |
| `REMU   RD,RS1,RS2` | `0000001`  | `RS24:0` | `RS14:0` | `111`   | `RD4:0`  | `0110011` |
: RV32M - Standard Extension for Integer Multiply and Divide (32 bit)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

**RV64M : Standard Extension for Integer Multiply and Divide (64 bit)**

| `RV64M`              | `31:25`    | `24:20`  | `19:15`  | `14:12` | `11:7`   | `6:0`     |
|  --------------------|  :------:  |  :----:  |  :----:  |  :---:  |  :----:  |  :------: |
| `MULW  RD,RS1,RS2`   | `0000001`  | `RS24:0` | `RS14:0` | `000`   | `RD4:0`  | `0111011` |
| `DIVW  RD,RS1,RS2`   | `0000001`  | `RS24:0` | `RS14:0` | `100`   | `RD4:0`  | `0111011` |
| `DIVUW RD,RS1,RS2`   | `0000001`  | `RS24:0` | `RS14:0` | `101`   | `RD4:0`  | `0111011` |
| `REMW  RD,RS1,RS2`   | `0000001`  | `RS24:0` | `RS14:0` | `110`   | `RD4:0`  | `0111011` |
| `REMUW RD,RS1,RS2`   | `0000001`  | `RS24:0` | `RS14:0` | `111`   | `RD4:0`  | `0111011` |
: RV64M - Standard Extension for Integer Multiply and Divide (64 bit)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### Standard Extension for Atomic Instructions

The Standard Extension for Atomic Instructions (A) introduces atomic memory operations, which are essential for building efficient and reliable multi-threaded applications. This extension includes instructions for atomic load, store, and read-modify-write operations, enabling synchronization primitives like locks and semaphores. The A extension is crucial for modern multi-core processors, allowing them to manage shared resources and execute concurrent tasks effectively, thereby improving performance and robustness in parallel computing environments.

**RV32A : Standard Extension for Atomic Instructions (32 bit)**

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

| `RV32A`                     | `31:25`     | `24:20`  | `19:15`  | `14:12` | `11:7`   | `6:0`     |
|  ---------------------------|  :-------:  |  :----:  |  :----:  |  :---:  |  :----:  |  :------: |
| `LR.W      AQRL,RD,RS1`     | `00010AQRL` | `00000`  | `RS14:0` | `010`   | `RD4:0`  | `0101111` |
| `SC.W      AQRL,RD,RS2,RS1` | `00011AQRL` | `RS24:0` | `RS14:0` | `010`   | `RD4:0`  | `0101111` |
| `AMOSWAP.W AQRL,RD,RS2,RS1` | `00001AQRL` | `RS24:0` | `RS14:0` | `010`   | `RD4:0`  | `0101111` |
| `AMOSADD.W AQRL,RD,RS2,RS1` | `00000AQRL` | `RS24:0` | `RS14:0` | `010`   | `RD4:0`  | `0101111` |
| `AMOSXOR.W AQRL,RD,RS2,RS1` | `00100AQRL` | `RS24:0` | `RS14:0` | `010`   | `RD4:0`  | `0101111` |
| `AMOOR.W   AQRL,RD,RS2,RS1` | `01000AQRL` | `RS24:0` | `RS14:0` | `010`   | `RD4:0`  | `0101111` |
| `AMOAMD.W  AQRL,RD,RS2,RS1` | `01100AQRL` | `RS24:0` | `RS14:0` | `010`   | `RD4:0`  | `0101111` |
| `AMOMIN.W  AQRL,RD,RS2,RS1` | `10000AQRL` | `RS24:0` | `RS14:0` | `010`   | `RD4:0`  | `0101111` |
| `AMOMAX.W  AQRL,RD,RS2,RS1` | `10100AQRL` | `RS24:0` | `RS14:0` | `010`   | `RD4:0`  | `0101111` |
| `AMOMINU.W AQRL,RD,RS2,RS1` | `11000AQRL` | `RS24:0` | `RS14:0` | `010`   | `RD4:0`  | `0101111` |
| `AMOMAXU.W AQRL,RD,RS2,RS1` | `11100AQRL` | `RS24:0` | `RS14:0` | `010`   | `RD4:0`  | `0101111` |
: RV32A - Standard Extension for Atomic Instructions (32 bit)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

**RV64A : Standard Extension for Atomic Instructions (64 bit)**

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

| `RV64A`                     | `31:25`     | `24:20`  | `19:15`  | `14:12` | `11:7`   | `6:0`     |
|  ---------------------------|  :-------:  |  :----:  |  :----:  |  :---:  |  :----:  |  :------: |
| `LR.D AQRL,RD,RS1`          | `00010AQRL` | `00000`  | `RS14:0` | `011`   | `RD4:0`  | `0101111` |
| `SC.D AQRL,RD,RS2,RS1`      | `00011AQRL` | `RS24:0` | `RS14:0` | `011`   | `RD4:0`  | `0101111` |
| `AMOSWAP.D AQRL,RD,RS2,RS1` | `00001AQRL` | `RS24:0` | `RS14:0` | `011`   | `RD4:0`  | `0101111` |
| `AMOSADD.D AQRL,RD,RS2,RS1` | `00000AQRL` | `RS24:0` | `RS14:0` | `011`   | `RD4:0`  | `0101111` |
| `AMOSXOR.D AQRL,RD,RS2,RS1` | `00100AQRL` | `RS24:0` | `RS14:0` | `011`   | `RD4:0`  | `0101111` |
| `AMOOR.D AQRL,RD,RS2,RS1`   | `01000AQRL` | `RS24:0` | `RS14:0` | `011`   | `RD4:0`  | `0101111` |
| `AMOAMD.D AQRL,RD,RS2,RS1`  | `01100AQRL` | `RS24:0` | `RS14:0` | `011`   | `RD4:0`  | `0101111` |
| `AMOMIN.D AQRL,RD,RS2,RS1`  | `10000AQRL` | `RS24:0` | `RS14:0` | `011`   | `RD4:0`  | `0101111` |
| `AMOMAX.D AQRL,RD,RS2,RS1`  | `10100AQRL` | `RS24:0` | `RS14:0` | `011`   | `RD4:0`  | `0101111` |
| `AMOMINU.D AQRL,RD,RS2,RS1` | `11000AQRL` | `RS24:0` | `RS14:0` | `011`   | `RD4:0`  | `0101111` |
| `AMOMAXU.D AQRL,RD,RS2,RS1` | `11100AQRL` | `RS24:0` | `RS14:0` | `011`   | `RD4:0`  | `0101111` |
: RV64A - Standard Extension for Atomic Instructions (64 bit)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### Standard Extension for Single-Precision Floating-Point

The Standard Extension for Single-Precision Floating-Point (F) adds support for single-precision (32-bit) floating-point arithmetic to the RISC-V base ISA. This extension includes instructions for floating-point addition, subtraction, multiplication, division, and other operations, as well as conversion between integer and floating-point formats. The F extension is vital for applications that require efficient handling of real numbers, such as graphics processing, scientific computations, and machine learning algorithms.

**RV32F : Standard Extension for Single-Precision Floating-Point (32 bit)**

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

| `RV32F`                          | `31:25`     | `24:20`  | `19:15`  | `14:12` | `11:7`   | `6:0`     |
|  --------------------------------|  :-------:  |  :----:  |  :----:  |  :---:  |  :----:  |  :------: |
| `FLW FRD,RS1`                    | `IIIIIII`   | `IIIII`  | `FRS1`   | `010`   | `FRD`    | `0000111` |
| `FSW FRS2,RS1`                   | `IIIIIII`   | `FRS2`   | `FRS1`   | `010`   | `IIIII`  | `0100111` |
| `FMADD.S RM,FRD,FRS1,FRS2,FRS3`  | `FRS3_00`   | `FRS2`   | `FRS1`   | `RM`    | `FRD`    | `1000011` |
| `FMSUB.S RM,FRD,FRS1,FRS2,FRS3`  | `FRS3_00`   | `FRS2`   | `FRS1`   | `RM`    | `FRD`    | `1000111` |
| `FNMSUB.S RM,FRD,FRS1,FRS2,FRS3` | `FRS3_00`   | `FRS2`   | `FRS1`   | `RM`    | `FRD`    | `1001011` |
| `FNMADD.S RM,FRD,FRS1,FRS2,FRS3` | `FRS3_00`   | `FRS2`   | `FRS1`   | `RM`    | `FRD`    | `1001111` |
| `FADD.S RM,FRD,FRS1,FRS2,FRS3`   | `0000000`   | `FRS2`   | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FSUB.S RM,FRD,FRS1,FRS2,FRS3`   | `0000100`   | `FRS2`   | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FMUL.S RM,FRD,FRS1,FRS2,FRS3`   | `0001000`   | `FRS2`   | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FDIV.S RM,FRD,FRS1,FRS2,FRS3`   | `0001100`   | `FRS2`   | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FSGNJ.S FRD,FRS1,FRS2`          | `0010000`   | `FRS2`   | `FRS1`   | `000`   | `FRD`    | `1010011` |
| `FSGNJN.S FRD,FRS1,FRS2`         | `0010000`   | `FRS2`   | `FRS1`   | `001`   | `FRD`    | `1010011` |
| `FSGNJX.S FRD,FRS1,FRS2`         | `0010000`   | `FRS2`   | `FRS1`   | `010`   | `FRD`    | `1010011` |
| `FMIN.S FRD,FRS1,FRS2`           | `0010100`   | `FRS2`   | `FRS1`   | `000`   | `FRD`    | `1010011` |
| `FMAX.S FRD,FRS1,FRS2`           | `0010100`   | `FRS2`   | `FRS1`   | `001`   | `FRD`    | `1010011` |
| `FSQRT.S FRD,FRS1,FRS2`          | `0101100`   | `00000`  | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FLE.S FRD,FRS1,FRS2`            | `1010000`   | `FRS2`   | `FRS1`   | `000`   | `FRD`    | `1010011` |
| `FLT.S FRD,FRS1,FRS2`            | `1010000`   | `FRS2`   | `FRS1`   | `001`   | `FRD`    | `1010011` |
| `FEQ.S FRD,FRS1,FRS2`            | `1010000`   | `FRS2`   | `FRS1`   | `010`   | `FRD`    | `1010011` |
| `FCVT.W.S RM,RD,FRS1`            | `1100000`   | `00000`  | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FCVT.WU.S RM,RD,FRS1`           | `1100000`   | `00010`  | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FCVT.S.W RM,RD,FRS1`            | `1101000`   | `00000`  | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FCVT.S.WU RM,RD,FRS1`           | `1101000`   | `00010`  | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FMV.X.S RD,FRS1`                | `1110000`   | `00000`  | `FRS1`   | `000`   | `RD`     | `1010011` |
| `FCLASS.S RD,FRS1`               | `1110000`   | `00000`  | `FRS1`   | `001`   | `RD`     | `1010011` |
| `FMV.S.X RD,FRS1`                | `1111000`   | `00000`  | `RS1`    | `000`   | `FRD`    | `1010011` |
| `FRCSR`                          | `0000000`   | `00011`  | `00000`  | `010`   | `RD`     | `1110011` |
| `FRRM`                           | `0000000`   | `00010`  | `00000`  | `010`   | `RD`     | `1110011` |
| `FRFLAGS`                        | `0000000`   | `00001`  | `00000`  | `010`   | `RD`     | `1110011` |
| `FSCSR`                          | `0000000`   | `00011`  | `RS1`    | `001`   | `RD`     | `1110011` |
| `FSRM`                           | `0000000`   | `00010`  | `RS1`    | `001`   | `RD`     | `1110011` |
| `FSFLAGS`                        | `0000000`   | `00001`  | `RS1`    | `001`   | `RD`     | `1110011` |
| `FSRMI`                          | `0000000`   | `00010`  | `00000`  | `101`   | `RD`     | `1110011` |
| `FSFLAGSI`                       | `0000000`   | `00001`  | `00000`  | `101`   | `RD`     | `1110011` |
: RV32F - Standard Extension for Single-Precision Floating-Point (32 bit)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

**RV64F : Standard Extension for Single-Precision Floating-Point (64 bit)**

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

| `RV64F`                          | `31:25`     | `24:20`  | `19:15`  | `14:12` | `11:7`   | `6:0`     |
|  --------------------------------|  :-------:  |  :----:  |  :----:  |  :---:  |  :----:  |  :------: |
| `FCVT.L.S RM,RD,FRS1`            | `1100000`   | `00010`  | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FCVT.LU.S RM,RD,FRS1`           | `1100000`   | `00011`  | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FCVT.S.L RM,RD,FRS1`            | `1101000`   | `00010`  | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FCVT.S.LU RM,RD,FRS1`           | `1101000`   | `00011`  | `FRS1`   | `RM`    | `FRD`    | `1010011` |
: RV64F - Standard Extension for Single-Precision Floating-Point (64 bit)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### Standard Extension for Double-Precision Floating-Point

The Standard Extension for Double-Precision Floating-Point (D) extends the RISC-V base ISA to support double-precision (64-bit) floating-point arithmetic. This extension provides a comprehensive set of instructions for double-precision operations, offering greater precision and range than single-precision arithmetic. The D extension is essential for high-accuracy computations in fields such as scientific research, financial modeling, and advanced engineering simulations, ensuring that RISC-V processors can meet the demands of computationally intensive applications.

**RV32D : Standard Extension for Double-Precision Floating-Point (32 bit)**

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

| `RV32D`                          | `31:25`     | `24:20`  | `19:15`  | `14:12` | `11:7`   | `6:0`     |
|  --------------------------------|  :-------:  |  :----:  |  :----:  |  :---:  |  :----:  |  :------: |
| `FLW FRD,RS1`                    | `IIIIIII`   | `IIIII`  | `FRS1`   | `011`   | `FRD`    | `0000111` |
| `FSW FRS2,RS1`                   | `IIIIIII`   | `FRS2`   | `FRS1`   | `011`   | `IIIII`  | `0100111` |
| `FMADD.D RM,FRD,FRS1,FRS2,FRS3`  | `FRS3_01`   | `FRS2`   | `FRS1`   | `RM`    | `FRD`    | `1000011` |
| `FMSUB.D RM,FRD,FRS1,FRS2,FRS3`  | `FRS3_01`   | `FRS2`   | `FRS1`   | `RM`    | `FRD`    | `1000111` |
| `FNMSUB.D RM,FRD,FRS1,FRS2,FRS3` | `FRS3_01`   | `FRS2`   | `FRS1`   | `RM`    | `FRD`    | `1001011` |
| `FNMADD.D RM,FRD,FRS1,FRS2,FRS3` | `FRS3_01`   | `FRS2`   | `FRS1`   | `RM`    | `FRD`    | `1001111` |
| `FADD.D RM,FRD,FRS1,FRS2,FRS3`   | `0000001`   | `FRS2`   | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FSUB.D RM,FRD,FRS1,FRS2,FRS3`   | `0000101`   | `FRS2`   | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FMUL.D RM,FRD,FRS1,FRS2,FRS3`   | `0001001`   | `FRS2`   | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FDIV.D RM,FRD,FRS1,FRS2,FRS3`   | `0001101`   | `FRS2`   | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FSGNJ.D FRD,FRS1,FRS2`          | `0010001`   | `FRS2`   | `FRS1`   | `000`   | `FRD`    | `1010011` |
| `FSGNJN.D FRD,FRS1,FRS2`         | `0010001`   | `FRS2`   | `FRS1`   | `001`   | `FRD`    | `1010011` |
| `FSGNJX.D FRD,FRS1,FRS2`         | `0010001`   | `FRS2`   | `FRS1`   | `010`   | `FRD`    | `1010011` |
| `FMIN.D FRD,FRS1,FRS2`           | `0010101`   | `FRS2`   | `FRS1`   | `000`   | `FRD`    | `1010011` |
| `FMAX.D FRD,FRS1,FRS2`           | `0010101`   | `FRS2`   | `FRS1`   | `001`   | `FRD`    | `1010011` |
| `FSQRT.D FRD,FRS1,FRS2`          | `0101101`   | `00000`  | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FLE.D FRD,FRS1,FRS2`            | `1010001`   | `FRS2`   | `FRS1`   | `000`   | `FRD`    | `1010011` |
| `FLT.D FRD,FRS1,FRS2`            | `1010001`   | `FRS2`   | `FRS1`   | `001`   | `FRD`    | `1010011` |
| `FEQ.D FRD,FRS1,FRS2`            | `1010001`   | `FRS2`   | `FRS1`   | `010`   | `FRD`    | `1010011` |
| `FCVT.W.D RM,RD,FRS1`            | `1100001`   | `00000`  | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FCVT.WU.D RM,RD,FRS1`           | `1100001`   | `00010`  | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FCVT.D.W RM,RD,FRS1`            | `1101001`   | `00000`  | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FCVT.D.WU RM,RD,FRS1`           | `1101001`   | `00010`  | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FCLASS.D RD,FRS1`               | `1110001`   | `00000`  | `FRS1`   | `001`   | `RD`     | `1010011` |
| `FCVT.W.D`                       | `1100001`   | `00000`  | `FRS1`   | `RM`    | `RD`     | `1010011` |
| `FCVT.WU.D`                      | `1100001`   | `00001`  | `FRS1`   | `RM`    | `RD`     | `1010011` |
| `FCVT.D.W`                       | `1101001`   | `00000`  | `FRS1`   | `RM`    | `RD`     | `1010011` |
| `FCVT.D.WU`                      | `1101001`   | `00001`  | `FRS1`   | `RM`    | `RD`     | `1010011` |
: RV32D - Standard Extension for Double-Precision Floating-Point (32 bit)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

**RV64D : Standard Extension for Double-Precision Floating-Point (64 bit)**

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

| `RV64D`                          | `31:25`     | `24:20`  | `19:15`  | `14:12` | `11:7`   | `6:0`     |
|  --------------------------------|  :-------:  |  :----:  |  :----:  |  :---:  |  :----:  |  :------: |
| `FCVT.L.D RM,RD,FRS1`            | `1100001`   | `00010`  | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FCVT.LU.D RM,RD,FRS1`           | `1100001`   | `00011`  | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FCVT.D.L RM,RD,FRS1`            | `1101001`   | `00010`  | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FCVT.D.LU RM,RD,FRS1`           | `1101001`   | `00011`  | `FRS1`   | `RM`    | `FRD`    | `1010011` |
| `FMV.X.D RD,FRS1`                | `1110001`   | `00000`  | `FRS1`   | `000`   | `RD`     | `1010011` |
| `FMV.D.X RD,FRS1`                | `1111001`   | `00000`  | `RS1`    | `000`   | `FRD`    | `1010011` |
: RV64D - Standard Extension for Double-Precision Floating-Point (64 bit)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### ISA Modes

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### RISC-V User

The RISC-V User mode is the most basic privilege level in the RISC-V architecture, intended for executing application code. This mode restricts access to certain system resources and privileged instructions, ensuring that user applications cannot directly interfere with critical system functions or compromise system security. The User mode is designed to provide a safe and isolated environment for running user-level software, supporting the principles of secure and robust system design.

##### RISC-V Supervisor

The RISC-V Supervisor mode is a higher privilege level than User mode, designed for executing operating system kernels and other system-level software. This mode provides access to additional system resources and privileged instructions necessary for managing hardware and executing system services. The Supervisor mode enables efficient control over process scheduling, memory management, and device I/O, facilitating the development of sophisticated and responsive operating systems on RISC-V processors.

##### RISC-V Hypervisor

The RISC-V Hypervisor mode adds another layer of privilege for managing virtual machines and hypervisors. This mode allows the execution of multiple operating systems concurrently on a single RISC-V processor, providing isolation and resource allocation between virtual machines. The Hypervisor mode supports advanced virtualization features, enabling efficient and secure deployment of virtualized environments, which are essential for modern cloud computing and data center applications.

##### RISC-V Machine

The RISC-V Machine mode is the highest privilege level in the RISC-V architecture, intended for executing firmware and low-level system software. This mode has unrestricted access to all system resources and instructions, allowing it to perform critical initialization and configuration tasks. The Machine mode is responsible for bootstrapping the system, managing hardware, and transitioning control to the operating system. It provides the foundational layer of control necessary for the secure and efficient operation of RISC-V processors.

### OpenRISC ISA

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### ISA Bases

The OpenRISC ISA provides options such as OpenRISC 32 and OpenRISC 64, catering to different performance and application requirements. These base configurations dictate the register widths and memory addressing capabilities of OpenRISC processors.

##### OpenRISC 32

The OpenRISC 32 is the 32-bit instruction set architecture for the OpenRISC family of processors. Designed with a focus on simplicity, flexibility, and performance, the OpenRISC 32-bit ISA provides a robust set of instructions that enable efficient execution of computational tasks. This architecture supports a wide range of applications, from embedded systems to general-purpose computing, by offering a balance between performance and resource efficiency. OpenRISC 32's open-source nature encourages innovation and customization, making it a popular choice for developers seeking to tailor their systems to specific needs.

##### OpenRISC 64

The OpenRISC 64 is the 64-bit instruction set architecture for the OpenRISC family, extending the capabilities of the 32-bit version to support more advanced computing requirements. This architecture is designed to handle larger data sizes and memory addressing, making it suitable for high-performance applications such as scientific computing, data-intensive tasks, and enterprise-level processing. The OpenRISC 64-bit ISA leverages the strengths of the 32-bit architecture while providing enhanced computational power and scalability, meeting the demands of modern, complex systems.

#### ISA Extensions

OpenRISC extends its ISA through various extensions that enhance its capabilities in specific areas of computation and I/O management, although specific extensions are not detailed here.

#### ISA Modes

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### OpenRISC User

The OpenRISC User mode is the standard operational mode for running application-level code on OpenRISC processors. In this mode, the processor executes user programs with restricted access to critical system resources and privileged instructions, ensuring a secure execution environment. The User mode is designed to protect the integrity of the system by isolating application processes, preventing them from interfering with the core system functions, and enhancing the overall stability and security of OpenRISC-based platforms.

##### OpenRISC Supervisor

The OpenRISC Supervisor mode provides a higher level of privilege compared to User mode, allowing the execution of system-level code and management of critical resources. In this mode, the processor has access to privileged instructions and hardware features necessary for overseeing system operations, such as memory management, interrupt handling, and peripheral control. The Supervisor mode is essential for maintaining system stability and performance, enabling efficient management of resources and ensuring reliable operation of the OpenRISC system.

##### OpenRISC Hypervisor

The OpenRISC Hypervisor mode, although not commonly implemented in traditional OpenRISC systems, theoretically allows for the management and execution of multiple virtual machines on a single processor. This mode provides the necessary privileges to control and allocate resources among virtual machines, ensuring isolation and efficient operation of each instance. The Hypervisor mode is critical for virtualization environments, supporting advanced features like workload balancing and secure multi-tenant computing, thereby enhancing the versatility and utility of OpenRISC processors in modern computing applications.

##### OpenRISC Machine

The OpenRISC Machine mode is the most privileged mode of operation in the OpenRISC architecture, designed for executing the lowest-level firmware and hardware initialization tasks. In this mode, the processor has unrestricted access to all system resources and privileged instructions, enabling complete control over hardware configuration and operation. The Machine mode is responsible for critical functions such as booting the system, initializing hardware components, and configuring system settings, ensuring a stable and functional foundation for higher-level software and applications on OpenRISC-based systems.

### MSP430 ISA

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### ISA Bases

The MSP430 ISA is primarily represented by the MSP430 16 base configuration, which specifies a 16-bit architecture suitable for low-power microcontroller applications. This base architecture defines the register size and memory addressing capabilities of MSP430 processors.

##### MSP430 16

The MSP430 16 refers to the 16-bit instruction set architecture (ISA) of the MSP430 microcontroller family. Designed for ultra-low-power applications, the MSP430 16-bit ISA provides a streamlined set of instructions that enable efficient execution of tasks with minimal power consumption. This ISA is particularly suited for battery-operated devices, such as portable medical equipment, wearable technology, and industrial sensors, where power efficiency and extended battery life are crucial. The 16-bit architecture balances performance and simplicity, making it an ideal choice for embedded systems requiring reliable and cost-effective solutions.

#### ISA Extensions

The MSP430 ISA, while not explicitly detailed here, may include specific extensions that enhance its capabilities in handling peripherals or specialized computation tasks.

#### ISA Modes

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### MSP430 User

The MSP430 User mode is the basic operational mode for the MSP430 microcontroller, intended for running user-level applications. In this mode, the microcontroller executes application code with restricted access to certain system resources and privileged instructions, ensuring a secure and stable operating environment. The User mode is designed to protect the system from accidental or malicious interference by isolating application processes, thereby enhancing the overall robustness and security of the MSP430-based systems.

##### MSP430 Supervisor

The MSP430 Supervisor mode is a higher privilege level than User mode, designed for executing critical system-level tasks and managing system resources. In this mode, the microcontroller has access to privileged instructions and hardware resources necessary for overseeing the overall operation of the device. The Supervisor mode is essential for functions such as interrupt handling, memory management, and peripheral control, providing the necessary authority to maintain system stability and performance in complex applications.

##### MSP430 Hypervisor

The MSP430 Hypervisor mode, while not traditionally associated with the MSP430 microcontroller, would theoretically allow for the management of multiple virtual machines on a single processor. In systems where hypervisor capabilities are implemented, this mode would enable the execution of multiple operating systems concurrently, each running in its own isolated environment. This advanced mode would be critical for applications requiring virtualization, providing robust resource allocation and isolation to ensure reliable and efficient multi-tenant operation.

##### MSP430 Machine

The MSP430 Machine mode is the highest privilege level in the MSP430 microcontroller architecture, designed for executing the lowest-level firmware and hardware initialization routines. This mode grants unrestricted access to all system resources and privileged instructions, allowing for complete control over the microcontroller's operation. The Machine mode is responsible for critical startup processes, such as initializing hardware components, configuring system settings, and transitioning control to the operating system or application code, ensuring the foundational stability and functionality of the MSP430-based systems.

## ELEMENTS

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### Hardware

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
cd synthesis/yosys
source synthesize.sh
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### ASIC for Design

Application-Specific Integrated Circuits (ASICs) are custom-designed integrated circuits tailored for specific applications or functions, offering high performance and power efficiency. ASICs like those designed for the MSP430, OpenRISC, and RISC-V architectures are optimized for their respective instruction sets and intended uses, ranging from embedded systems to high-performance computing.

type:

```
cd synthesis/qflow
source flow.sh
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### MSP430

Application-Specific Integrated Circuit (ASIC) design for MSP430 involves creating customized silicon chips specifically optimized for the MSP430 microcontroller architecture. This process includes designing and fabricating circuits that implement the MSP430's instruction set, peripherals, and interfaces, tailored to meet specific application requirements. Utilizing ASICs for MSP430 enables high performance, reduced power consumption, and minimized physical footprint, making them ideal for applications where efficiency and space are critical, such as in portable and battery-operated devices.

##### OpenRISC

ASIC design for OpenRISC focuses on developing custom integrated circuits based on the OpenRISC architecture, a family of open-source RISC processor designs. This entails designing specialized hardware to implement OpenRISC's instruction set, memory hierarchy, and I/O functionalities, ensuring optimized performance for target applications. By leveraging ASIC technology for OpenRISC, developers can achieve significant enhancements in speed, power efficiency, and system integration, tailored to the specific needs of embedded systems, industrial automation, and other high-performance computing applications.

##### RISC-V

ASIC design for RISC-V involves creating dedicated hardware tailored to the RISC-V instruction set architecture, known for its open and extensible nature. This process includes developing custom circuits that provide optimized processing, memory management, and peripheral interfacing capabilities specific to RISC-V. Implementing ASICs for RISC-V allows for highly efficient and high-performance solutions, making it suitable for a wide range of applications from consumer electronics to advanced computing systems, benefiting from RISC-V's scalability and modularity.

#### FPGA for Model

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

type:

```
cd synthesis/symbiflow
source flow.sh
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### MSP430

Field-Programmable Gate Array (FPGA) modeling for MSP430 involves using reconfigurable hardware to emulate the MSP430 microcontroller architecture. This approach allows developers to prototype and test MSP430-based designs quickly and efficiently, without the need for custom silicon fabrication. FPGAs provide flexibility in modifying the design, enabling rapid iteration and validation of various configurations and features. FPGA modeling is particularly valuable for early-stage development, educational purposes, and experimental projects involving the MSP430.

##### OpenRISC

FPGA modeling for OpenRISC utilizes reconfigurable hardware to implement and test the OpenRISC architecture. This method allows for the rapid development and validation of OpenRISC-based systems, providing a flexible platform to explore different design choices and optimizations. Using FPGAs for OpenRISC modeling enables quick prototyping, debugging, and performance analysis, making it an essential tool for developers working on innovative projects, academic research, and complex embedded applications requiring customization and rapid deployment.

##### RISC-V

FPGA modeling for RISC-V involves using configurable logic blocks to emulate the RISC-V processor architecture, facilitating rapid prototyping and testing of RISC-V designs. This approach allows developers to experiment with various RISC-V configurations, extensions, and custom instructions in a flexible and reconfigurable environment. FPGA modeling provides a practical and efficient way to validate and optimize RISC-V implementations before committing to ASIC production, supporting the iterative design process and accelerating the development cycle for cutting-edge computing solutions.

### Software

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

#### MSP430

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### MSP430 Tests

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

###### ISA 16

The ISA 16 tests for MSP430 focus on validating the functionality and performance of the 16-bit instruction set architecture. These tests are crucial for ensuring that the MSP430 microcontrollers execute instructions correctly and efficiently. They cover various aspects of the ISA, including arithmetic operations, control flow, and memory access, providing a comprehensive assessment of the microcontroller's capabilities. By rigorously testing the ISA 16, developers can identify and address any issues, ensuring reliable and predictable behavior in real-world applications.

##### MSP430 Bare Metal

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

###### C Language

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

###### C++ Language

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

###### Go Language

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

###### Rust Language

Rust language support for MSP430 in a bare metal environment brings the benefits of safety and concurrency to embedded programming. Rust's strong emphasis on memory safety and its ability to prevent common programming errors such as null pointer dereferencing and data races make it an ideal choice for developing reliable and secure applications. Writing bare metal applications in Rust on MSP430 ensures that developers can create high-performance code with confidence in its correctness and safety.

Hello QueenField in Rust Language:

```rust
fn main() {
  println!("Hello QueenField!");
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### MSP430 Operating System

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

###### GNU Linux

GNU Linux support for MSP430 allows the microcontroller to run a full-featured operating system, providing a rich set of tools and libraries for application development. This enables more complex and sophisticated applications to be developed on MSP430, leveraging the extensive ecosystem of Linux software. Running GNU Linux on MSP430 facilitates the development of networked, multitasking, and user-space applications, expanding the potential use cases for the microcontroller.

###### GNU Hurd

GNU Hurd support for MSP430 offers an alternative operating system environment based on the GNU Mach microkernel. Hurd provides a flexible and modular architecture that allows for fine-grained control over system resources. Running GNU Hurd on MSP430 enables developers to explore advanced system programming concepts and create highly customizable operating system components, opening new possibilities for innovative embedded applications on the MSP430 platform.

##### MSP430 Distribution

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

###### GNU Debian

GNU Debian distribution for MSP430 provides a comprehensive and user-friendly package management system, making it easier to install, update, and manage software on MSP430 devices. Debian's extensive repository of precompiled packages ensures that developers have access to a wide range of tools and libraries, simplifying the development process and enhancing productivity. The Debian distribution for MSP430 supports robust and scalable application development, leveraging the stability and reliability of the Debian ecosystem.

###### GNU Fedora

GNU Fedora distribution for MSP430 offers a cutting-edge platform with the latest software and technologies, tailored for MSP430 microcontrollers. Fedora's emphasis on innovation and rapid updates ensures that developers have access to the newest features and improvements. Using the Fedora distribution on MSP430, developers can build and deploy modern, high-performance applications, benefiting from the extensive community support and rich documentation provided by the Fedora project.

#### OpenRISC

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### OpenRISC Tests

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

###### ISA 32

The ISA 32 tests for OpenRISC focus on evaluating the 32-bit instruction set architecture, ensuring that the processor correctly executes a wide range of instructions. These tests are essential for verifying the functionality, performance, and reliability of OpenRISC processors. By thoroughly testing the ISA 32, developers can identify potential issues and optimize the processor's performance, ensuring that it meets the demands of various applications, from embedded systems to more complex computing tasks.

###### ISA 64

The ISA 64 tests for OpenRISC extend the evaluation to the 64-bit instruction set architecture, providing a comprehensive assessment of its capabilities. These tests cover all aspects of the 64-bit ISA, including arithmetic, control flow, and memory operations. By conducting rigorous ISA 64 tests, developers can ensure that OpenRISC processors deliver the necessary performance and reliability for high-performance computing and advanced applications, addressing the needs of more demanding computational tasks.

##### OpenRISC Bare Metal

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

###### C Language

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

###### C++ Language

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

###### Go Language

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

###### Rust Language

Rust language support for OpenRISC in a bare metal environment brings the advantages of memory safety and concurrency to embedded programming. Rust's emphasis on preventing common programming errors, such as null pointer dereferencing and data races, makes it an ideal choice for developing reliable and secure applications. Writing bare metal applications in Rust on OpenRISC ensures high performance and correctness, providing developers with confidence in the safety and efficiency of their code.

Hello QueenField in Rust Language:

```rust
fn main() {
  println!("Hello QueenField!");
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### OpenRISC Operating System

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

###### GNU Linux

GNU Linux support for OpenRISC provides a full-featured operating system environment, offering a rich set of tools and libraries for application development. This enables the development of complex and sophisticated applications on OpenRISC processors, leveraging the extensive Linux ecosystem. Running GNU Linux on OpenRISC facilitates the creation of networked, multitasking, and user-space applications, significantly expanding the range of potential use cases for OpenRISC.

###### GNU Hurd

GNU Hurd support for OpenRISC offers an alternative operating system environment based on the GNU Mach microkernel. Hurd provides a modular and flexible architecture, allowing fine-grained control over system resources. Running GNU Hurd on OpenRISC enables developers to explore advanced system programming concepts and create highly customizable operating system components, opening new possibilities for innovative embedded applications on the OpenRISC platform.

##### OpenRISC Distribution

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

###### GNU Debian

GNU Debian distribution for OpenRISC provides a comprehensive package management system, simplifying the installation, updating, and management of software on OpenRISC devices. Debian's extensive repository of precompiled packages ensures that developers have access to a wide range of tools and libraries, enhancing productivity and simplifying development. The Debian distribution for OpenRISC supports robust and scalable application development, leveraging the stability and reliability of the Debian ecosystem.

###### GNU Fedora

GNU Fedora distribution for OpenRISC offers a cutting-edge platform with the latest software and technologies tailored for OpenRISC processors. Fedora's emphasis on innovation and rapid updates ensures that developers have access to the newest features and improvements. Using the Fedora distribution on OpenRISC, developers can build and deploy modern, high-performance applications, benefiting from the extensive community support and rich documentation provided by the Fedora project.

#### RISC-V

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### RISC-V Tests

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

###### ISA 32

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

###### ISA 64

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

###### ISA 128

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

##### RISC-V Bare Metal

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

###### C Language

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

###### C++ Language

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

###### Go Language

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

###### Rust Language

Rust language support for RISC-V in a bare metal environment brings the advantages of memory safety and concurrency to embedded programming. Rust's emphasis on preventing common programming errors, such as null pointer dereferencing and data races, makes it an ideal choice for developing reliable and secure applications. Writing bare metal applications in Rust on RISC-V ensures high performance and correctness, providing developers with confidence in the safety and efficiency of their code.

Hello QueenField in Rust Language:

```rust
fn main() {
  println!("Hello QueenField!");
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

##### RISC-V Operating System

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

###### GNU Linux

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

###### GNU Hurd

GNU Hurd support for RISC-V offers an alternative operating system environment based on the GNU Mach microkernel. Hurd provides a modular and flexible architecture, allowing fine-grained control over system resources. Running GNU Hurd on RISC-V enables developers to explore advanced system programming concepts and create highly customizable operating system components, opening new possibilities for innovative embedded applications on the RISC-V platform.

##### RISC-V Distribution

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

###### GNU Debian

GNU Debian distribution for RISC-V provides a comprehensive package management system, simplifying the installation, updating, and management of software on RISC-V devices. Debian's extensive repository of precompiled packages ensures that developers have access to a wide range of tools and libraries, enhancing productivity and simplifying development. The Debian distribution for RISC-V supports robust and scalable application development, leveraging the stability and reliability of the Debian ecosystem.

###### GNU Fedora

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
