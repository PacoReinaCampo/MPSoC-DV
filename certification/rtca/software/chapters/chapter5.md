# SOFTWARE DEVELOPMENT PROCESS

This section discusses the objectives and activities of the software development processes. The software development processes are applied as defined by the software planning process (section 4) and the Software Development Plan (subsection 11.2). Table A-2 of Annex A is a summary of the objectives and outputs of the software development processes by software level. The software development processes are:

   - Software requirements process.
   - Software design process.
   - Software design process.
   - Integration process.

Software development processes produce one or more levels of software requirements. High-level requirements are produced directly through analysis of system requirements and system architecture. Usually, these high-level requirements are further developed during the software design process, thus producing one or more successive, lower levels of requirements. However, if Source Code is generated directly from high-level requirements, then the high-level requirements are also considered low-level requirements. and the guidelines for low-level requirements also apply.

The development of a software architecture involves decisions made about the structure of the software. During the software design process, the software architecture is defined and low-level requirements are developed. Low-level requirements are software requirements from which Source Code can be directly implemented without further information.

Each software development process may produce derived requirements. Derived requirements are requirements that are not directly traceable to higher level requirements. An example of such a derived requirement is the need for interrupt handling software to be developed for the chosen target computer. High-level requirements may include derived requirements, and low-level requirements may include derived requirements. The effects of derived requirements on safety related requirements are determined by the system safety assessment process.

## Software Requirements Process

The software requirements process uses the outputs of the system life cycle process to develop the software high-level requirements. These high-level requirements include functional, performance, interface and safety-related requirements.

### Software Requirements Process Objectives

The objectives of the software requirements process are:

   a. High-level requirements are developed.
   b. Derived high-level requirements are indicated to the system safety assessment process.

### Software Requirements Process Activities

Inputs to the software requirements process include the system requirements, the hardware interface and system architecture (if not included in the requirements) from the system life cycle process, and the Software Development Plan and the Software Requirements Standards from the software planning process. When the planned transition criteria have been satisfied, these inputs are used to develop the software high-level requirements.

The primary output of this process is the Software Requirements Data (subsection 11.9).

The software requirements process is complete when its objectives and the objectives of the integral processes associated with it are satisfied. Guidance for this process includes:

   a. The system functional and interface requirements that are allocated to software should be analyze for ambiguities, inconsistencies and undefined conditions.

   b. Inputs to the software requirements process detected as inadequate or incorrect should be reported as feedback to the input source processes for clarification or correction.

   c. Each system requirement that is allocated to software should be specified in the high-level requirements.

   d. High-level requirements that address system requirements allocated to software to preclude system hazards should be defined.

   e. The high-level requirements should conform to the Software Requirements Standards, and be verifiable and consistent.

   f. The high-level requirements should be stated in quantitative terms with tolerances where applicable.

   g. The high-level requirements should not describe design or verification detail except for specified and justified design constraints.

   h. Each system requirement allocated to software should be traceable to one or more software high-level requirements.

   i. Each high-level requirement should be traceable to one or more system requirements, except for derived requirements.

   j. Derived high-level requirements should be provided to the system safety assessment process.

## Software Design Process

The software high-level requirements are refined through one or more iterations in the software design process to develop the software architecture and the low-level requirements that can be used to implement Source Code.

### Software Design Process Objectives

The objectives of the software design process are:

   a. The software architecture and low-level requirements are developed from the high-level requirements.
   b. Derived low-level requirements are provided to the system safety assessment process.

### Software Design Process Activities

The software design process inputs are the Software Requirements Data, the Software Development Plan and the Software Design Standards. When the planned transition criteria have been satisfied, the high-level requirements are used in the design process to develop software architecture and low-level requirements. This may involve one or more lower levels of requirements.

The primary output of the process is the Design Description (subsection I 1. 10) which includes the software architecture and the low-level requirements.

The software design process is complete when its objectives and the objectives of the integral processes associated with it are satisfied. Guidance for this process includes:

   a. Low-level requirements and software architecture developed during the software design process should conform to the Software Design Standards and be traceable, verifiable and consistent

   b. Derived requirements should be defined and analyzed to ensure that the higher level requirements are not compromised.

   c. Software design process activities could introduce possible modes of failure into the software or, conversely, preclude others. The use of partitioning or other architectural means in the software design may alter the software level assignment for some components of the software. In such cases, additional data should be defined as derived requirements and provided to the s ystem safety assessment process.

   d. Control flow and data flow should be monitored when safety-related requirements dictate, for example, watchdog timers, reasonableness-checks and cross-channel comparisons.

   e. Responses to failure conditions should be consistent with the safety-related requirements.

   f. Inadequate or incorrect inputs detected during the software design process should be provided to either the system life cycle process, the software requirements process, or the software planning process as feedback for clarification or correction.

   Note: The current state of software engineering does not permit a quantitative correlation between complexity and the attainment of safety objectives. While no objective guidelines can be provided, the software design process should avoid introducing complexity because as the complexity of software increases, it becomes re difficult to verify the design and to show that the safety objectives of the software are satisfied.

### Designing for User-Modifiable Software

Guidance follows concerning the development of software that is designed to be modifiable by its users. A modifiable component is that part of the software that is intended to be changed by the user and a non-modifiable component is that which is not intended to be changed by the user. User-modifiable software may vary in complexity. Examples include a single memory bit used to select one of two equipment options, a table of messages, or a memory area that can be programmed, compiled, and linked for aircraft maintenance functions. Software of any level can include a modifiable component.

Guidance for designing user-modifiable software includes:

   a. The non-modifiable component should be protected from the modifiable component to prevent interference in the safe operation of the non-modifiable component. This protection can be enforced by hardware, by software, by the tools used to make the change, or by a combination of the three.

   b. The applicant-provided means should be shown to be the only means by which the modifiable component can be changed.

## Software Coding Process

In the software coding process, the Source Code is implemented from the software architecture and the low-level requirements.

### Software Coding Process Objectives.

The objective of the software coding process is:

   a. Source code is developed that is traceable, verifiable, consistent, and correctly implements low-level requirements.

### Software Coding Process Activities

The coding process inputs are the low-level requirements and software architecture from the software design process, and the Software Development Plan and the Software Code Standards. The software coding process may be entered or re-entered when the planned transition criteria are satisfied. The Source Code is produced by this process based upon the software architecture and the low-level requirements.

The primary results of this process are Source Code (subsection 1 1. I 1) and object code.

The software coding process is complete when its objectives and the objectives of the integral processes associated with it are satisfied. Guidance for this process includes:

   a. The Source Code should implement the low-level requirements and conform to the software architecture.
   b. The Source Code should conform to the Software Code Standards.
   c. The Source Code should be traceable to the Design Description.
   d. Inadequate or incorrect inputs detected during the software coding process should be provided to the software requirements process, software design process or software planning process as feedback for clarification or correction.

## Integration Process

The target computer, and the Source Code and object code from the software coding process are used with the linking and loading data (subsection 11.16) in the integration process to develop the integrated airborne system or equipment.

### Integration Process Objectives

The objective of the integration process is:

   a. The Executable Object Code is loaded into the target hardware for hardware/software integration.

### Integration Process Activities

The integration process consists of software integration and hardware/software integration.

The integration process may be entered or re-entered when the planned transition criteria have been satisfied. The integration process inputs are the software architecture from the software design process, and the Source Code and object code from the software coding process.

The outputs of the integration process are the Executable Object Code, as defined in subsection 11.12, and the linking and loading data. The integration process is complete when its objectives and the objectives of the integral processes associated with it are satisfied. Guidance for this process includes:

   a. The Executable Object Code should be generated from the Source and linking and loading data.

   b. The software should be loaded into the target computer for hardware/software integration.

   c. Inadequate or incorrect inputs detected during the integration process should be provided to the software requirements process, the software design process, the software coding process or the software planning process as feedback for clarification or correction.

### Integration Considerations

The following are considerations for deactivated code and software patches. An airborne system or equipment may be designed to include several configurations, not all of which are intended to be used in every application. This can lead to deactivated code that cannot be executed or data that is not used. This differs from dead code which is defined in the glossary and discussed in subparagraph 6.4.4.3. Guidance for deactivated code and patches includes:

   a. Evidence should be available that the deactivated code is disabled for the environments where its use is not intended. Unintended activation of deactivated code due to abnormal system conditions is the same as unintended activation of activated code.

   b. The methods for handling deactivated code should comply with the software plans.

   c. Patches should not be used in software submitted for use in a certified aircraft or engine to implement changes in requirements or architecture, or changes found necessary as a result of software verification process activities. Patches may be used on a limited, case-by-case basis, for example, to resolve known deficiencies in the software development environment. such as a known compiler problem.

   d. When a patch is used, these should be available:

      (1) Confirmation that the software configuration management process can effectively track the patch.

      (2) Regression analysis to provide evidence that the patch satisfies all objectives of the software developed by normal methods.

      (3) Justification in the Software Accomplishment Summary for the use of a patch.

## Traceability

Traceability guidance includes:

   a. Traceability between system requirements and software requirements should be provided to enable verification of the complete implementation of the system requirements and give visibility to the derived requirements.

   b. Traceability between the low-level requirements and high-level requirements should be provided to give visibility to the derived requirements and the architectural design decisions made during the software design process, and allow verification of the complete implementation of the high-level requirements.

   c. Traceability between Source Code and low-level requirements should be provided to enable verification of the absence of undocumented Source Code and verification of the complete implementation of the low-level requirements.
