# PLAN (PLAN)

In DevOps, the "PLAN" phase refers to the initial stage where teams strategize and plan out their development and deployment processes. This phase is crucial for setting the foundation of a successful DevOps workflow. Here's a breakdown of what typically happens during the PLAN phase:

1. **Requirements Gathering**: The team gathers requirements from stakeholders, including business goals, user needs, and technical specifications. These requirements serve as the basis for the development process.

2. **Infrastructure Planning**: DevOps involves not only code but also infrastructure as code (IaC). Teams plan out the necessary infrastructure resources, such as servers, databases, and networking components, needed to support the application.

3. **Tool Selection**: DevOps relies heavily on automation and tooling to streamline processes. During the planning phase, teams select the appropriate tools for version control, continuous integration, continuous delivery/deployment, monitoring, and other aspects of the DevOps pipeline.

4. **Workflow Design**: Teams design the workflow that will guide the development and deployment process. This includes defining branching strategies for version control, establishing testing protocols, deciding on deployment strategies (e.g., blue-green deployments, canary releases), and creating rollback plans.

5. **Risk Assessment**: Identifying potential risks and challenges early on is essential for effective planning. Teams assess risks related to technology, resource availability, dependencies, and compliance requirements. Strategies for mitigating these risks are developed as part of the plan.

6. **Timeline and Milestones**: Establishing a timeline with clear milestones helps keep the development process on track. Teams set deadlines for completing specific tasks, such as feature development, testing phases, and deployment milestones.

7. **Communication Plan**: Effective communication is key to successful DevOps implementation. Teams establish communication channels, protocols, and meeting schedules to ensure that all team members are informed and aligned throughout the development and deployment process.

By thoroughly planning and strategizing in the initial phase, teams can lay a solid foundation for the rest of the DevOps lifecycle, enabling smoother development, faster delivery, and higher-quality software products.

![DevOps Toolchain](assets/chapter1/devops-toolchain.svg){width=6cm}

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* Hardware Project Workflow

![Hardware Project Workflow](assets/chapter1/hardware-project.svg)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

* Software Project Workflow

![Software Project Workflow](assets/chapter1/software-project.svg)

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

| CONTROL       | DEVELOP      | OPERATION   |
|:--------------|:-------------|:------------|
| certification | model        | sim         |
| doc           | validation   | compilation |
| quality       | rtl/src      | synthesis   |
| requirements  | source       |             |
|               | verification |             |
: Hardware DevOps

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

| FOLDER        | NORMATIVE            | TECHNOLOGY    |
|--------------:|:---------------------|:--------------|
| requirements  | IEEE STD 1850-2010   | PSL           |
|               | OMG-2.5.1.           | UML           |
| certification | RTCA DO-254          | Hardware      |
|               | RTCA DO-178C         | Software      |
| quality       | ISO 9001-2015        | Management    |
| doc           | IEEE STD 1685-2014   | IP-XACT       |
|               | IEEE STD 1735-2014   | IP-Manager    |
|               | IEEE STD 1801-2013   | Low Power     |
|               | IEEE STD 754-2019    | Float Point   |
|               | IEEE STD 1754-1994   | RISC 32 Bit   |
| source        | IEEE STD 1666-2011   | SystemC       |
| model         | IEEE STD 1076-2019   | VHDL          |
|               | IEEE STD 1800-2017   | SystemVerilog |
| validation    | IEEE STD 1076-2019   | OSVVM         |
| rtl/src       | IEEE STD 1076-2019   | VHDL          |
|               | IEEE STD 1364-2005   | Verilog       |
| verification  | IEEE STD 1800.2-2020 | UVM           |
| lifecycle     | IEEE STD 2675-2021   | DevOps        |
: Project Folder

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## REQUIREMENTS

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### Matlab Language

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### Python Language

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### PSL Language

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### UML Language

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## QUALITY ASSURANCE

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### Ada Language

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## CERTIFICATION

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## DESIGN LIFECYCLE DATA

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### Hardware

* Data Required for the Hardware Planning
  * Hardware Configuration Management Plan
  * Hardware Design Plan
  * Hardware Process Assurance Plan
  * Hardware Process Assurance Records
  * Hardware Requirements Design HDL Code Validation and Verification and Archive Standards
  * Hardware Validation Plan
  * Hardware Verification Plan
  * Plan for Hardware Aspects of Certification
  * Supplier Management Plan
  * Tool Qualification Plans

* Data Required for the Hardware Development
  * Hardware Configuration Management Records
  * Hardware Design Data
  * Hardware Design Schematics
  * Hardware Life Cycle Environment Configuration Index
  * Hardware Process Assurance Records
  * Hardware Requirements
  * Hardware Requirements Design and HDL Code Standards
  * Hardware Review and Analysis Procedures
  * Hardware Review and Analysis Results
  * Hardware Tool Qualification Data
  * Hardware Traceability Data
  * HDL
  * Problem Reports

* Data Required for the Hardware Verification
  * Hardware Configuration Management Records
  * Hardware Design Representation Data
  * Hardware Design Schematics
  * Hardware Life Cycle Environment Configuration Index
  * Hardware Process Assurance Records
  * Hardware Requirements Data
  * Hardware Tool Qualification Data
  * Hardware Verification Procedures
  * Hardware Verification Results
  * HDL
  * Problem Reports

* Data Required for the Final Certification Hardware
  * Hardware Accomplishment Summary
  * Hardware Configuration Index
  * Hardware Configuration Management Records
  * Hardware Life Cycle Environment Configuration Index
  * Hardware Process Assurance Records
  * Hardware Verification Results
  * Problem Reports

### Software

* Data Required for the Software Planning
  * Software Configuration Management Plan
  * Software Design Plan
  * Software Process Assurance Plan
  * Software Process Assurance Records
  * Software Requirements Design HDL Code Validation and Verification and Archive Standards
  * Software Validation Plan
  * Software Verification Plan
  * Plan for Software Aspects of Certification
  * Supplier Management Plan
  * Tool Qualification Plans

* Data Required for the Software Development
  * Software Configuration Management Records
  * Software Design Data
  * Software Design Schematics
  * Software Life Cycle Environment Configuration Index
  * Software Process Assurance Records
  * Software Requirements
  * Software Requirements Design and HDL Code Standards
  * Software Review and Analysis Procedures
  * Software Review and Analysis Results
  * Software Tool Qualification Data
  * Software Traceability Data
  * HDL
  * Problem Reports

* Data Required for the Software Verification
  * Software Configuration Management Records
  * Software Design Representation Data
  * Software Design Schematics
  * Software Life Cycle Environment Configuration Index
  * Software Process Assurance Records
  * Software Requirements Data
  * Software Tool Qualification Data
  * Software Verification Procedures
  * Software Verification Results
  * HDL
  * Problem Reports

* Data Required for the Final Certification Software
  * Software Accomplishment Summary
  * Software Configuration Index
  * Software Configuration Management Records
  * Software Life Cycle Environment Configuration Index
  * Software Process Assurance Records
  * Software Verification Results
  * Problem Reports
