# SCOPE AND VISIBILITY RULES

In programming and specification languages like PSL (Property Specification Language), scope and visibility rules define where and how identifiers (such as variables, properties, and functions) can be accessed. Understanding these rules is essential for writing clear, maintainable, and error-free code or specifications.

## IMMEDIATE SCOPE

### Definition

Immediate scope refers to the region in the code where an identifier is directly accessible immediately after its declaration. This scope is typically limited to the block or module where the identifier is defined.

### Characteristics

- **Local Variables:** Variables declared within a block are only accessible within that block.
- **Local Properties:** Properties or sequences defined within a specific module or unit are only accessible within that module or unit.

### Example

```verilog
module example;
    int a;  // 'a' is in the immediate scope of 'example'
    always @(posedge clk) begin
        int b;  // 'b' is in the immediate scope of this always block
        // 'a' and 'b' are both accessible here
    end
    // 'a' is accessible here
    // 'b' is not accessible here
endmodule
```

In this example, `a` is in the immediate scope of the `example` module, while `b` is in the immediate scope of the `always` block.

## EXTENDED SCOPE

### Definition

Extended scope refers to a broader region where an identifier can be accessed beyond its immediate scope, often through mechanisms such as inheritance, inclusion, or linking.

### Characteristics

- **Inheritance:** In object-oriented contexts, properties and methods of a parent class or module are accessible in the child class or module.
- **Module Linking:** Identifiers in linked or included modules can be accessed if explicitly imported or referenced.

### Example

```verilog
module parent;
    int x;
endmodule

module child extends parent;
    always @(posedge clk) begin
        // 'x' from 'parent' is accessible here due to inheritance
        int y = x + 1;
    end
endmodule
```

In this example, `x` is defined in the `parent` module and is accessible in the `child` module due to inheritance, extending its scope.

## DIRECT AND INDIRECT NAME REFERENCES

### Direct Name References

Direct name references occur when an identifier is accessed using its explicit name within its scope or through qualified naming if the identifier is from an extended scope.

**Characteristics:**

- **Unambiguous Access:** The identifier is accessed using its exact name.
- **Immediate or Extended Scope:** The identifier can be in the immediate or extended scope but is referenced directly.

**Example:**

```verilog
module main;
    int data;
    always @(posedge clk) begin
        data = data + 1;  // Direct reference to 'data'
    end
endmodule
```

### Indirect Name References

Indirect name references occur when an identifier is accessed using an alias, pointer, or through some form of indirection.

**Characteristics:**

- **Alias or Pointer Access:** The identifier is accessed through another reference or a symbolic name.
- **Dynamic or Static Resolution:** The actual reference can be resolved dynamically (at runtime) or statically (at compile time).

**Example:**

```verilog
module main;
    int data;
    int pointer;
    always @(posedge clk) begin
        pointer = &data;  // 'pointer' holds the address of 'data'
        int value = *pointer;  // Indirect reference to 'data' through 'pointer'
    end
endmodule
```

In this example, `pointer` indirectly references `data`.

### Application in PSL

In PSL, scope and visibility rules are critical for organizing properties and ensuring they are accessible where needed. The following examples demonstrate immediate and extended scope in PSL:

**Immediate Scope:**

```psl
property p1;
    a -> b;
endproperty

// 'p1' is directly accessible within this scope
assert p1;
```

**Extended Scope:**

```psl
module m;
    property p1;
        a -> b;
    endproperty
endmodule

module n extends m;
    // 'p1' from module 'm' is accessible here
    assert p1;
endmodule
```

**Direct and Indirect Name References:**

**Direct Reference:**

```psl
assert always (req -> eventually ack);
```

**Indirect Reference:**

In PSL, indirect references can be more abstract, often involving parameters or aliases:

```psl
property p(seq);
    seq;
endproperty

sequence s1;
    a ##1 b;
endsequence

// Indirectly reference 's1' through parameterized property 'p'
assert p(s1);
```

In this example, the property `p` indirectly references the sequence `s1` through a parameter.

In summary, scope and visibility rules in PSL and similar languages ensure that identifiers are accessible where needed while maintaining encapsulation and modularity. Immediate scope covers local accessibility, extended scope includes inheritance and linking, and direct and indirect references provide different ways to access identifiers.
