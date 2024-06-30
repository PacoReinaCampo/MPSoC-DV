# EXCEPTIONS

## EXCEPTION DECLARATIONS

### Exception Declarations

Exception declarations in Ada define named exceptions that can be raised during program execution.

```ada
My_Exception : exception;
```

## EXCEPTION HANDLERS

### Exception Handlers

Exception handlers in Ada handle raised exceptions and specify actions to be taken upon exception occurrence.

```ada
begin
    -- Code that may raise exceptions
exception
    when Constraint_Error =>
        Put_Line("Constraint error occurred.");
    when others =>
        Put_Line("Other exception occurred.");
end;
```

## RAISE STATEMENTS AND RAISE EXPRESSIONS

### Raise Statements

Raise statements in Ada explicitly raise an exception.

```ada
raise My_Exception;
```

### Raise Expressions

Raise expressions in Ada allow raising an exception conditionally based on an expression.

```ada
raise My_Exception when X > 10;
```

## EXCEPTION HANDLING

### The Package Exceptions

The `Ada.Exceptions` package in Ada provides facilities for exception handling, including predefined exceptions and operations.

```ada
with Ada.Exceptions;
...
begin
    ...
exception
    when E : others =>
        Put_Line(Ada.Exceptions.Exception_Message(E));
end;
```

### Pragmas Assert and Assertion_Policy

Pragmas `Assert` and `Assertion_Policy` in Ada provide control over runtime checks and assertions.

```ada
pragma Assert (X > 0);  -- Assertion
```

### Example of Exception Handling

An example illustrating exception handling in Ada.

```ada
procedure Example is
    X : Integer := 0;
begin
    loop
        X := X + 1;
        if X > 10 then
            raise Constraint_Error;
        end if;
    end loop;
exception
    when Constraint_Error =>
        Put_Line("Constraint error occurred.");
    when others =>
        Put_Line("Other exception occurred.");
end Example;
```

## SUPPRESSING CHECKS

### Suppressing Checks

Ada allows suppressing certain runtime checks using pragmas for performance optimization.

```ada
pragma Suppress (All_Checks);
```

## EXCEPTIONS AND OPTIMIZATION

### Exceptions and Optimization

Handling exceptions in Ada can impact program performance, and optimization strategies can be used to manage these impacts.

```ada
pragma Optimize (Off);  -- Turn off optimizations
```

This manual outline covers the detailed aspects of exceptions in the Ada programming language, including exception declarations, exception handlers, raise statements and expressions, exception handling using the `Ada.Exceptions` package, pragmas `Assert` and `Assertion_Policy`, an example of exception handling, suppressing checks for optimization, and considerations for exceptions and optimization. Each section can be expanded with specific syntax rules, examples, and further details as needed.

