# INTRODUCTION

The rapid increase in the use of software in airborne systems and equipment used on aircraft and engines in the early 1980s resulted in a need for industry-accepted guidance for satisfying airworthiness requirements. DO- 178, "Software Considerations in Airborne Systems and Equipment Certification," was written to satisfy this need.

This document, now revised in the light of experience, provides the aviation community with guidance for determining, in a consistent manner and with an acceptable level of confidence, that the software aspects of airborne systems and equipment comply with airworthiness requirements. As software use increases, technology evolves and experience is gained in the application of this document, this document will be reviewed and revised. Appendix A contains a history of this document.

## Purpose

The purpose of this document is to provide guidelines for the production of software for airborne systems and equipment that performs its intended function with a level of confidence in safety that complies with airworthiness requirements. These guidelines are in the form of:

   - Objectives for software life cycle processes.
   - Descriptions of activities and design considerations for achieving those objectives.
   - Descriptions of the evidence that indicate that the objectives have been satisfied.

## Scope

This document discusses those aspects of airworthiness certification that pertain to the production of software for airborne systems and equipment used on aircraft or engines. In discussing those aspects, the system life cycle and its relationship with the software life cycle is described to aid in the understanding of the certification process. A complete description of the system life cycle processes, including the system safety assessment and validation processes, or aircraft and engine certification process is not intended.

Since certification issues are discussed only in relation to the software life cycle, the operational aspects of the resulting software are not discussed. For example, the certification aspects of user-modifiable data are beyond the scope of this document.

This document does not provide guidelines concerning the structure of the applicant’s organization, the relationships between the applicant and its suppliers, or how the responsibilities are divided. Personnel qualification criteria are also beyond the scope of this document.

## Relationship to Other Documents

In addition to the airworthiness requirements, various national and international standards for software are available. In some communities, compliance with these standards may be required. However, it is outside the scope of this document to invoke specific national or international standards, or to propose a means by which these standards might be used as an alternative or supplement to this document

Where this document uses the term "standards," it should be interpreted to mean the use of project specific standards as applied by the airborne system, airborne equipment, engine, or aircraft manufacturer. Such standards may be derived from general standards produced or adopted by the manufacturer for its activities.

## How to Use This Document

These points need to be noted when using this document:

   - Explanatory text is included to aid the reader in understanding the topic under discussion. For example, section 2 provides information necessary to understand the interaction between the system life cycle and software life cycle. Similarly, section 3 is a description of the software life cycle and section 10 is an overview of aircraft and engine certification.
   - This document is intended to be used by the international aviation community. To aid such use, references to specific national regulations and procedures are minimized. Instead, generic terms are used. For example, the term "certification authority" is used to mean the organization or person granting approval on behalf of the country responsible for aircraft or engine certification. Where a second country or a group of countries validates or participates in this certification, this document may be used with due recognition given to bilateral agreements or memoranda of understanding between the countries involved.
   - This document recognizes that the guidelines herein are not mandated by law, but represent a consensus of the aviation community. It also recognizes that alternative methods to the methods described herein may be available to the applicant. For these reasons, the use of words such as "shall" and "must" is avoided.
   - This document states the objectives for the software levels, as defined in paragraph 2.2.2. Annex A specifies the variation in these objectives by software level. If an applicant adopts this document for certification purposes, it may be used as a set of guidelines to achieve these objectives.
   - Section 11 contains the data generally produced to aid the software aspects of the certification process. The names of the data are denoted in the text by capitalization of the first letter of each word in the name. For example, Source Code
   - Section 12 discusses additional considerations including guidance for the use of previously developed software, for tool qualification, and for the use of alternative methods to those described in sections 2 through 11. Section 12 may not apply to every certification.
   - The tables for software level variation and the glossary are contained in Annexes, and are normative, parts of this document. Other material is contained in Appendices, and are informative parts of this document.
   - In cases where examples are used to indicate how the guidelines might be applied, either graphically or through narrative, the examples are not to be interpreted as the preferred method.
   - A list of items does not imply the list is all-inclusive.
   - Notes are used in this document to provide explanatory material, emphasize a point, or draw attention to related items which are not entirely within context. Notes do not contain guidance.

## Document Overview

Figure 1- 1 is a pictorial overview of this document’s sections and their relationship to each other.
