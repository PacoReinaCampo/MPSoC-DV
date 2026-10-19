# INSTRUCTIONS TESTS

type:

```bash
sudo apt install -y autoconf
sudo apt install -y automake
sudo apt install -y autotools-dev
sudo apt install -y bc
sudo apt install -y bison
sudo apt install -y build-essential
sudo apt install -y curl
sudo apt install -y flex
sudo apt install -y gawk
sudo apt install -y gperf
sudo apt install -y libexpat-dev
sudo apt install -y libgmp-dev
sudo apt install -y libmpc-dev
sudo apt install -y libmpfr-dev
sudo apt install -y libtool
sudo apt install -y patchutils
sudo apt install -y python3
sudo apt install -y texinfo
sudo apt install -y zlib1g-dev
```

type:

```bash
git clone --recursive https://github.com/riscv/riscv-gnu-toolchain

cd riscv-gnu-toolchain

./configure --prefix=/opt/riscv-elf-gcc
sudo make clean
sudo make

./configure --prefix=/opt/riscv-app-gcc --enable-multilib
sudo make clean
sudo make linux
```

| Tool       | Address                                                   |
|------------|-----------------------------------------------------------|
| `binutils` | `https://sourceware.org/git/binutils-gdb.git`             |
| `dejagnu`  | `https://git.savannah.gnu.org/git/dejagnu.git`            |
| `gcc`      | `https://gcc.gnu.org/git/gcc.git`                         |
| `gdb`      | `https://sourceware.org/git/binutils-gdb.git`             |
| `glibc`    | `https://sourceware.org/git/glibc.git`                    |
| `llvm`     | `https://github.com/llvm/llvm-project.git`                |
| `musl`     | `https://git.musl-libc.org/git/musl`                      |
| `newlib`   | `https://sourceware.org/git/newlib-cygwin.git`            |
| `pk`       | `https://github.com/riscv-software-src/riscv-pk.git`      |
| `qemu`     | `https://gitlab.com/qemu-project/qemu.git`                |
| `spike`    | `https://github.com/riscv-software-src/riscv-isa-sim.git` |
| `uclibc`   | `https://git.uclibc-ng.org/git/uclibc-ng.git`             |

:GNU ToolChain

Here is the list of configure option for specify source tree:

```bash
--with-binutils-src
--with-dejagnu-src
--with-gcc-src
--with-gdb-src
--with-glibc-src
--with-llvm-src
--with-musl-src
--with-newlib-src
--with-pk-src
--with-qemu-src
--with-spike-src
--with-uclibc-src
```

| Tool            |
|-----------------|
| `riscv32-elf`   |
| `riscv32-glibc` |

:Compilation 32-Bit

| Tool            |
|-----------------|
| `riscv64-elf`   |
| `riscv64-glibc` |
| `riscv64-musl`  |

:Compilation 64-Bit

## TEST 32 BIT

Verification of instructions in the RISC-V ISA involves rigorous testing and validation procedures to ensure correctness, functionality, and adherence to the ISA specifications across different implementations and extensions. Testing begins with unit tests focusing on individual instructions, verifying their behavior under various input conditions and edge cases. These tests aim to confirm that each instruction performs its intended operation correctly, including proper handling of operands, status flags, and side effects.

To further validate instruction correctness, integration tests assess the interaction between instructions within program sequences. Integration tests cover common usage scenarios, corner cases, and exception handling to verify the seamless execution flow and maintain consistency with the RISC-V ISA's architectural guarantees. These tests also evaluate performance characteristics, such as latency and throughput, to ensure optimal operation across diverse application workloads and hardware configurations.

Comprehensive verification includes compliance testing against the official RISC-V ISA specifications and ABI standards. Compliance tests validate instruction encoding, behavior, and expected results across different compliance suites and benchmarks. This process ensures conformance with the standard ISA semantics and compatibility with software tools, compilers, and operating systems that target RISC-V processors.

Moreover, validation of instructions extends to simulation and emulation environments where software models and virtual platforms replicate RISC-V processor behavior. Simulation-based testing evaluates instruction execution timing, resource utilization, and architectural features such as memory hierarchy and cache behavior. Emulation environments enable testing across various RISC-V implementations, facilitating compatibility verification and performance profiling under realistic operating conditions.

Overall, thorough verification of instructions in the RISC-V ISA is essential to guarantee reliability, security, and performance across a broad spectrum of computing applications—from embedded systems to high-performance computing clusters. By adhering to rigorous testing methodologies and standards, developers ensure that RISC-V processors deliver consistent and predictable behavior while promoting innovation and scalability in the open-source hardware ecosystem.

Format of a line in the table:

`<test>`

| test rv32                | status      |
|--------------------------|:------------|
| `rv32ui-p-add`           | `passed`    |
| `rv32ui-p-addi`          | `passed`    |
| `rv32ui-p-and`           | `passed`    |
| `rv32ui-p-andi`          | `passed`    |
| `rv32ui-p-auipc`         | `passed`    |
| `rv32ui-p-beq`           | `passed`    |
| `rv32ui-p-bge`           | `passed`    |
| `rv32ui-p-bgeu`          | `passed`    |
| `rv32ui-p-blt`           | `passed`    |
| `rv32ui-p-bltu`          | `passed`    |
| `rv32ui-p-bne`           | `passed`    |
| `rv32ui-p-fence_i`       | `passed`    |
| `rv32ui-p-jal`           | `passed`    |
| `rv32ui-p-jalr`          | `passed`    |
| `rv32ui-p-lb`            | `passed`    |
| `rv32ui-p-lbu`           | `passed`    |
| `rv32ui-p-lh`            | `passed`    |
| `rv32ui-p-lhu`           | `passed`    |
| `rv32ui-p-lui`           | `passed`    |
| `rv32ui-p-lw`            | `passed`    |
| `rv32ui-p-ma_data`       | `no passed` |
| `rv32ui-p-or`            | `passed`    |
| `rv32ui-p-ori`           | `passed`    |
| `rv32ui-p-sb`            | `passed`    |
| `rv32ui-p-sh`            | `passed`    |
| `rv32ui-p-simple`        | `passed`    |
| `rv32ui-p-sll`           | `passed`    |
| `rv32ui-p-slli`          | `passed`    |
| `rv32ui-p-slt`           | `passed`    |
| `rv32ui-p-slti`          | `passed`    |
| `rv32ui-p-sltiu`         | `passed`    |
| `rv32ui-p-sltu`          | `passed`    |
| `rv32ui-p-sra`           | `passed`    |
| `rv32ui-p-srai`          | `passed`    |
| `rv32ui-p-srl`           | `passed`    |
| `rv32ui-p-srli`          | `passed`    |
| `rv32ui-p-sub`           | `passed`    |
| `rv32ui-p-sw`            | `passed`    |
| `rv32ui-p-xor`           | `passed`    |
| `rv32ui-p-xori`          | `passed`    |
| `rv32ui-v-add`           | `no passed` |
| `rv32ui-v-addi`          | `no passed` |
| `rv32ui-v-and`           | `no passed` |
| `rv32ui-v-andi`          | `no passed` |
| `rv32ui-v-auipc`         | `no passed` |
| `rv32ui-v-beq`           | `no passed` |
| `rv32ui-v-bge`           | `no passed` |
| `rv32ui-v-bgeu`          | `no passed` |
| `rv32ui-v-blt`           | `no passed` |
| `rv32ui-v-bltu`          | `no passed` |
| `rv32ui-v-bne`           | `no passed` |
| `rv32ui-v-fence_i`       | `no passed` |
| `rv32ui-v-jal`           | `no passed` |
| `rv32ui-v-jalr`          | `no passed` |
| `rv32ui-v-lb`            | `no passed` |
| `rv32ui-v-lbu`           | `no passed` |
| `rv32ui-v-lh`            | `no passed` |
| `rv32ui-v-lhu`           | `no passed` |
| `rv32ui-v-lui`           | `no passed` |
| `rv32ui-v-lw`            | `no passed` |
| `rv32ui-v-ma_data`       | `no passed` |
| `rv32ui-v-or`            | `no passed` |
| `rv32ui-v-ori`           | `no passed` |
| `rv32ui-v-sb`            | `no passed` |
| `rv32ui-v-sh`            | `no passed` |
| `rv32ui-v-simple`        | `no passed` |
| `rv32ui-v-sll`           | `no passed` |
| `rv32ui-v-slli`          | `no passed` |
| `rv32ui-v-slt`           | `no passed` |
| `rv32ui-v-slti`          | `no passed` |
| `rv32ui-v-sltiu`         | `no passed` |
| `rv32ui-v-sltu`          | `no passed` |
| `rv32ui-v-sra`           | `no passed` |
| `rv32ui-v-srai`          | `no passed` |
| `rv32ui-v-srl`           | `no passed` |
| `rv32ui-v-srli`          | `no passed` |
| `rv32ui-v-sub`           | `no passed` |
| `rv32ui-v-sw`            | `no passed` |
| `rv32ui-v-xor`           | `no passed` |
| `rv32ui-v-xori`          | `no passed` |

:RV32I - "RV32I Base Integer Instruction Set"

The RV32I table details the base integer instruction set of the RISC-V ISA for 32-bit implementations, encompassing fundamental arithmetic, logical, and control instructions essential for basic computation.

| test rv32                | status      |
|--------------------------|:------------|
| `rv32um-p-div`           | `passed`    |
| `rv32um-p-divu`          | `passed`    |
| `rv32um-p-mul`           | `passed`    |
| `rv32um-p-mulh`          | `passed`    |
| `rv32um-p-mulhsu`        | `passed`    |
| `rv32um-p-mulhu`         | `passed`    |
| `rv32um-p-rem`           | `passed`    |
| `rv32um-p-remu`          | `passed`    |
| `rv32um-v-div`           | `no passed` |
| `rv32um-v-divu`          | `no passed` |
| `rv32um-v-mul`           | `no passed` |
| `rv32um-v-mulh`          | `no passed` |
| `rv32um-v-mulhsu`        | `no passed` |
| `rv32um-v-mulhu`         | `no passed` |
| `rv32um-v-rem`           | `no passed` |
| `rv32um-v-remu`          | `no passed` |

:RV32M - "RV32M Standard Extension for Integer Multiply and Divide"

This table specifies the RV32M extension, which adds support for integer multiplication and division instructions to the base RV32I instruction set, enhancing computational capabilities.

| test rv32                | status      |
|--------------------------|:------------|
| `rv32ua-p-amoadd_w`      | `no passed` |
| `rv32ua-p-amoand_w`      | `no passed` |
| `rv32ua-p-amomaxu_w`     | `no passed` |
| `rv32ua-p-amomax_w`      | `no passed` |
| `rv32ua-p-amominu_w`     | `no passed` |
| `rv32ua-p-amomin_w`      | `no passed` |
| `rv32ua-p-amoor_w`       | `no passed` |
| `rv32ua-p-amoswap_w`     | `no passed` |
| `rv32ua-p-amoxor_w`      | `no passed` |
| `rv32ua-p-lrsc`          | `no passed` |
| `rv32ua-v-amoadd_w`      | `no passed` |
| `rv32ua-v-amoand_w`      | `no passed` |
| `rv32ua-v-amomaxu_w`     | `no passed` |
| `rv32ua-v-amomax_w`      | `no passed` |
| `rv32ua-v-amominu_w`     | `no passed` |
| `rv32ua-v-amomin_w`      | `no passed` |
| `rv32ua-v-amoor_w`       | `no passed` |
| `rv32ua-v-amoswap_w`     | `no passed` |
| `rv32ua-v-amoxor_w`      | `no passed` |
| `rv32ua-v-lrsc`          | `no passed` |

:RV32A - "RV32A Standard Extension for Atomic Instructions"

The RV32A table outlines the RV32A extension, which introduces atomic memory operations to ensure thread-safe execution in multi-threaded environments, enhancing concurrency control.

| test rv32                | status      |
|--------------------------|:------------|
| `rv32uf-p-fadd`          | `no passed` |
| `rv32uf-p-fclass`        | `no passed` |
| `rv32uf-p-fcmp`          | `no passed` |
| `rv32uf-p-fcvt`          | `no passed` |
| `rv32uf-p-fcvt_w`        | `no passed` |
| `rv32uf-p-fdiv`          | `no passed` |
| `rv32uf-p-fmadd`         | `no passed` |
| `rv32uf-p-fmin`          | `no passed` |
| `rv32uf-p-ldst`          | `no passed` |
| `rv32uf-p-move`          | `no passed` |
| `rv32uf-p-recoding`      | `no passed` |
| `rv32uf-v-fadd`          | `no passed` |
| `rv32uf-v-fclass`        | `no passed` |
| `rv32uf-v-fcmp`          | `no passed` |
| `rv32uf-v-fcvt`          | `no passed` |
| `rv32uf-v-fcvt_w`        | `no passed` |
| `rv32uf-v-fdiv`          | `no passed` |
| `rv32uf-v-fmadd`         | `no passed` |
| `rv32uf-v-fmin`          | `no passed` |
| `rv32uf-v-ldst`          | `no passed` |
| `rv32uf-v-move`          | `no passed` |
| `rv32uf-v-recoding`      | `no passed` |

:RV32F - "RV32F Standard Extension for Single-Precision Floating-Point"

This table describes the RV32F extension, which adds support for single-precision floating-point arithmetic and operations to the RISC-V ISA, enabling computation with floating-point numbers.

| test rv32                | status      |
|--------------------------|:------------|
| `rv32ud-p-fadd`          | `passed`    |
| `rv32ud-p-fclass`        | `passed`    |
| `rv32ud-p-fcmp`          | `passed`    |
| `rv32ud-p-fcvt`          | `passed`    |
| `rv32ud-p-fcvt_w`        | `passed`    |
| `rv32ud-p-fdiv`          | `passed`    |
| `rv32ud-p-fmadd`         | `passed`    |
| `rv32ud-p-fmin`          | `passed`    |
| `rv32ud-p-ldst`          | `passed`    |
| `rv32ud-p-recoding`      | `passed`    |
| `rv32ud-v-fadd`          | `no passed` |
| `rv32ud-v-fclass`        | `no passed` |
| `rv32ud-v-fcmp`          | `no passed` |
| `rv32ud-v-fcvt`          | `no passed` |
| `rv32ud-v-fcvt_w`        | `no passed` |
| `rv32ud-v-fdiv`          | `no passed` |
| `rv32ud-v-fmadd`         | `no passed` |
| `rv32ud-v-fmin`          | `no passed` |
| `rv32ud-v-ldst`          | `no passed` |
| `rv32ud-v-recoding`      | `no passed` |

:RV32D - "RV32D Standard Extension for Double-Precision Floating-Point"

The RV32D table details the RV32D extension, which extends the RISC-V ISA to support double-precision floating-point arithmetic and operations, facilitating higher precision calculations.

| test rv32                | status      |
|--------------------------|:------------|
| `rv32uc-p-rvc`           | `no passed` |
| `rv32uc-v-rvc`           | `no passed` |

:RV32C - "RV32C Standard Extension for Compressed Instructions"

This table outlines the RV32C extension, which introduces compressed instruction formats to reduce code size while maintaining compatibility with the base RV32I instruction set, optimizing program memory usage.

| test rv32                | status      |
|--------------------------|:------------|
| `rv32uzba-p-sh1add`      | `no passed` |
| `rv32uzba-p-sh2add`      | `no passed` |
| `rv32uzba-p-sh3add`      | `no passed` |
| `rv32uzba-v-sh1add`      | `no passed` |
| `rv32uzba-v-sh2add`      | `no passed` |
| `rv32uzba-v-sh3add`      | `no passed` |

:RV32ZBA - "RV32ZBA Standard Extension)"

The RV32ZBA table specifies the RV32ZBA extension, which adds bit manipulation and bit field instructions to the RISC-V ISA, enhancing support for bitwise operations and compact data structures.

| test rv32                | status      |
|--------------------------|:------------|
| `rv32uzbb-p-andn`        | `no passed` |
| `rv32uzbb-p-clz`         | `no passed` |
| `rv32uzbb-p-cpop`        | `no passed` |
| `rv32uzbb-p-ctz`         | `no passed` |
| `rv32uzbb-p-max`         | `no passed` |
| `rv32uzbb-p-maxu`        | `no passed` |
| `rv32uzbb-p-min`         | `no passed` |
| `rv32uzbb-p-minu`        | `no passed` |
| `rv32uzbb-p-orc_b`       | `no passed` |
| `rv32uzbb-p-orn`         | `no passed` |
| `rv32uzbb-p-rev8`        | `no passed` |
| `rv32uzbb-p-rol`         | `no passed` |
| `rv32uzbb-p-ror`         | `no passed` |
| `rv32uzbb-p-rori`        | `no passed` |
| `rv32uzbb-p-sext_b`      | `no passed` |
| `rv32uzbb-p-sext_h`      | `no passed` |
| `rv32uzbb-p-xnor`        | `no passed` |
| `rv32uzbb-p-zext_h`      | `no passed` |
| `rv32uzbb-v-andn`        | `no passed` |
| `rv32uzbb-v-clz`         | `no passed` |
| `rv32uzbb-v-cpop`        | `no passed` |
| `rv32uzbb-v-ctz`         | `no passed` |
| `rv32uzbb-v-max`         | `no passed` |
| `rv32uzbb-v-maxu`        | `no passed` |
| `rv32uzbb-v-min`         | `no passed` |
| `rv32uzbb-v-minu`        | `no passed` |
| `rv32uzbb-v-orc_b`       | `no passed` |
| `rv32uzbb-v-orn`         | `no passed` |
| `rv32uzbb-v-rev8`        | `no passed` |
| `rv32uzbb-v-rol`         | `no passed` |
| `rv32uzbb-v-ror`         | `no passed` |
| `rv32uzbb-v-rori`        | `no passed` |
| `rv32uzbb-v-sext_b`      | `no passed` |
| `rv32uzbb-v-sext_h`      | `no passed` |
| `rv32uzbb-v-xnor`        | `no passed` |
| `rv32uzbb-v-zext_h`      | `no passed` |

:RV32ZBB - "RV32ZBB Standard Extension)"

This table details the RV32ZBB extension, which introduces byte and half-word instructions to efficiently manipulate data at finer granularity, optimizing memory and computational resources.

| test rv32                | status      |
|--------------------------|:------------|
| `rv32uzbc-p-clmul`       | `no passed` |
| `rv32uzbc-p-clmulh`      | `no passed` |
| `rv32uzbc-p-clmulr`      | `no passed` |
| `rv32uzbc-v-clmul`       | `no passed` |
| `rv32uzbc-v-clmulh`      | `no passed` |
| `rv32uzbc-v-clmulr`      | `no passed` |

:RV32ZBC - "RV32ZBC Standard Extension)"

The RV32ZBC table describes the RV32ZBC extension, which enhances support for population count and bit count operations within the RISC-V ISA, aiding in various algorithmic optimizations.

| test rv32                | status      |
|--------------------------|:------------|
| `rv32uzbs-p-bclr`        | `no passed` |
| `rv32uzbs-p-bclri`       | `no passed` |
| `rv32uzbs-p-bext`        | `no passed` |
| `rv32uzbs-p-bexti`       | `no passed` |
| `rv32uzbs-p-binv`        | `no passed` |
| `rv32uzbs-p-binvi`       | `no passed` |
| `rv32uzbs-p-bset`        | `no passed` |
| `rv32uzbs-p-bseti`       | `no passed` |
| `rv32uzbs-v-bclr`        | `no passed` |
| `rv32uzbs-v-bclri`       | `no passed` |
| `rv32uzbs-v-bext`        | `no passed` |
| `rv32uzbs-v-bexti`       | `no passed` |
| `rv32uzbs-v-binv`        | `no passed` |
| `rv32uzbs-v-binvi`       | `no passed` |
| `rv32uzbs-v-bset`        | `no passed` |
| `rv32uzbs-v-bseti`       | `no passed` |

:RV32ZBS - "RV32ZBS Standard Extension)"

The RV32ZBS table outlines the RV32ZBS extension, which introduces support for specialized instructions related to byte swap operations, optimizing data processing in specific use cases.

| test rv32                | status      |
|--------------------------|:------------|
| `rv32uzfh-p-fadd`        | `no passed` |
| `rv32uzfh-p-fclass`      | `no passed` |
| `rv32uzfh-p-fcmp`        | `no passed` |
| `rv32uzfh-p-fcvt`        | `no passed` |
| `rv32uzfh-p-fcvt_w`      | `no passed` |
| `rv32uzfh-p-fdiv`        | `no passed` |
| `rv32uzfh-p-fmadd`       | `no passed` |
| `rv32uzfh-p-fmin`        | `no passed` |
| `rv32uzfh-p-ldst`        | `no passed` |
| `rv32uzfh-p-move`        | `no passed` |
| `rv32uzfh-p-recoding`    | `no passed` |
| `rv32uzfh-v-fadd`        | `no passed` |
| `rv32uzfh-v-fclass`      | `no passed` |
| `rv32uzfh-v-fcmp`        | `no passed` |
| `rv32uzfh-v-fcvt`        | `no passed` |
| `rv32uzfh-v-fcvt_w`      | `no passed` |
| `rv32uzfh-v-fdiv`        | `no passed` |
| `rv32uzfh-v-fmadd`       | `no passed` |
| `rv32uzfh-v-fmin`        | `no passed` |
| `rv32uzfh-v-ldst`        | `no passed` |
| `rv32uzfh-v-move`        | `no passed` |
| `rv32uzfh-v-recoding`    | `no passed` |

:RV32ZFH - "RV32ZFH Standard Extension"

This table details the RV32ZFH extension, which enhances support for hardware floating-point features in the RISC-V ISA, improving performance and precision in floating-point arithmetic.

| test rv32                | status      |
|--------------------------|:------------|
| `rv32si-p-csr`           | `no passed` |
| `rv32si-p-dirty`         | `no passed` |
| `rv32si-p-ma_fetch`      | `no passed` |
| `rv32si-p-sbreak`        | `no passed` |
| `rv32si-p-scall`         | `no passed` |
| `rv32si-p-wfi`           | `no passed` |

:RV32I - "RV32I Standard Extension for Integer Instructions for Supervisor-level Instructions"

The RV32I table specifies the RV32I extension tailored for supervisor-level instructions, adding specific integer operations and capabilities for privileged execution modes.

| test rv32                | status      |
|--------------------------|:------------|
| `rv32mi-p-breakpoint`    | `passed`    |
| `rv32mi-p-csr`           | `passed`    |
| `rv32mi-p-illegal`       | `passed`    |
| `rv32mi-p-lh-misaligned` | `no passed` |
| `rv32mi-p-lw-misaligned` | `no passed` |
| `rv32mi-p-ma_addr`       | `passed`    |
| `rv32mi-p-ma_fetch`      | `passed`    |
| `rv32mi-p-mcsr`          | `passed`    |
| `rv32mi-p-sbreak`        | `passed`    |
| `rv32mi-p-scall`         | `passed`    |
| `rv32mi-p-shamt`         | `passed`    |
| `rv32mi-p-sh-misaligned` | `no passed` |
| `rv32mi-p-sw-misaligned` | `no passed` |
| `rv32mi-p-zicntr`        | `no passed` |

:RV32I - "RV32I Standard Extension for Integer Instructions for Machine-level Instructions"

This table describes the RV32I extension for machine-level instructions, introducing integer operations and functionalities tailored for the highest privilege execution mode in the RISC-V ISA.

## TEST 64 BIT

Verification of instructions in the RISC-V ISA involves rigorous testing and validation procedures to ensure correctness, functionality, and adherence to the ISA specifications across different implementations and extensions. Testing begins with unit tests focusing on individual instructions, verifying their behavior under various input conditions and edge cases. These tests aim to confirm that each instruction performs its intended operation correctly, including proper handling of operands, status flags, and side effects.

To further validate instruction correctness, integration tests assess the interaction between instructions within program sequences. Integration tests cover common usage scenarios, corner cases, and exception handling to verify the seamless execution flow and maintain consistency with the RISC-V ISA's architectural guarantees. These tests also evaluate performance characteristics, such as latency and throughput, to ensure optimal operation across diverse application workloads and hardware configurations.

Comprehensive verification includes compliance testing against the official RISC-V ISA specifications and ABI standards. Compliance tests validate instruction encoding, behavior, and expected results across different compliance suites and benchmarks. This process ensures conformance with the standard ISA semantics and compatibility with software tools, compilers, and operating systems that target RISC-V processors.

Moreover, validation of instructions extends to simulation and emulation environments where software models and virtual platforms replicate RISC-V processor behavior. Simulation-based testing evaluates instruction execution timing, resource utilization, and architectural features such as memory hierarchy and cache behavior. Emulation environments enable testing across various RISC-V implementations, facilitating compatibility verification and performance profiling under realistic operating conditions.

Overall, thorough verification of instructions in the RISC-V ISA is essential to guarantee reliability, security, and performance across a broad spectrum of computing applications—from embedded systems to high-performance computing clusters. By adhering to rigorous testing methodologies and standards, developers ensure that RISC-V processors deliver consistent and predictable behavior while promoting innovation and scalability in the open-source hardware ecosystem.

Format of a line in the table:

`<test>`

| **test rv64**            | **status**  |
|--------------------------|:------------|
| `rv64ui-p-add`           | `passed`    |
| `rv64ui-p-addi`          | `passed`    |
| `rv64ui-p-addiw`         | `passed`    |
| `rv64ui-p-addw`          | `passed`    |
| `rv64ui-p-and`           | `passed`    |
| `rv64ui-p-andi`          | `passed`    |
| `rv64ui-p-auipc`         | `passed`    |
| `rv64ui-p-beq`           | `passed`    |
| `rv64ui-p-bge`           | `passed`    |
| `rv64ui-p-bgeu`          | `passed`    |
| `rv64ui-p-blt`           | `passed`    |
| `rv64ui-p-bltu`          | `passed`    |
| `rv64ui-p-bne`           | `passed`    |
| `rv64ui-p-fence_i`       | `?`         |
| `rv64ui-p-jal`           | `passed`    |
| `rv64ui-p-jalr`          | `passed`    |
| `rv64ui-p-lb`            | `?`         |
| `rv64ui-p-lbu`           | `?`         |
| `rv64ui-p-ld`            | `?`         |
| `rv64ui-p-lh`            | `?`         |
| `rv64ui-p-lhu`           | `?`         |
| `rv64ui-p-lui`           | `passed`    |
| `rv64ui-p-lw`            | `?`         |
| `rv64ui-p-lwu`           | `?`         |
| `rv64ui-p-ma_data`       | `no passed` |
| `rv64ui-p-or`            | `passed`    |
| `rv64ui-p-ori`           | `passed`    |
| `rv64ui-p-sb`            | `?`         |
| `rv64ui-p-sd`            | `?`         |
| `rv64ui-p-sh`            | `?`         |
| `rv64ui-p-simple`        | `passed`    |
| `rv64ui-p-sll`           | `passed`    |
| `rv64ui-p-slli`          | `passed`    |
| `rv64ui-p-slliw`         | `passed`    |
| `rv64ui-p-sllw`          | `passed`    |
| `rv64ui-p-slt`           | `passed`    |
| `rv64ui-p-slti`          | `passed`    |
| `rv64ui-p-sltiu`         | `passed`    |
| `rv64ui-p-sltu`          | `passed`    |
| `rv64ui-p-sra`           | `passed`    |
| `rv64ui-p-srai`          | `passed`    |
| `rv64ui-p-sraiw`         | `passed`    |
| `rv64ui-p-sraw`          | `passed`    |
| `rv64ui-p-srl`           | `passed`    |
| `rv64ui-p-srli`          | `passed`    |
| `rv64ui-p-srliw`         | `passed`    |
| `rv64ui-p-srlw`          | `passed`    |
| `rv64ui-p-sub`           | `passed`    |
| `rv64ui-p-subw`          | `passed`    |
| `rv64ui-p-sw`            | `no passed` |
| `rv64ui-p-xor`           | `passed`    |
| `rv64ui-p-xori`          | `passed`    |
| `rv64ui-v-add`           | `no passed` |
| `rv64ui-v-addi`          | `no passed` |
| `rv64ui-v-addiw`         | `no passed` |
| `rv64ui-v-addw`          | `no passed` |
| `rv64ui-v-and`           | `no passed` |
| `rv64ui-v-andi`          | `no passed` |
| `rv64ui-v-auipc`         | `no passed` |
| `rv64ui-v-beq`           | `no passed` |
| `rv64ui-v-bge`           | `no passed` |
| `rv64ui-v-bgeu`          | `no passed` |
| `rv64ui-v-blt`           | `no passed` |
| `rv64ui-v-bltu`          | `no passed` |
| `rv64ui-v-bne`           | `no passed` |
| `rv64ui-v-fence_i`       | `no passed` |
| `rv64ui-v-jal`           | `no passed` |
| `rv64ui-v-jalr`          | `no passed` |
| `rv64ui-v-lb`            | `no passed` |
| `rv64ui-v-lbu`           | `no passed` |
| `rv64ui-v-ld`            | `no passed` |
| `rv64ui-v-lh`            | `no passed` |
| `rv64ui-v-lhu`           | `no passed` |
| `rv64ui-v-lui`           | `no passed` |
| `rv64ui-v-lw`            | `no passed` |
| `rv64ui-v-lwu`           | `no passed` |
| `rv64ui-v-ma_data`       | `no passed` |
| `rv64ui-v-or`            | `no passed` |
| `rv64ui-v-ori`           | `no passed` |
| `rv64ui-v-sb`            | `no passed` |
| `rv64ui-v-sd`            | `no passed` |
| `rv64ui-v-sh`            | `no passed` |
| `rv64ui-v-simple`        | `no passed` |
| `rv64ui-v-sll`           | `no passed` |
| `rv64ui-v-slli`          | `no passed` |
| `rv64ui-v-slliw`         | `no passed` |
| `rv64ui-v-sllw`          | `no passed` |
| `rv64ui-v-slt`           | `no passed` |
| `rv64ui-v-slti`          | `no passed` |
| `rv64ui-v-sltiu`         | `no passed` |
| `rv64ui-v-sltu`          | `no passed` |
| `rv64ui-v-sra`           | `no passed` |
| `rv64ui-v-srai`          | `no passed` |
| `rv64ui-v-sraiw`         | `no passed` |
| `rv64ui-v-sraw`          | `no passed` |
| `rv64ui-v-srl`           | `no passed` |
| `rv64ui-v-srli`          | `no passed` |
| `rv64ui-v-srliw`         | `no passed` |
| `rv64ui-v-srlw`          | `no passed` |
| `rv64ui-v-sub`           | `no passed` |
| `rv64ui-v-subw`          | `no passed` |
| `rv64ui-v-sw`            | `no passed` |
| `rv64ui-v-xor`           | `no passed` |
| `rv64ui-v-xori`          | `no passed` |

:RV64I - "RV64I Base Integer Instruction Set (+ RV32I)"

The RV64I table details the base integer instruction set of the RISC-V ISA for 64-bit implementations, including all instructions from RV32I while supporting wider registers and extended addressing.

| **test rv64**            | **status**  |
|--------------------------|:------------|
| `rv64um-p-div`           | `passed`    |
| `rv64um-p-divu`          | `passed`    |
| `rv64um-p-divuw`         | `passed`    |
| `rv64um-p-divw`          | `passed`    |
| `rv64um-p-mul`           | `passed`    |
| `rv64um-p-mulh`          | `passed`    |
| `rv64um-p-mulhsu`        | `passed`    |
| `rv64um-p-mulhu`         | `passed`    |
| `rv64um-p-mulw`          | `passed`    |
| `rv64um-p-rem`           | `passed`    |
| `rv64um-p-remu`          | `passed`    |
| `rv64um-p-remuw`         | `passed`    |
| `rv64um-p-remw`          | `passed`    |
| `rv64um-v-div`           | `no passed` |
| `rv64um-v-divu`          | `no passed` |
| `rv64um-v-divuw`         | `no passed` |
| `rv64um-v-divw`          | `no passed` |
| `rv64um-v-mul`           | `no passed` |
| `rv64um-v-mulh`          | `no passed` |
| `rv64um-v-mulhsu`        | `no passed` |
| `rv64um-v-mulhu`         | `no passed` |
| `rv64um-v-mulw`          | `no passed` |
| `rv64um-v-rem`           | `no passed` |
| `rv64um-v-remu`          | `no passed` |
| `rv64um-v-remuw`         | `no passed` |
| `rv64um-v-remw`          | `no passed` |

:RV64M - "RV64M Standard Extension for Integer Multiply and Divide (+ RV32M)"

This table outlines the RV64M extension, which extends RV32M to support integer multiplication and division instructions in 64-bit implementations, enhancing computational capabilities.

| **test rv64**            | **status**  |
|--------------------------|:------------|
| `rv64ua-p-amoadd_d`      | `no passed` |
| `rv64ua-p-amoadd_w`      | `no passed` |
| `rv64ua-p-amoand_d`      | `no passed` |
| `rv64ua-p-amoand_w`      | `no passed` |
| `rv64ua-p-amomax_d`      | `no passed` |
| `rv64ua-p-amomaxu_d`     | `no passed` |
| `rv64ua-p-amomaxu_w`     | `no passed` |
| `rv64ua-p-amomax_w`      | `no passed` |
| `rv64ua-p-amomin_d`      | `no passed` |
| `rv64ua-p-amominu_d`     | `no passed` |
| `rv64ua-p-amominu_w`     | `no passed` |
| `rv64ua-p-amomin_w`      | `no passed` |
| `rv64ua-p-amoor_d`       | `no passed` |
| `rv64ua-p-amoor_w`       | `no passed` |
| `rv64ua-p-amoswap_d`     | `no passed` |
| `rv64ua-p-amoswap_w`     | `no passed` |
| `rv64ua-p-amoxor_d`      | `no passed` |
| `rv64ua-p-amoxor_w`      | `no passed` |
| `rv64ua-p-lrsc`          | `no passed` |
| `rv64ua-v-amoadd_d`      | `no passed` |
| `rv64ua-v-amoadd_w`      | `no passed` |
| `rv64ua-v-amoand_d`      | `no passed` |
| `rv64ua-v-amoand_w`      | `no passed` |
| `rv64ua-v-amomax_d`      | `no passed` |
| `rv64ua-v-amomaxu_d`     | `no passed` |
| `rv64ua-v-amomaxu_w`     | `no passed` |
| `rv64ua-v-amomax_w`      | `no passed` |
| `rv64ua-v-amomin_d`      | `no passed` |
| `rv64ua-v-amominu_d`     | `no passed` |
| `rv64ua-v-amominu_w`     | `no passed` |
| `rv64ua-v-amomin_w`      | `no passed` |
| `rv64ua-v-amoor_d`       | `no passed` |
| `rv64ua-v-amoor_w`       | `no passed` |
| `rv64ua-v-amoswap_d`     | `no passed` |
| `rv64ua-v-amoswap_w`     | `no passed` |
| `rv64ua-v-amoxor_d`      | `no passed` |
| `rv64ua-v-amoxor_w`      | `no passed` |
| `rv64ua-v-lrsc`          | `no passed` |

:RV64A - "RV64A Standard Extension for Atomic Instructions (+ RV32A)"

The RV64A table describes the RV64A extension, which adds atomic memory operations to ensure thread-safe execution in 64-bit environments, enhancing concurrency control.

| **test rv64**            | **status**  |
|--------------------------|:------------|
| `rv64uf-p-fadd`          | `no passed` |
| `rv64uf-p-fclass`        | `no passed` |
| `rv64uf-p-fcmp`          | `no passed` |
| `rv64uf-p-fcvt`          | `no passed` |
| `rv64uf-p-fcvt_w`        | `no passed` |
| `rv64uf-p-fdiv`          | `no passed` |
| `rv64uf-p-fmadd`         | `no passed` |
| `rv64uf-p-fmin`          | `no passed` |
| `rv64uf-p-ldst`          | `no passed` |
| `rv64uf-p-move`          | `no passed` |
| `rv64uf-p-recoding`      | `no passed` |
| `rv64uf-v-fadd`          | `no passed` |
| `rv64uf-v-fclass`        | `no passed` |
| `rv64uf-v-fcmp`          | `no passed` |
| `rv64uf-v-fcvt`          | `no passed` |
| `rv64uf-v-fcvt_w`        | `no passed` |
| `rv64uf-v-fdiv`          | `no passed` |
| `rv64uf-v-fmadd`         | `no passed` |
| `rv64uf-v-fmin`          | `no passed` |
| `rv64uf-v-ldst`          | `no passed` |
| `rv64uf-v-move`          | `no passed` |
| `rv64uf-v-recoding`      | `no passed` |

:RV64F - "RV64F Standard Extension for Single-Precision Floating-Point (+ RV32F)"

The RV64F table specifies the RV64F extension, which introduces support for single-precision floating-point arithmetic and operations in 64-bit implementations, enabling computation with floating-point numbers.

| **test rv64**            | **status**  |
|--------------------------|:------------|
| `rv64ud-p-fadd`          | `passed`    |
| `rv64ud-p-fclass`        | `passed`    |
| `rv64ud-p-fcmp`          | `passed`    |
| `rv64ud-p-fcvt`          | `no passed` |
| `rv64ud-p-fcvt_w`        | `no passed` |
| `rv64ud-p-fdiv`          | `passed`    |
| `rv64ud-p-fmadd`         | `passed`    |
| `rv64ud-p-fmin`          | `passed`    |
| `rv64ud-p-ldst`          | `passed`    |
| `rv64ud-p-move`          | `no passed` |
| `rv64ud-p-recoding`      | `no passed` |
| `rv64ud-p-structural`    | `no passed` |
| `rv64ud-v-fadd`          | `no passed` |
| `rv64ud-v-fclass`        | `no passed` |
| `rv64ud-v-fcmp`          | `no passed` |
| `rv64ud-v-fcvt`          | `no passed` |
| `rv64ud-v-fcvt_w`        | `no passed` |
| `rv64ud-v-fdiv`          | `no passed` |
| `rv64ud-v-fmadd`         | `no passed` |
| `rv64ud-v-fmin`          | `no passed` |
| `rv64ud-v-ldst`          | `no passed` |
| `rv64ud-v-move`          | `no passed` |
| `rv64ud-v-recoding`      | `passed`    |
| `rv64ud-v-structural`    | `no passed` |

:RV64D - "RV64D Standard Extension for Double-Precision Floating-Point (+ RV32D)"

This table details the RV64D extension, which extends the RISC-V ISA to support double-precision floating-point arithmetic and operations in 64-bit implementations, facilitating higher precision calculations.

| **test rv64**            | **status**  |
|--------------------------|:------------|
| `rv64uc-p-rvc`           | `no passed` |
| `rv64uc-v-rvc`           | `no passed` |

:RV64C - "RV64C Standard Extension for Compressed Instructions (+ RV32C)"

The RV64C table extends the RV32C compression to 64-bit implementations by including additional compressed instructions, optimizing code density and memory usage.

| **test rv64**            | **status**  |
|--------------------------|:------------|
| `rv64uzba-p-add_uw`      | `no passed` |
| `rv64uzba-p-sh1add`      | `no passed` |
| `rv64uzba-p-sh1add_uw`   | `no passed` |
| `rv64uzba-p-sh2add`      | `no passed` |
| `rv64uzba-p-sh2add_uw`   | `no passed` |
| `rv64uzba-p-sh3add`      | `no passed` |
| `rv64uzba-p-sh3add_uw`   | `no passed` |
| `rv64uzba-p-slli_uw`     | `no passed` |
| `rv64uzba-v-add_uw`      | `no passed` |
| `rv64uzba-v-sh1add`      | `no passed` |
| `rv64uzba-v-sh1add_uw`   | `no passed` |
| `rv64uzba-v-sh2add`      | `no passed` |
| `rv64uzba-v-sh2add_uw`   | `no passed` |
| `rv64uzba-v-sh3add`      | `no passed` |
| `rv64uzba-v-sh3add_uw`   | `no passed` |
| `rv64uzba-v-slli_uw`     | `no passed` |

:RV64ZBA - "RV64ZBA Standard Extension (+ RV32ZBA)"

The RV64ZBA table outlines the RV64ZBA extension, which includes bit manipulation and bit field instructions optimized for 64-bit implementations, enhancing support for bitwise operations and compact data structures.

| **test rv64**            | **status**  |
|--------------------------|:------------|
| `rv64uzbb-p-andn`        | `no passed` |
| `rv64uzbb-p-clz`         | `no passed` |
| `rv64uzbb-p-clzw`        | `no passed` |
| `rv64uzbb-p-cpop`        | `no passed` |
| `rv64uzbb-p-cpopw`       | `no passed` |
| `rv64uzbb-p-ctz`         | `no passed` |
| `rv64uzbb-p-ctzw`        | `no passed` |
| `rv64uzbb-p-max`         | `no passed` |
| `rv64uzbb-p-maxu`        | `no passed` |
| `rv64uzbb-p-min`         | `no passed` |
| `rv64uzbb-p-minu`        | `no passed` |
| `rv64uzbb-p-orc_b`       | `no passed` |
| `rv64uzbb-p-orn`         | `no passed` |
| `rv64uzbb-p-rev8`        | `no passed` |
| `rv64uzbb-p-rol`         | `no passed` |
| `rv64uzbb-p-rolw`        | `no passed` |
| `rv64uzbb-p-ror`         | `no passed` |
| `rv64uzbb-p-rori`        | `no passed` |
| `rv64uzbb-p-roriw`       | `no passed` |
| `rv64uzbb-p-rorw`        | `no passed` |
| `rv64uzbb-p-sext_b`      | `no passed` |
| `rv64uzbb-p-sext_h`      | `no passed` |
| `rv64uzbb-p-xnor`        | `no passed` |
| `rv64uzbb-p-zext_h`      | `no passed` |
| `rv64uzbb-v-andn`        | `no passed` |
| `rv64uzbb-v-clz`         | `no passed` |
| `rv64uzbb-v-clzw`        | `no passed` |
| `rv64uzbb-v-cpop`        | `no passed` |
| `rv64uzbb-v-cpopw`       | `no passed` |
| `rv64uzbb-v-ctz`         | `no passed` |
| `rv64uzbb-v-ctzw`        | `no passed` |
| `rv64uzbb-v-max`         | `no passed` |
| `rv64uzbb-v-maxu`        | `no passed` |
| `rv64uzbb-v-min`         | `no passed` |
| `rv64uzbb-v-minu`        | `no passed` |
| `rv64uzbb-v-orc_b`       | `no passed` |
| `rv64uzbb-v-orn`         | `no passed` |
| `rv64uzbb-v-rev8`        | `no passed` |
| `rv64uzbb-v-rol`         | `no passed` |
| `rv64uzbb-v-rolw`        | `no passed` |
| `rv64uzbb-v-ror`         | `no passed` |
| `rv64uzbb-v-rori`        | `no passed` |
| `rv64uzbb-v-roriw`       | `no passed` |
| `rv64uzbb-v-rorw`        | `no passed` |
| `rv64uzbb-v-sext_b`      | `no passed` |
| `rv64uzbb-v-sext_h`      | `no passed` |
| `rv64uzbb-v-xnor`        | `no passed` |
| `rv64uzbb-v-zext_h`      | `no passed` |

:RV64ZBB - "RV64ZBB Standard Extension (+ RV32ZBB)"

This table describes the RV64ZBB extension, which introduces byte and half-word instructions optimized for 64-bit implementations, facilitating efficient data manipulation at finer granularity.

| **test rv64**            | **status**  |
|--------------------------|:------------|
| `rv64uzbc-p-clmul`       | `no passed` |
| `rv64uzbc-p-clmulh`      | `no passed` |
| `rv64uzbc-p-clmulr`      | `no passed` |
| `rv64uzbc-v-clmul`       | `no passed` |
| `rv64uzbc-v-clmulh`      | `no passed` |
| `rv64uzbc-v-clmulr`      | `no passed` |

:RV64ZBC - "RV64ZBC Standard Extension (+ RV32ZBC)"

The RV64ZBC table details the RV64ZBC extension, which enhances support for population count and bit count operations within the RISC-V ISA for 64-bit implementations, aiding in algorithmic optimizations.

| **test rv64**            | **status**  |
|--------------------------|:------------|
| `rv64uzbs-p-bclr`        | `no passed` |
| `rv64uzbs-p-bclri`       | `no passed` |
| `rv64uzbs-p-bext`        | `no passed` |
| `rv64uzbs-p-bexti`       | `no passed` |
| `rv64uzbs-p-binv`        | `no passed` |
| `rv64uzbs-p-binvi`       | `no passed` |
| `rv64uzbs-p-bset`        | `no passed` |
| `rv64uzbs-p-bseti`       | `no passed` |
| `rv64uzbs-v-bclr`        | `no passed` |
| `rv64uzbs-v-bclri`       | `no passed` |
| `rv64uzbs-v-bext`        | `no passed` |
| `rv64uzbs-v-bexti`       | `no passed` |
| `rv64uzbs-v-binv`        | `no passed` |
| `rv64uzbs-v-binvi`       | `no passed` |
| `rv64uzbs-v-bset`        | `no passed` |
| `rv64uzbs-v-bseti`       | `no passed` |

:RV64ZBS - "RV64ZBS Standard Extension (+ RV32ZBS)"

The RV64ZBS table specifies the RV64ZBS extension, which introduces specialized instructions for byte swap operations optimized for 64-bit implementations, improving data processing efficiency in specific scenarios.

| **test rv64**            | **status**  |
|--------------------------|:------------|
| `rv64uzfh-p-fadd`        | `no passed` |
| `rv64uzfh-p-fclass`      | `no passed` |
| `rv64uzfh-p-fcmp`        | `no passed` |
| `rv64uzfh-p-fcvt`        | `no passed` |
| `rv64uzfh-p-fcvt_w`      | `no passed` |
| `rv64uzfh-p-fdiv`        | `no passed` |
| `rv64uzfh-p-fmadd`       | `no passed` |
| `rv64uzfh-p-fmin`        | `no passed` |
| `rv64uzfh-p-ldst`        | `no passed` |
| `rv64uzfh-p-move`        | `no passed` |
| `rv64uzfh-p-recoding`    | `no passed` |
| `rv64uzfh-v-fadd`        | `no passed` |
| `rv64uzfh-v-fclass`      | `no passed` |
| `rv64uzfh-v-fcmp`        | `no passed` |
| `rv64uzfh-v-fcvt`        | `no passed` |
| `rv64uzfh-v-fcvt_w`      | `no passed` |
| `rv64uzfh-v-fdiv`        | `no passed` |
| `rv64uzfh-v-fmadd`       | `no passed` |
| `rv64uzfh-v-fmin`        | `no passed` |
| `rv64uzfh-v-ldst`        | `no passed` |
| `rv64uzfh-v-move`        | `no passed` |
| `rv64uzfh-v-recoding`    | `no passed` |

:RV64ZFH - "RV64ZFH Standard Extension (+ RV32ZFH)"

The RV64ZFH table outlines the RV64ZFH extension, which enhances support for hardware floating-point features in 64-bit implementations of the RISC-V ISA, improving performance and precision in floating-point arithmetic.

| **test rv64**            | **status**  |
|--------------------------|:------------|
| `rv64si-p-csr`           | `no passed` |
| `rv64si-p-dirty`         | `no passed` |
| `rv64si-p-icache-alias`  | `no passed` |
| `rv64si-p-ma_fetch`      | `no passed` |
| `rv64si-p-sbreak`        | `no passed` |
| `rv64si-p-scall`         | `no passed` |
| `rv64si-p-wfi`           | `no passed` |

:RV64I - "RV64I Standard Extension for Integer Instructions for Supervisor-level Instructions (+ RV32I)"

This table details the RV64I extension for supervisor-level instructions, adding specific integer operations and functionalities tailored for privileged execution modes in 64-bit implementations.

| **test rv64**            | **status**  |
|--------------------------|:------------|
| `rv64ssvnapot-p-napot`   | `no passed` |

:RV64SVNAPOT - "RV64SVNAPOT Standard Extension for Supervisor-level Instructions"

The RV64SVNAPOT table specifies the RV64SVNAPOT extension, which introduces supervisor-level instructions tailored for handling non-potentially aligned instructions in 64-bit environments.

| **test rv64**            | **status**  |
|--------------------------|:------------|
| `rv64mi-p-access`        | `no passed` |
| `rv64mi-p-breakpoint`    | `passed`    |
| `rv64mi-p-csr`           | `passed`    |
| `rv64mi-p-illegal`       | `?`         |
| `rv64mi-p-ld-misaligned` | `no passed` |
| `rv64mi-p-lh-misaligned` | `no passed` |
| `rv64mi-p-lw-misaligned` | `no passed` |
| `rv64mi-p-ma_addr`       | `?`         |
| `rv64mi-p-ma_fetch`      | `?`         |
| `rv64mi-p-mcsr`          | `passed`    |
| `rv64mi-p-sbreak`        | `passed`    |
| `rv64mi-p-scall`         | `passed`    |
| `rv64mi-p-sd-misaligned` | `no passed` |
| `rv64mi-p-sh-misaligned` | `no passed` |
| `rv64mi-p-sw-misaligned` | `no passed` |
| `rv64mi-p-zicntr`        | `no passed` |

:RV64I - "RV64I Standard Extension for Integer Instructions for Machine-level Instructions (+ RV32I)"

The RV64I table describes the RV64I extension for machine-level instructions, introducing integer operations and functionalities optimized for the highest privilege execution mode in 64-bit implementations.


| **test rv64**            | **status**  |
|--------------------------|:------------|
| `rv64mzicbo-p-zero`      | `no passed` |

:RV64ZICBO - "RV64ZICBO Standard Extension for Machine-level Instructions"

The RV64ZICBO table outlines the RV64ZICBO extension, which introduces machine-level instructions optimized for handling cache block operations in 64-bit environments.
