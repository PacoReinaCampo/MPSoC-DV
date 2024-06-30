# PROGRAM STRUCTURE AND COMPILATION ISSUES

## SEPARATE COMPILATION

### Compilation Units - Library Units

- **Compilation Unit**: A compilation unit in Ada is a source file that can be compiled independently. It typically contains a package specification, package body, task unit, or a main program.
  
  ```ada
  -- Example of a package specification compilation unit
  package My_Package is
     -- Declarations
  end My_Package;
  ```

- **Library Unit**: A library unit in Ada is a compiled unit that can be reused in other programs. It includes compiled packages, subprograms, and other units.

### Context Clauses - With Clauses

- **Context Clauses**: Context clauses in Ada (`with`, `use`, `renames`, etc.) specify dependencies and visibility for compilation units.
  
  ```ada
  with Ada.Text_IO;  -- Context clause
  use Ada.Text_IO;   -- Use clause
  
  procedure Main is
  begin
     Put_Line("Hello, World!");
  end Main;
  ```

### Subunits of Compilation Units

- **Subunits**: Ada allows breaking large units into smaller subunits (`child units`) for organization and modularity without breaking the single unit property.

  ```ada
  package body My_Package is separate;
  
  procedure Helper is separate;
  ```

### The Compilation Process

- **Compilation**: Ada compilation involves translating source code into object code (`*.o` files) using the `gnatmake` or `gcc` compiler.

  ```bash
  gnatmake main.adb  # Compile main.adb
  ```

### Pragmas and Program Units

- **Pragmas**: Pragmas in Ada provide additional instructions to the compiler, affecting compilation and runtime behavior.

  ```ada
  pragma Unreferenced (Variable);  -- Ignore unused variable warnings
  ```

- **Program Units**: Program units in Ada are the fundamental components of Ada programs, including packages, tasks, procedures, functions, and main programs.

## Environment-Level Visibility Rules

- **Visibility Rules**: Ada's visibility rules govern the scope and accessibility of entities across compilation units and within the same unit.

  ```ada
  package My_Package is
     X : Integer;  -- Visible within the package
  end My_Package;
  ```

## PROGRAM EXECUTION

### Elaboration Control

- **Elaboration**: Elaboration in Ada refers to the initialization and setup of program units and tasks before execution.

  ```ada
  procedure Main is
  begin
     -- Elaboration phase
     Put_Line("Starting program...");
     -- Execution phase
  end Main;
  ```

This manual outline covers the detailed aspects of program structure and compilation issues in the Ada programming language, including separate compilation with compilation units and library units, context clauses (`with`, `use`, `renames`), subunits, the compilation process, pragmas, program units, environment-level visibility rules, and elaboration control. Each section can be expanded with specific syntax rules, examples, and further details as needed.

