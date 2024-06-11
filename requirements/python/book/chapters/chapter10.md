# FULL GRAMMAR SPECIFICATION

The full grammar specification for Python defines the syntax rules for the language. This specification is detailed and covers all aspects of Python syntax, including expressions, statements, and other language constructs. Below is an overview of key elements in Python's grammar specification, focusing on the main categories.

## TOKENS

Python source code consists of tokens. The lexical analysis phase breaks the source code into these tokens.

### Types of Tokens

1. **Identifiers**: Names for variables, functions, classes, etc.
    ```plaintext
    identifier ::= (letter|"_") (letter | digit | "_")*
    ```

2. **Keywords**: Reserved words with special meanings.
    ```plaintext
    keyword ::= "False" | "None" | "True" | "and" | "as" | "assert" | "async" | "await" | "break" | "class" | "continue" | "def" | "del" | "elif" | "else" | "except" | "finally" | "for" | "from" | "global" | "if" | "import" | "in" | "is" | "lambda" | "nonlocal" | "not" | "or" | "pass" | "raise" | "return" | "try" | "while" | "with" | "yield"
    ```

3. **Literals**: Fixed values, including strings, numbers, and more.
    ```plaintext
    literal ::= integer | floatnumber | imagnumber | stringliteral | bytesliteral | boolliteral | none
    ```

4. **Operators**: Symbols for operations.
    ```plaintext
    operator ::= "+" | "-" | "*" | "/" | "//" | "%" | "**" | "<<" | ">>" | "&" | "|" | "^" | "~" | ":=" | "<" | ">" | "<=" | ">=" | "==" | "!="
    ```

5. **Delimiters**: Punctuation characters.
    ```plaintext
    delimiter ::= "(" | ")" | "[" | "]" | "{" | "}" | "," | ":" | "." | ";" | "@" | "=" | "->" | "+=" | "-=" | "*=" | "/=" | "//=" | "%=" | "@=" | "&=" | "|=" | "^=" | ">>=" | "<<=" | "**="
    ```

## PROGRAM STRUCTURE

### Modules

A Python program is composed of modules. Each module is a file containing Python code.

```plaintext
file_input ::= (NEWLINE | stmt)* ENDMARKER
```

### Statements

Statements are the building blocks of a program.

I. Simple Statements

Simple statements are executed in a single line.

```plaintext
simple_stmt ::= (expr_stmt | assignment_stmt | assert_stmt | pass_stmt | del_stmt | return_stmt | yield_stmt | raise_stmt | break_stmt | continue_stmt | import_stmt | global_stmt | nonlocal_stmt) NEWLINE
```

- **Expression Statements**
    ```plaintext
    expr_stmt ::= testlist_star_expr (augassign (yield_expr|testlist) | ('=' (yield_expr|testlist_star_expr))*)
    ```

- **Assignment Statements**
    ```plaintext
    assignment_stmt ::= (target_list "=")+ (yield_expr | star_expr | test_list)
    ```

- **The `assert` Statement**
    ```plaintext
    assert_stmt ::= "assert" test ["," test]
    ```

- **The `pass` Statement**
    ```plaintext
    pass_stmt ::= "pass"
    ```

- **The `del` Statement**
    ```plaintext
    del_stmt ::= "del" target_list
    ```

- **The `return` Statement**
    ```plaintext
    return_stmt ::= "return" [test_list]
    ```

- **The `yield` Statement**
    ```plaintext
    yield_stmt ::= yield_expr
    ```

- **The `raise` Statement**
    ```plaintext
    raise_stmt ::= "raise" [test ["from" test]]
    ```

- **The `break` Statement**
    ```plaintext
    break_stmt ::= "break"
    ```

- **The `continue` Statement**
    ```plaintext
    continue_stmt ::= "continue"
    ```

- **The `import` Statement**
    ```plaintext
    import_stmt ::= import_name | import_from
    ```

- **The `global` Statement**
    ```plaintext
    global_stmt ::= "global" identifier ("," identifier)*
    ```

- **The `nonlocal` Statement**
    ```plaintext
    nonlocal_stmt ::= "nonlocal" identifier ("," identifier)*
    ```

II. Compound Statements

Compound statements contain groups of statements.

```plaintext
compound_stmt ::= if_stmt | while_stmt | for_stmt | try_stmt | with_stmt | funcdef | classdef | async_stmt
```

- **The `if` Statement**
    ```plaintext
    if_stmt ::= "if" test ":" suite ("elif" test ":" suite)* ["else" ":" suite]
    ```

- **The `while` Statement**
    ```plaintext
    while_stmt ::= "while" test ":" suite ["else" ":" suite]
    ```

- **The `for` Statement**
    ```plaintext
    for_stmt ::= "for" exprlist "in" testlist ":" suite ["else" ":" suite]
    ```

- **The `try` Statement**
    ```plaintext
    try_stmt ::= "try" ":" suite (except_clause ":" suite)+ ["else" ":" suite] ["finally" ":" suite] | "try" ":" suite "finally" ":" suite
    ```

- **The `with` Statement**
    ```plaintext
    with_stmt ::= "with" with_item ("," with_item)* ":" suite
    ```

- **Function Definitions**
    ```plaintext
    funcdef ::= "def" funcname "(" [parameter_list] ")" ["->" test] ":" suite
    ```

- **Class Definitions**
    ```plaintext
    classdef ::= "class" classname ["(" [arglist] ")"] ":" suite
    ```

- **Coroutines**
    ```plaintext
    async_stmt ::= "async" (funcdef | with_stmt | for_stmt)
    ```

## EXPRESSIONS

Expressions represent values or computations.

### Primary Expressions

Primary expressions are the most basic forms of expressions.

```plaintext
primary ::= identifier | literal | enclosure
```

### Unary and Binary Operations

Unary and binary operations combine one or more expressions.

```plaintext
unary_expr ::= "-" primary | "+" primary | "~" primary
binary_expr ::= primary (operator primary)+
```

### Comprehensions

Comprehensions provide a concise way to create lists, dictionaries, sets, and generators.

```plaintext
comp_for ::= "for" target_list "in" or_test [comp_iter]
```

### Lambdas

Lambdas are anonymous functions.

```plaintext
lambda_expr ::= "lambda" [parameter_list] ":" expression
```

## OTHER ELEMENTS

### Imports

Python allows importing of modules using the `import` and `from ... import` statements.

```plaintext
import_name ::= "import" dotted_as_names
import_from ::= "from" (".")* dotted_name "import" ("*" | "(" import_as_names ")" | import_as_names)
```

### Type Hints

Type hints provide optional type information for functions and variables.

```plaintext
funcdef ::= "def" funcname "(" [parameter_list] ")" ["->" test] ":" suite
```

### Async and Await

Async and await are used for asynchronous programming.

```plaintext
async_funcdef ::= "async" funcdef
await_expr ::= "await" primary
```

This is a high-level overview of Python's grammar specification. For a complete and detailed specification, refer to the official Python documentation or the [Python Language Reference](https://docs.python.org/3/reference/grammar.html). This resource provides an exhaustive list of grammar rules and their exact definitions used by the Python interpreter.
