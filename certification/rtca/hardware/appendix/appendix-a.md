\appendix

# MODULATION OF HARDWARE LIFE CYCLE DATA BASED ON HARDWARE DESIGN ASSURANCE LEVEL

This appendix provides guidance for the modulation of the hardware design life cycle data based on the hardware design assurance level. It also provides guidance concerning the requirements for independence during the verification process.

Table A-1 identifies the data delivery classification and configuration management data control category for each data element. Refer to Table 7-1. There are two data delivery classification types defined:

1. Submitted. The data item should be submitted to the certification authority.
2. Not Available. The data item is not required.

All verification of Level A and B functions should be independent. Level C and lower functions do not require independent verification. Independence is needed only at the design hierarchy level at which the design is verified against the requirements. An equivalent means of independence, which addresses the issue of common mode failure, should be acceptable.

Independence is a means to address potential common mode errors that could occur when a designer verifies that the hardware item under development performs as designed, not as required. To address this concern, the responsibility for ensuring the verification process is consistent with demonstrating that the design requirements have been met should be performed with an individual, a process or a tool that is independent of the designer. There are many means of establishing independence and the verification plan should address the specific means to be used for a particular verification activity.

Some examples of acceptable means are:

1. Requirements or designs are reviewed by another individual.
2. Test cases or procedures are developed by another individual.
3. Test cases or procedures developed by the designer are reviewed by another individual.
4. An analysis performed by the designer is reviewed by another individual or a review team.
5. A different test is performed that confirms the results of testing by the designer, such as a test during flight test confirms a hardware item test or software verification tests, developed independently and performed on the target hardware item, confirm the results of testing by the designer.
6. Test or analysis results are verified by a tool.

   Note 1: Often verification tests are automated and require only the "push of a key" to execute them. It is not the intent of independence to require someone other than the designer to execute the tests once they are evaluated or developed with independence. The results may still need to be reviewed independently to confirm proper procedures were followed and that the results verify that the requirements have been met.

   Note 2: Organizational structure separation is not needed to achieve independence.

The circled numbers in Table A-1 refer to the notes following the table.

1. Data that should be submitted is indicated by an S in the Submit column. HC1 and HC2 data used for certification that need not be submitted should be available. Refer to Section 7.3.

2. The objectives listed here are for reference only. Not all objectives may be applicable to all assurance levels.

3. If this data is used for certification, then its availability is shown in the table. This data is not always used for certification and may not be required.

4. This can be accomplished informally through the certification liaison process for Levels C and D. Documentation can be in the form of meeting minutes and or presentation material.

5. If the applicant references this data item in submitted data items, it should be available.

6. Only the traceability data from requirements to test is needed.

7. Test coverage of derived or lower hierarchical requirements is not needed.
