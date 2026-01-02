# REQUIREMENTS

Hardware requirements form the essential foundation upon which a hardware design project is built. They meticulously define the intended functionality, performance characteristics, physical attributes, interfaces, environmental operating conditions, and any constraints applicable to the hardware item. These requirements guide the entire development lifecycle, serving as the primary reference for architectural decisions, detailed design implementation, verification strategies, and final validation, ensuring the end product meets the intended objectives and stakeholder expectations.

## REQUIREMENTS CAPTURE PROCESS

The requirements capture process identifies and records the hardware item requirements. This includes those derived requirements imposed by the proposed hardware item architecture, choice of technology, the basic and optional functionality, environmental, and performance requirements as well as the requirements imposed by the system safety assessment. This process may be iterative since additional requirements may become known during design.

### Requirements Capture Objectives

The objectives for the requirements capture process are:

1. Requirements are identified, defined and documented. This includes allocated requirements from the PSSA and derived requirements from the hardware safety assessment.

   Note: Traceability of verification results to the hardware requirements is addressed in Section 6. It is desirable to establish this method of traceability during the requirement capture process.

2. Derived requirements produced are fed back to the appropriate process.

3. Requirement omissions and errors are provided to the appropriate process for resolution.

### Requirements Capture Activities

The requirements capture activities form an iterative process which helps assure consistency of the requirements with the design implementation, the system requirements and the software requirements.

Guidance for the requirements capture activities includes:

1. The system requirements allocated to the hardware item should be documented. These may include identifying requirements, such as functionality and performance, and architectural considerations, such as segregation, Built-In-Test, testability, external interfaces, environment, test and maintenance considerations, power, and physical characteristics.

2. The safety requirements from the PSSA related to the hardware item should be identified. These may include:

   1. Design assurance levels imposed on the functions to be implemented in the hardware.

   2. Probabilistic requirements for malfunctions or loss of function.

   3. Hardware architectural and functional safety attributes, such as those outlined in Section 2.3.1, selected to meet the functional allocation.

3. Design constraints due to production processes, standards, procedures, technology, design environment and design guidance should be identified.

4. Derived requirements necessary for implementation should be determined. Requirements derived from the hardware safety assessment that have safety implications should be uniquely identified.

   Note: Derived requirements may address conditions, such as:

   1. Specific constraints to ensure that functions of a higher design assurance level can withstand anomalies of functions of a lower design assurance level as seen at the interface of the function with the lower design assurance level.

   2. The range of data inputs considering typical and full-scale data values as well as the high and low states of bits in data words or control registers.

   3. Power-up reset or other reset states.

   4. Supply voltage and current demands.

   5. Performance of time-related functions, such as filters, integrators and delays.

   6. State machine transitions that are possible, whether they are anticipated or not.

   7. Signal timing relationships or electrical conditions under normal and worst-case conditions.

   8. Signal noise and cross-talk.

   9. Signal glitches in asynchronous logic circuits.

   10. Specific constraints to control unused functions.

5. Derived requirements should be fed back to the SSA process so that the effects on the system requirements can be assessed.

6. The requirement data should be documented in quantitative terms, with tolerances where applicable. This does not include the description of design or verification solutions.

7. Requirement omissions or errors discovered during this process should be provided to the system development process.

8. The requirements, including those generated to meet the PSSA requirements, should be traceable to the next higher hierarchical level of requirements. Derived requirements should be identified and traced as far as possible through the hierarchical levels.

   Note: System level validation of allocated hardware safety requirements may occur during the requirement capture process. Validation of derived hardware requirements is described in Section 6.1.

## LANGUAGES

The Hardware Project WorkFlow illustrates the interconnected phases involved in bringing a hardware concept to realization. It typically begins with requirements definition and architectural planning, progresses through detailed design and implementation using hardware description languages, undergoes rigorous verification and validation using simulation and formal methods, and culminates in synthesis, physical implementation, and testing. This workflow emphasizes iterative refinement and feedback loops between stages to manage complexity and ensure quality throughout the development process.

* Hardware Project WorkFlow

  ![Hardware Project WorkFlow](assets/chapter9/hardware-project.svg){height=7cm}

Hardware DevOps represents the application of DevOps principles and practices to the hardware development lifecycle. It aims to break down silos between design, verification, manufacturing, and operations teams by fostering collaboration, automating workflows (like continuous integration and testing), and implementing robust configuration management. This approach accelerates development cycles, improves product quality, enhances traceability, and allows for more efficient management of complex hardware projects, adapting software development agility to the hardware domain.

| **Control**   | **Develop**   | **Operation** |
|:--------------|:--------------|:--------------|
| certification | model         | sim           |
| doc           | rtl/src       | compilation   |
| quality       | configuration | synthesis     |
| requirements  | validation    |               |
|               | verification  |               |

:Hardware DevOps

The Front-End CoDesign Project WorkFlow specifically addresses the initial phases of hardware development where system-level decisions are made, often involving close interaction between hardware and software design teams. This stage includes capturing requirements, defining the system architecture, partitioning functionality between hardware and software, creating high-level models (e.g., using SystemC or Matlab/Simulink), and performing early-stage verification and performance analysis to validate architectural choices before committing to detailed implementation.

![Front-End CoDesign Project WorkFlow](assets/chapter9/front-codesign-project.svg){height=7cm}

The Back-End CoDesign Project WorkFlow focuses on the subsequent stages of hardware implementation, translating the architectural and functional specifications defined in the front-end into a physical realization. This involves detailed Register Transfer Level (RTL) coding, logic synthesis to convert RTL into a gate-level netlist, physical design including placement and routing, timing closure, power analysis, and final verification steps like gate-level simulation and formal equivalence checking to ensure the manufactured hardware matches the intended design.

![Back-End CoDesign Project WorkFlow](assets/chapter9/back-codesign-project.svg){height=7cm}

The progression through the hardware design flow inherently involves an increase in the level of detail and specificity. Starting from abstract requirements that define *what* the system must do, the process moves to models that capture behavior, then to RTL or source code describing the implementation structure, followed by configuration details for tools, and finally to synthesis or compilation results which represent the concrete hardware or executable software, respectively. Each step adds layers of implementation detail to the initial concept.

   * details(**requirements**) < details(**model**) < details(**rtl**) < details(**configuration**) < details(**synthesis**)
   * details(**requirements**) < details(**model**) < details(**src**) < details(**configuration**) < details(**compilation**)
   * details(**validation**) < details(**verification**) < details(**sim**)

Within the verification domain, validation typically confirms that the high-level requirements are met by the design concept, often at an abstract level. Verification delves deeper, ensuring the design implementation correctly adheres to its detailed specification through more exhaustive checks, potentially using formal methods or extensive simulation. Simulation itself is a technique used within verification, executing a design model with specific stimuli to observe its behavior and check against expected outcomes, representing a specific instance of checking design correctness under defined conditions.

Utilizing standardized and well-defined languages is crucial throughout the hardware development process for specifying requirements, describing design architecture and behavior, and defining verification properties. These languages provide unambiguous means of communication between different engineers, teams, and electronic design automation (EDA) tools, reducing errors, enhancing clarity, enabling automation, and ensuring consistency from initial concept through to final implementation and verification.

### Unified Modeling Language

The Unified Modeling Language (UML) offers a standardized graphical notation for visualizing, specifying, constructing, and documenting the artifacts of systems, including complex hardware systems. While originating in software engineering, its various diagram types can be effectively adapted to model hardware architectures, component interactions, interfaces, state behaviors, and communication protocols, providing a common visual language for hardware designers and system architects.

   * **Structural UML diagrams** (for Architecture and Interface)
      - Class diagram
      - Component diagram
      - Composite diagram
      - Deployment diagram
      - Object diagram
      - Package diagram
      - Profile diagram

Structural UML diagrams are primarily concerned with representing the static aspects of a system. In a hardware context, diagrams like Component, Package, and Composite Structure diagrams are invaluable for illustrating the organization of hardware blocks, their interconnections, ports, interfaces, and the overall physical or logical architecture of the hardware item, providing a clear blueprint of the system's structure.

   * **Behavioral UML diagrams** (for Functionality and Registers and Interruptions)
      - Activity diagram
      - Communication diagram
      - Interaction diagram
      - Sequence diagram
      - State diagram
      - Timing diagram
      - Use diagram

Behavioral UML diagrams capture the dynamic aspects and interactions within a system. State Machine diagrams are particularly useful for modeling the behavior of control logic and protocols, Sequence diagrams can illustrate interactions between hardware components over time, and Activity diagrams can model data flow and processing steps. These help specify and understand the functionality, register operations, and interrupt handling logic within the hardware design.

![UML Diagrams Overview](assets/chapter9/uml_diagrams_overview.svg){height=5cm}

The UML Diagrams Overview graphic serves as a helpful reference, visually categorizing the suite of UML diagrams into structural and behavioral groups. This classification aids designers in selecting the most appropriate diagram type for the specific aspect of the hardware system they need to model, whether it's the static architecture, the dynamic interactions between components, or the behavior of individual elements, thereby facilitating clearer and more effective system documentation and communication.

### Property Specification Language

Property Specification Language (PSL) is a formal specification language designed primarily for defining properties or assertions about hardware designs. These properties precisely capture design intent and expected behavior, which can then be rigorously checked using formal verification tools or monitored during simulation-based verification. PSL allows engineers to express complex temporal behaviors and relationships, enhancing the verification process by enabling exhaustive checks beyond traditional test vector approaches.

### Python Language

Python has gained significant traction in the hardware development ecosystem due to its simplicity, powerful libraries, and ease of integration. It is extensively used for automating various tasks, including build processes, tool flows, and regression testing. Furthermore, Python is popular for developing testbenches (e.g., using frameworks like Cocotb), generating test stimuli, parsing simulation results, managing design data, and creating utility scripts that interface with EDA tools, significantly boosting productivity across the design and verification cycle.

### Matlab Language

Matlab, often used in conjunction with its companion tool Simulink, plays a vital role in the early stages of hardware design, particularly for systems involving algorithms for signal processing, control, or communications. It provides a high-level environment for developing and simulating algorithms, modeling system behavior, analyzing performance trade-offs, and automatically generating HDL code or test vectors from the models. This facilitates rapid prototyping and exploration of design alternatives before committing to detailed RTL implementation.
