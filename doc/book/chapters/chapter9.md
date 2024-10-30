# REQUIREMENTS

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

   a. Design assurance levels imposed on the functions to be implemented in the hardware.

   b. Probabilistic requirements for malfunctions or loss of function.

   c. Hardware architectural and functional safety attributes, such as those outlined in Section 2.3.1, selected to meet the functional allocation.

3. Design constraints due to production processes, standards, procedures, technology, design environment and design guidance should be identified.

4. Derived requirements necessary for implementation should be determined. Requirements derived from the hardware safety assessment that have safety implications should be uniquely identified.

   Note: Derived requirements may address conditions, such as:

   a. Specific constraints to ensure that functions of a higher design assurance level can withstand anomalies of functions of a lower design assurance level as seen at the interface of the function with the lower design assurance level.

   b. The range of data inputs considering typical and full-scale data values as well as the high and low states of bits in data words or control registers.

   c. Power-up reset or other reset states.

   d. Supply voltage and current demands.

   e. Performance of time-related functions, such as filters, integrators and delays.

   f. State machine transitions that are possible, whether they are anticipated or not.

   g. Signal timing relationships or electrical conditions under normal and worst-case conditions.

   h. Signal noise and cross-talk.

   i. Signal glitches in asynchronous logic circuits.

   j. Specific constraints to control unused functions.

5. Derived requirements should be fed back to the SSA process so that the effects on the system requirements can be assessed.

6. The requirement data should be documented in quantitative terms, with tolerances where applicable. This does not include the description of design or verification solutions.

7. Requirement omissions or errors discovered during this process should be provided to the system development process.

8. The requirements, including those generated to meet the PSSA requirements, should be traceable to the next higher hierarchical level of requirements. Derived requirements should be identified and traced as far as possible through the hierarchical levels.

   Note: System level validation of allocated hardware safety requirements may occur during the requirement capture process. Validation of derived hardware requirements is described in Section 6.1.

## LANGUAGES

* Hardware Project Workflow

![Hardware Project Workflow](assets/chapter9/hardware-project.svg)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

| CONTROL       | DEVELOP       | OPERATION   |
|:--------------|:--------------|:------------|
| certification | model         | sim         |
| doc           | rtl/src       | compilation |
| quality       | configuration | synthesis   |
| requirements  | validation    |             |
|               | verification  |             |

: Hardware DevOps

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

![Front-End CoDesign Project Workflow](assets/chapter9/front-codesign-project.svg)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

![Back-End CoDesign Project Workflow](assets/chapter9/back-codesign-project.svg)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

   * details(**requirements**) < details(**model**) < details(**rtl**) < details(**configuration**) < details(**synthesis**)
   * details(**requirements**) < details(**model**) < details(**src**) < details(**configuration**) < details(**compilation**)
   * details(**validation**) < details(**verification**) < details(**sim**)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### Unified Modeling Language

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

   * **Structural UML diagrams** (for Architecture and Interface)
      - Class diagram
      - Component diagram
      - Composite diagram
      - Deployment diagram
      - Object diagram
      - Package diagram
      - Profile diagram
   * **Behavioral UML diagrams** (for Functionality and Registers and Interrptions)
      - Activity diagram
      - Communication diagram
      - Interaction diagram
      - Sequence diagram
      - State diagram
      - Timing diagram
      - Use diagram

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

![UML Diagrams Overview](assets/chapter9/uml_diagrams_overview.svg)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### Property Specification Language

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### Python Language

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### Matlab Language

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....
