# INTRODUCTION

The use of increasingly complex electronic hardware for more of the safety critical aircraft functions generates new safety and certification challenges. These challenges arise from a concern that said aircraft functions may be increasingly vulnerable to the adverse effects of hardware design errors that may be increasingly difficult to manage due to the increasing complexity of the hardware. To counteract this perceived escalation of risk it has become necessary to ensure that the potential for hardware design errors is addressed in a more consistent and verifiable manner during both the design and certification processes.

As airborne electronic hardware becomes more complex, technology evolves and experience is gained in the application and use of the procedures described in this document, this document will be revised and reviewed consistent with approved RTCA/EUROCAE procedures.

## Purpose

This document has been prepared to assist organizations by providing design assurance guidance for the development of airborne electronic hardware such that it safely performs its intended function, in its specified environments. This guidance should be equally applicable to current, new, and evolving technologies. The purposes of this document are to:

1. Define hardware design assurance objectives.

2. Describe the basis for these objectives to help ensure correct interpretation of the guidance.

3. Provide descriptions of the objectives to allow the development of means of compliance with this and other guidance.

4. Provide guidance for design assurance activities to meet the design assurance objectives.

5. Allow flexibility in choice of processes necessary to meet the objectives of this document including improvements, as new process technologies become available.

This document recommends the activities that should be performed in order to meet design assurance objectives, rather than detailing how a design should be implemented.

The philosophy used to generate this guidance document is one of a top-down perspective based on the system functions being performed by electronic hardware and not a bottom-up perspective or one based solely on the specific hardware components used to implement the function. A top-down approach is more effective at addressing safety design errors by facilitating informed system and hardware design decisions, and efficient and effective verification processes. For example, verification should be performed at the highest hierarchical level of the system, assembly, and subassembly, component or hardware item at which compliance of the hardware item to its requirements can be achieved and the verification objectives satisfied.

## Scope

This document provides guidance for design assurance of airborne electronic hardware from conception through initial certification and subsequent post certification product improvements to ensure continued airworthiness. It was developed based on showing compliance with certification requirements for transport category aircraft and equipment but parts of this document may be applicable to other equipment.

The relationship between the system life cycle and the hardware design life cycle is described to aid in the understanding of the interrelationships of the system and hardware design assurance processes. A complete description of the system life cycle, including system safety assessment (SSA) and validation, and the aircraft certification process is not intended.

Certification issues are discussed only in relation to the hardware design life cycle. Aspects concerning the ability to produce, test, and maintain the hardware item are addressed only as they relate to airworthiness of the hardware design.

The guidance in this document is applicable, but not limited to, the following hardware items:

1. Line Replaceable Units (LRUs).

2. Circuit Board Assemblies.

3. Custom micro-coded components, such as Application Specific Integrated Circuits (ASICs) and Programmable Logic Devices (PLDs), including any associated macro functions.

4. Integrated technology components, such as hybrids and multi-chip modules.

5. Commercial-Off-The-Shelf (COTS) components.

Additional considerations that refer specifically to COTS components are included in Section 11 since COTS component suppliers may not necessarily follow the design processes described by this document or provide the necessary hardware design life cycle data.

This document does not attempt to define firmware. Firmware should be classified as hardware or software and addressed by the applicable processes. This document assumes that during the system definition, functions have been allocated to either hardware or software. RTCA DO-178/EUROCAE ED-12 provides guidance for functions that are allocated to implementation in software. This document provides guidance for functions that are allocated to hardware.

Note: This allows an efficient method of implementation and design assurance to be determined at the time the system is specified and functions allocated. All parties should agree with this system decision at the time that the allocation is made.

Assessment and qualification of tools used for hardware item design and verification is addressed in Section 11.4.

This document does not provide guidance concerning organizational structures or how responsibilities are divided within those structures.

Environmental qualification criteria are also beyond the scope of this document.

## Relationship to Other Documents

In addition to the airworthiness requirements, various national and international standards for hardware are available. In some communities, compliance with these standards may be required. However, it is outside the scope of this document to invoke specific national or international standards, or to propose a means by which these standards might be used as an alternative or supplement to this document.

Where this document uses the term "standards", it should be interpreted to mean the use of project-specific standards as applied by the airborne system, airborne equipment, engine, or aircraft manufacturer. Such standards may be derived from general standards produced or adopted by the manufacturer. Guidance for standards is provided in Section 10.2.

## Related Documents

SAE ARP4754/EUROCAE ED-79, Certification Considerations for Highly Integrated or Complex Aircraft Systems, as a source of development guidance for highly integrated or complex aircraft systems.

SAE ARP4761, Guidelines and Methods for Conducting the Safety Assessment Process on Civil Airborne Systems and Equipment, as a source of safety assessment methods to be used in the hardware design assurance process.

RTCA DO-178/EUROCAE ED-12, Software Considerations in Airborne Systems and Equipment Certification, as the complementary document for software development assurance.

RTCA DO-160/EUROCAE ED-14, Environmental Conditions and Test Procedures for Airborne Equipment, may be used by equipment designers as the primary environmental test standard for hardware item qualification.

## How to Use This Document

This document is intended to be used by the international aviation community. To aid such use, references to specific national regulations and procedures are minimized. Instead, generic terms are used. For example, the term "certification authority" is used to mean the organization or person granting approval on behalf of the country responsible for certification. Where a second country or a group of countries validates or participates in this certification, this document may be used with due recognition given to bilateral agreements or memoranda of understanding between the countries involved.

The guidance in this document represents a consensus of the aviation community and is a collection of the best industry practices for design assurance of airborne electronic hardware. To take into account the process developed in this document, the intent was to produce guidance that should be applied to complete new hardware designs and subsequent changes. Guidance for hardware previously developed to other processes is addressed in Section 11.1. It is understood that means other than those described herein may be available to and be used by the applicant.

In cases where examples are used to indicate how the guidance might be applied, either graphically or through narrative, the examples are not to be interpreted as the preferred method.

Section 11 discusses additional considerations for specific known cases where some of the objectives of Section 2 through Section 9 may not be satisfied. These considerations include guidance for the use of previously developed hardware, COTS component usage, product service experience, and tool assessment and qualification.

Appendix A provides guidance for the necessary hardware design life cycle data based on the hardware design assurance level that is being implemented.

Appendix B contains guidance on design assurance techniques for hardware used in implementing Level A and B functions which should be applied in addition to the guidance in Section 2 through Section 11. Appendix B may be applied for hardware of design assurance Levels C and D at the applicant’s discretion.

The Glossary of Terms as used in this document is contained in Appendix C. Appendix D contains a list of acronyms that are used in the document and spells out their complete names.

A list does not imply that its elements are in any way complete or that all elements are relevant to any specific product.

Notes are used in this document to provide explanatory material, emphasize a point, or draw attention to related subjects, which are not entirely within context. Notes do not contain guidance.

The word "should" is used when the intention is to provide guidance. "May" is used in conjunction with optional text.

This document uses the term "hardware item" to describe the electronic hardware which is the subject of the document.

The qualifier "hardware" is to be assumed throughout the document unless specifically stated otherwise. When the term "requirements" is used it is assumed to mean "hardware requirements". A system or software qualifier will always be specifically stated, such as "system requirement".

Note: Various industry advisory documents and aviation requirement documents do not always use harmonized terminology. For example, Federal Aviation Regulations (FAR) 21 and Joint Aviation Requirements (JAR) 21 use the term "product" to mean an aircraft, aircraft engine, or propeller. Document SAE ARP4754/EUROCAE ED-79 uses the term "product" to mean hardware, software, item or system generated in response to a defined set of requirements. The reader is advised to be aware of these and other differences in the use of terminology. This document uses the definitions in the glossary.

## Complexity Considerations

Although various classifications of the term "complexity" are used to describe electronics, such as simple, complex and highly complex, the differentiation between these classifications is not rigorously defined. Defining differences in complexity herein is based on the feasibility and level of difficulty necessary to accomplish acceptable verification coverage by deterministic means.

Hardware should be examined hierarchically at the levels of integrated circuit, board and LRU for complexity, including addressing functions that may not be testable, such as unused modes in multiple usage devices and potentially hidden states in sequential machines.

A hardware item is identified as simple only if a comprehensive combination of deterministic tests and analyses appropriate to the design assurance level can ensure correct functional performance under all foreseeable operating conditions with no anomalous behavior.

When an item cannot be classified as simple, it should be classified as complex. An item constructed entirely from simple items may itself be complex. Items that contain a device, such as an ASIC or a PLD, can be considered simple if they meet the criteria of simple as described in this section.

For complex items, the proposed means of providing design assurance should be agreed to by the certification authority early in the hardware design life cycle to mitigate program risk.

For a simple hardware item, extensive documentation of the design process is unnecessary. The supporting processes of verification and configuration management need to be performed and documented for a simple hardware item, but extensive documentation is not needed. Thus, there is reduced overhead in designing a simple hardware item to comply with this document. The main impact of this document is intended to be on the design of complex hardware items.

## Alternative Methods or Processes

Methods or processes other than those described in this document may be used to provide hardware design assurance. These methods and processes should be assessed based on their ability to satisfy the applicable regulations. Alternative methods or processes should be approved by the certification authority prior to their implementation. In lieu of direct comparison with the applicable regulations, the applicant could use the following guidance to reduce program risk while evaluating alternative methods or processes by comparison to this document.

Considerations for evaluation of alternative methods or processes may include:

1. Where used instead of processes prescribed by this document, processes satisfying one or more of the objectives of Section 2 through Section 9 should show an equivalent level of design assurance.

2. The effect of the proposed alternative methods or processes on satisfying the hardware design assurance objectives should be assessed.

3. The effect of the proposed alternative methods or processes on the life cycle data should be assessed.

4. The rationale for using the proposed alternative methods or processes should be substantiated by evidence that the methods or processes will produce the expected results.

## Document Overview

Figure 1-1 is a pictorial overview of the sections in this document, and some of their relationships to each other and to other related processes. There is no intent to show data flow but rather to show which sections and external processes are related.
