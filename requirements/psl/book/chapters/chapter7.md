# VERIFICATION LAYER

The verification layer in languages like PSL (Property Specification Language) encompasses directives and constructs specifically designed for verifying the properties of hardware designs. It includes mechanisms to assert conditions, make assumptions, restrict behaviors, and cover scenarios, ensuring comprehensive verification of the design's behavior.

## VERIFICATION DIRECTIVES

Verification directives are commands or statements used to specify conditions and constraints that need to be checked during the verification process.

### assert

The `assert` directive specifies conditions that must always hold true in the design. If an assertion fails during simulation or formal verification, it indicates a design error.

**Example:**
```psl
assert always (req -> eventually ack);
```
This assertion ensures that whenever `req` is true, `ack` must eventually become true.

### assume

The `assume` directive specifies conditions that are assumed to be true for the purpose of verification. These assumptions help constrain the verification environment.

**Example:**
```psl
assume always (input_signal != 0);
```
This assumption states that `input_signal` is never zero.

### restrict

The `restrict` directive imposes constraints on the design's behavior. It is used to limit the set of possible behaviors considered during verification.

**Example:**
```psl
restrict always (mode == 1 -> output_signal == 0);
```
This restriction ensures that if `mode` is 1, `output_signal` must be 0.

### restrict!

The `restrict!` directive is a stronger version of `restrict`, used to enforce constraints more strictly. It is often used in formal verification to eliminate behaviors that are not of interest.

**Example:**
```psl
restrict! always (mode == 1 -> output_signal == 0);
```
Similar to `restrict`, but with a stronger enforcement, typically causing verification to focus more on the constrained behavior.

### cover

The `cover` directive specifies scenarios or events that should be observed during simulation. It helps ensure that specific situations are tested and occur during verification.

**Example:**
```psl
cover (req && ack);
```
This coverage directive checks that the condition `req && ack` occurs during simulation.

### fairness and strong_fairness

Fairness and strong fairness constraints ensure that certain conditions occur infinitely often in infinite execution paths. They are crucial in liveness properties, ensuring that certain events happen repeatedly.

**Example:**
```psl
fairness always (req -> eventually ack);
strong_fairness always (req -> eventually ack);
```
These directives ensure that `req` being true eventually leads to `ack` being true infinitely often.

## VERIFICATION UNITS

Verification units are modular constructs that encapsulate properties, constraints, and verification logic. They promote reusability and organization in verification.

### Verification Unit Binding

Verification unit binding associates a verification unit with a specific part of the design. This binding ensures that the properties and constraints within the unit apply to the intended design components.

**Example:**
```psl
verification_unit my_unit is bound to my_module;
```
This binds the verification unit `my_unit` to the module `my_module`.

### Verification Unit Instantiation

Verification unit instantiation involves creating instances of verification units, allowing their properties and constraints to be applied in different contexts.

**Example:**
```psl
instance my_instance of my_unit;
```
This creates an instance `my_instance` of the verification unit `my_unit`.

### Verification Unit Inheritance

Verification unit inheritance allows a new verification unit to inherit properties and constraints from an existing unit, promoting reuse and extension.

**Example:**
```psl
verification_unit new_unit extends my_unit;
```
This creates a new verification unit `new_unit` that inherits from `my_unit`.

### Overriding Assignments

Overriding assignments enable modification of inherited properties and constraints in the derived verification units, allowing customization without altering the original unit.

**Example:**
```psl
verification_unit custom_unit extends base_unit;
custom_unit.property = custom_property;
```
This example shows how `custom_unit` inherits from `base_unit` but overrides a specific property with `custom_property`.

In summary, the verification layer in PSL provides a robust framework for asserting, assuming, restricting, and covering conditions in hardware design verification. It supports modularity through verification units, which can be bound, instantiated, inherited, and customized, ensuring a comprehensive and organized approach to verifying complex hardware designs.
