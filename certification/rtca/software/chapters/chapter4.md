# SOFTWARE PLANNING PROCESS

This section discusses the objectives and activities of the software planning process. This process
produces the software plans and standards that direct the software development processes and the integral
processes. Table A- 1 of Annex A is a summary of the objectives and outputs of the software planning
process by software level.

## Software Planning Process Objectives

The purpose of the software planning process is to define the means of producing software which will satisfy the system requirements and provide the level of confidence which is consistent with airworthiness requirements. The objectives of the software planning process are:

   a. The activities of the software development processes and integral processes of the software life cycle that will address the system requirements and software level(s) are defined (subsection 4.2).

   b. The software life cycle(s), including the inter- relationships between the processes, their sequencing, feedback mechanisms, and transition criteria are determined (section 3).

   c. The software life cycle environment, including the methods and tools to be used for the activities of each software life cycle process have been selected (subsection 4.4).

   d. Additional considerations, such as those discussed in section 12, have been addressed, if necessary.

   e. Software development standards consistent with the system safety objectives for the software to be produced are defined (subsection 4.5).

   f. Software plans that comply with subsection 4.3 and section 11 have been produced.

   g. Development and revision of the software plans are coordinated (subsection 4.3).

## Software Planning Process Activities

Effective planning is a determining factor in producing software that satisfies the guidelines of this document. Guidance for the software planning process includes:

   a. The software plans should be developed at a point in time in the software life cycle that provides timely direction to the personnel performing the software development processes and integral processes. See also the guidelines of subsection 9. I.

   b. The software development standards to be used for the project should be defined or selected.

   c. Methods and tools should be chosen that provide error prevention in the software development processes.

   d. The software planning process should provide coordination between the software development and integral processes to provide consistency among strategies in the software plans.

   e. The software planning process should include a means to revise the software plans as a project progresses.

   f. When multiple-version dissimilar software is used in a system, the software planning process should choose the methods and tools to achieve the error avoidance or detection necessary to satisfy the system safety objectives.

   g. For the software planning process to be complete, the software plans and software development standards should be under change control and reviews of them completed (subsection 4.6).

   h. If deactivated code is planned (subsection 2.4), the software planning process should describe how the deactivated code (selected options, flight test) will be defined, verified and handled to achieve system safety objectives.

   i. If user-modifiable code is planned, the process, tools, environment, and data items substantiating the guidelines of paragraph 5.2.3 should be specified in the software plans and standards.

Other software life cycle processes may begin before completion of the software planning process if the plans and procedures for the specific process activity are available.

## Software Plans

The purpose of the software plans is to define the means of satisfying the objectives of this document. They specify the organizations that will perform those activities. The software plans are:

   - The Plan for Software Aspects of Certification (subsection 1 1. 1) serves as the primary means for communicating the proposed development methods to the certification authority for agreement, and defines the means of compliance with this document.

   - The Software Development Plan (subsection 11.2) defines the software life cycle(s) and software development environment.

   - The Software Verification Plan (subsection 11.3) defines the means by which the software verification process objectives will be satisfied.

   - The Software Configuration Management Plan (subsection 11.4) defines the means by which the software configuration management process objectives will be satisfied.

   - The Software Quality Assurance Plan (subsection 11.5) defines the means by which the software quality assurance process objectives will be satisfied.

Guidance for the software plans includes:

   a. The software plans should comply with this document.

   b. The software plans should define the criteria for transition between software life cycle processes by specifying:

      (1) The inputs to the process, including feedback from other processes.
      (2) Any integral process activities that may be required to act on these inputs.
      (3) Availability of tools, methods, plans and procedures.

   c. The software plans should state the procedures to be used to implement software changes prior to use on a certified aircraft or engine. Such changes may be as a result of feedback from other processes and may cause a change to the software plans.

## Software Life Cycle Environment Planning

The purpose of the planning for the software life cycle environment is to define the methods, tools, procedures, programming languages and hardware that will be used to develop, verify, control and produce the software life cycle data (section 11) and software product. Examples of how the software environment chosen can have a beneficial effect on the airborne software include enforcing standards, detecting errors, and implementing error prevention and fault tolerance methods. The software life cycle environment is a potential error source that can contribute to failure conditions. Composition of this software life cycle environment may be influenced by the safety-related requirements determined by the system safety assessment process, for example, the use of dissimilar, redundant components.

The goal of error prevention methods is to avoid errors during the software development processes that might contribute to a failure condition. The basic principle is to choose requirements development and design methods, tools, and programming languages that limit the opportunity for introducing errors, and verification methods that ensure that errors introduced are detected. The goal of fault tolerance methods is to include safety features in the software design or Source Code to ensure that the software will respond correctly to input data errors and prevent output and control errors. The need for error prevention or fault tolerance methods is determined by the system requirements and the system safety assessment process.

The considerations presented above may affect:

   - The methods and notations used in the software requirements process and software design process.

   - The programming language(s) and methods used in the software coding process.

   - The software development environment tools.

   - The software verification and software configuration management tools.

   - The need for tool qualification (subsection 12.2).

### Software Development Environment

The software development environment is a significant factor in the production of high quality software. The software development environment can also adversely affect the production of airborne software in several ways. For example, a compiler could introduce errors by producing a corrupted output or a linker could fail to reveal a memory allocation error that is present. Guidance for the selection of software development environment methods and tools includes:

   a. During the software planning proces s, the software development environment should be chosen to minimize its potential risk to the final airborne software.

   b. The use of qualified tools or combinations of tools and parts of the software development environment should be chosen to achieve the necessary level of confidence that an error introduced by one part would be detected by another. An acceptable environment is produced when both parts are consistently used together.

   c. Software verification process activities or software development standards, which include consideration of the software level, should be defined to minimize potential software development environment-related errors.

   d. If certification credit is sought for use of the tools in combination, the sequence of operation of the tools should be specified in the appropriate plan.

   e. If optional features of software development tools are chosen for use in a project, the effects of the options should be examined and specified in the appropriate plan.

Note: This is especially important where the tool directly generates part of the software product. In this context, compilers are probably the most important tools to consider.

### Language and Compiler Considerations

Upon successful completion of verification of the software product, the compiler is considered acceptable for that product. For this to be valid, the software verification process activities need to consider particular features of the programming language and compiler. The software planning process considers these features when choosing a programming language and planning for verification. Guidance includes:

   a. Some compilers have features intended to optimize performance of the object code. If the test cases give coverage consistent with the software level, the correctness of the optimization need not be verified. Otherwise, the impact of these features on structural coverage analysis should be determined following the guidelines of subparagraph 6.4.4.2.

   b. To implement certain features, compilers for some languages may produce object code that is not directly traceable to the source code, for example, initialization, built-in error detection or exception handling (subparagraph 6.4.4.2, item b). The software planning process should provide a means to detect this object code and to ensure verification coverage and define the means in the appropriate plan.

   c. If a new compiler, linkage editor or loader version is introduced, or compiler options are changed during the software life cycle, previous tests and coverage analyses may no longer be valid. The verification planning should provide a means of re-verification which is consistent with the guidelines of section 6 and paragraph 12.1.3.

### Software Test Environment

The purpose of software test environment planning is to define the methods, tools, procedures and hardware that will be used to test the outputs of the integration process. Testing may be performed using the target computer, a target computer emulator or a host computer simulator. Guidance includes:

   a. The emulator or simulator may need to be qualified as described in subsection 12.2.

   b. The differences between the target computer and the emulator or simulator, and the effects of these differences on the ability to detect errors and verify functionality, should be considered. Detection of those errors should be provided by other software verification process activities and specified in the Software Verification Plan.

## Software Test Environment

The purpose of the software development standards is to define the rules and constraints for the software development processes. The software development standards include the Software Requirements Standards, the Software Design Standards and the Software Code Standards. The software verification process uses these standards as a basis for evaluating the compliance of actual outputs of a process with intended outputs. Guidance for software development standards includes:

   a. The software development standards should comply with section 11.

   b. The software development standards should enable software components of a given software product or related set of products to be uniformly designed and implemented.

   c. The software development standards should disallow the use of constructs or methods that produce outputs that cannot be verified or that are not compatible with safety-related requirements.

   Note: In developing standards, consideration can be given to previous experience. Constraints and rules on development, design, and coding methods can be included to control complexity. Defensive programming practices may be considered to improve robustness.

## Review and Assurance of the Software Planning Process

Reviews and assurance of the software planning process are conducted to ensure that the software plans and software development standards comply with the guidelines of this document and means are provided to execute them. Guidance includes:

   a. The chosen methods will enable the objectives of this document to be satisfied.

   b. The software life cycle processes can be applied consistently.

   c. Each process produces evidence that its outputs can be traced to their activity and inputs, showing the degree of independence of the activity, the environment, and the methods to be used.

   d. The outputs of the software planning process are consistent and comply with section 11.
