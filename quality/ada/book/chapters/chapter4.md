# NAMES AND EXPRESSIONS

## NAMES

### Indexed Components

Indexed components in Ada access elements of arrays or other indexed structures using square brackets (`[]`).

```ada
Array_Name(Index);
```

### Slices
Slices in Ada represent contiguous segments of arrays or strings.

```ada
Array_Name(First_Index .. Last_Index);
```

### Selected Components

Selected components in Ada access components of records or components of objects accessed through access types.

```ada
Record_Name.Component_Name;
```

### Attributes

Attributes in Ada provide information about types, objects, and program units. They are accessed using `'`.

```ada
Integer'Max;
```

### User-Defined References

User-defined references in Ada allow accessing elements or properties through user-defined types or access types.

```ada
type My_Array is array(1 .. 10) of Integer;
My_Array_Ref.Element(Index);
```

### User-Defined Indexing

User-defined indexing in Ada allows defining custom indexing operations for types.

```ada
type My_Index_Type is range 1 .. 10;
type My_Array is array(My_Index_Type) of Integer;
My_Array(My_Index);
```

## LITERALS

Literals in Ada are constant values used directly in expressions.

### Numeric Literals

```ada
123, 3.14, 16#1A#, 2#1010#  -- Decimal, Floating-point, Hexadecimal, Binary
```

### Character Literals

```ada
'A', '%', '\n'  -- Single characters, including special characters
```

### String Literals

```ada
"Hello, World!", "Ada"  -- Sequences of characters
```

## AGGREGATES

### Record Aggregates

Record aggregates in Ada initialize records with specified values.

```ada
Record_Name := (Component1 => Value1, Component2 => Value2);
```

### Extension Aggregates

Extension aggregates in Ada initialize tagged types with specified values.

```ada
Object_Name := new Tagged_Type'(Component1 => Value1, Component2 => Value2);
```

### Array Aggregates

Array aggregates in Ada initialize arrays with specified values.

```ada
Array_Name := (1 => Value1, 2 => Value2, others => Default_Value);
```

## EXPRESSIONS

Expressions in Ada combine operators, names, literals, and aggregates to produce values.

```ada
X := (A + B) * C / D;
```

## OPERATORS AND EXPRESSION EVALUATION

### Logical Operators and Short-circuit Control Forms

Logical operators in Ada include `and then`, `or else`, and `not`.

```ada
if A > 0 and then B /= 0 then
    Result := A / B;
end if;
```

### Relational Operators and Membership Tests

Relational operators in Ada compare values (`=`, `/=`, `<`, `<=`, `>`, `>=`) and include membership tests (`in`, `not in`).

```ada
if X in 1 .. 10 then
    ...
end if;
```

### Binary Adding Operators

Binary adding operators in Ada include `+` (addition) and `-` (subtraction).

```ada
Sum := A + B;
```

### Unary Adding Operators

Unary adding operators in Ada include `+` (positive) and `-` (negative).

```ada
Result := -X;
```

### Multiplying Operators

Multiplying operators in Ada include `*` (multiplication), `/` (division), and `mod` (modulo).

```ada
Result := A * B;
```

### Highest Precedence Operators

Highest precedence operators in Ada include `**` (exponentiation), `abs` (absolute value), and `**` (concatenation for strings).

```ada
S := "Hello" & " " & "World!";
```

### Conditional Expressions

Conditional expressions in Ada use `if ... then ... else ... end if`.

```ada
Max := if A > B then A else B;
```

### Quantified Expressions

Quantified expressions in Ada use `for all` and `there exists`.

```ada
if there exists I in 1 .. N => A(I) > 0 then
    ...
end if;
```

## TYPE CONVERSIONS

Type conversions in Ada convert values between compatible types using type names.

```ada
X := Float(Y);
```

## QUALIFIED EXPRESSIONS

Qualified expressions in Ada provide a concise way to create and initialize objects.

```ada
Object_Name : constant Integer := Integer'(A + B);
```

## ALLOCATORS

Allocators in Ada dynamically allocate storage for objects using `new`.

```ada
Object_Ptr := new Object_Type'(Initial_Value);
```

## STATIC EXPRESSIONS AND STATIC SUBTYPES

### Statically Matching Constraints and Subtypes

Static expressions in Ada are evaluated at compile-time and used to determine subtype constraints.

```ada
subtype Positive_Integer is Integer range 1 .. Integer'Last;
```

This manual outline covers the detailed aspects of names and expressions in the Ada programming language, including various ways to reference and manipulate data using names, literals, aggregates, expressions, operators, type conversions, allocators, and static expressions. Each section can be expanded with specific syntax rules, examples, and further details as needed.

