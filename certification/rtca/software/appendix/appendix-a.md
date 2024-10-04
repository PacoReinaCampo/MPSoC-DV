\appendix

# BACKGROUND OF DOCUMENT DO-178

## Prior Document Version History

In May 1980, the Radio Technical Commission for Aeronautics, now RTCA, Inc., established Special Committee 145 (SC-145), "Digital Avionics Software", to develop and document software practices that would support the development of software-based airborne systems and equipment. The European Organisation for Civil Aviation Electronics, now the European Organisation for Civil Aviation Equipment (EUROCAE), had previously established Working Group 12 (WG-12) to produce a similar document and, in October 1980, was ready to publish document ED-35, "Recommendations on Software Practice and Documentation for Airborne Systems." EUROCAE elected to withhold publication of its document and, instead, to work in concert with RTCA to develop a common set of guidelines. SC-145 produced RTCA Document DO-178, "Software Considerations in Airborne Systems and Equipment Certification", which was approved by the RTCA Executive Committee and published by RTCA in January 1982. EUROCAE published ED-12 shortly thereafter.

Early in 1983 the RTCA Executive Committee determined that DO-178 should be revised to reflect the experience gained in the certification of the aircraft and engines containing software based systems and equipment. It established Special Committee 152 (SC-152) for this purpose.

As a result of this committee's work, a revised RTCA document, DO-178A, "Software Considerations in Airborne Systems and Equipment Certification", was published in 1985. Shortly thereafter, EUROCAE published ED-12A, which was identical in technical content to DO-178A.

## RTCA / EUROCAE Committee Activities in the Production of This Document

In early 1989, the Federal Aviation Administration (FAA) formally requested that RTCA establish a Special Committee for the review and revision of DO-178A. Since its release in 1985, the aircraft manufacturers, the avionics industry and the certification authorities throughout the world have used DO-178A or the equivalent EUROCAE ED-12A as the primary source of the guidelines to determine the acceptability of systems and equipment containing software.

However, rapid advances in software technology, which were not envisioned by SC-152, and differing interpretations which were applied to some crucial areas, indicated that the guidelines required revision. Accordingly, an RTCA ad hoc group was formed with representatives from ARINC, the Airline Pilots Association, the National Business Aircraft Association, the Air Transport Association and the FAA to consider the FAA request. The group reviewed the issues and experience associated with the application of DO-178A and concluded that a Special Committee should be authorized to revise DO-178A. The RTCA Executive Committee established Special Committee 167 (SC- 167) during the autumn of 1989 to accomplish this task, and agreed to these Terms of Reference:

"Special Committee 167 shall review and revise, as necessary, RTCA Document DO-178A, "Software Considerations in Airborne Systems and Equipment Certification."

GUIDANCE:

SC-167 should recognize the dynamic, evolving environment for software requirements, software design, code generation, testing and documentation; and formulate a revised document that can accommodate this environment while recommending suitably rigorous techniques. SC-167 should also recognize the international implications of this document and, therefore, should establish a close working relationship with EUROCAE, which has become the normal practice in RTCA committees.

To accomplish this revision, the Special Committee should consider the experience gained through the field application of the guidance material contained in DO-178 and DO-178A, as well as the as results of recent research in software engineering. The Special Committee should focus this review to address these areas:

   1. Examine existing industry and government standards and consider for possible adaptation or reference, where relevant.

   2. Assess the adequacy of existing software levels and the associated nature and degree of analysis, verification, test and assurance activities. The revised process criteria should be structured to support objective compliance demonstration.

   3. Examine the criteria for tools to be used for certification credit, for example, tools for software development, software configuration management and software verification.

   4. Examine the certification criteria for previously developed software, off-the-shelf software, databases and user-modifiable software for the system to be certified.

   5. Examine the certification criteria for architectural and methodical strategies used to reduce the software level or to provide verification coverage, for example, partitioning and dissimilar software.

   6. Examine configuration control guidelines, software quality assurance guidelines and identification conventions; and their compatibility with existing certification authority requirements for type certification, in-service modifications and equipment approval.

   7. Consider the impact of new technology, such as, modular architecture, data loading, packaging, and memory technology.

   8. Examine the need, content and delivery requirements of all documents, with special emphasis on the Software Accomplishment Summary.

   9. Define and consider the interfaces between the software and system life cycles.

   10. Review the criteria associated with making pre- and post-certification changes to a system.

   11. Consider the impact of evolutionary development and other alternative life cycles to the model implied by DO-178A.

EUROCAE WG-12 was re-established to work with SC-167 and, to accomplish the task, five joint RTCA/EUROCAE working groups were formed to address these topics:

   1. Documentation Integration and Production.

   2. System Issues.

   3. Software Development.

   4. Software Verification.

   5. Software Configuration Management and Software Quality Assurance.

The cooperative efforts of SC-167 and WG-12 culminated in the publication of RTCA document DO-178B and EUROCAE document ED-12B.

## Summary Of Differences between DO-178B and DO-178A

This is a complete rewrite of DO-178A.

It is suggested that the entire document be read before using any of the sections or tables in isolation.

DO-178B is primarily a process-oriented document. For each process, objectives are defined and a means of satisfying these objectives are described. A description of the software life cycle data which shows that the objectives have been satisfied is provided. The objectives for each process are summarized in tables and the effect of software level on the applicability and independence of these objectives is specified in the tables. The variation by software level in configuration management rigor for the software life cycle data is also in the tables.

DO-178B recognizes that many different software life cycles are acceptable for developing software for airborne systems and equipment. DO-178B emphasizes that the chosen software life cycle(s) should be defined during the planning for a project. The processes which comprise a software development project, no matter which software life cycle was chosen, are described. These processes fall into three categories: the software planning process, the software development processes, which include software requirements, software design, software coding and integration; and the integral processes which include software verification, software quality assurance, software configuration management and certification liaison. Integral processes are active throughout the software life cycle. DO-178B requires that criteria which control the transitions between software life cycle processes should be established during the software planning process.

The relationship between the system life cycle processes and software life cycle processes is further defined. Failure conditions associated with functions which are to be implemented in software need to be considered during the system safety assessment process. This is the basis for establishing the software level. The software levels are now Level A, Level B, Level C, Level D, and Level E.

The software verification section emphasizes requirements-based testing, which is supplemented with structural coverage.

The items that are to be delivered and other data items are further defined, as well as the configuration management required.

A section covering additional topics has been added to provide guidance in areas previously not addressed in DO-178A. These topics include the use of previously developed software, tool qualification, and the use of alternative methods, including formal methods, exhaustive input testing, multiple-version dissimilar software verification, software reliability models, and product service history.

The glossary of terms has been reviewed for redundant or conflicting terminology and, where possible, industry-accepted definitions adopted.

The guidelines of this document were compared with international standards: ISO 9000-3 (1991), "Guidelines for the Application of ISO 9001 to the Development, Supply and Maintenance of Software," and IEC 65A (Secretariat)122 (Draft - November 1991), "Software for Computers in the Application of Industrial Safety-Related Systems." These guidelines are considered to generally satisfy the intent of those standards.

A comprehensive index is provided to assist in the application of this document.
