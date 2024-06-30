# EXTENDING CLASSES

In Java, classes can inherit attributes and behaviors from other classes using the `extends` keyword. This forms the basis of inheritance, a key feature of object-oriented programming.

### AN EXTENDED CLASS

An extended class inherits fields and methods from a superclass. Example:

```java
public class Animal {
    public void eat() {
        System.out.println("Animal is eating");
    }
}

public class Dog extends Animal {
    public void bark() {
        System.out.println("Dog is barking");
    }
}
```

### CONSTRUCTORS IN EXTENDED CLASSES

Constructors in subclasses can call constructors from their superclass using the `super()` keyword to initialize inherited fields.

```java
public class Animal {
    private String name;

    public Animal(String name) {
        this.name = name;
    }
}

public class Dog extends Animal {
    private String breed;

    public Dog(String name, String breed) {
        super(name); // Call superclass constructor
        this.breed = breed;
    }
}
```

### INHERITING AND REDEFINING MEMBERS

Subclasses inherit methods and fields from superclasses. Methods can be overridden (redefined) in subclasses to provide specific implementations.

```java
public class Animal {
    public void makeSound() {
        System.out.println("Animal makes a sound");
    }
}

public class Dog extends Animal {
    @Override
    public void makeSound() {
        System.out.println("Dog barks");
    }
}
```

### TYPE COMPATIBILITY AND CONVERSION

A subclass object can be treated as an instance of its superclass (upcasting). Explicit casting may be required to treat a superclass object as a subclass object (downcasting).

```java
Animal animal = new Dog(); // Upcasting
Dog dog = (Dog) animal; // Downcasting
```

### WHAT PROTECTED REALLY MEANS

The `protected` access modifier allows access to members within the same package or subclasses in different packages. It facilitates encapsulation while enabling inheritance.

### MARKING METHODS AND CLASSES FINAL

The `final` keyword prevents classes from being subclassed or methods from being overridden. It ensures the stability of class behavior or structure.

```java
public final class Animal {
    // Class implementation
}

public class Dog extends Animal { // Error: Cannot inherit from final class
    // Class implementation
}

public class Animal {
    public final void eat() {
        // Method implementation
    }
}

public class Dog extends Animal {
    // Error: Cannot override final method
}
```

### ABSTRACT CLASSES AND METHODS

Abstract classes cannot be instantiated and may contain abstract methods (without implementation). Subclasses must implement abstract methods.

```java
public abstract class Animal {
    public abstract void makeSound();
}

public class Dog extends Animal {
    @Override
    public void makeSound() {
        System.out.println("Dog barks");
    }
}
```

### THE OBJECT CLASS

The `Object` class is the root of the Java class hierarchy. All classes inherit from `Object`, which provides common methods like `equals()`, `hashCode()`, `toString()`, etc.

### CLONING OBJECTS

Object cloning creates a copy of an object. Classes can implement the `Cloneable` interface and override `clone()` method for deep or shallow copying.

```java
public class MyClass implements Cloneable {
    // Override clone() method
    @Override
    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
```

### EXTENDING CLASSES: HOW AND WHEN

Extend a class when you want to reuse code, establish an "is-a" relationship, or specialize behavior. Use inheritance judiciously to maintain code clarity and avoid deep class hierarchies.

### DESIGNING A CLASS TO BE EXTENDED

To design a class for extension, document behaviors and guidelines for subclassing. Use `protected` access for methods and fields intended for subclasses, ensuring consistency and flexibility.

### SINGLE INHERITANCE VERSUS MULTIPLE INHERITANCE

Java supports single inheritance (one class extends another), promoting simplicity and avoiding diamond problem complexities seen in multiple inheritance (supported by interfaces).

This manual provides a comprehensive overview of extending classes in Java, covering inheritance, constructors, method overriding, access modifiers, and related concepts. For more detailed information, refer to the Java documentation and additional resources.
