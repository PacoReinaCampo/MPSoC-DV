# SYSTEM ASPECTS OF HARDWARE DESIGN ASSURANCE

Hardware design assurance begins at the system level with the allocation of system functions to hardware and the assignment of their corresponding system development assurance levels.

A single system function may be assigned to a hardware item, to a software component or to a combination of hardware and software. Safety requirements associated with the function are addressed from a system perspective, a software perspective and a hardware perspective to determine the level of reliability and the level of assurance necessary to satisfy these requirements.

Figure 2-1 illustrates the relationships of the system development process for airborne systems and equipment and safety assessment, hardware development, and software development processes.

Figure 2-1 Relationships Among Airborne Systems, Safety Assessment, Hardware and Software Processes

There are four areas of overlap in the figure, Safety/Hardware, Safety/Software, Hardware/Software and Safety/Hardware/Software. These overlaps illustrate the relationship and interactions between these processes where a system requirement may result in requirements within the scope and design assurance guidance of multiple processes. For example, a hardware function that contained safety requirements would involve both the safety assessment process and the hardware design life cycle process.

The overlaps illustrate the need for a coordinated interaction between the processes to ensure that the assurance requirements of the system function are satisfied. The discussion of system or software assurance processes is beyond the scope of this document. However, in coordinating the design assurance for a hardware function, the applicant may wish to take advantage of assurance provided by activities in the systems or software processes.

These relationships and interactions are described further in Section 2.1.1 through Section 2.1.3.

## Information Flow

The flow of information between the life cycle processes is shown in Figure 2-2. The following sections describe the flow of information from the system development process to the hardware design life cycle process, from the hardware design life cycle process to the system development process, and between the hardware design life cycle process and the software life cycle process.

Note: It is recognized that these are iterative processes and changes will occur throughout the hardware design life cycle.

### Information Flow from System Development Process to Hardware Design Life Cycle Process

This information flow may include:

1. Design and safety requirements allocated to hardware.

2. Design assurance level for each function, along with its associated requirements and failure conditions, if applicable.

3. Allocated probabilities and at risk exposure times for hardware functional failures.

4. Hardware/software interface description.

5. Requirements for safety strategies and design constraints, such as testability, design methods, and hardware architectures.

6. Requirements for system verification activities to be performed by hardware level verification.

7. Installation, ergonomic and environmental requirements allocated to hardware.

8. Integration problem reports that may have an impact on requirements. These may arise as a result of activities, such as system verification, generation of system requirements or SSA.

### Information Flow from Hardware Design Life Cycle Process to System Development Process

This information flow may include:

1. Implementation of the requirements, such as mechanical drawings, schematics and parts lists.

2. Hardware derived requirements that may have an impact on any allocated requirement.

3. Implementation architecture, including fault containment boundaries.

4. Evidence of any required system verification and validation activities performed during the hardware design life cycle.

5. Product safety analysis data, such as:

   a. Probabilities and failure rates for designated hardware functional failures of concern to the SSA process.

   b. Common mode fault analysis.

   c. Isolation boundaries and generic fault mitigation strategies.

   d. Latency analysis data relevant to system requirements. Examples are hardware provisions for fault monitoring, fault detection intervals and undetectable faults.

6. Requirements for hardware verification activities to be performed by system level verification.

7. Assumptions and analysis methods regarding installation requirements and environmental conditions necessary for the analyses to be valid.

8. Problem or change reports that may have an impact on system, software or allocated hardware requirements.

### Information Flow between Hardware Design Life Cycle Process and Software Life Cycle Process

This information flow may include:

1. Derived requirements needed for hardware/software integration, such as definition of protocols, timing constraints, and addressing schemes for the interface between hardware and software.

2. Instances where hardware and software verification activities require coordination.

3. Identified incompatibilities between the hardware and the software, which may be part of a reporting and corrective action system.

4. Safety assessment data that should also be made available to system processes.

## System Safety Assessment Processes

There are three system safety assessment processes: functional hazard assessment (FHA), preliminary system safety assessment (PSSA) and SSA. These processes are used to establish the system safety objectives applicable to the system development assurance process, and to determine that the system functions achieve the safety objectives.

The SSA process should transform the safety objectives into system and equipment safety requirements. These requirements should embody the basic safety objectives and safety attributes for system and equipment functions and architecture. The SSA process and the system development process allocate these safety requirements to the hardware.

There are five system development assurance levels, Level A through Level E, corresponding to the five classes of failure conditions: catastrophic, hazardous/severe-major, major, minor and no effect. Table 2-1 correlates the hardware design assurance levels to the five classes of failure conditions and provides definitions of hardware failure conditions and their respective design assurance levels. Initially, the hardware design assurance level for each hardware function is determined by the SSA process using an FHA to identify potential hazards and then the PSSA process allocates the safety requirements and associated failure conditions to the function implemented in the hardware.

Throughout the hardware design life cycle, there may be iterative feedback between the safety, system and hardware processes to ensure that the hardware as designed and built will satisfy the system safety, functional and performance requirements allocated to the hardware.

## Hardware Safety Assessment

The hardware safety assessment is conducted in conjunction with and to support the SSA process. The intent of this safety process is to demonstrate that the applicable systems and equipment, including the hardware, have satisfied the safety requirements of applicable aircraft certification requirements.

Given the safety, functional and performance requirements allocated to the hardware by the system process, the hardware safety assessment determines the hardware design assurance level for each function and contributes to determining the appropriate design assurance strategies to be used.

### Hardware Safety Assessment Considerations

The designer of a hardware item may show compliance with the safety requirements allocated to the hardware and with the hardware design assurance level by an appropriate design assurance strategy.

A single design assurance level and strategy may be applied to an entire hardware item or a hardware item may be evaluated as having separate functional failure paths (FFPs) in order to accommodate a mix of design assurance levels or design assurance strategies. A functional failure path analysis (FFPA) may be used to justify a lower design assurance level for a portion of the hardware item, or to accommodate different functions implemented with different technologies or product service histories.

Note: FFPA is described in Appendix B, Section 2. Although written to address the subject matter of Appendix B, this analysis method may be applied to any design assurance level.

If a hardware item contains functions that individually have different design assurance levels, such situations may be addressed by either of the following methods:

- The entire item may be assured at the highest design assurance level.

- The individual hardware functions may be assured separately at their respective hardware design assurance levels as defined by the hardware safety assessment, if their function, interfaces and shared resources can be protected from adverse effects of functions of lower design assurance levels. Design assurance of shared resources should be the design assurance level of the function with the highest level.

Guidance for hardware safety assessment includes:

1. Iterative hardware safety assessment and design should determine derived hardware safety requirements and ensure that system safety requirements allocated to the hardware are satisfied and ensure that derived requirements are satisfied.

2. These derived requirements should include safety requirements for hardware architecture, circuits and components, and protection against anomalous behaviors, including incorporating specific hardware architectural and functional safety attributes, such as:

   a. Circuit or component redundancy.

   b. Separation or electrical isolation between circuits or components.

   c. Dissimilarity between circuits or components.

   d. Monitoring of circuits or components.

   e. Protection or reconfiguration mechanisms.

   f. Allowed failure rates and probabilities for circuit and component random failures and latent failures.

   g. Limitations of usage or installation.

   h. Prevention and management of upsets and upset recovery.

3. The hardware design assurance process and the hardware safety assessment should jointly determine the specific means of compliance and design assurance level for each function and should determine that an acceptable level of design assurance has been achieved.

   Note: Anomalous behavior of the hardware may be caused by random faults or design errors in a hardware item, or by upsets to the hardware.

   The hardware designer may choose a higher hardware design assurance level for a hardware item function. An example would be the anticipation of re-using a hardware item function in an installation requiring a higher level of design assurance.

The hardware safety assessment may use various qualitative and quantitative assessment methods. These may include fault tree analysis (FTA), common mode analysis, failure modes and effects analysis, and statistical reliability analysis methods for applicable quantitative assessment of random faults.

### Quantitative Assessment of Random Hardware Faults

Statistical failure assessment and prediction methods, which are based on hardware failure rates, redundancy, separation and isolation, failure mode statistics, probability analysis, component de-rating, stress analysis, and manufacturing process control, have proven to be acceptable means of assessing quantitative risk factors for random failures of hardware.

### Qualitative Assessment of Hardware Design Errors and Upsets

Unlike random failures of hardware, neither design errors nor some types of upsets are statistically predictable, and both may cross redundancy boundaries in the form of common mode faults. Redundancy management techniques and quantitative assessment methods to be used should be selected so that potential common mode faults and the effects of upsets are precluded or mitigated when necessary.

Although difficult to assess quantitatively, safety risk from design errors and upsets can be effectively assessed by a practical application of qualitative safety assessment methods. Analysis techniques, such as fault tree analysis, common mode analysis, and functional failure modes and effects analysis (F-FMEA), are fundamentally qualitative methods, and can be used to address hardware design errors and upsets. More specifically, these methods can determine the potential effects of design errors and upsets, and can help determine the means by which they are to be precluded or mitigated. Using these methods, the hardware safety assessment can contribute to determining the hardware design assurance strategies to be used and can be used iteratively throughout the hardware design process to qualitatively determine the assurance achieved by the selected strategies.

### Design Assurance Considerations for Hardware Failure Condition Classification

As the severity of the system failure condition increases, the amount of hardware design assurance necessary to ensure that related failure conditions have been mitigated increases. For all design assurance levels, an approach or strategy should be developed to ensure an appropriate level of design assurance. Figure 2-3 outlines the decision-making process for developing an appropriate design assurance strategy.

Guidance includes:

1. For Level A or B functions implemented in hardware, the design assurance considerations should address potential anomalous behaviors and potential design errors of the hardware functions.

2. The decision making process outlined in Figure 2-3 should be used when developing design assurance strategies for each hardware function being implemented.

3. The strategies described in Appendix B should be applied for Level A and B functions in addition to the guidance provided in Section 3 through Section 11.

4. The design assurance strategy should be selected as a function of the hardware architecture and usage, and of the hardware implementation technology that has been chosen.

Different technologies, components selection, and components usage offer varying degrees of hardware design life cycle information and varying degrees of inherent protection against design errors and their effects. The most suitable design assurance method may vary for different functional paths within the same hardware item.

The numbers in the decision and activity blocks of Figure 2-3 refer to the numbered items following the figure that provide further clarification of the decision or activity.

Figure 2-3 Decision Making Process for Selecting the Hardware Design Assurance Strategy

1. Begin Assessment Process. For all design assurance levels, an approach or strategy should be developed to ensure an appropriate level of design assurance.

2. Determine FFP Design Assurance Level. For each identified hardware item, determine and document the FFPs associated with the item and the design assurance level. Conventional safety assessment techniques should be used to determine which hardware circuits are and which are not in the identified Level A or B FFPs.

3. Is the Hardware Implementation of the FFP Simple or Complex? For hardware design assurance Level A or Level B FFPs, determine if the hardware is simple or complex as described in Section 1.6.

4. Develop Design Assurance Strategy for Level A or Level B Complex FFPs. If the FFP is complex and Level A or B, use the additional strategies described in Appendix B to determine the appropriate design assurance strategy, corresponding implementation concept and the error mitigation methods. For each Level A or B FFP, a design assurance strategy should be determined using advanced analysis, product service experience or architectural mitigation.

   Level A FFPs in an implementation may require more than one approach if the approach selected does not provide complete mitigation of potential failures and anomalous behaviors.

5. Is the Strategy Adequate? Determine if there are deficiencies in the design assurance strategies and, if deficiencies exist in the strategy or would exist in the data expected to be available, modify the strategy to correct the deficiencies by proposing additional design assurance, implementation or architectural strategies.

   When the design assurance strategy is acceptable, document the design assurance processes for each FFP. The strategy should also address certification authority participation aspects, such as schedule milestones, program reviews and oversight activities.

6. Document the Applicable Fail-Safe Aspects. Determine the appropriate fail-safe design architecture and features of the hardware item and perform an analysis to satisfy the availability and integrity requirements of the system. Document the fail-safe design aspects and the associated common mode analysis, probability analysis, architecture and other features.

7. Document the Design Assurance Approach and Strategy. Document and obtain certification authority approval of the applicable design assurance approach and strategy in the system certification plan or the Plan for Hardware Aspects of Certification (PHAC).

8. Implement the Approach. Implement the hardware design in compliance with the appropriate design assurance approach as defined in the approved plan and document evidence of compliance to approved plans and strategy.
