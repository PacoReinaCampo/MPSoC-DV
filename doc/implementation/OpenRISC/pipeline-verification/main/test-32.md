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
