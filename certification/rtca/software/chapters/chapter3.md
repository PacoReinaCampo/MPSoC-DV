# SOFTWARE LIFE CYLCE

This section discusses the software life cycle processes, software life cycle definition, and transition criteria between software life cycle processes. The guidelines of this document do not prescribe a preferred software life cycles and interactions between them. The separation of the processes is not intended to imply a structure for the organization (s) that perform them, For each software product, the software life cycle (s) is constructed that includes these processes.

## Software Life Cycle Processes

The software life cycle processes are:

   - The software planning process that defines and coordinates the activities of the software development and integral processes for a project. Section 4 describes the software planning process.

   - The software development processes that produce the software product. These processes are the software requirements process, the software design process, the software coding process, and the integration process. Section 5 describes the software development processes.

   - The integral processes that ensure the correctness, control, and confidence of the software life cycle processes and their outputs. The integral processes are the software verification process, the software configuration management process, the software quality assurance process, and the certification liaison process. It is important to understand that the integral processes are performed concurrently with the software development processes throughout the software life cycle. Sections 6 through 9 describe the integral processes.

## Software Life Cycle Definition

A project defines one or more software life cycle (s) by choosing the activities for each process, specifying a sequence for the activities, and assigning responsibilities for the activities.

For a specific project, the sequencing of these processes is determined by attributes of the project, such as system functionality and complexity, software size and complexity, requirements stability, use of previously developed results, development strategies and hardware availability. The usual sequence through the software development processes is requirements, design, coding and integration.

Figure 3-1 illustrates the sequence of software development processes for several components of a single software product with different software life cycles. Component W implements a set of system requirements by developing the software requirements, using those requirements to define a software design, implementing that design into source code, and then integrating the component into the hardware. Component X illustrates the use of previously developed software used in a certified aircraft or engine. Component Y illustrates the use of a simple, partitioned function that can be coded directly from the software requirements. Component Z illustrates the use of a prototyping strategy. Usually, the goals of prototyping are to better understand the software requirements and to mitigate development and technical risks. The initial requirements are used as the basis to implement a prototype. This prototype is evaluated in an environment representative of the intended use of the system under development. Results of the evaluation are used to refine the requirements.

The processes of a software life cycle may be iterative, that is, entered and re-entered. The timing and degree of iteration varies due to the incremental development of system functions, complexity, requirements development, hardware availability, feedback to previous processes, and other attributes of the project.

The various parts of the selected software life cycle are tied together with a combination of incremental integration process and software verification process activities.

## Transition Criteria Between Processes

Transition criteria are used to determine whether a process may be entered or re-entered. Each software life cycle process performs activities on inputs to produce outputs. A process may produce feedback to other processes and receive feedback from others. Definition of feedback includes how information is recognized, controlled and resolved by the receiving process. An example of a feedback definition is problem reporting.

The transition criteria will depend on the planned sequence of software development processes and integral processes, and may be affected by the software level. Examples of transition criteria which may be chosen are: that the software verification process reviews have been performed; the input is an identified configuration item; and a traceability analysis has been completed for the input. Every input to a process need not be complete before that process can be initiated, if the transition criteria established for the process are satisfied. Guidance includes:

   a. If a process acts on partial inputs, subsequent inputs to the process should be examined to determine that the previous outputs of the software development and software verification processes are still valid.
