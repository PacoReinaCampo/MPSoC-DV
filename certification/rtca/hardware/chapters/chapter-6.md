# VALIDATION AND VERIFICATION PROCESS

This section describes the validation process and the verification process. The validation process provides assurance that the hardware item derived requirements are correct and complete with respect to system requirements allocated to the hardware item. The verification process provides assurance that the hardware item implementation meets all of the hardware requirements, including derived requirements.

## Validation process

The validation process discussed here is intended to ensure that the derived requirements are correct and complete with respect to the system requirements allocated to the hardware item through the use of a combination of objective and subjective processes. Validation may be conducted before or after the hardware item is available, however, validation is typically conducted throughout the design life cycle.

Note 1: Experience indicates that attention to the development and validation of requirements can identify subtle errors or omissions early in the development cycle and reduce exposure to subsequent redesign or inadequate hardware performance.

The validation process discussed here is not intended to validate the requirements allocated from system requirements since validation of these requirements is assumed to occur as part of the system process. In addition, not all hardware item derived requirements need to be validated.

Design decisions that affect the system safety or functional requirements allocated to other portions of the system should be classified as derived requirements and should be validated. Additionally, design decisions and assumptions that constrain subsequent design tasks should be validated as derived requirements.

Derived requirements that need to be validated should be validated against the system requirements allocated to the hardware item. Derived requirements that are not traceable to a higher level requirement should be validated against the design decision from which they are derived.

Note 2: A design decision to include a separate power supply for circuitry performing a specific function could result in the derivation of requirements to guide the design of that power supply. These derived requirements could include safety requirements based on the failure condition that could result from the fault or failure of the function supported by the circuit that receives power from the power supply. These requirements should be validated.

Another example of a design decision that becomes a derived requirement is the memory address assignments for peripheral devices. There is often no requirements basis for the assignments, however, once made they constrain subsequent design tasks to comply with those assignments in order for the design to function correctly. This derived requirement may not need to be validated.

### Validation Process Objectives

The objectives of the validation process for derived hardware requirements are:

1. Derived hardware requirements against which the hardware item is to be verified are correct and complete.

2. Derived requirements are evaluated for impact on safety.

3. Omissions and errors are fed back to the appropriate processes for resolution.

### Validation Process Activities

The hardware validation objective may be satisfied through a combination of activities, such as reviews, simulation, prototyping, modeling, analysis, service experience, engineering assessment, or the development and execution of tests.

Guidance for validation process activities includes:

1. The derived hardware requirements that need to be validated should be identified.

2. For each requirement that was identified in item 1, the validation completion criteria should be identified and satisfied as shown below:

   a. Each requirement has been validated at some hierarchical level by review, analysis or test.

   b. The review, analysis or test of each requirement is appropriate for validating the requirement, especially with respect to safety.

   c. The review, analysis or test results associated with the validation of each requirement are correct and that discrepancies between actual and expected results are explained. When expected results are not pre-defined as may be the case for reviews and analyses, the results of the validation activity should be consistent with the requirement, especially with respect to safety requirements.

   Note: Validation completion criteria may be based on requirements, safety considerations, operational mode or implementation.

3. The derived requirements should be evaluated for their impact on safety. 

4. The derived hardware requirements should be evaluated for completeness with respect to the system requirements allocated to the hardware item. For the purposes of this process, a set of requirements is complete when all the attributes that have been defined are necessary and all the necessary attributes have been defined.

5. The derived hardware requirements should be evaluated for correctness with respect to the system requirements allocated to the hardware item. For the purposes of this document, a requirement is correct when the requirement is defined without ambiguity and there are no errors in the defined attributes.

6. Traceability between the derived hardware requirements and the validation activities and results should be established.

7. Requirement omissions and errors should be fed back to the appropriate process for resolution.

## Verification Process

The verification process provides assurance that the hardware item implementation meets the requirements. Verification consists of reviews, analyses and tests applied as defined in the verification plan. The verification process should include an assessment of the results.

Note 1: Safety aspects of hardware design take the form of safety requirements to be met by the hardware implementation.

This section provides guidance for the verification process that should be applied to the hardware design. The verification process may be applied at any level of the design hierarchy as defined in the hardware verification plan. For safety requirements, it is advantageous to apply the verification process at various stages of the design process to increase the probability, to a high degree of confidence, that design errors have been eliminated. Some design assurance levels require that the objectives of the verification process be met with independence as addressed in Appendix A.

The software verification, software/hardware integration verification and systems integration verification processes are not addressed here. However, verification of hardware requirements during these processes is a valid method of hardware verification.

Changes to a verified configuration may be re-verified by similarity, analysis, newly designed tests or by repeating a portion of the original verification.

Note 2: Informal testing outside the documented verification process is recommended. The procedures and results, however, are not necessarily maintained under configuration management control but are highly effective in the detection and elimination of design errors early in the design process. Verification credit can be taken for this testing only if it is formalized.

### Verification Process Objectives

The objectives of the verification process are:

1. Evidence is provided that the hardware implementation meets the requirements.

2. Traceability is established between hardware requirements, the implementation, and the verification procedures and results.

3. Acceptance test criteria are identified, can be implemented and are consistent with the hardware design assurance levels of the hardware functions.

4. Omissions and errors are fed back to the appropriate processes for resolution.

### Verification Process Activities

Verification process objectives may be satisfied through a combination of methods, such as reviews, analyses, and the development and execution of tests. The verification plan documents the verification activities that should be employed to demonstrate compliance to the requirements.

Verification activities include:

1. Requirements that need a verification activity should be identified. It is not intended that requirements should be verified at every hierarchical level; requirements can be verified at a higher hierarchical level.

2. Verification methods, such as tests, simulation, prototyping, analyses and reviews, should be selected and performed.

3. Traceability between requirements, implementation, and the verification procedure and results should be established. Traceability should be consistent with the design assurance level of the function performed by the hardware. It is not intended to require traceability to detailed components, such as resistors, capacitors or gates, unless required for safety considerations.

4. Verification coverage analysis should be performed to determine that the verification process is complete, including:

   a. Each requirement has been verified at some hierarchical level by review, analysis or test.

   b. The review, analysis or test of each requirement is appropriate for verifying the requirement, especially with respect to safety requirements.

   c. The review, analysis or test results associated with the verification of each requirement are correct and that discrepancies between actual and expected results are explained. When expected results are not pre-defined as may be the case for reviews and analyses, the results of the verification activity should be consistent with the requirement, especially with respect to safety requirements.

5. The results of the verification activities should be documented.

6. Omissions and errors should be fed back to the appropriate process for resolution.

## Validation and Verification Methods

This section describes some methods that may be applicable to both validation and verification.

### Test

Test is a method that confirms that the hardware item correctly responds to a stimulus or series of stimuli. Examples of tests include functional test on the hardware item, system bench test, system validation facility test and aircraft test.

Tests may be conducted using manual, automated or specialized test equipment. Tests may also take advantage of internal hardware item test capabilities, such as Built-In-Test, in the verification process.

When it is not feasible to verify specific requirements by exercising the hardware item in its intended operational environment, other verification means should be provided, and justified.

Tests may be performed during various hardware design processes. Testing performed for certification credit requires a configured item. Systems integration or software/hardware integration test results may also be used for test credit.

Guidance for tests includes:

1. Each requirement to be validated or verified by test should be identified. Environmental qualification test requirements are part of these requirements.

2. The testing stimulus, sequence and test conditions, such as item ambient temperature and applied voltage, should be defined for each test.

3. Pass/fail criteria and a method for recording the results should be defined prior to test execution.

4. The complete identification of the test equipment and calibration date for each should be recorded.

5. The configuration identity of the hardware item being tested should be recorded.

6. Test results should be recorded and retained.

7. Test failures should be fed back to the appropriate process for resolution.

### Analysis

Analysis is a detailed, repeatable, analytical method for evaluation of specific hardware item characteristics to demonstrate that a specific requirement is met. Examples of analyses are stress analysis, design margin analysis, common mode failure analysis, worst case analysis and test coverage analysis. Service experience may provide data for various analyses.

Note: As the complexity of the hardware design increases, it is advantageous to make use of computerized tools, such as simulation to verify requirements and implementation of the design.

Analyses may include a detailed examination of the functionality, performance, traceability and safety implications of a hardware item function and its relationship to other functions within the airborne system or equipment. Analysis alone or in combination with other verification methods provides evidence that a requirement is correctly implemented. Analysis should be based on data provided by the design process, service experience or other available databases.

Simulation is an important design analysis tool both for visualization of circuit operation and for higher level functional operation. Simulation can be used to analyze the impact of production variations in hardware parameters that would be difficult to do using other verification means and thus build confidence in reduction of design errors affecting safety due to these variations. Since the results depend on the models and scenarios employed, simulation results alone cannot be used for the purpose of certification credit without supporting evidence of their validity.

Examples of analysis include:

1. Thermal Analysis. Thermal analysis verifies that the design implementation meets the requirements when exposed to the operating thermal environment.

2. Stress Analysis. Stress analysis verifies that components meet de-rating criteria over the required operating range.

3. Reliability Analysis. Reliability analysis establishes whether the design implementation satisfies the reliability requirements of the product.

4. Design Margin Analysis. Design margin analysis verifies that the design implementation satisfies its functional requirements given the variability of components.

5. Similarity Analysis. Similarity analysis compares characteristics and usage to those of systems previously certified.

6. Simulation Analysis. A simulation analysis compares the simulation results and expected results.

### Reviews

A review is a qualitative method for evaluation of the plans, requirements, design data, design concept or design implementation.

Reviews should be held throughout the hardware design life cycle as identified in the relevant plan. All reviews to be used for certification credit should be identified in the validation and verification plan.

Guidance for reviews may include:

1. Participants should have the knowledge necessary to perform the reviews.

2. Hardware review results may be used to permit or deny transitions between hardware design life cycle process activities.

3. Results of review should be documented, including decisions made and disposition of actions to be taken.

#### Requirements Review

The requirements review is a method to ensure the acceptability of requirements. A requirements review may address objectives from both the validation and the verification processes within the same review.

Requirement changes that occur after the initial requirements review should be subject to the same review process used initially or an equivalent review process. It is not the intent of this review to validate the system requirements allocated to the hardware item.

Guidance for requirements review includes:

1. Each requirement should be unambiguous, verifiable, and described in complete enough detail for its hierarchical level and should not conflict with other requirements.

2. Derived requirements should be consistent with the system requirements or requirements from which they are derived.

3. The requirements should be consistent with the SSA.

4. The derived safety requirements should be defined and fed back to the SSA.

5. The requirements should be compatible with relevant hardware design standards.

6. The requirements should be compatible with the capabilities and limitations of available technology.

7. The component's requirements, such as performance, temperature range, de-rating and screening, should be consistent with the safety and reliability requirements.

8. The ability to test, maintain and manufacture the hardware item should be addressed.

9. The software/hardware interface requirements should be defined.

10. The requirements should be traceable upward to the next hierarchical level according to the criteria defined in the plan.

11. The derived requirements should capture the implementation constraints that will not be verified at a higher hierarchical level.
12. Omissions and errors should be fed back to the appropriate process for resolution.

   Note 1: The following questions may help assess completeness of requirements:

   a. Are all upper level requirements considered?

   b. Are applicable standards and guidance considered?

   c. Are all hardware functions and interfaces covered?

   d. Is the architecture covered completely?

   e. Is all of the hardware implementation requiring verification adequately specified?

   f. Are all prohibited behavior characteristics in the safety assessment covered?

   g. Is the operating environment adequately specified?

   h. Are assumptions and constraints considered?

   i. Will this implementation avoid any known problems with existing or similar hardware?

      Note 2: The following questions may help assess correctness of requirements:

   a. Are the requirements in accordance with upper level requirements?

   b. Are the requirements in accordance with the system requirements allocated to the hardware item?

   c. Are the requirements stating "what" as opposed to "how"?

   d. Are the requirements unambiguous?

   e. Can the requirements be realized?

   f. Can the requirements be verified?

   g. Have the functioning modes been defined?

   h. Are the requirements consistent with the safety assessment?

   i. Are assumptions and constraints correctly identified as derived requirements?

#### Design Review

A design review is a method to determine that the design data and implementation satisfy the requirements. Design reviews should be performed as defined in the plan at multiple times during the hardware design life cycle. Examples are conceptual design, detail design and implementation reviews. For hierarchical designs that span several hardware item levels, such as ASICs and circuit card assemblies, design reviews should be considered where the potential is greatest for assuring a correct design.

Guidance for design reviews includes:

1. All requirements should be addressed and the derived requirements and the design data should be correctly defined.

2. Environmental requirements should be addressed.

3. Safety and reliability requirements should be addressed.

4. The safety aspects of the design data should be explicitly identified.

5. The design should be capable of being implemented, tested and maintained.

6. New manufacturing techniques should be evaluated.

7. The components selection criteria identified in the plans should be satisfied.

8. The design should be traceable to the requirements.

9. Omissions and errors should be fed back to the appropriate process for resolution.
