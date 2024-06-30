# INTERFACES

Interfaces in Java define a contract for classes to implement. They enable multiple inheritance of type (through abstract methods) and promote loose coupling in object-oriented design.

### A SIMPLE INTERFACE EXAMPLE

An interface in Java is declared using the `interface` keyword. It contains method signatures without implementations.

```java
public interface Animal {
    void makeSound();
    void eat();
}
```

### INTERFACE DECLARATIONS

Interfaces can declare methods, constants, and default methods (Java 8+). All interface methods are `public` by default and do not have method bodies.

```java
public interface Animal {
    void makeSound();
    void eat();
    
    int LEGS = 4; // Constant (implicitly public, static, final)
}
```

### EXTENDING INTERFACES

Interfaces can extend other interfaces using the `extends` keyword. This allows for hierarchical organization of interfaces.

```java
public interface Pet extends Animal {
    void play();
}
```

### WORKING WITH INTERFACES

Classes implement interfaces using the `implements` keyword. They must provide implementations for all interface methods.

```java
public class Dog implements Animal {
    @Override
    public void makeSound() {
        System.out.println("Dog barks");
    }
    
    @Override
    public void eat() {
        System.out.println("Dog eats");
    }
}
```

### MARKER INTERFACES

Marker interfaces in Java are interfaces without any methods. They serve as tags to indicate certain behaviors or characteristics.

```java
public interface Serializable {
    // Marker interface indicating objects can be serialized
}
```

### WHEN TO USE INTERFACES

Interfaces are used in Java:
- To define contracts for classes to implement, promoting code reuse and flexibility.
- To achieve multiple inheritance of type when classes need to implement behaviors from multiple sources.
- To enable polymorphism and dependency inversion, allowing for loose coupling and easier testing.

This manual provides a comprehensive overview of interfaces in Java, covering their definition, usage, extending interfaces, marker interfaces, and guidelines for when to use interfaces. For more detailed information, refer to the Java documentation and additional resources.
