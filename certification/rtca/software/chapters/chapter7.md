# SOFTWARE CONFIGURATION MANAGEMENT PROCESS

This section discusses the objectives and activities of the software configuration management (SCM process. The SCM process is applied as defined by the software planning process (section 4) and the Software Configuration Management Plan (subsection 11.4). Outputs of the SCM process are recorded in Software Configuration Management Records (subsection 11.18) or in other software life cycle data.

Table A-8 of Annex A is a summary of the objectives and outputs of the SCM process.

## Software Configuration Management Process Objectives

The SCM process, working in cooperation with the other software life cycle processes, assists in satisfying general objectives to:

   a. Provide a defined and controlled configuration of the software throughout the software life cycle.

   b. Provide the ability to consistently replicate the Executable Object Code for software manufacture or to regenerate it in case of a need for investigation or modification.

   c. Provide control of process inputs and outputs during the software life cycle that ensures consistency and repeatability of process activities.

   d. Provide a known point for review, assessing status, and change control by control of configuration items and the establishment of baselines.

   e. Provide controls that ensure problems receive attention and changes are recorded, approved, and implemented.

   f. Provide evidence of approval of the software by control of the outputs of the software life cycle processes.

   g. Aid the assessment of the software product compliance with requirements.

   h. Ensure that secure physical archiving, recovery and control are maintained for the configuration items. The objectives for SCM are independent of software level. However, two categories of software life cycle data may exist based on the SCM controls applied to the data (subsection 7.3).

## Software Configuration Management Process Activities

The SCM process includes the activities of configuration identification, change control, baseline establishment, and archiving of the software product, including the related software life cycle data. The following guidelines define the objectives for each SCM process activity. The SCM process does not stop when the software product is accepted by the certification authority, but continues throughout the service life of the airborne system or equipment.

### Configuration Identification.

The objective of the configuration identification activity is to label unambiguously each configuration item (and its successive versions) so that a basis is established for the control and reference of configuration items. Guidance includes:

   a. Configuration identification should be established for the software life cycle data.

   b. Configuration identification should be established for each configuration item, for each separately controlled component of a configuration item, and for combinations of configuration items that comprise a software product.

   c. Configuration items should be configuration-identified prior to the implementation of change control and traceability data recording.

   d. A configuration item should be configuration-identified before that item is used by other software life cycle processes, referenced by other software life cycle data, or used for software manufacture or software loading.

   e. If the software product identification cannot be determined by physical examination (for example, part number plate examination), then the Executable Object Code should contain configuration identification which can be accessed by other parts of the airborne system or equipment. This may be applicable for field-loadable software (subsection 2.5).

### Baselines and Traceability

The objective of baseline establishment is to define a basis for further software life cycle process activity and allow reference to. control of, and traceability between configuration items. Guidance includes:

   a. Baselines should be established for configuration items used for certification credit. (Intermediate baselines may be established to aid in controlling software life cycle process activities.)

   b. A software product baseline should be established for the software product and defined in the Software Configuration Index (subsection II. 16).

   Note: User-modifiable software is not included in the software product baseline, except for its associated protection and boundary components. Therefore, modifications may be made to user-modifiable software without affecting the configuration identification of the software product baseline.

   c. Baselines should be established in controlled software libraries (physical, electronic, or other) to ensure their integrity. Once a baseline is established, it should be protected from change.

   d. Change control activities should be followed to develop a derivative baseline from an established baseline.

   e. A baseline should be traceable to the baseline from which it was derived, if certification credit is sought for software life cycle process activities or data associated with the development of the previous baseline.

   f. A configuration item should be traceable to the configuration item from which it was derived, if certification credit is sought for software life cycle process activities or data associated with the development of the previous configuration item.

   g. A baseline or configuration item should be traceable either to the output it identifies or to the process with which it is associated.

### Problem Reporting, Tracking and Corrective Action

The objective of problem reporting, tracking and corrective action is to record process non-compliance with software plans and standards, to record deficiencies of outputs of software life cycle processes, to record anomalous behavior of software products, and to ensure resolution of these problems.

Note: Software life cycle process and software product problems may be recorded in separate problem reporting systems.

Guidance includes:

   a. A problem report should be prepared that describes the process non-compliance with plans, output deficiency, or software anomalous behavior, and the corrective action taken, as defined in subsection 11.17.

   b. Problem reporting should provide for configuration identification of affected configuration item(s) or definition of affected process activities, status reporting of problem reports, and approval and closure of problem reports.

   c. Problem reports that require corrective action of the software product or outputs of software life cycle processes should invoke the change control activity.

   Note: The problem reporting and change control activities are related.

### Change Control.

The objective of the change control activity is to provide for recording, evaluation, resolution and approval of changes throughout the software life cycle. Guidance includes:

   a. Change control should preserve the integrity of the configuration items and baselines by providing protection against their change.

   b. Change control should ensure that any change to a configuration item requires a change to its configuration identification.

   c. Changes to baselines and to configuration items under change control should be recorded, approved, and tracked. Problem reporting is related to change control, since resolution of a reported problem may result in changes to configuration items or baselines. Note: It is generally recognized that early implementation of change control assists the control and management of software life cycle process activities.

   d. Software changes should be traced to their origin and the software life cycle processes repeated from the point at which the change affects their outputs. For example, an error discovered at hardware/software integration, that is shown to result from an incorrect design, should result in design correction, code correction and repetition of the associated integral process activities.

   e. Throughout the change activity, software life cycle data affected by the change should be updated and records should be maintained for the change control activity. The change control activity is aided by the change review activity.

### Change Review.

The objective of the change review activity is to ensure problems and changes are assessed, approved or disapproved, approved changes are implemented, and feedback is provided to affected processes through problem reporting and change control methods defined during the software planning process. The change review activity should include:

   a. Confirmation that affected configuration items are configuration identified.

   b. Assessment of the impact on safety-related requirements with feedback to the system safety assessment process.

   c. Assessment of the problem or change, with decisions for action to be taken.

   d. Feedback of problem report or change impact and decisions to affected processes.

### Configuration Status Accounting

The objective of the status accounting activity is to provide data for the configuration management of software life cycle processes with respect to configuration identification, baselines, problem reports, and change control. The status accounting activity should include:

   a. Reporting on configuration item identification, baseline identification, problem report status, change history, and release status.

   b. Definition of the data to be maintained and the means of recording and reporting status of this data.

### A rchive, Retrieval and Release

The objective of the archive and retrieval activity is to ensure that the software life cycle data associated with the software product can be retrieved in case of a need to duplicate, regenerate, retest or modify the software product. The objective of the release activity is to ensure that only authorized software is used, especially for software manufacturing, in addition to being archived and retrievable. Guidance includes:

   a. Software life cycle data associated with the software product should be retrievable from the approved source (for example, the developing organization or company).

   b. Procedures should be established to ensure the integrity of the stored data (regardless of medium of storage) by:

      (1) Ensuring that no unauthorized changes can be made.

      (2) Selecting storage media that minimize regeneration errors or deterioration.

      (3) Exercising and/or refreshing archived data at a frequency compatible with the storage life of the medium.

      (4) Storing duplicate copies in physically separate archives that minimize the risk of loss in the event of a disaster.

   c. The duplication process should be verified to produce accurate copies, and procedures should exist that ensure error-free copying of the Executable Object Code.

   d. Configuration items should be identified and released prior to use for software manufacture and the authority for their release should be established. As a minimum, the components of the software product loaded into the airborne system or equipment (which includes the Executable Object Code and may also include associated media for software loading) should be released. Note: Release is generally also required for the data that defines the approved software for loading into the airborne system or equipment. Definition of that data is outside the scope of this document, but may include the Software Configuration Index.

   e. Data retention procedures should be established to satisfy airworthiness requirements and enable software modifications.

   Note: Additional data retention considerations may include items such as business needs and future certification authority reviews, which are outside the scope of this document.

### Software Load Control

The objective of the software load control activity is to ensure that the Executable Object Code is loaded into the airborne system or equipment with appropriate safeguards. Software load control refers to the process by which programmed instructions and data are transferred from a master memory device into the airborne system or equipment. For example, methods may include (subject to approval by the certification authority) the installation of factory per-programmed memory devices or in situ re-programming of the airborne system or equipment using a field loading device. Whichever method is used, software load control should include:

   a. Procedures for part numbering and media identification that identify software configurations that are intended to be approved for loading into the airborne system or equipment.

   b. Whether the software is delivered as an end item or is delivered installed in the airborne system or equipment, records should be kept that confirm software compatibility with the airborne system or equipment hardware.

   Note: Additional guidance on software load control is provided in subsection 2.5.

### Software Life Cycle Environment Control

The objective of software fife cycle environment control is to ensure that the tools used to produce the software are identified, controlled, and retrievable. The software life cycle environment tools are defined by the software planning process and identified in the Software Life Cycle Environment Configuration Index (subsection 11.15). Guidance includes:

   a. Configuration identification should be established for the Executable Object Code (or equivalent) of the tools used to develop, control, build, verify, and load the software.

   b. The SCM process for controlling qualified tools, should comply with the objectives associated with Control Category I or 2 data (subsection 7.3), as specified in paragraph 12.2.3, item b.

   c. Unless 7.2.9 item b applies, the SCM process for controlling the Executable Object Code (or equivalent) of tools used to build and load the software (for example, compilers, assemblers, linkage editors) should comply with the objectives associated with Control Category 2 data, as a minimum.

## Data Control Categories

Software life cycle data can be assigned to one of two categories: Control Category 1 (CC1) and Control Category 2 (CC2). These categories are related to the configuration management controls placed on the data. Table 7-1 defines the set of SCM process objectives associated with each control category, where · indicates that the objectives apply for software life cycle data of that category.

The tables of Annex A specify the control category for each software life cycle data item, by software level. Guidance for data control categories includes:

   a. The SCM process objectives for software life cycle data categorized as CC should be applied according to Table 7-1.

   b. The SCM process objectives for software life cycle data categorized as C should be applied according to Table 7-1 as a minimum.
