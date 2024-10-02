# HARDWARE DESIGN LIFE CYCLE DATA

This section describes the hardware design life cycle data items that may be produced during the hardware design life cycle for providing evidence of design assurance and compliance with certification requirements. The scope, amount and detail of the life cycle data needed by the certification authorities as design assurance evidence will vary depending on a number of factors. These factors include the applicable certification authority requirements for the airborne system, the assigned design assurance levels, the complexity and the service experience of the hardware. Details of the design assurance evidence should be identified, recorded in the PHAC and agreed to with the certification authorities.

The additional considerations in Section 11 and the design assurance considerations for Level A and B functions in Appendix B may lead to the generation of additional life cycle data.

Appendix A indicates the hardware design life cycle data to be developed, the degree of verification independence, and the applicable data control category, as defined in Section 7 , in terms of the hardware design assurance level.

1. The hardware design life cycle data characteristics should be:

   a. Unambiguous. Information/data is written in terms that allow only a single interpretation.

   b. Complete. Information/data includes necessary and relevant requirements and descriptive material, labeled figures, and defined terms and units of measure.

   c. Verifiable. Information/data can be checked for correctness by a person or a tool.

   d. Consistent. Information/data contains no conflicts.

   e. Modifiable. Information/data is structured and changes can be made completely, consistently and correctly while retaining the structure.

   f. Traceable. Information/data origin can be determined.

   The descriptions of this section are not intended to imply a particular data packaging method, form or organization of the hardware life cycle data within a package. For example, all plans, standards, and procedures may be described in a single document or multiple documents.

2. The data packaging method, form and organization should be proposed in the PHAC and agreement with the certification authority obtained early in the program.

3. Agreed-upon information and data should be retrievable and available throughout the service life of the airborne system or equipment.

## Hardware Plans

The hardware plans describe the processes, procedures, methods, and standards to be used for the hardware certification, design, validation, verification, process assurance and configuration control.

### Plan for Hardware Aspects of Certification

The PHAC defines the processes, procedures, methods and standards to be used to achieve the objectives of this document and obtain certification authority approval for certification of the system containing hardware items. The PHAC, once approved, represents an agreement between the certification applicant and the certification authority on the processes and activities to be conducted and the resultant evidence to be produced to satisfy the hardware aspects of certification. The PHAC may be part of another plan, such as the airborne system certification plan.

The PHAC should include:

1. System Overview. This section provides an overview of the airborne system in which the hardware items are to be used, including a system functional description, system failure conditions, system architecture, a description of the allocation of the functions to hardware items and software, and references to existing system documentation.
2. Hardware Overview. This section describes the hardware functions, hardware items, architecture, new technologies to be used, and any fail-safe, fault tolerant, redundancy and partitioning techniques to be used.
3. Certification Considerations. This section describes the certification basis, proposed means of compliance and the hardware design assurance level of each function of the hardware item. It also provides the justification for the hardware design assurance level assignment based on a safety assessment of the hardware and its use within the airborne system, including a description of potential hardware failure conditions as discussed in Section 2.3.4. When applicable, either a summary of the FFPA or plan for performing an FFPA and applying the results should also be included.
4. Hardware Design Life Cycle. This section describes the procedures, methods and standards to be applied and processes and activities to be performed to meet the hardware design assurance objectives. It describes the activities, combinations and sequencing of activities, relationships between processes and activities, transition criteria, responsibilities, tool usage, and means for providing feedback and interaction among hardware processes and between hardware processes and the system and software processes. This section may reference applicable plans, policies, standards, procedures and deviations to those plans and standards for the program.
5. Hardware Design Life Cycle Data. This section describes or references the data to be developed and submitted or available as evidence of compliance to the objectives of this document and the plan.
6. Additional Considerations. This section describes the additional considerations. These include use of previously developed hardware, including references to applicable data to be reused, COTS usage, product service experience, and tool assessment and qualification as described in Section 11, or design assurance considerations for Level A or B functions as described in Appendix B.
7. Alternative Methods. This section describes any alternative methods proposed for the program which are either not described in this document or are to be applied in a manner other than as described in this document. Justification for why the alternative method is acceptable should be provided.
8. Certification Schedule. This section identifies the major program milestones and the dates when hardware design life cycle data will be submitted to the certification authority.

### Hardware Design Plan

The hardware design plan describes the procedures, methods and standards to be applied and the processes and activities to be conducted for the design of the hardware item. This plan may be included in the PHAC and may reference design policies and standards to be applied.

The hardware design plan should include:

1. Hardware Design Life Cycle. References to design policies and standards to be applied and a description of the hardware design life cycle processes and activities that will be used to achieve the design objectives for the hardware design assurance level.
2. Hardware Product Description. Identification of the hardware specifications to be achieved, alternative uses, planned service life and upgrade considerations.
3. Hardware Design Methods. Description of the requirements capture and specification methods, conceptual design methods, detailed design methods, synthesis techniques, implementation methods, and production transition methods to be used for the hardware item. When architectural mitigation for Level A or B functions, as described in Appendix B, Section 3.1, has been considered but not finalized at the time this plan is written, state how the decision will be carried into the design process.
4. Hardware Design Environment. Description of the design tools to be used.
5. Hardware Item Data. Identification of hardware item design data to be produced or references to previously developed hardware item specifications, document and drawing numbers, and part numbers.
6. Other Considerations. Description of planned process technology options, use and assembly options, product packaging, and hardware mounting options.

### Hardware Validation Plan.

The validation plan describes the procedures, methods and standards to be applied and the processes and activities to be conducted for the validation of the hardware item derived requirements to achieve the validation objectives of this document. This plan may be included in the PHAC and may reference validation standards to be applied.

The validation plan should include:

1. Validation Methods. Description of and references to the validation procedures, standards and methods to be used. Methods may include analyses, reviews and testing.
2. Validation Data. Identification and description of the evidence to be produced as a result of the hardware validation process.
3. Validation Environment. Identification and description of analysis and test equipment and validation tools to be used to implement the validation process and activities.

### Hardware Verification Plan

The verification plan describes the procedures, methods and standards to be applied and the processes and activities to be conducted for the verification of the hardware items to achieve the verification objectives of this document. This plan may be included in the PHAC and may reference verification policies and standards to be applied.

The verification plan should include:

1. Verification Methods. Description of and references to the verification policies, procedures, standards and methods to be used to provide objective evidence of the integrity of the hardware items, including COTS and unused functions. Methods may include analyses, reviews and testing. When the advanced analysis methods of Appendix B, Section 3.3 are employed, include a detailed description of the methods for the applicable FFPs and the applicable verification completion criteria.
2. Verification Data. Identification and description of the evidence to be produced as a result of the hardware verification process.
3. Verification Independence. Description of the means to be used to assure verification independence for those objectives requiring independence.
4. Verification Environment. Identification and description of analysis and test equipment and verification tools to be used to implement the verification process and activities.
5. Organizational Responsibilities. Identification of the organizations responsible for implementing the verification process.

### Hardware Configuration Management Plan

The hardware configuration management plan describes the policies, procedures, standards and methods to be used to satisfy the configuration management objectives of this document.

The hardware configuration management plan should include:

1. Hardware Configuration Management Methods. Description of and reference to the policies, procedures, standards and methods to be used to identify, manage, and control the hardware and its life cycle data.
2. Hardware Baselines. Description of the methods and procedures used to establish design and product baselines and provide baseline traceability.
3. Problem Reporting and Resolution. Description of the methods and procedures to be used for recording, tracking and resolving problem reports.
4. Change Control. Description of the methods, procedures and processes for identifying, controlling, and tracking changes to controlled data items.
5. Storage and Retrieval. Description of the procedures for release, archival and retrieval of hardware design life cycle data. The description should include archive content, format, and medium standards, rules, methods and criteria.
6. Environment Control. Description of the procedures and method for identifying and controlling the tools used for developing and verifying the hardware.
7. Configuration Management Tools. Description of the tools and resources used for the configuration management process and activities.

### Hardware Process Assurance Plan

The hardware process assurance plan describes the procedures, methods and standards to be applied and the processes and activities to be conducted for achieving the process assurance objectives of this document.

The hardware process assurance plan should include:

1. Process Control. Description of the policies and procedures for implementation of process assurance of the hardware design processes.
2. Organizational Responsibilities. Identification of the organizations responsible for implementing process assurance.
3. Conformance. Description of the policies, procedures and criteria for determining process and product conformance.
4. Process Assurance Activities. Description of the process assurance reviews and audits to be conducted to demonstrate compliance of the processes to plans and standards.
5. Deviations. Description of the methods for detecting, recording, evaluating, resolving and approving deviations from plans and standards.

## Hardware Design Standards and Guidance

Hardware design standards and guidance may define the rules, procedures, methods, and criteria for hardware design, validation, verification, assurance and control processes and are used to assess the acceptability and quality of hardware design results. Standards may not be required, but, if the applicant invokes them for the project, they become part of the certification basis and plans for the project. As with the plans, such standards and guidance may be packaged as a single document or multiple documents. Tools may be used to enforce standards.

### Requirements Standards

Requirements standards may be used during the requirements capture process to define the rules, procedures, methods, guidance and criteria for developing the requirements. Requirements standards may include methods and criteria for developing and specifying requirements, methods and criteria for validating the requirements, notations used to express the requirements, guidance on the use of requirements specification tools, and the means used to provide derived requirements to the system design process.

### Hardware Design Standards

Hardware design standards may be used during the conceptual design process and detailed design process to define the rules, procedures, methods, guidance and criteria for developing and specifying the hardware design.

Hardware design standards may include:

1. Hardware design representation methods and notations.
2. Design specification and naming conventions.
3. Guidance on design methods.
4. Guidance on the use of hardware design tools.
5. Guidance for electronic component selection.
6. Guidance for assessing design alternatives.
7. Guidance for assessing the fail-safe and fault-tolerance design constructs.
8. Description of the means for providing feedback to the requirements process and for clarifying requirements.

### Validation and Verification Standards

Hardware validation and verification standards may be used during the validation and verification processes to define the rules, procedures, methods, guidance and criteria for validating and verifying the hardware design and implementation.

### Hardware Archive Standards

Hardware archive standards may be used to define the procedures, methods and criteria used to retain and archive product data and develop and maintain program and project archives. Hardware archive standards may include archive content, format, and medium standards, rules, methods and criteria.

## Hardware Design Data

The hardware design data are the specifications, documents and drawings that define the hardware items.

### Hardware Requirements

The requirements specify the functional, performance, safety, quality, maintainability, and reliability requirements for the hardware item being developed.

The requirements should include:

1. The system design and safety requirements allocated to the hardware.
2. Identification of applicable standards for the hardware.
3. Hardware functional and performance requirements, including derived requirements and stress limits for normal use.
4. Hardware reliability and quality requirements, including requirements related to failure rates, exposure times and design constraints.
5. Hardware maintenance and repair requirements throughout the hardware item service life.
6. Hardware manufacturability and assembly requirements.
7. Hardware testability requirements.
8. Hardware storage and handling requirements.
9. Installation requirements.

### Hardware Design Representation Data

The hardware design representation data provides a definition of the hardware item and is comprised of the set of drawings, documents and specifications used to build the hardware item. The following paragraphs define some typical hardware design data and their content. The type of data, drawings and documents produced for a given hardware design will vary depending on the size, complexity and number of components the hardware item contains. 

#### Conceptual Design Data

The conceptual design data is the data that describes the hardware item’s architecture and functional design and may include:

1. A high-level description, such as a block diagram or HDL definition, which outlines the major functions and shows the flow of information between these functions.
2. The mechanical structure which describes the arrangement of the hardware item, such as drawings or sketches showing exterior package, printed circuit board arrangement, connector selection and location, and major interconnect wiring.
3. Other architectural features and partitioning that are important from an airworthiness point of view. This might include items such as EMI, lightning, shock or vibration protection, unused functions in major components as well as man-machine interfaces, such as ergonomic factors, lighting characteristics and display resolution.
4. Top-level hardware item functional description.
5. Hardware item functional architecture.
6. Preliminary hardware safety assessment data.

#### Detailed Design Data

The detailed design data describes the data necessary to implement the hardware item consistently with its requirements. Depending on the hierarchical level of the hardware item, this may include top-level drawing, assembly drawings, interconnection data, parts data, HDL hardware description, reliability data, test methodology data, list of unused functions in selected components and actions taken to assure they will not compromise the safety of the hardware item, installation control data, and hardware/software interface data. Some specific data are described below.

Note: In addition to the detailed design data required by other applicable certification requirements, such as Technical Standard Orders, the content and availability of other detailed design data items are proposed by the applicant to the certification authority in the PHAC.

##### Top-Level Drawing

...

The top-level drawing uniquely identifies the hardware item and identifies all assemblies, subassemblies, components and relevant documentation that define the hardware item.

##### Assembly Drawings

...

Assembly drawings include additional detailed information needed to assemble the hardware item, assembly, or subassembly.

An assembly drawing may include:

1. Location and orientation of the hardware items within a hardware assembly.
2. Identification of assembly instruction sequences or methods to ensure a correct and fault free assembly.
3. Locations for identifying marks, labels, vision references used in subsequent operations.

##### Installation Control Drawings

...

Installation control drawings ensure correct installation of a hardware item into a system or correct installation of a hardware item into another hardware item. For some lower level hardware item, assembly drawings for the next higher hardware item or assembly may act as the installation control drawing.

Installation control drawing may include:

1. Dimensions.
2. Clearance requirements.
3. Cooling and mounting information.
4. Information on weight, center of gravity, and other parameters necessary to ensure safe and proper installation.

##### Hardware/Software Interface Data

...

The performance of the hardware as determined by the requirements specification may depend upon the configuration of the hardware by the software, calibration of the hardware by the software or upon a necessary interaction between the hardware and software.

Data relating to the interface between the hardware and the software may include:

1. Memory addresses.
2. Allocation of memory address fields into which data can be loaded.
3. Timing and sequence information.
4. Other information necessary for the operation of the hardware/software interface.

## Validation and Verification Data

Validation and verification data is the evidence of the completeness and correctness of the hardware design results and of the hardware item itself. It provides assurance that the hardware has been developed to its requirements and design, correctly produced, and the design objectives achieved. Data includes procedures and results for hardware reviews, analyses and testing. Additional data items beyond that described in this section may be needed for Level A and B functions as described in Appendix B.

#### Traceability Data

Hardware traceability establishes a correlation between the requirements, detailed design, implementation and verification data that facilitates configuration control, modification and verification of the hardware item.

Hardware traceability data should include:

1. A correlation between the system requirements allocated to hardware and the requirements.
2. A correlation between the requirements and the hardware detailed design data.
3. A correlation between the hardware detailed design data and the as-built hardware item or assembly.
4. A correlation between the requirements, including derived hardware requirements, and detailed design data and the verification procedures and results.
5. The results of a traceability analysis.

#### Review and Analysis Procedures

Hardware review and analysis procedures define the process and criteria for conducting reviews and analyses.

Hardware review and analysis procedures should include:

1. Purpose of review or analysis.
2. Organizations to participate in the review.
3. Review or analysis criteria.
4. Detailed instructions for conducting the review or analysis.
5. Review or analysis acceptability and completion criteria.

#### Review and Analysis Results

Hardware review and analysis results are the evidence that the reviews and analyses have been completed to approved procedures and criteria.

Hardware review and analysis results should include:

1. Identification of review or analysis procedure.
2. Identification of data item reviewed or analyzed.
3. Personnel participating in the review or analysis.
4. Review or analysis results.
5. Corrective actions generated as a result of review or analysis, such as listing of problem reports or action items.
6. Review or analysis conclusion including, for reviews, a qualitative assessment of the item reviewed and, for analysis, a quantitative assessment of the item analyzed and the analysis data.

#### Test Procedures

Hardware test procedures define the methods, environment and instructions for conducting both functional and environmental qualification testing used for the verification of the hardware item.

Hardware test procedures should include:

1. Purpose of test.
2. Identification of the hardware test setups, software and test equipment setup instructions required for each hardware test.
3. Detailed instructions for conducting the test procedures.
4. Test input data.
5. Expected results, such as pass/fail criteria and requirements covered by the test.

#### Test Results

Hardware test results are the objective evidence that the tests have been completed to approved procedures in support of the verification of the hardware item.

Hardware test results should include:

1. Identification of the test procedure.
2. Identification of the item tested.
3. Actual results of conducting the test.
4. Identification of the personnel conducting and witnessing the tests, if applicable, and the date the tests were conducted.
5. Interpretation of results, either by analysis or review and actual test coverage achieved.

## Hardware Acceptance Test Criteria

This data provides the criteria and assessment data that the test and associated test results are capable of ensuring that an item is manufactured or repaired correctly.

The criteria should include:

1. Key attributes to be tested.
2. Pass/fail criteria for each key attribute.
3. Any test constraints.
4. Substantiation of the key attributes and pass/fail criteria.
5. Coverage of design aspects necessary to meet the safety requirements.
6. Assessment data that shows that the test criteria have been properly implemented based on the actual test procedures and associated test results.

## Problem Reports

Problem reports are a means to identify and record the resolution to hardware design problems, process non-compliance with hardware plans and standards, and deficiencies in hardware life cycle data.

Problem reports should include:

1. Identification of the configuration item and process activity in which the problem was observed.
2. Identification of the configuration items to be modified or a description of the process to be changed.
3. A problem description which enables the problem to be understood and resolved.
4. A description of the corrective action taken to resolve the reported problem.

## Hardware Configuration Management Records

The results of the configuration management process activities are recorded in configuration management records. These may include configuration identification lists, baseline or electronic records, change history reports, problem report summaries, tool identification data, archive records and release records.

## Hardware Process Assurance Records

The results of the process assurance process activities are recorded in process assurance records. These may include review or audit reports, meeting minutes, records of authorized process deviations, or conformity review records. 

## Hardware Accomplishment Summary

The Hardware Accomplishment Summary is the primary data item for showing compliance to the PHAC and demonstrating to the certification authority that the objectives of this document have been achieved for the hardware items. This summary may be combined with the system accomplishment summary. The Hardware Accomplishment Summary should include the following information as documented in the PHAC:

1. System overview.
2. Hardware overview.
3. Certification considerations.
4. Hardware design life cycle description.
5. Hardware design life cycle data.
6. Previously developed hardware.
7. Additional considerations.
8. Alternative methods

Differences from the approved PHAC should be identified. In addition, the following four items should be addressed: 

1. Hardware Identification. This section identifies the hardware configuration and hardware items by part number and version.
2. Change History. If applicable, this section includes a summary of hardware changes with attention to changes made due to failures affecting safety, and identifies changes from the hardware design life cycle processes since the previous certification.
3. Hardware Status. The section contains a summary of problem reports unresolved at the time of certification, including a statement of functional limitations.
4. Compliance Statement. This section includes a statement of compliance with this document and a summary of the methods used to demonstrate compliance with criteria specified in the hardware plans. This section also addresses additional rulings and deviations from the hardware plans, procedures, and this document.

   Note: The data included in the PHAC does not necessarily need to be repeated in the Hardware Accomplishment Summary, however doing so may expedite the certification process.
