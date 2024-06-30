# VISIBILITY RULES

## DECLARATIVE REGION

### Declarative Part

A declarative region in Ada is a part of the code where declarations are made, such as within a block, package, or subprogram.

```ada
procedure Process is
    X : Integer := 10;  -- Declarative part
begin
    ...
end Process;
```

## SCOPE OF DECLARATIONS

### Scope

The scope of a declaration in Ada determines where a name is valid and accessible within the program.

```ada
procedure Process is
    X : Integer := 10;  -- Scoped to Process procedure
begin
    ...
end Process;
```

## VISIBILITY

### Visibility

Visibility in Ada determines where a declaration can be referenced within a program, which is influenced by its scope and any use clauses or renamings.

```ada
package My_Package is
    A : Integer := 42;
private
    B : Integer := 24;
end My_Package;
```

### Overriding Indicators

Overriding indicators in Ada specify which declarations take precedence when there are conflicting names.

```ada
package My_Package is
    A : Integer := 42;
    A : constant Integer := 24;  -- Overriding indicator
end My_Package;
```

## USE CLAUSES

### Use Clauses

Use clauses in Ada allow direct access to public entities declared in other packages without qualifying their names.

```ada
with Ada.Text_IO;
use Ada.Text_IO;  -- Use clause

procedure Main is
begin
    Put_Line("Hello, World!");
end Main;
```

## RENAMING DECLARATIONS

### Object Renaming Declarations

Object renaming declarations in Ada alias an existing object with a different name.

```ada
X : Integer := 10;
Y : aliased Integer := X;  -- Object renaming
```

### Exception Renaming Declarations

Exception renaming declarations in Ada allow renaming standard exceptions for clarity or customization.

```ada
with Ada.Exceptions;

My_Exception : exception;
...
declare
    pragma Exception_Name (My_Exception, "Custom_Exception");
begin
    raise My_Exception;
exception
    when My_Exception =>
        Put_Line("Handling Custom_Exception");
end;
```

### Package Renaming Declarations

Package renaming declarations in Ada alias an existing package with a different name.

```ada
with Ada.Text_IO;

package Output is new Ada.Text_IO;
```

### Subprogram Renaming Declarations

Subprogram renaming declarations in Ada alias existing subprograms with different names for clarity or customization.

```ada
procedure Original_Procedure is
begin
    ...
end Original_Procedure;

procedure Renamed_Procedure is new Original_Procedure;
```

### Generic Renaming Declarations

Generic renaming declarations in Ada alias existing generic units with different names for reuse or customization.

```ada
generic
    type Element_Type is private;
    with function "=" (Left, Right : Element_Type) return Boolean;
package Equality is
    function Equal (A, B : Element_Type) return Boolean;
end Equality;

package Integer_Equality is new Equality(Integer, "=");
```

## THE CONTEXT OF OVERLOAD RESOLUTION

### Overload Resolution
Overload resolution in Ada determines which subprogram or operator definition matches a given call based on parameter types and context.

```ada
function "+" (Left, Right : Integer) return Integer;
function "+" (Left, Right : Float) return Float;

X : Integer := 10;
Y : Float := 3.14;
Z1 : Integer := X + X;  -- Resolves to Integer version
Z2 : Float := Y + Y;    -- Resolves to Float version
```

This manual outline covers the detailed aspects of visibility rules in the Ada programming language, including declarative regions, scope of declarations, visibility, overriding indicators, use clauses, renaming declarations for objects, exceptions, packages, subprograms, and generics, as well as the context of overload resolution. Each section can be expanded with specific syntax rules, examples, and further details as needed.

