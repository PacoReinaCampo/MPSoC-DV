# ADDITIONAL CONSIDERATIONS

This section provides guidance on additional considerations of design assurance that are not covered in the previous sections. These additional considerations may be used at the applicant’s discretion to satisfy some of the objectives of Section 2 through Section 9. Any use of additional considerations should be agreed with the certification authority.

## Use of Previously Developed Hardware

This section discusses the issues associated with the use of previously developed hardware. Guidance includes the assessment of modifications to the hardware, to the aircraft installation, to the application environment, or to the design environment and upgrading design baselines. Guidance for COTS component usage, a special case of previously developed hardware, is covered in Section 11.2. Configuration Management and Process Assurance considerations should also be addressed for each use of previously developed hardware.

The intention to use previously developed hardware should be stated in the PHAC.

### Modifications to Previously Developed Hardware

This section discusses modifications to previously developed hardware. Modification may result from requirement changes, the detection of errors, hardware or technology enhancements, or procurement difficulties.

Analysis activities for proposed modifications include:

1. Review of the outputs of the system safety assessment process.
2. Application of the guidance of Section 11.1.4 if the hardware design assurance level is increased.
3. The impact of changes should be analyzed, including the consequences of changes that may result in a re-verification effort involving more than the area changed. This area may be determined by signal flow analysis, functional analysis, timing analysis, traceability analysis or other suitable means.

### Change of Aircraft Installation

This section discusses the use in a new aircraft installation of hardware that has been previously certified at a certain hardware design assurance level and under a specific certification basis. When using previously developed hardware on new aircraft installations, the following guidance should be used:

1. The system safety assessment process assesses the new aircraft installation and determines the hardware design assurance level and the certification basis. No additional effort will be required if these are the same or less stringent for the new installation as they were in the previous installation.
2. If functional modifications are required for the new installation, the guidance of Section 11.1.1, Modifications to Previously Developed Hardware, should be satisfied.
3. If the previous design activity did not produce the outputs required to substantiate the safety objectives of the new installation, the guidance of Section 11.1.4, Upgrading A Design Baseline, should be satisfied.

### Change of Application or Design Environment

Use of previously developed hardware may involve a new design environment, or integration with other software or hardware than that used for the original application.

New design environments may increase or reduce some activities within the hardware design life cycle processes. Guidance includes:

1. If a new design environment uses hardware design tools, the guidance of Section 11.4, Tool Assessment and Qualification, may be applicable.
2. Verification of hardware interfaces should be conducted where previously developed hardware is used with different interfacing hardware.
3. The need for re-verification of hardware/software interfaces should be addressed when previously developed hardware uses different software.

### Upgrading a Design Baseline

The following guidance is for hardware items whose life cycle data from a previous application are determined to be deficient for the safety objectives associated with a new application. This guidance is intended to aid the applicant in obtaining agreement with the certification authority for hardware previously developed at a lower hardware design assurance level:

Guidance for upgrading a design baseline includes:

1. The objectives of this document should be satisfied, while taking advantage of life cycle data of the previous development.
2. Hardware aspects of certification should be based on the failure conditions and hardware design assurance levels as determined by the system safety assessment process. The impact of the changes to the previous application should be analyzed to determine areas of deficiency.
3. Life cycle data from a previous development should be evaluated to ensure that the verification process objectives are satisfied for the hardware that is planned for implementation of the upgraded function at the required hardware design assurance level.
4. Reverse engineering may be used to regenerate hardware life cycle data that is deficient or missing to satisfy the design assurance objectives of this document
5. If use of product service experience is planned to satisfy the design assurance objectives of this document in upgrading a design baseline, the guidance of Section 11.3, Product Service Experience, should be addressed.
6. The applicant should specify the strategy for accomplishing compliance with this document in the PHAC.

### Additional Configuration Management Considerations

The configuration management process for the new application of previously developed hardware should include, in addition to the guidance of Section 7:

1. Traceability from the hardware product and life cycle data of the previous application to the new application.
2. Change control processes that can manage change requests from different applications of the common item.

## Commercial-Off-The-Shelf (COTS) Components Usage

COTS components are used extensively in hardware designs and typically the COTS components design data is not available for review. The certification process does not specifically address individual components, modules, or subassemblies, as these are covered as part of the specific aircraft function being certified. As such, the use of COTS components will be verified through the overall design process, including the supporting processes, as defined in this document. The use of an electronic component management process, in conjunction with the design process, provides the basis for COTS components usage.

### Electronic Component Management for COTS Components

Electronic component management for COTS components is an important supporting process associated with the design and development of hardware. The processes of electronic component management apply to COTS electronic components. While there are both business and technical aspects of this process, this section only deals with the technical aspects as they impact certification.

Certification credit may be gained by establishing that:

1. The component manufacturer can demonstrate a track record for production of high quality components.
2. Quality control procedures are established at the component manufacturer.
3. There is service experience supporting the successful operation of the component.
4. The component has been qualified by the manufacturer or by means of additional testing, which establish the component reliability.
5. The component manufacturer has control of the component quality level or that this is assured by means of additional component testing.
6. The components have been selected on the basis of technical suitability of the intended application, such as component temperature range, power or voltage rating, or that additional testing or other means has been used to establish these.
7. The component performance and reliability are monitored on a continuous basis, with feedback to component manufacturers concerning areas that need improvement.

### COTS Component Procurement

COTS component procurement guidance is not the intent of this document but feedback of procurement issues should be managed and resolved by the applicant when they have significant impacts on hardware design assurance.

Major concerns include:

1. Actual availability of COTS component design assurance data as required by this document.
2. Variations in component parameters that depend on production batches may not be identified, even by robustness tests.
3. Evolving aspects of electronic component technology.
4. COTS components which become non-procurable.

## Product Service Experience

Service experience may be used to substantiate design assurance for previously developed hardware and for COTS components. Service experience relates to data collected from any previous or current usage of the component. Data from non-airborne applications is not excluded.

Note: Wide and successful use of an item in service may provide confidence that the item’s design is mature and free of errors and that the manufacturing quality of the item is demonstrated.

### Product Service Experience Data Acceptability Criteria

When service experience data is used for design assurance, the relevance and acceptability of the service experience data depends on one or more of the following:

1. Similarity of hardware item usage with respect to application, function, operating environment and design assurance level.
2. Extent to which the design assurance data is based on the proposed configuration of the hardware item.
3. Extent to which the design errors found during the service period being assessed have been eliminated, mitigated, or analyzed and determined to have no safety impact in the configuration to be used.
4. Actual failure rates in operation.

   Note: The PHAC should specifically address those aspects where the design assurance of parts of an application relies on service experience data.

### Assessment of Product Service Experience Data

To satisfy the above criteria the applicant should:

1. Assess the relevance of previous applications, installations and environments to the target application, based upon engineering analysis.

   Note: Data used to determine appropriateness of use and usage limitations may be available in specifications, data sheets, application notes, service bulletins, user correspondence and errata notices. These sources of information may also describe the functions associated with the hardware item, so the airborne intended use can be correlated to previous uses.

2. Assess the intended usage for impacts on the safety assessment process, including possible mitigation of the effects of design errors identified by the data.

3. Assess any available statistics on design errors and their impact on the safety assessment process. A qualitative assessment can be used if statistics are not available.

4. Assess available problem reports. Problem reports may show that service experience has led to improvements now available in the current configuration. Problems identified but not fixed may still be mitigated by architectural means or by performing additional verification. Establish or assess the relationships between problem reports and hardware item or product requirement changes.

   Note: For electronic components, substantial service usage may increase the likelihood that errors have been detected and eliminated or that temporary "fixes" are available.

### Product Service Experience Assessment Data

Service experience assessment data used to substantiate the design assurance for the proposed application should include:

1. Identification of the component and its intended function in the airborne system. Identify the design assurance level, or for components used in Level A and B functions, a description of additional means of assurance for the component, such as architectural means and additional or advanced verification strategies to be applied.
2. A description of the service experience data collection and assessment process, including criteria for determining the adequacy and validity of the data.
3. The service experience data, including the detailed service information being considered, change history, assumptions used to analyze the service experience data and a summary of the analysis results.
4. Justification for the adequacy of the service experience data relative to the intended use and required design assurance level.

## Tool Assessment and Qualification

Tools, both hardware and software, will normally be used during hardware design and verification. When design tools are used to generate the hardware item or the hardware design, an error in the tool could introduce an error in the hardware item. When verification tools are used to verify the hardware item, an error in the tool may cause the tool to fail to detect an error in the hardware item or hardware design. Prior to the use of a tool, a tool assessment should be performed. The results of this assessment and, if necessary, tool qualification should be recorded and maintained.

The purpose of tool assessment and qualification is to ensure that the tool is capable of performing the particular design or verification activity to an acceptable level of confidence for which the tool will be used.

### Tool Assessment and Qualification Process

Tool assessment assesses the role of the tool in a design life cycle process and may include qualification activities to be performed depending on the role of the tool and design assurance level of the hardware function. This assessment guidance is presented as a flowchart and applies to both design tools and verification tools when used to meet objectives or generate data items to satisfy those objectives. The flowchart will lead the applicant to limited appraisal of some categories of tools and to tool qualification of others.

The tool assessment and qualification process may be applied to either a single tool or a collection of tools. Tools often contain capabilities beyond those needed for a specific design or verification activity on any specific project. It is only necessary to assess those functions of the tool used for a specific hardware life cycle activity, not the entire tool.

It is recognized that tools are often integrated and shared during the various life-cycle phases. If the same tool is used during both the design and the verification phase, then the tool may need to be assessed as a design tool unless separation of and protection between the two functions can be established.

Note 1: If the assessment of a given tool indicates that some of its functions are used for design but other functions are used for verification, it may be worthwhile to address the functions separately and perform the assessment for each group of the tool’s assessed functions.

Note 2: This assessment activity focuses as much or more on the application of the tool as the tool itself.

The flow chart of Figure 11-1 indicates the tool assessment considerations and activities and provides guidance for when tool qualification may be necessary. The numbers in the decision and activity blocks refer to the numbered items following the figure that provide further clarification of the decision or activity.

Figure 11-1 Design and Verification Tool Assessment and Qualification

1. Identify the Tool. Includes the name, source, version number and the host environment on which it is based. Tool updates should be documented and tracked.

   Note: When updating a tool, assess the potential impacts of tool updates on existing results and on the remaining life cycle of the hardware.

2. Identify the Process the Tool Supports. Identify the design or verification process that the tool supports, any relevant limitations of the tool and the outputs it produces for use in the hardware design life cycle. If certain problems are known to exist with the tool, provide a statement of acceptability for use of the tool with justification.

3. Is the Tool Output Independently Assessed? An independent assessment verifies the correctness of the tool output using an independent means. If the tool output is independently assessed, then no further assessment is necessary.

   Note: Independent assessment of a design tool’s output that is generated in whole or in part by the tool may be established by the verification activities performed on the item, such as component, netlist or assembly. In this case, the integrity of the end item does not depend upon the correctness of the design tool output alone.

   Independent assessment of a verification tool’s output may include a manual review of the tool outputs or may include a comparison against the outputs of a separate tool capable of performing the same verification activity as the tool being assessed.

   The applicant may propose other methods of independent assessment as well.

4. Is the Tool a Level A, B or C Design Tool or a Level A or B Verification Tool? If the tool is used for Level D functions, as a verification tool for Level C functions, or used to assess the completion of verification testing, such as in an elemental analysis as described in Appendix B, Section 3.3.1.1.2, no further assessment is necessary. If the tool is used as a design tool for hardware implementing a Level A, B or C function or is used as a verification tool for hardware implementing a Level A or B function, then further assessment is needed.

5. Does the Tool have Relevant History? When it is possible to show that the tool has been previously used and has been found to produce acceptable results, then no further assessment is necessary. A discussion of the relevance of the previous tool usage versus the proposed usage of the tool should be included in the justification.

   Note: The history of the tool may be based on either an airborne or non-airborne application, provided that data is available to substantiate the relevance and credibility of the tool’s history.

6. Establish Baseline and Problem Reporting for Tool Qualification. Establish a baseline for tool configuration management and tool problem reporting to prepare for tool qualification.

7. Basic Tool Qualification. Establish and execute a plan to confirm that the tool produces correct outputs for its intended application using analysis or testing. The tool’s user guide or other description of the tool’s function and its use may be used to generate requirements.

8. Type of Tool and Level? Is the tool being considered a Level A or B hardware design tool or a Level C hardware design tool or a Level A or Level B hardware verification tool?

9. Design Tool Qualification. Qualify the Level A or B design tool using the strategies described in Appendix B of this document, the tool qualification guidance of RTCA DO-178B / EUROCAE ED-12B for software development tools or other means acceptable to the certification authority. Independence of this activity from the tool development should also be established.

   Note: Specific guidance for Level A and B design tool qualification is not provided here because of the variability of the circumstances of the tool usage, technology involved, visibility of the tool’s implementation and life cycle data, and other factors. Using such a design tool without independent assessment of the tool’s output or establishing relevant history is discouraged, as it may prove to be a task as challenging as the development of the hardware for which the tool is proposed to be used.

10. Complete. Document the tool assessment, justification for the assessment decisions, and if applicable, tool qualification data. Provide specific references to installation guides, user manuals and tool qualification data, as necessary to support the tool assignment and qualification.

### Tool Assessment and Qualification Data

The tool assessment and qualification data should include:

1. Identify the tool, the process it supports and, when applicable, the following items:

   a. The rationale and results of the independent assessment per item 3 of Figure 11-1.

   b. The tool designation per item 4 of Figure 11-1.

   c. The tool’s history when being used to satisfy item 5 of Figure 11-1. A discussion of the relevance of the previous tool usage versus the proposed usage of the tool should be included in the justification.

2. An unambiguous configuration definition to be used in tool qualification, in compliance with item 6 of Figure 11-1 , and a justification for the applicability of the tested configuration if it differs from that actually used to design or verify the end hardware item.

3. Details of tool qualification, including the requirements used in testing, the test procedures, expected results, analysis procedures used to interpret and supplement the test results, and how independence is established.

4. The plan for qualifying a design tool, including the applicable procedures, and results for any activities identified in the plan.

5. The disposition of known tool errata, including workarounds, and, when applicable, problem reports generated as a result of tool qualification.
