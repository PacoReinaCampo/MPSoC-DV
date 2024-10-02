# ADDITIONAL CONSIDERATIONS

The previous sections of this document provide guidance for satisfying certification requirements in which the applicant submits evidence of the software life cycle processes. This section introduces additional considerations concerning the software aspects of certification in relation to the use of previously developed software, qualification of software tools, and alternative methods for achieving the objectives of the previous sections of this document.

## Use of Previously Developed Software

The guidelines of this subsection discuss the issues associated with the use of previously developed software, including the assessment of modifications, the effect of changing an aircraft installation, application environment, or development environment, upgrading a development baseline, and SCM and SQA considerations. The intention to use previously developed software is stated in the Plan for Software Aspects of Certification.

### Modifications to Previously Developed Software

This guidance discusses modifications to previously developed software where the outputs of the previous software life cycle processes comply with this document. Modification may result from requirement changes, the detection of errors, and/or software enhancements. Analysis activities for proposed modifications include:

   a. The revised outputs of the system safety assessment process should be reviewed considering the proposed modifications.
   b. If the software level is revised, the guidelines of paragraph 12.1.4 should be considered.
   c. Both the impact of the software requirements changes and the impact of software architecture changes should be analyzed, including the consequences of software requirement changes upon other requirements and coupling between several software components that may result in reverification effort involving more than the modified area.
   d. The area affected by a change should be determined. This may be done by data flow analysis, control flow analysis, timing analysis and traceability analysis.
   e. Areas affected by the change should be reverified considering the guidelines of section 6.

### Change of Aircraft Installation

Airborne systems or equipment containing software which has been previously certified at a certain software level and under a specific certification basis may be used in a new aircraft installation. This guidance should be used for new aircraft installations, if using previously developed software:

   a. The system safety assessment process assesses the new aircraft installation and determines the software level and the certification basis. No additional effort will be required if these are the same for the new installation as they were in the previous installation.
   b. If functional modifications are required for the new installation, the guidelines of paragraph 12.1.1, Modifications to Previously Developed Software, should be satisfied.
   c. If the previous development activity did not produce outputs required to substantiate the safety objectives of the new installation, the guidelines of paragraph 12.1.4, Upgrading a Development Baseline, should be satisfied.

### Change of Application or Development Environment.

Use and modification of previously developed software may involve a new development environment, a new target processor or other hardware, or integration with other software than that used for the original application.

New development environments may increase or reduce some activities within the software life cycle. New application environments may require activities in addition to software life cycle process activities which address modifications. Guidance for change of application or development environment includes:

   a. If a new development environment uses software development tools, the guidelines of subsection 12.2, Tool Qualification, may be applicable.
   b. The rigor of the evaluation of an application change should consider the complexity and sophistication of the programming language. For example, the rigor of the evaluation for Ada generics will be greater if the generic parameters are different in the new application. For object oriented languages, the rigor will be greater if the objects that are inherited are different in the new application.
   c. If a different compiler or different set of compiler options are used, resulting in different object code, the results from a previous software verification process activity using the object code may not be valid and should not be used for the new application. In this case, previous test results may no longer be valid for the structural coverage criteria of the new application. Similarly, compiler assumptions about optimization may not be valid.
   d. If a different processor is used then:
      (1) The results from a previous software verification process activity directed at the hardware/software interface should not be used for the new application.
      (2) The previous hardware/software integration tests should be executed for the new application.
      (3) Reviews of hardware/software compatibility should be repeated.
      (4) Additional hardware/software integration tests and reviews may be necessary.
   e. Verification of software interfaces should be conducted where previously developed software is used with different interfacing software.

### Upgrading A Development Baseline

Guidelines follow for software whose software life cycle data from a previous application are determined to be inadequate or do not satisfy the objectives of this document, due to the safety objectives associated with a new application. These guidelines are intended to aid in the acceptance of:

   - Commercial off-the-shelf software.
   - Airborne software developed to other guidelines.
   - Airborne software developed prior to the existence of this document.
   - Software previously developed to this document at a lower software level.

Guidance for upgrading a development baseline includes:

   a. The objectives of this document should be satisfied while taking advantage of software life cycle data of the previous development that satisfy the objectives for the new application.
   b. Software aspects of certification should be based on the failure conditions and software level(s) as determined by the system safety assessment process. Comparison to failure conditions of the previous application will determine areas which may need to be upgraded.
   c. Software life cycle data from a previous development should be evaluated to ensure that the software verification process objectives of the software level are satisfied for the new application.
   d. Reverse engineering may be used to regenerate software life cycle data that is inadequate or missing in satisfying the objectives of this document. In addition to producing the software product, additional activities may need to be performed to satisfy the software verification process objectives.
   e. If use of product service history is planned to satisfy the objectives of this document in upgrading a development baseline, the guidelines of paragraph 12.3.5 should be considered.
   f. The applicant should specify the strategy for accomplishing compliance with this document in the Plan for Software Aspects of Certification.

### Software Configuration Management Considerations

If previously developed software is used, the software configuration management process for the new application should include, in addition to the guidelines of section 7:

   a. Traceability from the software product and software life cycle data of the previous application to the new application.
   b. Change control that enables problem reporting, problem resolution, and tracking of changes to software components used in more than one application.

### Software Quality Assurance Considerations

If previously developed software is used, the software quality assurance process for the new application should include, in addition to the guidelines of section 8:

   a. Assurance that the software components satisfy or exceed the software life cycle criteria of the software level for the new application.
   b. Assurance that changes to the software life cycle processes are stated in the software plans.

## Tool Qualification

Qualification of a tool is needed when processes of this document are eliminated, reduced or automated by the use of a software tool without its output being verified as specified in section 6. The use of software tools to automate activities of the software life cycle processes can help satisfy system safety objectives insofar as they can enforce conformance with software development standards and use automatic checks.

The objective of the tool qualification process is to ensure that the tool provides confidence at least equivalent to that of the process(es) eliminated, reduced or automated. If partitioning of tool functions can be demonstrated, only those functions that are used to eliminate, reduce, or automate software life cycle process activities, and whose outputs are not verified, need be qualified.

Only deterministic tools may be qualified, that is, tools which produce the same output for the same input data when operating in the same environment. The tool qualification process may be applied either to a single tool or to a collection of tools. Software tools can be classified as one of two types:

   - Software development tools: Tools whose output is part of airborne software and thus can introduce errors. For example, a tool which generates Source Code directly from low- level requirements would have to be qualified if the generated Source Code is not verified as specified in section 6.
   - Software verification tools: Tools that cannot introduce errors, but may fail to detect them. For example, a static analyzer, that automates a software verification process activity, should be qualified if the function that it performs is not verified by another activity. Type checkers, analysis tools and test tools are other examples.

Tool qualification guidance includes:

   a. Tools should be qualified according to the type specified above.

   b. Combined software development tools and software verification tools should be qualified to comply with the guidelines in paragraph 12.2.1, unless partitioning between the two functions can be demonstrated. c. The software configuration management process and software quality assurance process objectives for airborne software should apply to software tools to be qualified.

The software verification process objectives for software development tools are described in paragraph 12.2.1, item d.

A tool may be qualified only for use on a specific system where the intention to use the tool is stated in the Plan for Software Aspects of Certification. Use of the tool for other systems may need further qualification.

### Qualification Criteria for Software Development Tools 

The qualification criteria for software development tools includes:

   a. If a software development tool is to be qualified, the software development processes for the tool. should satisfy the same objectives as the software development processes of airborne software.

   b. The software level assigned to the tool should be the same as that for the airborne software it produces, unless the applicant can justify a reduction in software level of the tool to the certification authority.

      Note: A reduction in a tool's software level can be based upon the significance of the software verification process activity to be eliminated, reduced or automated, with respect to the entire suite of verification activities. This significance is a function of:

   - The type of software verification process activity to be eliminated, reduced or automated. For example, a verification activity for conformance of the Source Code with software indentation standards is less significant than verification activity for compliance of the Executable Object Code with the high-level requirements.
   - The likelihood that other verification activities would have detected the same error(s).

   c. The applicant should demonstrate that the tool complies with its Tool Operational Requirements (subparagraph 12.2.3.2). This demonstration may involve a trial period during which a verification of the tool output is performed and tool-related problems are analyzed, recorded and corrected.

   d. Software development tools should be verified to check the correctness, consistency, and completeness of the Tool Operational Requirements and to verify the tool against those requirements. The objectives of the tool's software verification process are different from those of the airborne software since the tool's high-level requirements correspond to its Tool Operational Requirements instead of system requirements. Verification of software development tools may be achieved by:

      (1) Review of the Tool Operational Requirements as described in paragraph 6.3.1, items a and b.

      (2) Demonstration that the tool complies with its Tool Operational Requirements under normal operating conditions.

      (3) Demonstration that the tool complies with its Tool Operational Requirements while executing in abnormal operating conditions, including external disturbances and selected failures applied to the tool and its environment.

      (4) Requirements-based coverage analysis and additional tests to complete the coverage of the requirements.

      (5) Structural coverage analysis appropriate for the tool's software level.

      (6) Robustness testing for tools with a complex data flow or control flow, as specified in subparagraph 6.4.2.2, appropriate to the tool's software level.

      (7) Analysis of potential errors produced by the tool, to confirm the validity of the Tool Qualification Plan.

### Qualification Criteria for Software Verification Tools

The qualification criteria for software verification tools should be achieved by demonstration that the tool complies with its Tool Operational Requirements under normal operational conditions.

### Tool Qualification Data

Guidance for tool qualification data includes:

   a. When qualifying a tool, the Plan for Software Aspects of Certification of the related airborne software should specify the tool to be qualified and reference the tool qualification data.
   b. The tool qualification data should be controlled as Control Category 1 (CC1) for software development tools and CC2 for software verification tools.
   c. For software development tools, the tool qualification data should be consistent with the data in section 11 and have the same characteristics and content as data for airborne software, with these considerations:
      (1) A Tool Qualification Plan satisfies the same objectives as the Plan for Software Aspects of Certification of the airborne software.
      (2) Tool Operational Requirements satisfies the same objectives as the Software Requirements Data of the airborne software.
      (3) A Tool Accomplishment Summary satisfies the same objectives as the Software Accomplishment Summary of the airborne software.

#### Tool Qualification Plan

For software development tools to be qualified, the Tool Qualification Plan describes the tool qualification process. This plan should include:

   a. Configuration identification of the tool.
   b. Details of the certification credit sought, that is, the software verification process activities to be eliminated, reduced or automated.
   c. The software level proposed for the tool.
   d. A description of the tool's architecture.
   e. The tool qualification activities to be performed.
   f. The tool qualification data to be produced.

#### Tool Operational Requirements

Tool Operational Requirements describe the tool's operational functionality. This data should include:

   a. A description of the tool's functions and technical features. For software development tools, it includes the software development process activities performed by the tool.
   b. User information, such as installation guides and user manuals.
   c. A description of the tool's operational environment.
   d. For software development tools, the expected responses of the tool under abnormal operating conditions.

### Tool Qualification Agreement

The certification authority gives its agreement to the use of a tool in two steps:

   - For software development tools, agreement with the Tool Qualification Plan. For software verification tools, agreement with the Plan for Software Aspects of Certification of the airborne software.
   - For software development tools, agreement with the Tool Accomplishment Summary. For software verification tools, agreement with the Software Accomplishment Summary of the airborne software.

## Alternative Methods.

Some methods were not discussed in the previous sections of this document because of inadequate maturity at the time this document was written or limited applicability for airborne software. It is not the intention of this document to restrict the implementation of any current or future methods. Any single alternative method discussed in this subsection is not considered an alternative to the set of methods recommended by this document, but may be used in satisfying one or more of the objectives of in this document.

Alternative methods may be used to support one another. For example, formal methods may assist tool qualification or a qualified tool may assist the use of formal methods. An alternative method cannot be considered in isolation from the suite of software development processes. The effort for obtaining certification credit of an alternative method is dependent on the software level and the impact of the alternative method on the software life cycle processes.

Guidance for using an alternative method includes:

   a. An alternative method should be shown to satisfy the objectives of this document.
   b. The applicant should specify in the Plan for Software Aspects of Certification, and obtain agreement from the certification authority for:
      (1) The impact of the proposed method on the software development processes.
      (2) The impact of the proposed method on the software life cycle data.
      (3) The rationale for use of the alternative method which shows that the system safety objectives are satisfied.
   c. The rationale should be substantiated by software plans, processes, expected results, and evidence of the use of the method.

### Formal Methods

Formal methods involve the use of formal logic, discrete mathematics, and computer-readable languages to improve the specification and verification of software. These methods could produce an implementation whose operational behavior is known with confidence to be within a defined domain. In their most thorough application, formal methods could be equivalent to exhaustive analysis of a system with respect to its requirements. Such analysis could provide:

   - Evidence that the system is complete and correct with respect to its requirements.
   - Determination of which code, software requirements or software architecture satisfy the next higher level of software requirements.

The goal of applying formal methods is to prevent and eliminate requirements, design and code errors throughout the software development processes. Thus, formal methods are complementary to testing. Testing shows that functional requirements are satisfied and detects errors, and formal methods could be used to increase confidence that anomalous behavior will not occur (for inputs that are out of range) or unlikely to occur. Formal methods may be applied to software development processes with consideration of these factors:

   * Levels of the design refinement: The use of formal methods begins by specifying software high-level requirements in a formal specification language and verifying by formal proofs that they satisfy system requirements, especially constraints on acceptable operation. The next lower level of requirements are then shown to satisfy the high-level requirements. Performing this process down to the Source Code provides evidence that the software satisfies system requirements. Application of formal methods can start and stop with consecutive levels of the design refinement, providing evidence that those levels of requirements are specified correctly.

   * Coverage of software requirements and software architecture: Formal methods may be applied to software requirements that:
      - Are safety-related.
      - Can be defined by discrete mathematics.
      - Involve complex behavior, such as concurrency, distributed processing, redundancy management, and synchronization.

These criteria can be used to determine the set of requirements at the level of the design refinement to which the formal methods are applied.

   * Degree of rigor: Formal methods include these increasingly rigorous levels:
      - Formal specification with no proofs.
      - Formal specification with manual proofs.
      - Formal specification with automatically checked or generated proofs.

The use of formal specifications alone forces requirements to be unambiguous. Manual proof is a well-understood process that can be used when there is little detail. Automatically checked or generated proofs can aid the human proof process and offer a higher degree of dependability, especially for more complicated proofs.

### Exhaustive Input Testing

There are situations where the software component of an airborne system or equipment is simple and isolated such that the set of inputs and outputs can be bounded. If so, it may be possible to demonstrate that exhaustive testing of this input space can be substituted for a software verification process activity. For this alternative method, the applicant should include:

   a. A complete definition of the set of valid inputs and outputs of the software.
   b. An analysis which confirms the isolation of the inputs to the software.
   c. Rationale for the exhaustive input test cases and procedures.
   d. The test cases, test procedures and test results.

### Considerations for Multiple- Version Dissimilar Software Verification.

Guidelines follow concerning the software verification process as it applies to multiple-version dissimilar software. If the software verification process is modified because of the use of multiple- version dissimilar software, evidence should be provided that the software verification process objectives are satisfied and that equivalent error detection is achieved for each software version.

Multiple, dissimilar versions of the software are produced using combinations of these techniques:

   - The Source Code is implemented in two or more different programming languages.
   - The object code is generated using two or more different compilers.
   - Each software version of Executable Object Code executes on a separate, dissimilar processor, or on a single processor with the means to provide partitioning between the software versions.
   - The software requirements, software design, and/or Source Code are developed by two or more development teams whose interactions are managed.
   - The software requirements, software design, and/or Source Code are developed on two or more software development environments, and/or each version is verified using separate test environments.
   - The Executable Object Code is linked and loaded using two or more different linkage editors and two or more different loaders.
   - The software requirements, software design, and/or Source Code are developed in conformance with two or more different Software Requirements Standards, Software Design Standards, and/or Software Code Standards, respectively.

When multiple versions of software are used, the software verification methods may be modified from those used to verify single version software. They will apply to software development process activities that are multi-thread, such as separate, multiple development teams. The software verification process is dependent on the combined hardware and software architectures since this affects the dissimilarity of the multiple software versions. Additional software verification process objectives to be satisfied are:

   a. To demonstrate that the inter-version compatibility requirements are satisfied, including compatibility during normal and abnormal operations and state transitions.
   b. To demonstrate that equivalent error detection is achieved. Other changes in software verification process activities may be agreed with by the certification authority, if the changes are substantiated by rationale that confirms equivalent software verification coverage.

#### Independence of Multiple- Version Dissimilar Software

When multiple-version dissimilar software versions are developed independently using a managed method, the development processes have the potential to reveal certain classes of errors such that verification of each software version is equivalent to independent verification of the software development processes. To realize the advantage of this potential, guidance for independence includes:

   a. The applicant should demonstrate that different teams with limited interaction developed each software version's software requirements, software design and Source Code.
   b. Independent test coverage analyses should still be performed as with a single version.

#### Multiple Processor-Related Verification

When each version of dissimilar software executes on a different type of processor, the verification of some aspects of compatibility of the code with the processor (paragraph 6.4.3, item a) may be replaced by verification to ensure that the multiple types of processor produce the correct outputs. This verification consists of integration tests in which the outputs of the multiple versions are cross- compared in requirements-based test cases. The applicant should show that:

   a. Equivalent error detection is achieved.
   b. Each processor was designed by a different developer.

   c. The outputs of the multiple versions are equivalent.

#### Multiple- Version Source Code Verification

The guidelines for structural coverage analysis (subparagraph 6.4.4.2) may be modified for airborne systems or equipment using multiple-version dissimilar software. Structural coverage analysis may be performed at the Source Code level even if the object code is not directly traceable to Source Code statements provided that the applicant shows that:

   a. Each version of software is coded using a different programming language.
   b. Each compiler used is from a different developer.

#### Tool Qualification for Multiple- Version Dissimilar Software

If multiple-version dissimilar software is used, the tool qualification process may be modified, if evidence is available that the multiple software development tools are dissimilar. This depends on the demonstration of equivalent software verification process activity in the development of the multiple software versions using dissimilar software development tools. The applicant should show that:

   a. Each tool was obtained from a different developer.
   b. Each tool has a dissimilar design.

#### Multiple Simulators and Verification

If separate, dissimilar simulators are used to verify multiple-version dissimilar software versions, then tool qualification of the simulators may be modified. This depends on the demonstration of equivalent software verification process activity in the simulation of the multiple software versions using multiple simulators. Unless it can be justified as unnecessary, for multiple simulators to be dissimilar, evidence should be available that:

   a. Each simulator was developed by a different team.
   b. Each simulator has different requirements, a different design and a different programming language.
   c. Each simulator executes on a different processor.

   Note: When a multiple processor system using multiple, dissimilar versions of software are executing on identical processors, it may be difficult to demonstrate dissimilarity of simulators because of the reliance on information obtained from a common source, the processor manufacturer.

### Software Reliability Models

During the preparation of this document, methods for estimating the post-verification probabilities of software errors were examined. The goal was to develop numerical requirements for such probabilities for software in computer-based airborne systems or equipment. The conclusion reached, however, was that currently available methods do not provide results in which confidence can be placed to the level required for this purpose. Hence, this document does not provide guidance for software error rates. If the applicant proposes to use software reliability models for certification credit, rationale for the model should be included in the Plan for Software Aspects of Certification, and agreed with by the certification authority.

### Product Service History

If equivalent safety for the software can be demonstrated by the use of the software's product service history, some certification credit may be granted. The acceptability of this method is dependent on:

   - Configuration management of the software.
   - Effectiveness of problem reporting activity.
   - Stability and maturity of the software.
   - Relevance of product service history environment.
   - Actual error rates and product service history.
   - Impact of modifications.

Guidance for the use of product service history includes:

   a. The applicant should show that the software and associated evidence used to comply with system safety objectives have been under configuration management throughout the product service history.
   b. The applicant should show that the problem reporting during the product service history provides assurance that representative data is available and that in -service problems were reported and recorded, and are retrievable.
   c. Configuration changes during the product service history should be identified and the effect analyzed to confirm the stability and maturity of the software. Uncontrolled changes to the Executable Object Code during the product service history may invalidate the use of product service history.
   d. The intended software usage should be analyzed to show the relevance of the product service history.
   e. If the operating environments of the existing and proposed applications differ, additional software verification should confirm compliance with the system safety objectives.
   f. The analysis of configuration changes and product service history environment may require the use of software requirements and design data to confirm the applicability of the product service history environment.
   g. If the software is a subset of the software that was active during the service period, then analysis should confirm the equivalency of the new environment with the previous environment, and determine those software components that were not executed during normal operation.

   Note: Additional verification may be needed to confirm compliance with the system safety objectives for those components.

   h. The problem report history should be analyzed to determine how safety-related problems occurred and which problems were corrected.
   i. Those problems that are indicative of an inadequate process, such as design or code errors, should be indicated separately from those whose cause are outside the scope of this document, such as hardware or system requirements errors.
   j. The data described above and these items should be specified in the Plan for Software Aspects of Certification:
      (1) Analysis of the relevance of the product service history environment.
      (2) Length of service period and rationale for calculating the number of hours in service, including factors such as operational modes, the number of independently operating copies in the installation and in service, and the definition of "normal operation" and "normal operation time."
      (3) Definition of what was counted as an error and rationale for that definition.
      (4) Proposed acceptable error rates and rationale for the product service history period in relation to the system safety and proposed error rates.
   k. If the error rate is greater than that identified in the plan, these errors should be analyzed and the analyses reviewed with the certification authority.
