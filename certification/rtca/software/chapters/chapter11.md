# SOFTWARE LIFE CYCLE DATA

Data is produced during the software life cycle to plan, direct, explain, define, record, or provide evidence of activities. This data enables the software life cycle processes, system or equipment certification, and post-certification modification of the software product. This section discusses the characteristics, form, configuration management controls, and content of the software life cycle data.

The characteristics of the software life cycle data are:

   a. Unambiguous: Information is unambiguous if it is written in terms which only allow a single interpretation, aided if necessary by a definition.

   b. Complete: Information is complete when it includes necessary, relevant requirements and/or descriptive material, responses are defined for the range of valid input data, figures used are labeled, and terms and units of measure are defined.

   c. Verifiable: Information is verifiable if it can be checked for correctness by a person or tool.

   d. Consistent: Information is consistent if there are no conflicts within it.

   e. Modifiable: Information is modifiable if it is structured and has a style such that changes can be made completely, consistently, and correctly while retaining the structure.

   f. Traceable: Information is traceable if the origin of its components can be determined. In addition, this guidance applies:

   g. Form: The form should provide for the efficient retrieval and review of software fife cycle data throughout the service life of the airborne system or equipment. The data and the specific form of the data should be specified in the Plan for Software Aspects of Certification.

Note: (1) The software life cycle data may take a number of forms. For example, it can be in written form, as computer files stored on magnetic media, or as displays on a remote terminal. It may be packaged as individual documents, combined into larger documents, or distributed across several documents.

Note: (2) The Plan for Software Aspects of Certification and the Software Accomplishment Summary may be required as separate printed documents by some certification authorities.

Software life cycle data can be placed in one of two categories associated with the software configuration management controls applied: Control Category 1 (CC1) and Control Category 2 (CC2) (subsection 7.3). This distinction provides a means to manage development costs where less stringent controls can be applied without a reduction in safety. The minimum control category assigned to each data item, and its variation by software level is specified in Annex A.

The following data descriptions define the data generally produced to aid in the software aspects of the certification process. The descriptions are not intended to describe all data necessary to develop a software product, and are not intended to imply a particular data packaging method or organization of the data within a package.

In addition to the data defined in these subsections, other data may be produced as evidence to aid the certification process.

   h. Control: If intended to be used for this purpose, this data should be defined in the software plan which defines the process for which the data will be produced. While the nature and content of this data may vary, as a minimum, CC2 controls should be applied. Examples include memoranda and meeting minutes.

## Plan for Software Aspects of Certification

The Plan for Software Aspects of Certification is the primary means used by the certification authority for determining whether an applicant is proposing a software life cycle that is commensurate with the rigor required for the level of software being developed. This plan should include:

   a. System overview: This section provides an overview of the system, including a description of its functions and their allocation to the hardware and software, the architecture, processor(s) used, hardware/software interfaces, and safety features.

   b. Software overview: This section briefly describes the software functions with emphasis on the proposed safety and partitioning concepts, for example, resource sharing, redundancy, multiple-version dissimilar software, fault tolerance, and timing and scheduling strategies.

   c. Certification considerations. This section provides a summary of the certification basis, including the means of compliance, as relating to the software aspects of certification. This section also states the proposed software level(s) and summarizes the justification provided by the system safety assessment process, including potential software contributions to failure conditions.

   d. Software life cycle: This section defines the software life cycle to be used and includes a summary of each software life cycle and its processes for which detailed information is defined in their respective software plans. The summary explains how the objectives of each software life cycle process will be satisfied, and specifies the organizations to be involved, the organizational responsibilities, and the system life cycle processes and certification liaison process responsibilities.

   e. Software life cycle data: This section specifies the software life cycle data that will be produced and controlled by the software life cycle processes. This section also describes the relationship of the data to each other or to other data defining the system, the software life cycle data to be submitted to the certification authority, the form of the data, and the means by which software life cycle data will be made available to the certification authority.

   f. Schedule: This section describes the means the applicant will use to provide the certification authority with visibility of the activities of the software life cycle processes so reviews can be planned.

   g. Additional considerations.: This section describes specific features that may affect the certification process, for example, alternative methods of compliance, tool qualification, previously developed software, option-selectable software, user-modifiable software, COTS software, field-loadable software, multiple-version dissimilar software, and product service history.

## Software Development Plan

The Software Development Plan includes the objectives, standards and software life cycle(s) to be used in the software development processes. It may be included in the Plan for Software Aspects of Certification. This plan should include:

   a. Standards: Identification of the Software Requirements Standards, Software Design Standards and Software Code Standards for the project. Also, references to the standards for previously developed software, including COTS software, if those standards are different.

   b. Software life cycle: A description of the software life cycle processes to be used to form the specific software life cycle(s) to be used on the project, including the transition criteria for the software development processes. This description is distinct from the summary provided in the Plan for Software Aspects of Certification, in that it provides the detail necessary to ensure proper implementation of the software life cycle processes.

   c. Software evelopment environment: A statement of the chosen software development environment in terms of hardware and software, including:

      (1) The chosen requirements development method(s) and tools to be used.

      (2) The chosen design method(s) and tools to be used.

      (3) The programming language(s), coding tools, compilers, linkage editors and loaders to be used.

      (4) The hardware platforms for the tools to be used.

## Software Verification Plan

The Software Verification Plan is a description of the verification procedures to satisfy the software verification process objectives. These procedures may vary by software level as defined in the tables of Annex A. This plan should include:

   a. Organization: Organizational responsibilities within the software verification process and interfaces with the other software life cycle processes.

   b. Independence: A description of the methods for establishing verification independence, when required.

   c. Verification methods: A description of the verification methods to be used for each activity of the software verification process.
      (1) Review methods, including checklists or other aids.
      (2) Analysis methods, including traceability and coverage analysis.
      (3) Testing methods, including guidelines that establish the test case selection process, the test procedures to be used, and the test data to be produced.

   d. Verification environment: A description of the equipment for testing, the testing and analysis tools, and the guidelines for applying these tools and hardware test equipment (see also paragraph 4.4.3, item b for guidance on indicating target computer and simulator or emulator differences).

   e. Transition criteria: The transition criteria for entering the software verification process defined in this plan.

   f. Partitioning considerations: If partitioning is used, the methods used to verify the integrity of the partitioning.

   g. Compiler assumptions: A description of the assumptions made by the applicant about the correctness of the compiler, linkage editor or loader (paragraph 4.4.2).

   h. Reverification Guidelines: For software modification, a description of the methods for identifying the affected areas of the software and the changed parts of the Executable Object Code. The reverification should ensure that previously reported errors or classes of errors have been eliminated.

   i. Previously developed software: For previously developed software, if the initial compliance baseline for the verification process does not comply with this document, a description of the methods to satisfy the objectives of this document.

   j. Multiple-version dissimilar software: If multiple-version dissimilar software is used, a description of the software verification process activities (paragraph 12.3.3).

## Software Configuration Management Plan

The Software Configuration Management Plan establishes the methods to be used to achieve the objectives of the software configuration management (SCM) process throughout the software life cycle. This plan should include:

   a. Environment: A description of the SCM environment to be used, including procedures, tools, methods, standards, organizational responsibilities, and interfaces.

   b. Activities: A description of the SCM process activities in the software life cycle that will satisfy the objectives for:
      (1) Configuration identification: Items to be identified, when they will be identified, the identification methods for software life cycle data (for example, part numbering), and the relationship of software identification and airborne system or equipment identification.
      (2) Baselines and traceability: The means of establishing baselines, what baselines will be established, when these baselines will be established, the software library controls, and the configuration item and baseline traceability.
      (3) Problem reporting: The content and identification of problem reports for the software product and software life cycle processes, when they will be written, the method of closing problem reports, and the relationship to the change control activity.
      (4) Change control: Configuration items and baselines to be controlled, when they will be controlled, the problem/change control activities that control them, pre- certification controls, post-certification controls, and the means of preserving the integrity of baselines and configuration items.
      (5) Change review: The method of handling feedback from and to the software life cycle processes; the methods of assessing and prioritizing problems, approving changes, and handling their resolution or change implementation; and the relationship of these methods to the problem reporting and change control activities.
      (6) Configuration status accounting: The data to be recorded to enable reporting configuration management status, definition of where that data will be kept, how it will be retrieved for reporting, and when it will be available.
      (7) Archive, retrieval, and release: The integrity controls, the release method and authority, and data retention.
      (8) Software load control: A description of the software load control safeguards and records.
      (9) Software life cycle environment controls: Controls for the tools used to develop, build, verify and load the software, addressing items I through 7 above. This includes control of tools to be qualified.
      (10) Software life cycle data controls: Controls associated with Control Category I and Control Category 2 data.

   c. Transition criteria The transition criteria for entering the SCM process.

   d. SCM data: A definition of the software life cycle data produced by the SCM process, including SCM Records, the Software Configuration Index and the Software Life Cycle Environment Configuration Index.

   e. Supplier control: The means of applying SCM process requirements to sub-tier suppliers.

## Software Quality Assurance Plan

The Software Quality Assurance Plan establishes the methods to be used to achieve the objectives of the software quality assurance (SQA) process. The SQA Plan may include descriptions of process improvement, metrics, and progressive management methods. This plan should include:

   a. Environment: A description of the SQA environment, including scope, organizational responsibilities and interfaces, standards, procedures, tools and methods.

   b. Authority: A statement of the SQA authority, responsibility, and independence, including the approval authority for software products.

   c. Activities: The SQA activities that are to be performed for each software life cycle process and throughout the software life cycle including:
      (1) SQA methods, for example, reviews, audits, reporting, inspections, and monitoring of the software life cycle processes.
      (2) Activities related to the problem reporting, tracking and corrective action system.
      (3) A description of the software conformity review activity.

   d. Transition criteria The transition criteria for entering the SQA process.

   e. Timing: The timing of the SQA process activities in relation to the activities of the software life cycle processes.

   f. SQA Records: A definition of the records to be produced by the SQA process.

   g. Supplier control: A description of the means of ensuring that sub-tier suppliers' processes and outputs will comply with the SQA Plan.

## Software Requirements Standards

The purpose of Software Requirements Standards is to define the methods, rules and tools to be used to develop the high-level requirements. These standards should include:

   a. The methods to be used for developing software requirements, such as structured methods.

   b. Notations to be used to express requirements, such as data flow diagrams and formal specification languages.

   c. Constraints on the use of the requirement development tools.

   d. The method to be used to provide derived requirements to the system process.

## Software Design Standards

The purpose of Software Design Standards is to define the methods, rules and tools to be used to develop the software architecture and low-level requirements. These standards should include:

   a. Design description method(s) to be used.

   b. Naming conventions to be used.

   c. Conditions imposed on permitted design methods, for example, scheduling, and the use of interrupts and event-driven architectures, dynamic tasking, re-entry, global data, and exception handling, and rationale for their use.

   d. Constraints on the use of the design tools.

   e. Constraints on design, for example, exclusion of recursion, dynamic objects, data aliases, and compacted expressions.

   f. Complexity restrictions, for example, maximum level of nested calls or conditional structures, use of unconditional branches, and number of entry/exit points of code components.

## Software Code Standards

The purpose of the Software Code Standards is to define the programming languages, methods, rules and tools to be used to code the software. These standards should include:

   a. Programming language(s) to be used and/or defined subset(s). For a programming language, reference the data that unambiguously defines the syntax, the control behavior, the data behavior and side-effects of the language. This may require limiting the use of some features of a language.

   b. Source Code presentation standards, for example, line length restriction, indentation, and blank line usage and Source Code documentation standards, for example, name of author, revision history, inputs and outputs, and affected global data.

   c. Naming conventions for components, subprograms, variables, and constants.

   d. Conditions and constraints imposed on permitted coding conventions, such as the degree of coupling between software components and the complexity of logical or numerical expressions and rationale for their use.

   e. Constraints on the use of the coding tools.

## Software Requirements Data

Software Requirements Data is a definition of the high-level requirements including the derived requirements. This data should include:

   a. Description of the allocation of system requirements to software, with attention to safety related requirements and potential failure conditions.

   b. Functional and operational requirements under each mode of operation.

   c. Performance criteria, for example, precision and accuracy.

   d. Timing requirements and constraints.

   e. Memory size constraints.

   f. Hardware and software interfaces, for example, protocols, formats, frequency of inputs and frequency of outputs.

   g. Failure detection and safety monitoring requirements.

   h. Partitioning requirements allocated to software, how the partitioned software components interact with each other, and the software level(s) of each partition.

## Design Description

The Design Description is a definition of the software architecture and the low- level requirements that will satisfy the software high-level requirements. This data should include:

   a. A detailed description of how the software satisfies the specified software high-level requirements, including algorithms, data structures, and how software requirements are allocated to processors and tasks.

   b. The description of the software architecture defining the software structure to implement the requirements.

   c. The input/output description, for example, a data dictionary, both internally and externally throughout the software architecture.

   d. The data flow and control flow of the design.

   e. Resource limitations, the strategy for managing each resource and its limitations, the margins, and the method for measuring those margins, for example, timing and memory.

   f. Scheduling procedures and inter-processor/inter-task communication mechanisms, including time-rigid sequencing, preemptive scheduling, Ada rendezvous, and interrupts.

   g. Design methods and details for their implementation, for example, software data loading, user-modifiable software, or multiple-version dissimilar software.

   h. Partitioning methods and means of preventing partition breaches.

   i. Descriptions of the software components, whether they are new or previously developed, and, if previously developed, reference to the baseline from which they were taken.

   j. Derived requirements resulting from the software design process.

   k. If the system contains deactivated code, a description of the means to ensure that the code cannot be enabled in the target computer.
   l. Rationale for those design decisions that are traceable to safety-related system requirements.

## Source Code

This data consists of code written in source language(s) and the compiler instructions for generating the object code from the Source Code, and linking and loading data. This data should include the software identification, including the name and date of revision and/or version, as applicable.

## Executable Object Code

The Executable Object Code consists of a form of Source Code that is directly usable by the central processing unit of the target computer and is, therefore, the software that is loaded into the hardware or system.

## Software Verification Cases and Procedures

Software Verification Cases and Procedures detail how the software verification process activities are implemented. This data should include descriptions of the:

   a. Review and analysis procedures: Details, supplementary to the description in the Software Verification Plan, which describes the scope and depth of the review or analysis methods to be used.

   b. Test cases: The purpose of each test case, set of inputs, conditions, expected results to achieve the required coverage criteria, and the pass/fail criteria.

   c. Test proceed: The step-by-step instructions for how each test case is to be set up and executed, how the test results are evaluated, and the test environment to be used.

## Software Verification Results

The Software Verification Results are produced by the software verification process activities. Software Verification Results should:

   a. For each review, analysis and test, indicate each procedure that passed or failed during the activities and the final pass/fail results.

   b. Identify the configuration item or software version reviewed, analyzed or tested.

   c. Include the results of tests, reviews and analyses, including coverage analyses and traceability analyses.

## Software Life Cycle Environment Configuration Index

The Software Life Cycle Environment Configuration Index (SECI) identifies the configuration of the software life cycle environment. This index is written to aid reproduction of the hardware and software life cycle environment, for software regeneration, reverification, or software modification, and should:

   a. Identify the software life cycle environment hardware and its operating system software.

   b. Identify the software development tools, such as compilers, linkage editors and loaders, and data integrity tools (such as tools that calculate and embed checksums or cyclical redundancy checks).

   c. Identify the test environment used to verify the software product, for example, the software verification tools.

   d. Identify qualified tools and their associated tool qualification data.

   Note: This data may be included in the Software Configuration Index.

## Software Configuration Index

The Software Configuration Index (SCI) identifies the configuration of the software product.

Note: The SCI can contain one data item or a set (hierarchy) of data items. The SCI can contain the items listed below or it may reference another SCI or other configuration identified data that specifies the individual items and their versions. The SCI should identify:

   a. The software product.

   b. Executable Object Code.

   c. Each Source Code component.

   d. Previously developed software in the software product, if used.

   e. Software life cycle data.

   f. Archive and release media.

   g. Instructions for building the Executable Object Code, including, for example, instructions and data for compiling and linking; and the procedures used to recover the software for regeneration, testing or modification.

   h. Reference to the Software Life Cycle Environment Configuration Index (subsection II. 15), if is packaged separately.

   i. Data integrity checks for the Executable Object Code, if used.

   Note: The SCI may be produced for one software product version or it may be extended to contain data for several alternative or successive software product versions.

## Problem Reports

Problem reports are a means to identify and record the resolution to software product anomalous behavior, process non-compliance with software plans and standards, and deficiencies in software life cycle data. Problem reports should include:

   a. Identification of the configuration item and/or the software life cycle process activity in which the problem was observed.

   b. Identification of the configuration item(s) to be modified or a description of the process to be changed.

   c. A problem description that enables the problem to be understood and resolved.

   d. A description of the corrective action taken to resolve the reported problem.

## Software Configuration Management Records

The results of the SCM process activities are recorded in SCM Records. Examples include configuration identification lists, baseline or software library records, change history reports, archive records, and release records. These examples do not imply records of these specific types need to be produced. Note: Due to the integral nature of the SCM process, its outputs will often be included as parts of other software life cycle data.

## Software Quality Assurance Records

The results of the SQA process activities are recorded in SQA Records. These may include SQA review or audit reports, meeting minutes, records of authorized process deviations, or software conformity review records.

## Software Accomplishment Summary

The Software Accomplishment Summary is the primary data item for showing compliance with the Plan for Software Aspects of Certification. This summary should include:

   a. System overview: This section provides an overview of the system, including a description of its functions and their allocation to hardware and software, the architecture, the processor(s) used, the hardware/software interfaces, and safety features. This section also describes any differences from the system overview in the Plan for Software Aspects of Certification.

   b. Software overview: This section briefly describes the software functions with emphasis on the safety and partitioning concepts used, and explains differences from the software overview proposed in the Plan for Software Aspects of Certification.

   c. Certification considerations: This section restates the certification considerations described in the Plan for Software Aspects of Certification and describes any differences.

   d. Software characteristics: This section states the Executable Object Code size, timing and memory margins, resource limitations, and the means of measuring each characteristic.

   e. Software life cycle : This section summarizes the actual software life cycle(s) and explains differences from the software life cycle and software life cycle processes proposed in the Plan for Software Aspects of Certification.

   f. Software life cycle data: This section references the software life cycle data produced by the software development processes and integral processes. It describes the relationship of the data to each other and to other data defining the system, and the means by which software life cycle data will be made available to the certification authority. This section also describes any differences from the Plan for Software Aspects of Certification.

   g. Additional considerations: This section summarizes certification issues that may warrant the attention of the certification authority and references data items applicable to these issues, such as issue papers or special conditions.

   h. Software identification: This section identifies the software configuration by part number and version.

   i. Change history: If applicable, this section includes a summary of software changes with attention to changes made due to failures affecting safety, and identifies changes from the software life cycle processes since the previous certification.

   j. Software status: This section contains a summary of problem reports unresolved at the time of certification, including a statement of functional limitations.

   k. Compliance statement: This section includes a statement of compliance with this document and a summary July 2, 1996 of the methods used to demonstrate compliant with criteria specified in the software plans. This section also addresses additional rulings and deviations from the software plans, standards and this document.
