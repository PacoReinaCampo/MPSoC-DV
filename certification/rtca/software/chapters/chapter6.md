# SOFTWARE VERIFICATION PROCESS

This section discusses the objectives and activities of the software verification process. Verification is a technical assessment of the results of both the software development processes and the software verification process. The software verification process is applied as defined by the software planning process (section 4) and the Software Verification Plan (subsection 11.3). Verification is not simply testing. Testing, in general, cannot show the absence of errors. As a result, the following subsections use the term "verify" instead of "test" when the software verification process objectives being discussed are typically a combination of reviews, analyses and test. Tables A-3 through A- 7 of Annex A contain a summary of the objectives and outputs of the software verification process, by software level.

Note: For lower software levels, less emphasis is on:

   - Verification of low-level requirements.

   - Verification of the software architecture.

   - Degree of test coverage.

   - Control of verification procedures.

   - Independence of software verification process activities.

   - Overlapping software verification process activities, that is, multiple verification activities, each of which may be capable of detecting the same class of error.

   - Robustness testing.

   - Verification activities with an indirect effect on error prevention or detection, for example, conformance to software development standards.

## Software Verification Process Objectives

The purpose of the software verification process is to detect and report errors that may have been introduced during the software development processes. Removal of the errors is an activity of the software development processes. The general objectives of the software verification process are to verify that:

   a. The system requirements allocated to software have been developed into software high-level requirements that satisfy those system requirements.

   b. The high-level requirements have been developed into software architecture and low-level requirements that satisfy the high-level requirements. If one or more levels of software requirements are developed between high-level requirements and low-level requirements, the successive levels of requirements are developed such that each successively lower level satisfies its higher level requirements. If code is generated directly from high-level requirements, this objective does not apply.

   c. The software architecture and low-level requirements have been developed into Source Code that satisfies the low-level requirements and software architecture.

   d. The Executable Object Code satisfies^ the software requirements.

   e. The means used to satisfy these objectives are technically correct and complete for the software level.

## Software Verification Process Activities

Software verification process objectives are satisfied through a combination of reviews, analyses, the development of test cases and procedures, and the subsequent execution of those test procedures. Reviews and analyses provide an assessment of the accuracy, completeness, and verifiability of the software requirements, software architecture, and Source Code. The development of test cases may provide further assessment of the internal consistency and completeness of the requirements. The execution of the test procedures provides a demonstration of compliance with the requirements.

The inputs to the software verification process include the system requirements, the software requirements and architecture, traceability data, Source Code, Executable Object Code, and the Software Verification Plan.

The outputs of the software verification process are recorded in Software Verification Cases and Procedures (subsection 11.13) and Software Verification Results (subsection 11.14).

The need for the requirements to be verifiable once they have been implemented in the software may itself impose additional requirements or constraints on the software development processes.

The verification process provides traceability between the implementation of the software requirements and verification of those software requirements:

   - The traceability between the software requirements and the test cases is accomplished by the requirements-based coverage analysis.

   - The traceability between the code structure and the test cases is accomplished by the structural coverage analysis.

Guidance for the software verification activities includes:

   a. High-level requirements and traceability to those high-level requirements should be verified.

   b. The results of the traceability analyses and requirements-based and structural coverage analyses should show that each software requirement is traceable to the code that implements it and to the review, analysis, or test case that verifies it.

   c. If the code tested is not identical to the airborne software, those differences should be specified and justified.

   d. When it is not possible to verify specific software requirements by exercising the software in a realistic test environment, other means should be provided and their justification for satisfying the software verification process objectives defined in the Software Verification Plan or Software Verification Results.

   e. Deficiencies and errors discovered during the software verification process should be reported to the software development processes for clarification and correction.

## Software Reviews and Analyses.

Reviews and analyses are applied to the results of the software development processes and software verification process. One distinction between reviews and analyses is that analyses provide repeatable evidence of correctness and reviews provide a qualitative assessment of correctness. A review may consist of an inspection of an output of a process guided by a checklist or similar aid.

An analysis may examine in detail the functionality, performance, traceability and safety implications of a software component, and its relationship to other components within the airborne system or equipment.

### Reviews and Analyses of the High-Level Requirements

The objective of these reviews and analyses is to detect and report requirements errors that may have been introduced during the software requirements process. These reviews and analyses confirm that the high-level requirements satisfy these objectives:

   a. Compliance with system requirements: The objective is to ensure that the system functions to be performed by the software are defined, that the functional, performance, and safety- related requirements of the system are satisfied by the software high-level requirements, and that derived requirements and the reason for their existence are correctly defined.

   b. Accuracy and consistency: The objective is to ensure that each high-level requirement is accurate, unambiguous and sufficiently detailed and that the requirements do not conflict with each other.

   c. Compatibility with the target computer: The objective is to ensure that no conflicts exist between the high-level requirements and the hardware/software features of the target computer, especially, system response times and input/output hardware.

   d. Verifiability: The objective is to ensure that each high-level requirement can be verified.

   e. Conformance to standards: The objective is to ensure that the Software Requirements Standards were followed during the software requirements process and that deviations from the standards are justified.

   f. Traceability: The objective is to ensure that the functional, performance, and safety-related requirements of the system that are allocated to software were developed into the software high-level requirements.

   g. Algorithm aspects: The objective is to ensure the accuracy and behavior of the proposed algorithms, especially in the area of discontinuities.

### Reviews and Analyses of the Low- Level Requirements

The objective of these reviews and analyses is to detect and report requirements errors that may
have been introduced during the software design process. These reviews and analyses confirm that
the software low-level requirements satisfy these objectives:

   a. Compliance with high-level requirements: The objective is to ensure that the software low-level requirements satisfy the software high-level requirements and that derived requirements and the design basis for their existence are correctly defined.

   b. Accuracy and consistency: The objective is to ensure that each low-level requirement is accurate and unambiguous and that the low-level requirements do not conflict with each other.

   c. Compatibility with the target computer: The objective is to ensure that no conflicts exist between the software requirements and the hardware/software features of the target computer, especially, the use of resources (such as bus loading), system response times, and input/output hardware.

   d. Verifiability: The objective is to ensure that each low-level requirement can be verified.

   e. Conformance to standards: The objective is to ensure that the Software Design Standards were followed during the software design process, and that deviations from the standards are justified.

   f. Traceability: The objective is to ensure that the high-level requirements and derived requirements were developed into the low-level requirements.

   g. Algorithm aspects: The objective is to ensure the accuracy and behavior of the proposed algorithms, especially in the area of discontinuities.

### Reviews and Analyses of the Software Architecture.

The objective of these reviews and analyses is to detect and report errors that may have been introduced during the development of the software architecture. These reviews and analyses confirm that the software architecture satisfies these objectives:

   a. Compatibility with the high-level requirements: The objective is to ensure that the software architecture does not conflict with the high-level requirements, especially functions that ensure system integrity, for example, partitioning schemes.

   b. Consistency: The objective is to ensure that a correct relationship exists between the components of the software architecture. This relationship exists via data flow and control flow.

   c. Compatibility with the target computer: The objective is to ensure that no conflicts exist, especially initialization, asynchronous operation, synchronization and interrupts, between the software architecture and the hardware/software features of the target computer.

   d. Verifiability: The objective is to ensure that the software architecture can be verified, for example, there are no unbounded recursive algorithms.

   e. Conformance to standards: The objective is to ensure that the Software Design Standards were followed during the software design process and that deviations to the standards are justified, especially complexity restrictions and design constructs that would not comply with the system safety objectives.

   f. Partitioning integrity: The objective is to ensure that partitioning breaches are prevented or isolated.

### Reviews and Analyses of the Source Code

The objective is to detect and report errors that may have been introduced during the software coding process. These reviews and analyses confirm that the outputs of the software coding process are accurate, complete and can be verified. Primary concerns include correctness of the code with respect to the software requirements and the software architecture, and conformance to the Software Code Standards. These reviews and analyses are usually confined to the Source Code. The topics should include:

   a. Compliance with the low-level requirements: The objective is to ensure that the Source Code is accurate and complete with respect to the software low-level requirements, and that no Source Code implements an undocumented function.

   b. Compliance with the software architecture: The objective is to ensure that the Source Code matches the data flow and control flow defined in the software architecture.

   c. Verifiability: The objective is to ensure the Source Code does not contain statements and structures that cannot be verified and that the code does not have to be altered to test it.

   d. Conformance to standards: The objective is to ensure that the Software Code Standards were followed during the development of the code, especially complexity restrictions and code constraints that would be consistent with the system safety objectives. Complexity includes the degree of coupling between software components, the nesting levels for control structures, and the complexity of logical or numeric expressions. This analysis also ensures that deviations to the standards are justified.

   e. Traceability: The objective is to ensure that the software low-level requirements were developed into Source Code.

   f. Accuracy and consistency: The objective is to determine the correctness and consistency of the Source Code, including stack usage, fixed point arithmetic overflow and resolution, resource contention, worst-case execution timing, exception handling, use of uninitialized variables or constants, unused variables or constants, and data corruption due to task or interrupt conflicts.

### Reviews and Analyses of the Outputs of the Integration Process

The objective is to ensure that the results of the integration process are complete and correct. This could be performed by a detailed examination of the linking and loading data and memory map. The topics should include:

   a. Incorrect hardware addresses.

   b. Memory overlaps.

   c. Missing software components.

### Reviews and Analyses of the Test Cases, Procedures and Results

The objective of these reviews and analyses is to ensure that the testing^ of the code was developed and performed accurately and completely. The topics should include:

   a. Test cases: The verification of test cases is presented in paragraph 6.4.4.

   b. Test procedures: The objective is to verify that the test cases were accurately developed into test procedures and expected results.

   c. Test results: The objective is to ensure that the test results are correct and that discrepancies between actual and expected results are explained.

## Software Testing Process

Testing of airborne software has two complementary objectives. One objective is to demonstrate that the software satisfies its requirements. The second objective is to demonstrate with a high degree of confidence that errors which could lead to unacceptable failure conditions, as determined by the system safety assessment process, have been removed.

Figure 6-1 is a diagram of the software testing process. The objectives of the three types of testing in the figure are:

   - Hardware/software integration testing: To verify correct operation of the software in the target computer environment.

   - Software integration testing: To verify the interrelationships between software requirements and components and to verify the implementation of the software requirements and software components within the software architecture.

   - Low-level testing: To verify the implementation of software low-level requirements.

   Note: If a test case and its corresponding test procedure are developed and executed for hardware/software integration testing or software integration testing and satisfy the requirements-based coverage and structural coverage, it is not necessary to duplicate the test for low-level testing. Substituting nominally equivalent low-level tests for high-level tests may be less effective due to the reduced amount of overall functionality tested.

To satisfy the software testing objectives:

   a. Test cases should be based primarily on the software requirements.

   b. Test cases should be developed to verify correct functionality and to establish conditions     that reveal potential errors.

   c. Software requirements coverage analysis should determine what software requirements were not tested.

   d. Structural coverage analysis should determine what software structures were not exercised.

### Test Environment

More than one test environment may be needed to satisfy the objectives for software testing. An excellent test environment includes the software loaded into the target computer and tested in a high fidelity simulation of the target computer environment.

Note: In many cases, the requirements-based coverage and structural coverage necessary can be achieved only with more precise control and monitoring of the test inputs and code execution than generally possible in a fully integrated environment. Such testing may need to be performed on a small software component that is functionally isolated from other software components.

Certification credit may be given for testing done using a target computer emulator or a host computer simulator. Guidance for the test environment includes:

   a. Selected tests should be performed in the integrated target computer environment, since some errors are only detected in this environment.

### Requirements-Based Test Case Selection

Requirements-based testing is emphasized because this strategy has been found to be the most effective at revealing errors. Guidance for requirements-based test case selection includes:

   a. To implement the software testing objectives, two categories of test cases should be included: normal range test cases and robustness (abnormal range) test cases.

   b. The specific test cases should be developed from the software requirements and the error sources inherent in the software development processes.

#### Normal Range Test Cases

The objective of normal range test cases is to demonstrate the ability of the software to respond to normal inputs and conditions. Normal range test cases include:

   a. Real and integer input variables should be exercised using valid equivalence classes and boundary values.

   b. For time-related functions, such as filters, integrators and delays, multiple iterations of the code should be performed to check the characteristics of the function in context.

   c. For state transitions, test cases should be developed to exercise the transitions possible during normal operation.

   d. For software requirements expressed by logic equations, the normal range test cases should verify the variable usage and the Boolean operators. Note: One method is to test all combinations of the variables. For complex expressions, this method is impractical due to the large number of test cases required. A different strategy that ensures the required coverage could^ be developed. For example, for Level A, the Boolean operators could be verified by analysis or review, and to complement this activity, test cases could be established to provide modified condition/decision coverage.

#### Robustness Test Cases

The objective of robustness test cases is to demonstrate the ability of the software to respond to abnormal inputs and conditions. Robustness test cases include:

   a. Real and integer variables should be exercised using equivalence class selection of invalid values.

   b. System initialization should be exercised during abnormal conditions.

   c. The possible failure modes of the incoming data should be determined, especially complex, digital data strings from an external system.

   d. For loops where the loop count is a computed value, test cases should be developed to attempt to compute out-of-range loop count values, and thus demonstrate the robustness of the loop-related code.

   e. A check should be made to ensure that protection mechanisms for exceeded frame times respond correctly.

   f. For time-related functions, such as filters, integrators and delays, test cases should be developed for arithmetic overflow protection mechanisms.

   g. For state transitions, test cases should be developed to provoke transitions that are not allowed by the software requirements.

### Requirements-Based Testing Methods

Requirements-based testing methods consist of methods for requirements-based hardware/software integration testing, requirements-based software integration testing, and requirements-based low-level testing. With the exception of hardware/software integration testing, these methods do not prescribe a specific test environment or strategy. Guidance includes:

   a. Requirements-Based Hardware/Software Integration Testing: This testing method should concentrate on error sources associated with the software operating within the target computer environment, and on the high-level functionality. The objective of requirements-based hardware/software integration testing is to ensure that the software in the target computer will satisfy the high-level requirements.

Typical errors revealed by this testing method include:

      - Incorrect interrupt handling.
      - Failure to satisfy execution time requirements.
      - Incorrect software response to hardware transients or hardware failures, for example, start-up sequencing, transient input loads and input power transients.
      - Data bus and other resource contention problems, for example, memory mapping.
      - Inability of built-in test to detect failures.
      - Errors in hardware/software interfaces.
      - Incorrect behavior of feedback loops.
      - Incorrect control of memory management hardware or other hardware devices under software control.
      - Stack overflow.
      - Incorrect operation of mechanism(s) used to confirm the correctness and compatibility of field-loadable software.
      - Violations of software partitioning.

   b. Requirements-Based Software Integration Testing: This testing method should concentrate on the inter-relationships between the software requirements, and on the implementation of requirements by the software architecture. The objective of requirements-based software integration testing is to ensure that the software components interact correctly with each other and satisfy the software requirements and software architecture. This method may be performed by expanding the scope of requirements through successive integration of code components with a corresponding expansion of the scope of the test cases. Typical errors revealed by this testing method include:

      - Incorrect initialization of variables and constants.
      - Parameter passing errors.
      - Data corruption, especially global data.
      - Inadequate end-to-end numerical resolution.
      - Incorrect sequencing of events and operations.

   c. Requirements-Based Low-Level Testing: This testing method should concentrate on demonstrating that each software component complies with its low-level requirements. The objective of requirements-based low-level testing is to ensure that the software components satisfy their low-level requirements.

      - Typical errors revealed by this testing method include:
      - Failure of an algorithm to satisfy a software requirement.
      - Incorrect loop operations
      - Incorrect logic decisions.
      - Failure to process correctly legitimate combinations of input conditions.
      - Incorrect responses to missing or corrupted input data.
      - Incorrect handling of exceptions, such as arithmetic faults or violations of array limits.
      - Incorrect computation sequence.
      - Inadequate algorithm precision, accuracy or performance.

### Test Coverage Analysis

Test coverage analysis is a two step process, involving requirements-based coverage analysis and structural coverage analysis. The first step analyzes the test cases in relation to the software requirements to confirm that the selected test cases satisfy the specified criteria. The second step confirms that the requirements-based test procedures exercised the code structure. Structural coverage analysis may not satisfy the specified criteria. Additional guidelines are provided for resolution of such situations as dead code (subparagraph 6.4.4.3).

#### Requirements-Based Test Coverage Analysis

The objective of this analysis is to determine how well the requirements-based testing verified the implementation of the software requirements. This analysis may reveal the need for additional requirements-based test cases. The requirements-based test coverage analysis should show that:

   a. Test cases exist for each software requirement.

   b. Test cases satisfy the criteria of normal and robustness testing as defined in paragraph 6.4.2.

#### Structural Coverage Analysis

The objective of this analysis is to determine which code structure was not exercised by the requirements-based test procedures. The requirements-based test cases may not have completely exercised the code structure, so structural coverage analysis is performed and additional verification produced to provide structural coverage. Guidance includes:

   a. The analysis should confirm the degree of structural coverage appropriate to the software level.

   b. The structural coverage analysis may be performed on the Source Code, unless the software level is A and the compiler generates object code that is not directly traceable to Source Code statements. Then, additional verification should be performed on the object code to establish the correctness of such generated code sequences. A compiler-generated array-bound check in the object code is an example of object code that is not directly traceable to the Source Code.

   c. The analysis should confirm the data coupling and control coupling between the code components.

#### Structural Coverage Analysis Resolution

Structural coverage analysis may reveal code structure that was not exercised during testing. Resolution would require additional software verification process activity. This unexecuted code structure may be the result of:

   a. Shortcomings in requirements-based test cases or procedures: The test cases should be supplemented or test procedures changed to provide the missing coverage. The method(s) used to perform the requirements-based coverage analysis may need to be reviewed.

   b. Inadequacies in software requirements: The software requirements should be modified and additional test cases developed and test procedures executed.

   c. Dead code: The code should be removed and an analysis performed to assess the effect and the need for reverification.

   d. Deactivated code: For deactivated code which is not intended to be executed in any configuration used within an aircraft or engine, a combination of analysis and testing should show that the means by which such code could be inadvertently executed are prevented, isolated, or eliminated. For deactivated code which is only executed in certain configurations of the target computer environment, the operational configuration needed for normal execution of this code should be established and additional test cases and test procedures developed to satisfy the required coverage objectives.
