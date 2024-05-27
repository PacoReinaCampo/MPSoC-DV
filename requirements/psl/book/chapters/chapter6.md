# Temporal Layer

The temporal layer in languages like PSL (Property Specification Language) is designed to describe and specify the temporal relationships between events in hardware designs. This layer is crucial for expressing how signals and states evolve over time, which is essential for verifying the dynamic behavior of digital systems.

## Sequential Expressions

Sequential expressions describe the order and timing of events. They are used to specify how sequences of events unfold over time.

### Sequential Extended Regular Expressions (SEREs)

SEREs are a powerful way to describe sequences of events using a syntax similar to regular expressions but extended to handle the temporal aspect of hardware behavior.

**Example:**
```psl
{a; b[*3]; c}
```
In this example, `a` is followed by `b` occurring three times, followed by `c`.

### Sequences

Sequences are ordered lists of events or conditions that must occur in a specified order. They can be used to describe complex temporal relationships in a concise manner.

**Example:**
```psl
sequence my_sequence;
  a ##1 b ##2 c;
endsequence
```
This sequence specifies that `a` is followed by `b` one clock cycle later, and then `c` two clock cycles after `b`.

## Properties

Properties are assertions about the behavior of the system. They describe conditions that should always hold true.

### FL Properties

FL (Formal Language) properties are basic properties used to assert simple conditions over time.

**Example:**
```psl
assert always (req -> eventually ack);
```
This property asserts that whenever `req` is true, `ack` must eventually become true.

### Optional Branching Extension (OBE) Properties

OBE properties extend basic properties to handle branching time logic, allowing for the specification of properties over multiple possible futures.

**Example:**
```psl
assert (a -> (b || c));
```
This property asserts that if `a` is true, then either `b` or `c` must be true, capturing a branching behavior.

### Replicated Properties

Replicated properties specify that a property holds multiple times under certain conditions, often used to describe repeating patterns.

**Example:**
```psl
assert always {a; b}[*];
```
This property asserts that the sequence `{a; b}` repeats indefinitely.

## Local Variables

Local variables are used within properties and sequences to store intermediate values or states. They help in capturing and reusing values within a scope.

**Example:**
```psl
sequence s;
  int x = a + b;
  x ##1 c == x;
endsequence
```
Here, `x` is a local variable used within the sequence `s`.

## Procedural Blocks

Procedural blocks define blocks of code that execute sequentially, similar to procedural code in traditional programming languages. They are used to describe complex temporal behaviors.

**Example:**
```psl
always @(posedge clk) begin
  if (rst) begin
    // reset logic
  end else begin
    // main logic
  end
end
```
This procedural block executes on the rising edge of the clock.

## Property and Sequence Declarations

Properties and sequences can be declared and reused throughout the design, promoting modularity and reusability.

### Parameters

Parameters allow properties and sequences to be parameterized, enabling them to be more flexible and reusable.

**Example:**
```psl
property p(int delay);
  req ##delay ack;
endproperty

assert p(3);
```
Here, the property `p` takes an integer parameter `delay`.

### Declarations

Declarations define properties and sequences in a structured way, specifying their behavior and parameters.

**Example:**
```psl
sequence s;
  a ##1 b;
endsequence

property p;
  s ##1 c;
endproperty
```
This example declares a sequence `s` and a property `p` that uses `s`.

### Instantiation

Instantiation involves using declared properties and sequences in different contexts, potentially with different parameters.

**Example:**
```psl
assert p with (delay = 2);
```
This instantiation uses the property `p` with a specific parameter value.

In summary, the temporal layer in PSL provides a rich set of constructs for specifying and verifying the temporal behavior of hardware designs. Sequential expressions, properties, local variables, procedural blocks, and declarations form the core components of this layer, enabling precise and powerful descriptions of how signals and states evolve over time.
