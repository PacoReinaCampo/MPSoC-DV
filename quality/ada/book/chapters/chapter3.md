# DECLARATIONS AND TYPES

## DECLARATIONS

In Ada, declarations introduce names and define their properties. Declarations include entities such as variables, constants, types, subtypes, procedures, functions, packages, tasks, and exceptions.

## TYPES AND SUBTYPES

### Type Declarations

Type declarations define new data types in Ada. They specify the representation and operations allowed on values of that type. Examples include:

```ada
type Integer is range -2**31 .. 2**31 - 1;
type Real is digits 15;
```

### Subtype Declarations

Subtype declarations define subsets of existing types. They inherit properties from the parent type but may impose additional constraints. Example:

```ada
subtype Positive_Integer is Integer range 1 .. Integer'Last;
```

### Classification of Operations

Operations on types in Ada are classified as predefined operations (e.g., arithmetic, relational), type-specific operations (defined by the programmer for custom types), and dispatching operations (for tagged types).

### Subtype Predicates

Subtype predicates in Ada define conditions that must hold for values of a subtype. They are used to specify constraints beyond those of the base type.

## OBJECTS AND NAMED NUMBERS

### Object Declarations

Objects in Ada are entities with a specific type and value. They include variables, constants, and components of composite objects (records, arrays, etc.).

```ada
X : Integer := 42;
```

### Number Declarations

Named numbers in Ada are constants declared with a numeric value. They provide meaningful names to numeric literals.

```ada
Max_Length : constant := 100;
```

## DERIVED TYPES AND CLASSES

### Derivation Classes

Derived types in Ada are created using type extensions (tagged types), subtype declarations, and array type definitions. They inherit properties from existing types but may include additional constraints or features.

## SCALAR TYPES

### Enumeration Types

Enumeration types in Ada define a set of named values. Each value corresponds to an integer constant, starting from zero by default.

```ada
type Day is (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday);
```

### Character Types

Character types in Ada represent ASCII characters and include operations specific to characters.

```ada
type ASCII_Char is range 'A' .. 'Z';
```

### Boolean Types

Boolean types in Ada have two values: `True` and `False`. They are used in conditions and logical operations.

```ada
type Flag is (True, False);
```

### Integer Types

Integer types in Ada represent whole numbers within a specified range.

```ada
type Int8 is range -128 .. 127;
```

### Operations of Discrete Types

Operations on discrete types in Ada include arithmetic, relational, and logical operations defined for integer, enumeration, and Boolean types.

### Real Types

Real types in Ada represent floating-point numbers with a specified precision.

```ada
type Real is digits 15;
```

### Floating Point Types

Floating-point types in Ada represent real numbers with a defined range and precision.

```ada
type Float is digits 6 range -1.0E38 .. 1.0E38;
```

### Operations of Floating Point Types

Operations on floating-point types in Ada include arithmetic, relational, and transcendental functions like `sin`, `cos`, `exp`, etc.

### Fixed Point Types

Fixed-point types in Ada represent decimal numbers with a fixed number of decimal places.

```ada
type Fixed is delta 0.01 range -999.99 .. 999.99;
```

### Operations of Fixed Point Types

Operations on fixed-point types in Ada include arithmetic and comparison operations.

## ARRAY TYPES

### Index Constraints and Discrete Ranges

Array types in Ada define collections of elements indexed by discrete ranges.

```ada
type Matrix is array (1 .. 3, 1 .. 3) of Integer;
```

### Operations of Array Types

Operations on array types in Ada include element access, assignment, and iteration over elements.

### String Types

String types in Ada represent sequences of characters.

```ada
type String is array (Positive range <>) of Character;
```

## DISCRIMINANTS

### Discriminant Constraints

Discriminated types in Ada have discriminants that determine aspects of the type. Constraints on discriminants define their valid values.

```ada
type Rectangle (Width, Height : Positive) is record
    ...
end record;
```

### Operations of Discriminated Types

Operations on discriminated types in Ada include initialization based on discriminant values and access to discriminants.

## RECORD TYPES

### Variant Parts and Discrete Choices

Record types in Ada define aggregates of named components, possibly with variant parts.

```ada
type Person_Record is record
    Name : String(1 .. 50);
    case Gender is
        when Male   =>  Age : Natural;
        when Female =>  Age : Natural;
    end case;
end record;
```

## TAGGED TYPES AND TYPE EXTENSIONS

### Type Extensions

Tagged types in Ada support object-oriented programming with inheritance. Type extensions inherit properties and operations from a parent tagged type.

```ada
type Shape is tagged record
    ...
end record;

type Circle is new Shape with record
    Radius : Float;
end record;
```

### Dispatching Operations of Tagged Types

Dispatching operations in Ada allow dynamic dispatch based on the type of the object. They are defined using `abstract` subprograms.

```ada
procedure Area (S : in Shape; Result : out Float) is abstract;
```

### Abstract Types and Subprograms

Abstract types and subprograms in Ada are defined using `abstract` keywords. They serve as placeholders for concrete implementations in derived types.

## ACCESS TYPES

### Incomplete Type Declarations

Access types in Ada declare pointers to objects of a specified type. They are used for dynamic memory allocation and access to objects.

```ada
type Node;
type Node_Ptr is access Node;
```

### Operations of Access Types

Operations on access types in Ada include allocation, deallocation, and dereferencing operations.

## DECLARATIVE PARTS

### Completions of Declarations

Declarative parts in Ada complete the specification of entities declared earlier. They include bodies of procedures, functions, tasks, and packages.

```ada
procedure Process (Item : in Integer) is
begin
    ...
end Process;
```

This manual outline covers the detailed aspects of declarations and types in the Ada programming language, including various types, subtype declarations, array types, discriminants, record types, tagged types, access types, and declarative parts. Each section can be expanded with specific syntax rules, examples, and further details as needed.

