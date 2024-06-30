# PACKAGES

## PACKAGE SPECIFICATIONS AND DECLARATIONS

### Package Specifications

Package specifications in Ada declare the public interface of a package, including types, subprograms, constants, and variables.

```ada
package My_Package is
    type Integer_Array is array (Natural range <>) of Integer;
    procedure Sort (Data : in out Integer_Array);
end My_Package;
```

### Package Declarations

Package declarations in Ada define the scope and visibility of the package within a program unit.

```ada
with My_Package;  -- Package specification is needed

procedure Main is
    package My_Pkg renames My_Package;
    Data : My_Pkg.Integer_Array := (3, 1, 4, 1, 5, 9);
begin
    My_Pkg.Sort(Data);
end Main;
```

## PACKAGE BODIES

### Package Bodies

Package bodies in Ada provide the implementation of package specifications, including subprograms and private declarations.

```ada
package body My_Package is
    procedure Sort (Data : in out Integer_Array) is
        -- Implementation of sorting algorithm
    begin
        -- Sort implementation
    end Sort;
end My_Package;
```

## PRIVATE TYPES AND PRIVATE EXTENSIONS

### Private Types

Private types in Ada restrict the visibility of types and their components to within the package.

```ada
package My_Package is
    type Private_Type is private;
private
    type Private_Type is record
        ...
    end record;
end My_Package;
```

### Private Extensions

Private extensions in Ada allow extending a private type outside its original declaration, maintaining encapsulation.

```ada
package My_Package is
    type Base_Type is private;
private
    type Base_Type is record
        ...
    end record;
end My_Package;

package My_Package.Extended_Pkg is
    type Extended_Type is new Base_Type with private;
private
    type Extended_Type is new Base_Type with
        record
            ...
        end record;
end My_Package.Extended_Pkg;
```

### Private Operations

Private operations in Ada are subprograms declared and defined within the private part of a package, accessible only within the package.

```ada
package My_Package is
    type Counter is private;
    procedure Increment (C : in out Counter);
private
    type Counter is record
        Value : Integer := 0;
    end record;
    procedure Increment (C : in out Counter) is
    begin
        C.Value := C.Value + 1;
    end Increment;
end My_Package;
```

### Type Invariants

Type invariants in Ada are conditions specified for private types that must hold true at all times.

```ada
package My_Package is
    type Positive_Integer is private;
private
    type Positive_Integer is new Integer with
        Dynamic_Predicate => Positive_Integer > 0;
end My_Package;
```

## DEFERRED CONSTANTS

Deferred constants in Ada are constants whose value is defined in the package body rather than in the package specification.

```ada
package My_Package is
    A : constant Integer;
    B : constant Integer := 42;
private
    A : constant Integer := 10;  -- Deferred constant
end My_Package;
```

## LIMITED TYPES

Limited types in Ada are types that do not have default initialization or finalization.

```ada
package My_Package is
    type Limited_Type is limited record
        ...
    end record;
end My_Package;
```

## ASSIGNMENT AND FINALIZATION

### Assignment

Assignment of variables in Ada assigns values to variables, records, and arrays.

```ada
package My_Package is
    X : Integer;
    Y : Integer := 42;
    type Point is record
        X : Integer;
        Y : Integer;
    end record;
    P : Point;
begin
    X := 10;
    P := (X => 5, Y => 7);
end My_Package;
```

### Finalization

Finalization in Ada ensures that all actions are completed before moving on.

