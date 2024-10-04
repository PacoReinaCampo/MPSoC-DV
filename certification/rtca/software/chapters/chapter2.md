# SYSTEM ASPECTS RELATING TO SOFTWARE DEVELOPMENT

This section discusses those aspects of the system life cycle processes necessary to understand the software life cycle processes. Discussed are:

   - Exchange of data between the system and software life cycle processes (subsection 2.1).

   - Categorization of failure conditions, definition of software levels, and software level determination (subsection 2.2).

   - System architectural considerations (subsection 2.3).

   - System considerations for user-modifiable software, option-selectable software, and commercial off-the-shelf software (subsection 2.4).

   - System design considerations for field-loadable software (subsection 2.5).

   - System requirements considerations for software verification (subsection 2.6).

   - Software considerations in system verification (subsection 2.7).

## Information Flow Between System and Software Life Cycle Processes

Figure 2-1 is an overview of the safety aspects of the information flow between system life cycle processes and the software life cycle processes. Due to interdependence of the system safety assessment process and the system design process, the flow of information described in these sections is iterative.

Note: At the time of publication of this document, guidelines for the system life cycle processes were under development by an international committee. While every attempt was made to keep the inter-process information flows and definitions compatible, some differences may exist between the final published documents. Any differences will be reconciled in future revisions of the documents.

### Information Flow from System Processes to Software Processes

The system safety assessment process determines and categorizes the failure conditions of the system. Within the system safety assessment process, an analysis of the system design defines safety related requirements that specify the desired immunity from, and system responses to, these failure conditions. These requirements are defined for hardware and software to preclude or limit the effects of faults, and may provide fault detection and fault tolerance. As decisions are being made during the hardware design process and software development processes, the system safety assessment process analyzes the resulting system design to verify that it satisfies the safety-related requirements.

The safety-related requirements are a part of the system requirements which are inputs to the software life cycle processes. To ensure that the safety-related requirements are properly implemented throughout the software life cycle, the system requirements typically include or reference:

   - The system description and hardware definition.

   - Certification requirements, including applicable Federal Aviation Regulations (FAR-United States), Joint Aviation Regulations (JAR-Europe), Advisory Circulars (United States), etc.

   - System requirements allocated to software, including functional requirements, performance requirements, and safety-related requirements.

   - Software level(s) and data substantiating their determination, failure conditions, their categories, and related functions allocated to software.

   - Safety strategies and design constraints, including design methods, such as, partitioning, dissimilarity, redundancy or safety monitoring.

   - If the system is a component of another system, the safety-related requirements and failure conditions for that system.

System life cycle processes may specify requirements for the software life cycle processes to aid system verification activities.

### Information Flow from Software Processes to System Processes

The system safety assessment process determines the impact of the software design and implementation on system safety using information provided by the software life cycle processes. This information includes fault containment boundaries, software requirements, software architecture, and error sources that may have been detected or eliminated through software architecture or by the use of tools or by other methods used in the software design process. Traceability between system requirements and software design data is important to the system safety assessment process.

Modifications to the software may affect system safety and, therefore, need to be identified to the system safety assessment process for evaluation.

## Failure Condition and Software Level

Guidance follows concerning system failure condition categories, the definition of software levels, the relationship between software levels and failure condition categories, and how software level is determined.

The failure condition category of a system is established by determining the severity of failure conditions on the aircraft and its occupants. An error in software may cause a fault that contributes to a failure condition. Thus, the level of software integrity necessary for safe operation is related to the system failure conditions.

### Failure Condition Categorization

For a complete definition of failure condition categories, refer to the applicable regulations and guidance material, Federal Aviation Administration AC 25-1309-1A and/or the Joint Aviation Authorities AMJ 25-1309, as amended. The failure condition categories listed are derived from this guidance material and are included to assist in the use of this document. The categories are:

   a. Catastrophic: Failure conditions which would prevent continued safe flight and landing.

   b. Hazardous/Severe-Major: Failure conditions which would reduce the capability of the aircraft or the ability of the crew to cope with adverse operating conditions to the extent that there would be:

      (1) a large reduction in safety margins or functional capabilities,

      (2) physical distress or higher workload such that the flight crew could not be relied on to perform their tasks accurately or completely, or

      (3) adverse effects on occupants including serious or potentially fatal injuries to a small number of those occupants.

   c. Major: Failure conditions which would reduce the capability of the aircraft or the ability of the crew to cope with adverse operating conditions to the extent that there would be, for example, a significant reduction in safety margins or functional capabilities, a significant increase in crew workload or in conditions impairing crew efficiency, or discomfort to occupants, possibly including injuries.

   d. Minor: Failure conditions which would not significantly reduce aircraft safety, and which would involve crew actions that are well within their capabilities. Minor failure conditions may include, for example, a slight reduction in safety margins or functional capabilities, a slight increase in crew workload, such as, routine flight plan changes, or some inconvenience to occupants.

   e. No Effect: Failure conditions which do not affect the operational capability of the aircraft or increase crew workload.

### Software Level Definitions

Software level is based upon the contribution of software to potential failure conditions as determined by the system safety assessment process. The software level implies that the level of effort required to show compliance with certification requirements varies with the failure condition category. The software level definitions are:

   a. Level A: Software whose anomalous behavior, as shown by the system safety assessment process, would cause or contribute to a failure of system function resulting in a catastrophic failure condition for the aircraft.

   b. Level B: Software whose anomalous behavior, as shown by the system safety assessment process, would cause or contribute to a failure of system function resulting in a hazardous/severe-major failure condition for the aircraft.

   c. Level C: Software whose anomalous behavior, as shown by the system safety assessment process, would cause or contribute to a failure of system function resulting in a major failure condition for the aircraft.

   d. Level D: Software whose anomalous behavior, as shown by the system safety assessment process, would cause or contribute to a failure of system function resulting in a minor failure condition for the aircraft.

   e. Level E: Software whose anomalous behavior, as shown by the system safety assessment process, would cause or contribute to a failure of system function with no effect on aircraft operational capability or pilot workload. Once software has been confirmed as level E by the certification authority, no further guidelines of this document apply.

### Software Level Determination

Initially, the system safety assessment process determines the software level(s) appropriate to the software components of a particular system without regard to system design. The impact of failure, both loss of function and malfunction, is addressed when making this determination.

Note: (1) The applicant may want to consider planned functionality to be added during future developments, as well as potential changes in system requirements allocated to software that may result in a more severe failure condition category and higher software level. It may be desirable to develop the software to a level higher than that determined by the system safety assessment process of the original application, since later development of software life cycle data for substantiating a higher software level application may be difficult.

Note: (2) For airborne systems and equipment mandated by operating regulations, but which do not affect the airworthiness of the aircraft, for example, an accident flight data recorder, the software level needs to be commensurate with the intended function. In some cases, the software level may be specified in equipment minimum performance standards.

If the anomalous behavior of a software component contributes to more than one failure condition, then the most severe failure condition category of that component determines the software level for that software component. There are various architectural strategies, such as those described in subsection 2.3, which during the evolution of the system design, may result in the software level(s) being revised.

A system function may be allocated to one or more partitioned software components. A parallel implementation is one in which a system function is implemented with multiple software components such that anomalous behavior of more than one component is required to produce the failure condition. For a parallel implementation, at least one software component will have the software level associated with the most severe failure condition category for that system function. The software level for the other components are determined using the failure condition category associated with loss of that function. Examples of such implementations are described in paragraphs 2.3.2, Multiple-Version Dissimilar Software, and 2.3.3, Safety Monitoring.

A serial implementation is one in which multiple software components are used for a system function such that anomalous behavior of any of the components could produce the failure condition. In this implementation, the software components will have the software level associated with the most severe failure condition category of the system function.

Development of software to a software level does not imply the assignment of a failure rate for that software. Thus, software levels or software reliability rates based on software levels cannot be used by the system safety assessment process as can hardware failure rates. Strategies which depart from the guidelines of this paragraph (2.2.3) need to be justified by the system safety assessment process.

## System Architectural Considerations

If the system safety assessment process determines that the system architecture precludes anomalous behavior of the software from contributing to the most severe failure condition of a system, then the software level is determined by the most severe category of the remaining failure conditions to which the anomalous behavior of the software can contribute. The system safety assessment process considers the architectural design decisions to determine whether they affect software level or software functionality. Guidance is provided on several architectural strategies that may limit the impact of errors, or detect errors and provide acceptable system responses to contain the errors. These architectural techniques are not intended to be interpreted as the preferred or required solutions.

### Partitioning

Partitioning is a technique for providing isolation between functionally independent software components to contain and/or isolate faults and potentially reduce the effort of the software verification process. If protection by partitioning is provided, the software level for each partitioned component may be determined using the most severe failure condition category associated with that component.

Guidance for partitioning includes:

   a. These aspects of the system should be considered when designing partitioning protection to determine their potential for violating that protection:

      (1) Hardware resources: processors, memory devices, I/O devices, interrupts, and timers.

      (2) Control coupling: vulnerability to external access.

      (3) Data coupling: shared or overlaying data, including stacks and processor registers.

      (4) Failure modes of hardware devices associated with the protection mechanisms.

   b. The software life cycle processes should address the partitioning design considerations, including the extent and scope of interactions permitted between the partitioned components, and whether the protection is implemented by hardware or by a combination of hardware and software.

   c. If the partitioning protection involves software, then that software should be assigned the software level corresponding to the highest level of the partitioned software components.

### Multiple-Version Dissimilar Software

Multiple-version dissimilar software is a system design technique that involves producing two or more components of software that provide the same function in a way that may avoid some sources of common errors between the components. Multiple-version dissimilar software is also referred to as multi-version software, dissimilar software, N-version programming, or software diversity.

Software life cycle processes completed or activated before dissimilarity is introduced into a development, remain potential error sources. System requirements specify a hardware configuration which provides for the execution of multiple-version dissimilar software. The degree of dissimilarity and hence the degree of protection is not usually measurable. Probability of loss of system function will increase to the extent that the safety monitoring associated with dissimilar software versions detects actual errors or experiences transients that exceed comparator threshold limits. Dissimilar software versions are usually used, therefore, as a means of providing additional protection after the software verification process objectives for the software level, as described in section 6, have been satisfied. Dissimilar software verification methods may be reduced from those used to verify single version software if it can be shown that the resulting potential loss of system function is acceptable as determined by the system safety assessment process.

Verification of multiple-version dissimilar software is discussed in paragraph 12.3.3.

### Safety Monitoring

Safety monitoring is a means of protecting against specific failure conditions by directly monitoring a function for failures which would contribute to the failure condition. Monitoring functions may be implemented in hardware, software, or a combination of hardware and software.

Through the use of monitoring techniques, the software level of the monitored function may be reduced to the level associated with the loss of its related system function. To allow this level reduction, there are three important attributes of the monitor that should be determined:

   a. Software level: Safety monitoring software is assigned the software level associated with the most severe failure condition category for the monitored function.

   b. System fault coverage: Assessment of the system fault coverage of a monitor ensures that the monitor's design and implementation are such that the faults which it is intended to detect will be detected under all necessary conditions.

   c. Independence of Function and Monitor: The monitor and protective mechanism are not rendered inoperative by the same failure condition that causes the hazard.

## System Considerations for User-Modifiable Software, Option-Selectable Software and Commercial Off-The-Shelf Software

The potential effects of user modification are determined by the system safety assessment process and used to develop the software requirements, and then, the software verification process activities. Designing for user-modifiable software is discussed further in paragraph 5.2.3. A change that affects the non-modifiable software, its protection, or the modifiable software boundaries is a software modification and discussed in paragraph 12.1.1. For this document, a modifiable component is that part of the software that is intended to be changed by the user, and a non-modifiable component is that which is not intended to be changed by the user.

Some airborne systems and equipment may include optional functions which may be selected by software programmed options rather than by hardware connector pins. The option-selectable software functions are used to select a particular configuration within the target computer. See paragraph 5.4.3 for guidelines on deactivated code.

Guidance for system considerations for user-modifiable software, option-selectable software, and commercial off-the-shelf software includes:

   a. User-modifiable software: Users may modify software within the modification constraints without certification authority review, if the system requirements provide for user modification.

   b. The system requirements should specify the mechanisms which prevent the user modification from affecting system safety whether or not they are correctly implemented. The software which provides the protection for user modification should be at the same software level as the function it is protecting from errors in the modifiable component.

   c. If the system requirements do not include provision for user modification, the software should not be modified by the user unless compliance with this document is demonstrated for the modification.

   d. At the time of the user modification, the user should take responsibility for all aspects of the user-modifiable software, for example, software configuration management, software quality assurance, and software verification.

   e. Option-selectable software: When software programmed options are included, means should be provided to ensure that inadvertent selections involving non-approved configurations for the target computer within the installation environment cannot be made.

   f. Commercial off-the-shelf software: COTS software included in airborne systems or equipment should satisfy the objectives of this document.

   g. If deficiencies exist in the software life cycle data of COTS software, the data should be augmented to satisfy the objectives of this document. The guidelines in paragraphs 12.14, Upgrading A Development Baseline, and 12.3.5, Product Service History, may be relevant in this instance.

## System Design Considerations for Field-Loadable Software

Field-loadable airborne software refers to software or data tables that can be loaded without removing the system or equipment from its installation. The safety-related requirements associated with the software data loading function are part of the system requirements. If the inadvertent enabling of the software data loading function could induce a system failure condition, a safety-related requirement for the software data loading function is specified in the system requirements.

System safety considerations relating to field-loadable software include:

   - Detection of corrupted or partially loaded software.

   - Determination of the effects of loading the inappropriate software.

   - Hardware/software compatibility.

   - Software/software compatibility.

   - Aircraft/software compatibility.

   - Inadvertent enabling of the field loading function.

   - Loss or corruption of the software configuration identification display.

Guidance for field-loadable software includes:

   a. Unless otherwise justified by the system safety assessment process, the detection mechanism for partial or corrupted software loads should be assigned the same failure condition or software level as the most severe failure condition or software level associated with the function that uses the software load.

   b. If a system has a default mode when inappropriate software or data is loaded, then each partitioned component of the system should have safety-related requirements specified for operation in this mode which address the potential failure condition.

   c. The software loading function, including support systems and procedures, should include a means to detect incorrect software and/or hardware and/or aircraft combinations and should provide protection appropriate to the failure condition of the function.

   d. If software is part of an airborne display mechanism that is the means for ensuring that the aircraft conforms to a certified configuration, then that software should either be developed to the highest level of the software to be loaded, or the system safety assessment process should justify the integrity of an end-to-end check of the software configuration identification.

## System Requirements Considerations for Software Verification

The system requirements are developed from the system operational requirements and the safety-related requirements that result from the system safety assessment process. Considerations include:

   a. The system requirements for airborne software establish two characteristics of the software:

      (1) The software performs specified functions as defined by the system requirements.

      (2) The software does not exhibit specific anomalous behavior(s) as determined by the system safety assessment process. Additional system requirements are generated to eliminate the anomalous behavior.

   b. These system requirements should then be developed into software high-level requirements that are verified by the software verification process activities.

## Software Considerations in System Verification

Guidance for system verification is beyond the scope of this document. However, the software life cycle processes aid and interact with the system verification process. Software design details that relate to the system functionality need to be made available to aid system verification.

System verification may provide significant coverage of code structure. Coverage analysis of system verification tests may be used to achieve the coverage objectives of various test activities described under software verification.
