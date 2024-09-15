# SUBPROGRAMS

## SUBPROGRAM DECLARATIONS

### Preconditions and Postconditions

Subprogram declarations in Ada specify interfaces for procedures and functions, including preconditions and postconditions.

```ada
procedure Initialize (X : in out Integer) with
  Pre => X >= 0,
  Post => X > 0;
```

Preconditions (`Pre`) specify conditions that must be true before entering the subprogram. Postconditions (`Post`) specify conditions that must be true upon exiting the subprogram.

## FORMAL PARAMETER MODES

Formal parameter modes in Ada specify how parameters are passed into and out of subprograms.

   * **in**: Passes data into the subprogram without allowing modifications.
   * **out**: Passes data out of the subprogram without requiring initial values.
   * **in out**: Allows both passing data into and out of the subprogram.

```ada
procedure Swap (A, B : in out Integer);
```

## SUBPROGRAM BODIES

### Conformance Rules

Subprogram bodies in Ada implement the functionality specified in the declaration. They must conform to the interface defined by the declaration, including parameter modes, types, and constraints.

```ada
procedure Swap (A, B : in out Integer) is
    Temp : Integer;
begin
    Temp := A;
    A := B;
    B := Temp;
end Swap;
```

### Inline Expansion of Subprograms

Ada compilers may inline expand subprograms for performance optimization if specified or if deemed appropriate by the compiler.

## SUBPROGRAM CALLS

Subprogram calls in Ada invoke procedures or functions with specified parameter associations.

```ada
Swap (X, Y);
```

### Parameter Associations

Parameter associations in Ada specify how actual parameters are mapped to formal parameters in subprogram calls.

```ada
procedure Print_Sum (A, B : Integer) is
begin
    Put_Line(Integer'Image(A + B));
end Print_Sum;

Print_Sum(A => 10, B => 20);
```

## RETURN STATEMENTS

Return statements in Ada specify values returned by functions or terminate procedures.

```ada
function Add (A, B : Integer) return Integer is
begin
    return A + B;
end Add;
```

### Nonreturning Procedures

Procedures in Ada may be specified as nonreturning using `pragma Convention (Convention => No_Return);` to indicate they do not return a value.

## OVERLOADING OF OPERATORS

Ada supports overloading operators for user-defined types, allowing custom behavior for standard operators like `+`, `-`, `*`, etc.

```ada
function "+" (Left, Right : Vector) return Vector is
begin
    return (X => Left.X + Right.X, Y => Left.Y + Right.Y);
end "+";
```

## NULL PROCEDURES

Null procedures in Ada are placeholders with an empty body. They can be used for deferred implementation.

```ada
procedure Process is
begin
    null; -- Placeholder for future implementation
end Process;
```

## EXPRESSION FUNCTIONS

Expression functions in Ada are functions that return values computed from expressions.

```ada
function Square (X : Integer) return Integer is
begin
    return X * X;
end Square;
```

This manual outline covers the detailed aspects of subprograms in the Ada programming language, including subprogram declarations, formal parameter modes, subprogram bodies, subprogram calls, return statements, overloading of operators, null procedures, and expression functions. Each section can be expanded with specific syntax rules, examples, and further details as needed.

