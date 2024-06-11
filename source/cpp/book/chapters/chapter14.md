# ALGORITHMS LIBRARY

The Algorithms library in C++ provides a comprehensive set of functions for performing various operations on sequences of elements, such as searching, sorting, and transforming. Let's explore two key features introduced in recent versions of C++:

## EXECUTION POLICIES (C++17)

Execution policies were introduced in C++17 to enable parallel execution of standard algorithms. They provide a mechanism for specifying the execution mode of algorithms, allowing developers to take advantage of parallelism when processing large datasets. There are three execution policies defined in C++17:

- **`std::execution::seq`**: Specifies sequential execution. Algorithms executed with this policy will run sequentially, without parallelization.
  
- **`std::execution::par`**: Specifies parallel execution. Algorithms executed with this policy may run in parallel, potentially speeding up computation on multi-core systems.
  
- **`std::execution::par_unseq`**: Specifies parallel execution with vectorization. Algorithms executed with this policy may run in parallel and vectorized, exploiting both parallelism and SIMD (Single Instruction, Multiple Data) capabilities of modern processors.

Execution policies provide a high-level interface for specifying the desired execution mode of algorithms, abstracting away the details of parallelization and allowing the implementation to choose the most efficient execution strategy based on the available hardware and workload.

## CONSTRAINED ALGORITHMS (C++20)

Constrained algorithms were introduced in C++20 to provide more expressive and flexible algorithms that can handle constrained ranges of elements. Constrained algorithms offer similar functionality to standard algorithms but operate only on elements that meet specific criteria or constraints. They are designed to work with ranges that satisfy certain requirements, such as being sorted or partitioned.

Constrained algorithms use the concepts introduced in the Ranges library to express requirements on ranges and elements, making them more composable and generic. They allow developers to write code that is both more expressive and efficient by leveraging the properties of constrained ranges.

Overall, the Algorithms library in C++ continues to evolve, introducing new features like execution policies and constrained algorithms to improve the expressiveness, efficiency, and parallelism of standard algorithms. These features enable developers to write more concise, readable, and performant code for processing sequences of elements in C++.
