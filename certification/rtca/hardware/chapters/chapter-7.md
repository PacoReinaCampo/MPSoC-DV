# CONFIGURATION MANAGEMENT PROCESS

The configuration management process is intended to provide the ability to consistently replicate the configuration item, regenerate the information if necessary and modify the configuration item in a controlled fashion if modification is necessary. This section describes the objectives for hardware configuration management and activities that support those objectives.

## Configuration Management Objectives

The objectives of the configuration management process are:

1. Configuration items are uniquely identified and documented.

2. Consistent and accurate replication of configuration items is ensured.

3. A controlled method of identifying and tracking modification to configuration items is provided.

## Configuration Management Activities

Guidance for the configuration management activities includes:

1. Configuration items should be uniquely identified, documented and controlled. This may include, but is not limited to, hardware, design representations of hardware, tools or other data items used for certification credit and baselines.

2. Baselines should be established.

3. Problems should be uniquely identified, tracked and reported.

4. Change control and traceability of changes should be maintained. This requires that life cycle data identified in the plans should be secure and retrievable.

5. Archiving, retrieval and release of configuration items should be controlled.

Various methods may be used to satisfy configuration management objectives and activities and the following paragraphs provide guidance on activities that may be used as an acceptable method.

### Configuration Identification

The purpose of the configuration identification activity is to label unambiguously each configuration item so that a basis is established for the control and reference of configuration items.

Guidance includes:

1. Configuration identification should be established for data items.

2. Configuration identification should be established for each configuration item, for each separately controlled component of a configuration item and for combinations of configuration items that make up a product consistent with the plans agreed to by the certification authority.

   Note: The detail to which components, such as ASICs, configured PLDs, printed circuit boards and black boxes, are identified is determined by the Configuration Management Plan.

3. Configuration identification should be established for COTS components and previously developed hardware items before they are used in a baseline.

4. Configuration identification should be established for each configuration item before it is used in a new baseline, referenced by other data items or used for product manufacturing.

### Baseline Establishment

The purpose of baseline establishment is to define a basis for further activities and allow reference to, control of and traceability between configuration items.

Guidance includes:

1. Baselines should be established for configuration items used for certification credit.

   Note: Intermediate baselines may be established to aid in controlling hardware activities.

2. Once a baseline is established it should be subject to change control procedures.

3. Change control guidance should be followed when developing a derivative baseline from an established baseline.

4. If in developing a new baseline, certification credit is sought for activities or data associated with design of a previous baseline, this new baseline should be traceable to the previous baseline from which it was derived.

   Note: The baseline may be a configuration item, a previously certified hardware item or a COTS component.

### Problem Reporting, Tracking and Corrective Action

The purpose of problem reporting, tracking and corrective action is to record problems and ensure correct disposition and resolution. Problems may include non-compliance with plans and standards, deficiencies of life cycle process outputs, anomalous behavior of products, and inadequacy or deficiency of tools and technology processes. Problem reporting should be implemented no later than the establishment of the baseline from which certification credit is to be obtained.

Guidance includes:

1. Each reported problem should be covered by a problem report.

2. Problem reporting should identify the configuration of the affected configuration items.

3. Problem reports that require corrective action should invoke the change control activity.

4. All closed problem reports should include a description of action taken to close the problem report including the completion of data item changes that were needed to implement a corrective action.

5. Not all problem reports have to be closed in order to obtain certification, however, all problem reports should be evaluated and those that are determined to have safety or certification impact should be closed.

6. The problem reporting system should track the status of problem reports, including their approval and disposition.

### Change Control

The purpose of the change control activity is to ensure the recording, evaluation, resolutionand approval of changes. Change control should be implemented in compliance with the configuration management plan and should be started no later than the establishment of the baseline from which certification credit is to be obtained.

Guidance includes:

1. Change control should preserve the integrity of the configuration items by providing protection against unauthorized change.

2. Change control should ensure that a change is assessed to determine whether or not the configuration identity needs to be updated.

3. Changes to configuration items under change control should be recorded, approved, and tracked. Approval authority is defined in the configuration management plan.

   Note 1: Problem reporting is related to change control, since resolution of a reported problem may result in changes to configuration items.

   Note 2: It is generally recognized that early implementation of change control assists the control and management of process activities.

4. Change control should ensure traceability of changes to the reason for the change.

5. Change control should ensure that the impact of the change is assessed to determine the effect of the change on the outputs of the processes and that the output data is updated.

   Note 1: Some or all of the activities of the processes may need to be repeated from the point at which their outputs are affected.

   Note 2: It should be recognized that a change to the manufacturing tools, technology processes or external components may impact the design.

6. Change control should ensure that feedback is provided to affected processes.

### Release, Archive and Retrieve

The purpose of the release activity is to place data items under configuration management control to ensure that only authorized data is used in other activities. The purpose of the archive and retrieve activity is to ensure that data items associated with the product can be retrieved in case of a need to duplicate, regenerate, re-test or modify the product.

Guidance includes:

1. Configuration items should be identified and released prior to use for manufacture and the authority for their release should be established.

2. Data items associated with the product should be retrievable from an approved source, such as the developing organization or company.

   Note: Change control data and problem report data are part of the data items.

3. Data retention procedures should be available to satisfy airworthiness requirements and enable modifications.

4. Procedures should be established to ensure the integrity of the stored data for as long as required by the certification authorities by:

   a. Ensuring that no unauthorized changes are made.

   b. Selecting storage media.

   c. Maintaining availability of stored data. For example, by exercising or refreshing archived data at a frequency compatible with the storage life of the medium.

   d. Ensuring that a single event that can cause irretrievable loss of archived data is unlikely. For example, by storing duplicate copies in physically separate archives.

## Data Control Categories

Two categories associated with the configuration management of data items are defined: hardware control category 1 (HC1) and hardware control category 2 (HC2). Specifying two categories allows a less stringent configuration control for certain data items. HC1 requires all configuration management activities to be performed while HC2 is less restrictive. Data items classified as HC2 are not expected to change incrementally, but will be superceded by new data.

Table 7-1 defines the configuration management activities that are to be performed under HC1 and HC2. For example, Table 7-1 shows that data items identified in Appendix A, Table A-1 as HC2 need to be retrievable but do not need to be released. Additionally, Table 7-1 shows that any HC1 data item will have a baseline.

Appendix A identifies the control category for each data item as a function of hardware design assurance level. For example, in Table A-1 , HC1 applies to hardware requirements for all assurance levels while HC2 applies to hardware review and analysis results for all assurance levels.
