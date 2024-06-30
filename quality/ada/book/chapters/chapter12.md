# GENERIC UNITS

## GENERIC DECLARATIONS

### Generic Declarations

Generic declarations in Ada define reusable components parameterized by types, subprograms, or other entities.

```ada
generic
    type Element_Type is private;
    with function "=" (Left, Right : Element_Type) return Boolean;
package Equality is
    function Equal (A, B : Element_Type) return Boolean;
end Equality;
```

## GENERIC BODIES

### Generic Bodies

Generic bodies in Ada provide the implementation of generic units defined in the specification.

```ada
generic
    type Element_Type is private;
    with function "=" (Left, Right : Element_Type) return Boolean;
package body Equality is
    function Equal (A, B : Element_Type) return Boolean is
    begin
        return A = B;
    end Equal;
end Equality;
```

## GENERIC INSTANTIATION

### Generic Instantiation

Generic instantiation in Ada creates specific instances of generic units by binding actual types or subprograms to formal parameters.

```ada
with Equality;

package Integer_Equality is new Equality(Integer, "=");
```

## FORMAL OBJECTS

### Formal Objects

Formal objects in Ada are parameters of generic units that can represent constants or variables of various types.

```ada
generic
    type Element_Type is private;
    with function "=" (Left, Right : Element_Type) return Boolean;
package Equality is
    X : Element_Type;  -- Formal object
    function Equal (A : Element_Type) return Boolean;
end Equality;
```

## FORMAL TYPES

### Formal Private and Derived Types

Formal private and derived types in Ada allow generic units to accept user-defined types and their derived types.

```ada
generic
    type Element_Type is private;
package Container is
    type Container_Type is private;
    procedure Add (C : in out Container_Type; Item : in Element_Type);
    function Retrieve (C : Container_Type) return Element_Type;
private
    type Container_Type is ...
end Container;
```

### Formal Scalar Types

Formal scalar types in Ada allow generic units to accept scalar types such as integers, floating-point numbers, and enumerations.

```ada
generic
    type Scalar_Type is private;
package Math_Functions is
    function Square (X : Scalar_Type) return Scalar_Type;
end Math_Functions;
```

### Formal Array Types

Formal array types in Ada allow generic units to accept arrays of different dimensions and sizes.

```ada
generic
    type Element_Type is private;
    type Index_Type is (<>);
    type Array_Type is array (Index_Type) of Element_Type;
package Array_Processing is
    procedure Process (A : in out Array_Type);
end Array_Processing;
```

### Formal Access Types

Formal access types in Ada allow generic units to accept access types to control dynamic memory allocation.

```ada
generic
    type Element_Type is private;
    type Element_Access is access Element_Type;
package Container is
    procedure Add (C : in out Element_Access; Item : in Element_Type);
end Container;
```

### Formal Interface Types

Formal interface types in Ada allow generic units to accept interfaces that define a set of operations without specifying the implementation.

```ada
generic
    type Interface_Type is interface;
package Processor is
    procedure Process (Object : in Interface_Type'Class);
end Processor;
```

## FORMAL SUBPROGRAMS

### Formal Subprograms

Formal subprograms in Ada allow generic units to accept subprogram parameters, enabling generic algorithms that operate on different types of data.

```ada
generic
    type Element_Type is private;
    with function "=" (Left, Right : Element_Type) return Boolean;
    with function "<" (Left, Right : Element_Type) return Boolean;
package Sorting is
    procedure Sort (Data : in out Element_Type_Array);
end Sorting;
```

## FORMAL PACKAGES

### Formal Packages

Formal packages in Ada allow generic units to accept entire packages as parameters, enabling modular and reusable software components.

```ada
generic
    with package Data_Structures is new Unbounded_String;
package String_Processing is
    function Length (S : Data_Structures.String) return Natural;
end String_Processing;
```

## EXAMPLE OF A GENERIC PACKAGE

### Example of a Generic Package

An example illustrating a generic package in Ada.

```ada
generic
    type Element_Type is private;
package Stack is
    type Stack_Type is private;
    procedure Push (S : in out Stack_Type; Item : in Element_Type);
    procedure Pop (S : in out Stack_Type; Item : out Element_Type);
private
    type Stack_Type is record
        Data : array (1 .. Max_Stack_Size) of Element_Type;
        Top : Natural := 0;
    end record;
end Stack;
```

This manual outline covers the detailed aspects of generic units in the Ada programming language, including generic declarations, generic bodies, generic instantiation, formal objects, formal types (private, scalar, array, access, interface), formal subprograms, formal packages, and an example of a generic package. Each section can be expanded with specific syntax rules, examples, and further details as needed.

