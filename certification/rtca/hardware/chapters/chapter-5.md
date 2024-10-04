# HARDWARE DESIGN PROCESSES

The hardware design processes produce a hardware item that fulfills the requirements allocated to hardware from the system requirements. This section describes five major processes as depicted in Figure 5- 1. These are Requirements Capture, Conceptual Design, Detailed Design, Implementation and Production Transition. These design processes may be applied at any hierarchical level of the hardware item, such as LRUs, circuit board assemblies and ASICs/PLDs. The following sections describe each process, its objectives and the related activities that should be addressed to reduce the probability of design and implementation errors that affect safety. It is important that each of these processes is planned and the details recorded in a hardware design plan.

Each process, and interactions between the processes, can be iterative. For each iteration, the effect of the change on each of the processes should be addressed and evaluated for impact on the results of previous iterations.

Note 1: It is good engineering practice to document process artifacts, such as design notes, design review notes and problem reports, throughout the design process.

Current practices provide many different means, graphical, mathematical, database or text based, to represent requirements and design implementations. Examples of these representations are schematics, hardware description languages (HDL), state diagrams, Boolean representations and graphical methods.

Note 2: Some representations are adapted to a specific process or combination of processes, such as requirements capture, conceptual design or detailed design, and some are adapted to more efficiently implement a specific implementation technology. Evidence to support the design assurance level should be provided, regardless of the design representation used.

For each design representation used, the following should be considered:

1. The guidance of this document should be followed regardless of the representation, or combination of representations, used.

2. The design representation should allow the hardware item to be consistently replicated.

3. Small changes in design representation may have a large impact on the design implementation. The impact of these changes on design assurance should be addressed.

4. The design representation environment or method may change after the baseline of the design data has been established. If this occurs, the impact of the change on the replication of the design should be assessed.

HDL design representations use coded text based techniques that are similar in appearance to those used for software representations. This similarity in appearance can mislead one to attempt to use software verification methods directly on the design representation of HDL or other equivalent hardware specification languages. The guidance of this document is applicable for design assurance for designs using an HDL representation.

Note: The structured processes described throughout this document are applicable to complex hardware designs including ASICs and PLDs. As an example, the following table maps typical ASIC/PLD processes to the processes depicted in Figure 5- 1 of this document.

## Requirements Capture Process

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

## Conceptual Design Process

The conceptual design process produces a high-level design concept that may be assessed to determine the potential for the resulting design implementation to meet the requirements. This may be accomplished using such items as functional block diagrams, design and architecture descriptions, circuit card assembly outlines, and chassis sketches.

### Conceptual Design Objectives

The conceptual design objectives are:

1. The hardware item conceptual design is developed consistent with its requirements.

2. Derived requirements produced are fed back to the requirements capture or other appropriate processes.

3. Requirement omissions and errors are provided to the appropriate processes for resolution.

### Conceptual Design Activities

Guidance for the conceptual design activities includes:

1. A high-level description should be generated for the hardware item. This may include:

   a. Architectural constraints related to safety, including those necessary to address design errors and functional, component over-stress, reliability and robustness defects.

   b. Identification of any implementation constraints on software or other system components.

2. Major components should be identified. The way they contribute to the hardware safety requirements should be determined, including the impact of unused functions.

3. Derived requirements, including the interface definition, should be fed back to the requirements capture process.

4. Requirement omissions and errors should be fed back to the appropriate process for resolution.

5. The reliability, maintenance and test features to be provided should be identified.

   Note: Consensus between the relevant parties that the conceptual design objectives have been met is recommended. Typically, a design review is used to accomplish this consensus.

## Detailed Design Process

The detailed design process produces detailed design data using the hardware item requirements and conceptual design data as the basis for the detailed design.

### Detailed Design Objectives

The detailed design process objectives are:

1. The detailed design is developed from the hardware item requirements and conceptual design data.

2. Derived requirements are fed back to the conceptual design process or other appropriate processes.

3. Requirement omissions or errors are provided to the appropriate processes for resolution.

### Detailed Design Process Activities

Guidance for the detailed design activities includes:

1. The detailed design data for the hardware item should be generated based on the requirements and conceptual design data. This may include assembly and interconnection data, component data, HDL, test methods and hardware-software interface data.

   Note: During the detailed design process, verification methods are used informally to facilitate the technical decisions made during this process. For example, analysis of design parameters, such as logic timing and parameter variations, can provide information on which to base design decisions.

2. Architectural design techniques should be implemented as necessary. These may include establishing safety monitors for proper functionality, dissimilarity between function and safety monitors, preclusion of a design error from impacting safety, and fault tolerant designs.

3. Test features should be designed in, where necessary, to allow verification of safety requirements.

   Note: It is important to develop the design in a way that certain safety features can be verified not only during the hardware design life cycle, but also as a part of an acceptance test and a field return to service test.

4. An assessment of unused functions should be performed to identify potential effects on safety. Adverse effects should be addressed.

5. Constraints on the design, installation or operation of the hardware item that, if not adhered to, could affect the safety of the item should be identified.

6. Derived requirements produced during the detailed design process should be fed back to the conceptual design or other appropriate processes.

7. Requirement omissions and errors discovered during the detailed design process should be provided to the appropriate process for resolution.

## Implementation Process

The implementation process uses the detailed design data to produce the hardware item that is an input to the testing activity.

### Implementation Objectives

The objectives of the implementation process are:

1. A hardware item is produced which implements the hardware detailed design using representative manufacturing processes.

2. The hardware item implementation, assembly and installation data is complete.

3. Derived requirements are fed back to the detailed design process or other appropriate processes.

4. Requirement omissions and errors are provided to the appropriate processes for resolution.

### Implementation Activities

Guidance for the implementation activities includes:

1. A hardware item should be produced using the design data and, where practical, the resources intended for the production product. This may include procurement, kitting, build, inspection and test.

2. Derived requirements generated by the implementation process should be fed back to the detailed design process or other appropriate processes.

3. Omissions and errors discovered during the implementation process should be provided to the appropriate process for resolution.

## Production Transition Process

In this process, manufacturing data, test facilities and general resources should be examined to ensure availability and suitability for production. The production transition process uses the outputs from the implementation and verification processes to move the product into production.

### Production Transition Objectives

The objectives of this process are:

1. A baseline is established that includes all design and manufacturing data needed to support the consistent replication of the hardware item.

2. Manufacturing requirements related to safety are identified and documented and manufacturing controls are established.

3. Derived requirements are fed back to the implementation process or other appropriate processes.

4. Errors and omissions are provided to the appropriate processes for resolution.

### Production Transition Activities

Guidance for the production transition activities includes:

1. Manufacturing data should be prepared from configured design data.

2. Manufacturing data should be checked for completeness and consistency with the configured design data.

   Note: It is beyond the scope of this document to impose any conditions on the nature of the manufacturing build documentation.

3. Any changes or improvements that are incorporated during the production transition process should be evaluated to ensure they adhere to all product requirements, especially safety requirements. Any changes not compliant with customer or certification requirements should be approved by the relevant parties.

4. Manufacturing requirements pertaining to safety should be explicitly defined so they can be controlled during the production process.

5. Data required to develop acceptance test criteria should be determined.

6. Omissions or errors that are identified should be provided to the appropriate process for resolution.

## Acceptance Test

An acceptance test demonstrates that the manufactured, modified or repaired product performs in compliance with the key attributes of the unit on which certification is based. These key attributes are chosen using engineering judgement and are indicative that the product is capable of meeting the requirements to which the unit was developed.

Note 1: Configuration control of the "as built" product is not a function to be performed by the acceptance test activity. The configuration management plan, as described in Section 7 of this document, should describe how the applicant plans to perform this activity.

The scope of this document does include the determination of the acceptance test criteria, including pass/fail conditions. Production activities, including acceptance testing, are considered to be outside the scope of this document

Note 2: An acceptance test is not intended to verify all requirements on each production unit.

Subitem testing may be used as a part of the acceptance test.

Acceptance test criteria should ensure that:

1. Electrical tests are identified.

2. Environmental screening tests are identified when necessary.

3. The acceptance test provides coverage of those design aspects necessary to meet the safety requirements. Safety related item or subitems that are not covered by the test should be identified and other assurance means provided. These means may include analysis, design control, statistical process control or other means as appropriate.

## Series Production

This process is not within the scope of this document, but elements impacting design assurance are briefly described to complete the life cycle.

This process reproduces the hardware item on a routine basis that complies with the production data and requirements.

Considerations include:

1. Management of change of the production processes or the design provides assurance that change does not adversely impact existing safety or certification or compliance to the requirements.

   Note: In addition to the guidance proposed by the body of the document, Section 11.1.1 covers Modifications to Previously Developed Hardware. When addressing component obsolescence, refer to Section 11.2.

2. Updating of all documentation related to changes is performed in compliance with approved configuration management plans.
