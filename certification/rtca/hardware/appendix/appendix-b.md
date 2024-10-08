# DESIGN ASSURANCE CONSIDERATIONS FOR LEVEL A AND B FUNCTIONS

## INTRODUCTION

The designer of hardware implementing Level A and Level B functions makes design decisions that may impact safety. As the design assurance level increases, the approach needed to verify that a given design meets its safety requirements may need overlapping, layered combinations of design assurance methods. It is up to the applicant to select one or more of these methods or propose another method that would provide design assurance.

This appendix provides the designer with guidance on how to perform and use an FFPA to develop a design assurance strategy as well as guidance on some specific methods that may be used for design assurance.

## FUNCTIONAL FAILURE PATH ANALYSIS

An FFPA is a structured, top-down, iterative analysis. It identifies the specific portions of the design which implement the function; that is, the assemblies, components and elements associated with each path; and the associated failure modes and effects to be analyzed to determine that the hardware architecture and implementation complies with the safety requirements. FFPA also identifies those assemblies, components and elements of the design that implement the Level A and B functions.

An FFPA begins with the PSSA, which is used to identify system level FFPs that may be decomposed into and allocated to hardware FFPs.

The goal of an FFPA is to identify individual FFPs so that:

1. Hardware implementing Levels A and B functions can be addressed by an appropriate design assurance method described in this appendix or another advanced method acceptable to the certification authority.

2. Considerations of this appendix are optional for hardware implementing level C or lower level functions, that is, those functions that will be assured using only the guidance of Section 3 through Section 11 of this document.

   Note: Identification of separate FFPs for functions implemented in different technologies or offering different degrees of design visibility is often useful because the total hardware item's design assurance may be accomplished using multiple design assurance methods. The level of decomposition may vary for each FFP.

Decomposition is performed using conventional top-down safety assessment techniques, such as fault tree analysis. The decomposition may be complemented using F-FMEA, dependency diagrams and common mode analysis for each successive level of decomposition. The level of decomposition may vary for each system level FFP depending on the design assurance strategy, corresponding implementation concept and the error mitigation methods being proposed for the hardware being designed. Decomposition progresses from:

- system level FFPs into hardware level FFPs;

- hardware level FFPs into circuit level FFPs;

- circuit level FFPs into component level FFPs; and

- component level FFPs into elemental level FFPs.

### Functional Failure Path Analysis Method

The FFPA should be performed as follows:

1. For each Level A and Level B function, identify the function and its design assurance level based on the hardware requirements and system FHA for that function. The function may be formed as a collection of subfunctions, each having a corresponding set of derived requirements and an associated design assurance level. These subfunctions may be decomposed further as necessary.

2. For each Level A and Level B function, determine the means of implementing the function or the subfunctions and analyze the design assurance options. The assurance data available or expected to be available for the implementation of the function or subfunction should be complete and acceptable for the design assurance strategy or strategies chosen. If the assurance data available or expected to be available is complete, correct and acceptable, then no further decomposition is necessary.

3. For FFPs that are not Levels A or B, their interrelationships with the Level A or B FFPs should be evaluated using an F-FMEA, common mode analysis or dependency diagram to ensure that the Level A and B FFPs cannot be adversely impacted by the FFPs which are not Level A or B.

This assessment process is iterative. If there is no acceptable method of design assurance for a FFP, the decomposition and evaluation process is repeated or the architecture or implementation of the hardware function changed until an acceptable method of design assurance has been determined and acceptable assurance data is provided or can be provided for each Level A and Level B FFP.

Results of the FFPA and selected methods used for design assurance for the hardware are communicated to the aircraft systems process as described in Section 2.1 of this document. These results are used to examine and validate that the aircraft level assumptions, especially those related to multiple cross system usage of similar hardware items, are still valid.

### Functional Failure Path Analysis Data

The FFPA data should:

1. Identify the anomalous behaviors and functional failures that have been delegated to the hardware item from the system level.

2. Identify the FFPs, the effects of their anomalous behavior or functional failure, and decomposition level in the design hierarchy to which the analysis was performed and the type and location of the acceptable assurance data that should be available.

3. Describe the relationship between FFPs to determine their independence and inter- dependencies on other FFPs and components. Such relationships may be described using qualitative FTA or other top-down analysis, common mode analysis, F-FMEA or dependency diagrams. The relationship descriptions should identify those inter-related paths and components and the inter-dependencies.

4. Trace between the FFPs and the hardware requirements and derived requirements.

## DESIGN ASSURANCE METHODS FOR LEVEL A AND B FUNCTIONS

It is not the intent of this appendix to restrict the implementation of design assurance through the use of any current or future method. Methods discussed in this appendix may be used in satisfying one or more of the objectives of the processes described in Section 4 through Section 6 of this document.

### Architectural Mitigation

Architectural design features, such as dissimilar implementation, redundancy, monitors, isolation, partitioning and command/authority limits, can be specifically employed to mitigate or contain the adverse effects of hardware design and implementation errors. As part of the PSSA, activities such as qualitative fault tree analysis and common mode analysis can provide assurance for determining the scope of architectural attributes needed to mitigate or contain the effects of hardware faults, failures, and design and implementation errors. More specifically, this approach should be applied in conjunction with the FFPA approach for hardware as described in Appendix B, Section 2 , and should use the common mode analysis process to determine the applicability of particular mitigation strategies for coverage of hardware design and implementation errors. For example, redundancy usually helps mainly in the area of random faults or upsets, but redundancy can also be used effectively to mitigate design and implementation errors if their common mode aspects have been addressed.

### Architectural Mitigation Method

Architectural mitigation is performed by identifying FFPs associated with a proposed hardware implementation, and then analyzing design options to identify and propose design features and strategies that mitigate the effects of these FFPs. The overall effects of a proposed architecture in regards to mitigating all relevant effects of the FFPs should be evaluated and addressed. Introduction of an architectural mitigation strategy also introduces some derived requirements against which its implementation should be verified. Specifically, the architectural features should protect against some or all of the adverse effects of the identified FFPs and should be assessed for introduction of additional failure paths, which should then be addressed by further architectural mitigation, or by another of the design assurance strategies described in this appendix.

### Architectural Mitigation Resolution

The safety assessment process determines the acceptability of the architectural mitigation. The FFPA should first identify all the Level A and B hardware FFPs where architectural mitigation is to be used for credit, and should identify the methods to be used, and should determine the rationale for that mitigation. Adequacy is determined by assessing each function supporting the mitigation in the context of the overall architecture approach that may involve a more or less complex aggregate of architectural mitigation strategies.

The common mode analysis should address the potential for common mode errors in requirements, implementation, manufacturing and maintenance that could defeat the mitigation. The designer should also consider potential random failures of the hardware forming the architectural mitigation functions that may cause the mitigation to become unavailable. The probabilistic availability of the functions supporting the mitigation should be commensurate with the consequences of the loss of mitigation, which may result in the reduction of safety margins.

The overall approach should ensure that correct operation and acceptable independence between the necessary functions are achieved and maintained. Any special safeguards needed to eliminate, isolate or bound residual common mode effects should be identified and incorporated either in the form of additional architectural mitigation or other design assurance strategies defined in this appendix.

When the architecture definition is complete, hardware functions in Level A and B FFPs which are determined to be unmitigated, or inadequately mitigated, should be re-addressed using another design assurance methods from this appendix. For example, partial architectural mitigation of individual circuits and components can be used in conjunction with the safety specific analysis method when that analysis is used to identify and provide verification coverage for the unmitigated portions of the applicable circuits and components.

### Architectural Mitigation Data

Documentation of architectural mitigation means, applied to protect levels A and B FFPs in hardware, should be provided in the forms of safety assessment data, safety requirements data and traceability data. The safety assessment data should be based on the assessment of hardware FFPs and common mode failure analysis specifically addressing the architectural mitigation aspects of the hardware design.

Architectural mitigation data should include:

1. Identification of the Level A and B hardware FFPs that are to be protected by architectural means.

2. Description of the architectural approach and validation rationale about coverage provided by that approach.

3. Rationale for common mode boundaries and common mode design aspects applicable to that architecture.

4. Identification of unmitigated and inadequately mitigated Level A and B FFPs to be addressed by other design assurance methods.

5. Requirements about the functional operation and necessary design attributes of the architectural mitigation mechanisms.

6. Mitigation mechanisms used to meet safety requirements that include software, such as software partitioning, safety monitors and dissimilar software. These mechanisms and safety software requirements should be provided to the system process and the software development process.

7. Conventional failure rate data and latent fault exposure assessment data for any hardware that performs the applicable architectural mitigation.

8. Traceability data linking safety requirements to the applicable safety assessment data and to the applicable design verification data.

## Product Service Experience

Section 11.3 provides basic guidance on how to assess product service experience data for applicability for use in airborne hardware. For Level A and B functions that use previously developed hardware as part of the design, additional design assurance is necessary. This assurance can be provided in the following manner.

### Product Service Experience Method

After completion of the assessment of Section 11.3, the FFPs that are implemented by the hardware under consideration should be analyzed with respect to any applicable service experience. The applicant or designer should identify the service experience data and establish that the service experience data demonstrates that the reused functionality of the hardware was sufficiently exercised during previous uses of the hardware.

### Product Service Experience Resolution

When the service experience data analysis is complete, hardware functions in Level A and B FFPs that are determined to be not exercised, inadequately exercised or for which no service experience is available by in-service operation, should be addressed using another design assurance method or by the identification of additional verification that can be applied to exercise the functions.

### Product Service Experience Data

Data of product service experience applied to protect Level A and B FFPs in hardware, should include:

1. The product service experience assessment data of Section 11.3.2.

2. Identification of the FFPs for which design assurance is provided by service experience and justification for the sufficiency of the service experience data.

3. Identification of the FFPs for which service experience data is insufficient and identification of test environments, test procedures, analyses and results used to complete the design assurance for the FFPs.

4. Identification of FFPs and operational conditions not demonstrated by the service experience that will require additional architectural mitigation or advanced verification method.

5. Traceability data as described in Section 10.4.1 showing the explicit relationship of the service experience data and verification that provides design assurance coverage of each FFP.

## Advanced Verification Methods

Additional design assurance confidence may be achieved and evidence provided by the application of advanced verification methods, such as Elemental Analysis, Formal Methods, Safety-Specific Verification Analysis, or other applicant-proposed and certification authority-accepted methods.

The advanced verification methods of design assurance both use and extend the scope of the FFPA method presented in Appendix B, Section 2. The FFPA method is applied progressively at equipment-level, circuit-level, and component-level to determine the hardware implementation of the Level A and B FFPs. Data from the FFPA is then used to determine the proposed means of design assurance applicable to the hardware circuits, components and elements contained in those Level A and B FFPs.

These three methods are summarized here and described in the following sections.

1. Elemental Analysis. Elemental analysis provides a measurement of the completeness of the hardware verification from a bottom-up perspective. Every functional element within the FFP is identified and verified using verification test cases that meet the verification objectives of Section 6.1. The analysis may also identify areas of concern that need to be addressed by other appropriate means.

2. Safety-Specific Analysis. This strategy focuses on exposing and correcting the design errors that could adversely affect the hardware outputs from a system-safety perspective. Applicable safety sensitive portions of the hardware input space and output space are analytically determined. The sensitive portions of the hardware input space are stimulated, and the output space is observed not only for the safety- sensitive intended-function requirements verification, but also for anomalous behaviors. The methods of output space observation are identified in advance, by analysis that is accomplished using traditional safety analysis techniques.

3. Formal Methods. Formal Methods employ techniques from formal logic and discrete mathematics for the specification, design and verification of computer

systems. These techniques may be used to substantiate the reasoning employed in various processes of the hardware design life cycle.

Other advanced verification methods may be proposed by the applicant other than those described in this section.

### Elemental Analysis

Elemental analysis may be used to show that FFPs are verified by associated verification test cases. Elemental analysis provides confidence and evidence that design errors are precluded by separating a complex implementation of the FFP into elements at the level that the designer generated it. This analysis method provides a measurement of the verification process to support the determination of verification coverage and completeness, and is most suited where the detailed design is visible and under configuration control. This would be the case in an ASIC or PLD, where the functions are addressed at the same design assurance level, or where functions of different design assurance levels are isolated or segregated. Every functional element of the applicable circuits or components is identified and verified for intended-function correctness using verification procedures that achieve the verification objectives of Section 6.1. Elemental analysis is generally applied to an entire component or an assembly without regard to the number of varied FFPs implemented in it, but may be applied to a portion of a component or assembly if a rationale can be provided for the isolation, independence or segregation of different FFPs.

Note: When an elemental analysis is performed on a function implemented in a PLD, the programmed contents and the application of the PLD's features should be included, and the unprogrammed component may be addressed using a separate method, such as prior service experience.

The analysis identifies areas of concern that need to be addressed by appropriate means. A verification process without such an analysis may leave some circuitry inadequately tested. Historically, such inadequacies have been due to shortcomings in requirements- based test procedures, unclear or incomplete hardware requirements, unused circuitry, initialization circuitry and library functions. This analysis examines verification of elements in the FFPs of concern and determines if the verification coverage related to each element is complete. Determination that verification coverage for elements is incomplete indicates a need for additional verification or appropriate activity.

The applicant should propose at what levels in the design hierarchy the elements are defined and how they are to be analyzed for verification coverage.

#### Elemental Analysis Method

The elemental analysis method begins by defining a set of criteria to be applied in the analysis in consideration of the hardware design assurance level, the hardware technology and visibility of the details of the implemented hardware.

The criteria should include:

1. Identification and a definition of the elements at an appropriate level of the hardware design.

2. The verification coverage to which each element should be verified.

These criteria are then applied to the analysis of verification activities to determine whether the verification coverage completion criteria will be achieved by the planned verification. If the criteria will not be achieved, then each element being examined should be exercised by an appropriate set of stimuli and cause appropriate observable effects on the signals being monitored in the test.

Note: As this process examines the tests against the hardware itself, it can detect deficiencies in the test procedures. Addressing the test deficiencies would then provide additional confidence and evidence that the testing is sufficient, and the execution of new or amended test cases can then uncover errors in the hardware.

##### Selecting Elemental Analysis Criteria

...

The elemental analysis criteria to be applied should be selected on a case-by-case basis depending on the hardware element type and complexity, and the identifiable functional operations of the element. The analysis may show either that all the low-level primitive blocks, such as counters, registers, multiplexers, adders, op amps and filters, have been adequately tested or that all groups of interconnected primitives have been adequately tested and achieve the verification coverage criteria. The analysis criteria of the test procedures should be derived based on an assessment of the functional operation of the element and its integration with other hardware elements in order to perform the next higher hierarchical level hardware function.

Note 1: For example: if an element is a modulo-n counter used as a time delay, the test procedures may use appropriate equivalence-class selections of input data to verify that it counts when enabled, stops counting when disabled, counts at the correct rate, and reaches n and rolls-over at the specified time. It would not be necessary to show that the test procedures exercise the individual gates or flip-flops that collectively form the counter.

As an example of using interconnected primitives as an element, an Arithmetic Logic Unit (ALU) may be constructed of primitives, such as registers, adders, and control logic. The ALU may be simulated to show that the primitives collectively form the ALU, but the verification procedures used in the elemental analysis should use appropriate equivalence-classes of input data to show that the ALU performs its functions.

The elements need not be defined at a level of the design below that specified by the designer of the hardware. Gate-level analysis may be appropriate only if the design is explicitly expressed as gates for combinatorial logic or state machine control.

Note 2: Analyzing the implementation below the level of that specified by the designer, such as at the gate or transistor level, is not necessary as it would be analogous to analyzing software at the assembly language or binary pattern level. These lower abstraction levels are implicitly addressed by performing the elemental analysis on verification tests performed on the hardware, or on post-layout simulations successfully assessed, and if necessary, qualified as verification tools per Section 11.4.

An ASIC or PLD may contain proprietary library functions that may not provide visibility of their internal design and therefore would not lend themselves to manual analysis. Library functions may be treated as COTS elements in the elemental analysis, with the COTS hardware aspects addressed as defined in Section 11.2 and Appendix B, Section 2.2. Verification of the application of the library function should show that it is consistent with its specification or description provided by the library manufacturer and the tests should be executed in an environment that allows the test results to be observed.

Note 3: The intent is not to discourage the use of design libraries in favor of building new functions; the practical use of design libraries is encouraged to minimize further opportunities for introducing errors into the hardware.

For ASICs or PLDs synthesized from a high level description in an HDL, the analysis criteria may be based on the high-level behavioral language code representing the hardware. However, since implementations synthesized from HDL representations may include parallel logic structures and non-sequential temporal aspects, the synthesized output should be included in the analysis completion determination. The synthesizer should be assessed as well.

##### Performing the Elemental Analysis

...

Elemental analysis should use the requirements-based verification tests performed in one or more of the following test environments:

1. Tests with the circuitry implementing the functional path installed in the target assembly.

2. Tests performed on a standalone prototype. Such tests are typical for an ASIC or PLD.

3. Manufacturing acceptance tests.

   Note: Since manufacturing tests often are not based on the requirements, manufacturing acceptance tests may be restricted in their application to elemental analysis.

4. A post-layout simulation, typically for an ASIC or PLD, that has been assessed and, if necessary, qualified for use as a verification tool as described in Section 11.4.

An elemental analysis itself may be performed using a simulation to measure the completeness achieved, provided that the test procedures to be analyzed can be related to the elemental analysis criteria being applied and are those used for hardware functional verification credit toward the objectives in Section 6. If the test procedures analyzed are derived from an in-circuit test of hardware or standalone prototype and are examined using a simulation, the test stimuli and expected results may be translated for the simulator provided that the translation process is checked for accuracy as a part of the elemental analysis. A simulator used to perform the elemental analysis should be shown to be able to correctly determine whether each type of element included in the implementation has met the analysis criteria.

#### Elemental Analysis Results Resolution

Elemental analysis may reveal hardware elements not verified, indicating either a need for additional verification process activities or perhaps a need to remove the untested element or mitigate any anomalous behavior that could result by architectural means. Untested hardware elements may be the result of:

1. Shortcomings in verification test cases or procedures. Shortcomings may arise if the test cases simply do not test the elements in the hardware item in compliance with the criteria in Appendix B, Section 3.3.1.1. They may also arise if there are "don't cares" in the functional requirements but the hardware item was appropriately designed to produce repeatable responses. Under these circumstances, the test procedures and cases should be supplemented or changed. Furthermore, the assertion of the test's ability to verify its respective requirements should be reviewed.

2. Inadequacies in requirements. The requirements should be modified or additional derived requirements identified. Additional verification tests should then be developed for the new or revised requirements, executed and analyzed.

3. Unused functions. The hardware item may contain functions that are not used in its target circuit application, such as unused subfunctions within a library function or test structures used only for component-level acceptance tests. Such functions should either be shown to be isolated from the other used functions or shown to present no potential anomalous behavior that could have an adverse effect on safety. This could possibly be achieved by showing that the unused elements are positively deactivated either within the hardware or when installed. If the unused functions are to be used in some future application, the elemental analysis deficiency may be revisited at that time provided that such functions are identified as not being fully verified.

4. Element of no safety consequence. The consequence of anomalous behavior of the element can be bound and shown by analysis to not cause an adverse safety effect to the airplane or its occupants. These items should be resolved by recording the analysis bounding the consequence of anomalous behavior of the element.

#### Elemental Analysis Life Cycle Data Output

The elemental analysis life cycle data output should:

1. Identify the FFPs to be addressed by elemental analysis, and propose at what levels in the design hierarchy the elements are defined and how they are to be analyzed for verification adequacy, which are parts of the verification coverage completion criteria. This should be included in the PHAC or hardware verification plan.

2. Describe the methods and identify the FFPs addressed in the analysis and the levels in the design hierarchy at which the analysis was performed.

3. Ensure that the traceability data, as described in Section 10.4.1 shows the explicit relationship of the verification procedures to the elements in the elemental analysis.

4. Identify the verification test cases and requirements added or modified as a result of the elemental analysis.

5. State the level of the verification completeness achieved for the FFPs addressed by elemental analysis, including identification of the analysis discrepancies not resolved by modification to verification tests or requirements and the rationale for acceptability.

### Safety-Specific Analysis

Where applied, the safety-specific analysis method extends the hardware FFPA concept by performing a more in-depth analysis of the selected circuits and components. The extended FFPA is used to both derive and validate safety-specific requirements about internal operations of those circuits and components. These derived safety requirements are then addressed by the verification tests as discussed below.

Safety-specific analysis is based on the concept that a potentially latent design error can affect a hardware item's output only when specific input stimuli expose it. Therefore, to properly stimulate and expose the safety errors of concern, the subset of input cases for which safe operation is necessary is identified and then appropriate equivalence classes from that subset are included in the verification tests. During execution of these test cases, the item's outputs are evaluated for absence of specific anomalous behaviors that could result in unsafe output conditions. The safety-specific analysis is used to bound the set of input conditions to be applied in the verification test cases so that a potentially infinite set of input test cases do not have to be addressed.

Note: The implementation may also bound the input set and conditions so that it is not possible or is adequately improbable that the implementation would allow an input outside the limits tested.

The safety-specific analysis method can also be used to determine the unmitigated aspects of circuit and component functions in which partial architectural mitigation is applicable. In this case, the additional safety-specific analysis can be a useful and effective method to determine what additional design assurance is needed to complete the safety coverage.

The safety–specific analysis method is equally applicable to either COTS hardware or custom circuits and components because it is able to use user guide data about those circuit and components instead of detailed internal design data. By combining the user guide data with this more detailed application of the FFPA method, the safety-specific analysis is able to successfully determine the safety-sensitive aspects of circuit and component usage and the associated internal FFPs where design error removal emphasis is needed. This information can then be used to successfully derive circuit and component verification tests which, when completed, maximize the likelihood that the verification process has exposed and corrected, mitigated, or provided work-arounds for those circuit and component design errors which could adversely affect the hardware from a system- safety perspective.

#### Safety-Specific Analysis Method

Once the circuits and components which are to be addressed using the safety-specific analysis method of design assurance are selected, then an additional FFPA is performed to examine them in greater detail. This analysis determines more specifically which circuit and component functions contribute to the already identified Level A and B functions that use those circuits and components. This is accomplished by examining each applicable circuit and component, case-by-case, at its functional boundaries, considering the actual functional usage of that circuit or component to perform the higher level hardware functions contained in the identified Level A and B FFPs.

Note: Sufficient information may be available in circuit and component user's guide data that a user can successfully use the functions of that circuit or component to perform higher level hardware functions. If sufficient information is available about the circuit's or component's internal functioning, it should also be adequate to make this assessment. If sufficient information is not available, this assessment cannot be done, and another method should be used instead or in conjunction with this method.

After the relevant safety-sensitive functions of the circuits and components have been identified based on the actual usage of those circuits and components, the next step is an even more detailed functional analysis. This analysis should determine the specific safety- sensitive and unmitigated attributes of those circuit and component functions that are to be addressed in more detail by the safety-specific verification conditions. These verification conditions should be derived and validated by using F-FMEA techniques to determine the specific functional attributes that are safety-sensitive and further to determine any specific anomalous behavior of those functions that would constitute a Level A and B FFP within the circuit or component.

Derived verification conditions obtained via the above safety-specific analysis activities are then used in conjunction with the following guidance to complete the safety-specific analysis criteria for verification of circuit and components contained in Level A and B FFPs. Guidance includes:

1. Identify the relevant input space of the functions. Determine the associated output space pass/fail criteria, based on the identified safety-sensitive functional attributes and anomalous behaviors, and develop the equivalence-classes that will provide the necessary coverage of the relevant input space.

2. Identify relevant observable detection means, and input space stimulation means for each considered function.

   Note: Special tools and implementation features may be used to ensure observe-ability and testability.

3. Specify the test environments that address verification of potential error sources and interdependencies.

   Note: Component-level functions should be tested at the highest integration level feasible. Testing at higher levels of integration usually provides the best coverage of error-sources, such as upset, interdependencies and potential cross-functional interactions.

Tests should be developed using equivalence-classes. Testing should address key logic decisions, arithmetic, timing, state transitions and real-time attributes.

#### Safety-Specific Analysis Resolution

The safety-specific verification completion criteria should be established by completion of the safety-specific analysis for all the applicable circuits and components. Any deficiencies found by that analysis or by the verification itself should be resolved by one of the following methods:

1. Change the design to correct the error.

2. Add architectural mitigation, which resolves the error by removing it from the relevant FFP.

3. Add appropriate tests.

#### Safety-Specific Analysis Data

Documentation of safety-specific analysis, when applied to circuits and components in Level A and B FFPs, should be provided in the form of safety assessment data, safety requirements data, verification procedures and results, and traceability data. The verification procedures should be traceable to the safety requirements, and to the safety- specific analysis. Safety-specific analysis data should include:

1. Identification of the circuit and components which are to be addressed by the safety- specific analysis method.

2. Identification of the Level A and B FFPs in which each of those circuits and components reside.

3. Identification of partial architectural mitigation applicable to circuits and components where design assurance completion is to be provided by the safety-specific analysis method.

4. For each applicable circuit and component, identification of safety sensitive functions.

5. For each identified safety-sensitive function, identification of safety-sensitive attributes and anomalous behaviors of concern.

6. Verification conditions addressing the applicable circuits, components, internal functions, functional attributes and anomalous behaviors.

7. Verification conditions addressing input dependencies and output space behaviors to be verified.

8. Verification procedures and results.

9. Traceability data linking verification procedures and hardware safety verification conditions to safety-specific hardware analysis data.

### Formal Methods

The term formal methods refers to the use of techniques from logic and discrete mathematics in the specification, design and construction of computer systems.

Note: The material in this section is derived from "Formal Methods Specification and Analysis Guidebook for the Verification of Software and Computer Systems, Volume II: A Practitioner's Companion," May 1997, NASA-GB- 001 - 97. A more detailed presentation of the application of formal methods, illustrated with a worked example, can be found there.

Applications of formal methods fall into two broad categories, descriptive and deductive. Descriptive methods employ formal specification languages, which provide for clear, unambiguous descriptions of requirements and other design artifacts. Deductive methods rely on a discipline that requires the explicit enumeration of all assumptions and reasoning steps. In addition, each reasoning step must be an instance of a small number of allowed rules of inference. The most rigorous formal methods apply these techniques to substantiate the reasoning used to justify the requirements, or other aspects of the design or implementation of a complex or critical system. The purpose of formal methods is to reduce reliance on human intuition and judgment in evaluating arguments. That is, deductive formal methods reduce the acceptability of an argument to a calculation that can, in principle, be checked by a tool, thereby replacing the inherent subjectivity of the review process with a repeatable exercise.

There are several areas where application of formal methods provides additional assurance in the design process. Although formal methods are applicable throughout the design process, increases in design assurance may be obtained by targeted application. The following list highlights some of the possibilities:

1. Formal methods may be applied at different stages of the development life cycle. Generally, applications of formal methods are most effective at the early stages of the life cycle, specifically during requirements capture and high-level design.

2. Formal methods may be applied to the entire design or they may be targeted to specific components. The FFPA is used to determine which FFPs to analyze with formal methods. Protocols dealing with complex concurrent communication and hardware implementing fault-tolerant functions may be effectively analyzed with formal methods.

3. Formal methods may be applied to verify system functionality or they may be used to establish specific properties. Although formal methods have traditionally been associated with "proof-of-correctness," that is, ensuring that a component meets its functional specification, they can also be applied to only the most important properties. Often, it is more important to confirm that a design does not exhibit certain undesirable properties, rather than to prove that it has full functionality.

Practical application of formal methods typically requires tool support. Tools used should be assessed and, if necessary, qualified as described in Section 11.4.

#### The Methodology of Formal Methods

The application of formal methods begins by expressing the requirements using a formal language. The requirement specification serves an important descriptive function. It provides a basis for documenting, communicating and prototyping the behavior and properties of a system using an unambiguous notation. In addition, the requirements specification serves as a basis for calculating or formally predicting system behavior. A formal model of the component to be analyzed is constructed using a formal language. The model is analyzed with respect to the formal statement of requirements using the rules of the selected formal logic. The characteristics of the model are determined by the style of formal analysis to be performed.

The level of detail in the component model is determined by the goal of the chosen formal analysis technique. Some approaches are tailored to finding design errors that may have eluded testing, while other approaches seek to guarantee the absence of certain classes of design errors.

1. Error-Detection. The most common formal technique for error detection is called model checking. Here the requirements are expressed as formula in a decidable temporal logic. The model of the component is an abstract state machine designed so that the property to be tested is preserved. The proof procedure is automatic. A failed proof attempt indicates a design error in the modeled component. The result of failed proof is a sequence of input stimuli that demonstrate specifically how the component does not satisfy the stated requirement.

2. Error Preclusion. Formal methods targeted to prevention of errors are generally based upon an expressive specification language with a supporting proof theory. With the increased expressiveness, more complicated requirements may be stated and more detailed models of the component may be constructed. However, the proof procedure may only be partially automated. An appropriate level of detail for the component model may be a synthesizable HDL description. In some cases, the same model may be used both for simulation and formal analysis. A completed proof is evidence that the component is logically correct with respect to the stated requirements for the analyzed input space.

#### Formal Methods Resolution

There are three possible outcomes of a deductive formal analysis:

1. If the proof attempt is successful, the verification activity is complete. The level of design assurance depends upon the fidelity of the models employed. For example, if the model of the hardware item corresponds to a detailed design, the proof provides assurance of functional correctness equivalent to that of exhaustive testing.

2. In some cases, a failed proof results in an explicit counter-example; that is, it identifies a test scenario to illustrate specifically how the design does not meet the stated requirements. This may indicate either a deficiency in the design or a deficiency in the requirements. Such deficiencies may be resolved by correcting the design, revising the requirements, shown to not be a physically realizable condition or using another method. All counter-examples should be identified so that they can be resolved. Changes to the design or requirements need to be reflected back to the appropriate process.

   a. After a design or requirement has been modified to address a deficiency identified by a failed proof attempt, the proof should be attempted again to confirm that the modification has successfully addressed the identified problems. This cycle is repeated until a successful proof is achieved.

   b. In cases where a counter-example is considered resolved without requirement or design changes but the tool identifies only one counter-example, that is, the resolved counter-example, the process should be modified so that it can identify all other counter-examples. 

3. The most difficult case to resolve is when a proof cannot be produced and a counter- example cannot be identified. One possible option is to revise the design in order to simplify the verification effort. Alternatively, the verification activity may be decomposed with a clear delineation between the cases addressed by proof and those cases where the requirement needs to be addressed by some other means. Changes to the design and derived requirements should be reflected back to the FFPA.

#### Formal Methods Data

The data developed during the application of formal methods includes:

1. Description of the specific formal methods approach to be used and the components or FFPs to which formal methods will be applied.

2. Formal statement of requirements.

3. Formal models of the component.

4. Proof, or sufficiently detailed script to generate proof, relating the models of the component to the formal statement of requirements and including correlation in the traceability data.

5. Identification of tools employed and tool assessment results.

6. Identification of the verification test cases and requirements added or modified as a result of the analysis.

7. Statement of the level of the verification completeness achieved for the FFPs addressed by analysis. Include a list of the analysis discrepancies not resolved by modification to verification test cases or requirements and their rationale for acceptability of the discrepancies.
