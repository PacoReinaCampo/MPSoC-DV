# ORGANIZATION

This section outlines how the document is structured, detailing the abstract, lexical, syntax, and semantic components of the language. It helps readers understand how the language is organized and how to interpret its different elements.

## ABSTRACT STRUCTURE

The abstract structure provides an overview of the main components and organizational principles of the language.

### Layers

The language might be organized into multiple layers, each serving a different purpose or abstraction level:
- **Core Layer:** The fundamental constructs and rules that form the basis of the language.
- **Application Layer:** Higher-level constructs built on top of the core layer, used for more complex operations or domain-specific functionalities.
- **Verification Layer:** Constructs specifically used for verification purposes, such as assertions and temporal logic.

### Flavors

Different "flavors" or variants of the language might be defined to cater to various use cases or target different domains. For example:
- **Formal Verification Flavor:** Tailored for rigorous, mathematical verification of properties.
- **Simulation Flavor:** Designed for use in simulation environments where certain pragmatic considerations might apply.

## LEXICAL STRUCTURE

The lexical structure defines the basic building blocks of the language, such as tokens, identifiers, keywords, and operators.

### Identifiers

Identifiers are names used to represent variables, functions, modules, etc. They must follow specific rules, such as:
- **Naming Conventions:** Allowed characters, case sensitivity, and length limits.
- **Scope:** Visibility and lifetime of identifiers within the code.

### Keywords

Keywords are reserved words that have special meanings in the language and cannot be used as identifiers. Examples include `if`, `else`, `while`, `assert`, etc.

### Operators

Operators are symbols that perform operations on variables and values. These include:
- **Arithmetic Operators:** +, -, *, /, etc.
- **Logical Operators:** &&, ||, !, etc.
- **Comparison Operators:** ==, !=, <, >, etc.

### Macros

Macros are predefined or user-defined instructions that expand into a set of instructions or expressions. They help in code reuse and simplification.

### Comments

Comments are non-executable parts of the code that provide explanations or annotations. They can be single-line or multi-line and are typically denoted by specific symbols like `//` for single-line comments and `/*...*/` for multi-line comments.

## SYNTAX

The syntax defines the rules for how valid statements and expressions are formed in the language.

### Conventions

Syntax conventions include the general rules and guidelines for writing code, such as:
- **Code Structure:** How to structure programs, including indentation and line breaks.
- **Statement Termination:** Rules for ending statements, such as using a semicolon.

### HDL Dependencies

For hardware description languages (HDLs), syntax might depend on specific HDL features or constructs, requiring certain conventions to be followed to integrate smoothly with HDLs like VHDL or Verilog.

## SEMANTICS

The semantics define the meaning of syntactically correct statements and expressions.

### Clocked vs Unclocked Evaluation

- **Clocked Evaluation:** Refers to operations or assertions that are synchronized with a clock signal, often used in sequential logic.
- **Unclocked Evaluation:** Refers to operations or assertions that are not dependent on a clock signal, often used in combinational logic.

### Safety vs Liveness Properties

- **Safety Properties:** Assert that "something bad" will never happen (e.g., a system never enters an unsafe state).
- **Liveness Properties:** Assert that "something good" will eventually happen (e.g., a request will eventually receive a response).

### Linear vs Branching Logic

- **Linear Logic:** Concerns properties that are evaluated over single execution paths or sequences of states.
- **Branching Logic:** Concerns properties that are evaluated over branching structures of possible execution paths, allowing for reasoning about multiple potential futures.

### Simple Subset

A simplified subset of the language that contains the core features and constructs, often used for educational purposes or as an entry point for beginners.

### Finite-Length vs Infinite-Length Behavior

- **Finite-Length Behavior:** Properties or evaluations that are concerned with finite sequences of states or operations.
- **Infinite-Length Behavior:** Properties or evaluations that are concerned with infinite sequences, often relevant in systems that are intended to run indefinitely.

### The Concept of Strength

In PSL, the concept of strength refers to the precedence and binding power of operators and constructs:
- **Strong Operators:** Bind more tightly and have higher precedence.
- **Weak Operators:** Bind less tightly and have lower precedence.

In summary, this organizational framework provides a comprehensive and structured way to define and understand the various components and aspects of a language like PSL, ensuring clarity and consistency in its application and interpretation.
