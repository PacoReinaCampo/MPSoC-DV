# NESTED CLASSES AND INTERFACES

Nested classes and interfaces in Java provide a way to logically group classes and interfaces that are only used in one place. They enhance encapsulation, code organization, and maintainability.

### STATIC NESTED TYPES

Static nested classes are nested within another class but are marked with the `static` keyword. They can access static members of the outer class directly.

```java
public class Outer {
    private static int outerStaticField = 10;
    
    static class StaticNested {
        void display() {
            System.out.println("Outer static field: " + outerStaticField);
        }
    }
}
```

### INNER CLASSES

Inner classes (non-static nested classes) are associated with an instance of the outer class. They can access instance variables and methods of the outer class.

```java
public class Outer {
    private int outerField = 20;
    
    class Inner {
        void display() {
            System.out.println("Outer field: " + outerField);
        }
    }
}
```

### LOCAL INNER CLASSES

Local inner classes are defined within a method or scope block. They cannot have access modifiers and are only visible within the scope where they are defined.

```java
public class Outer {
    void outerMethod() {
        class LocalInner {
            void display() {
                System.out.println("Inside local inner class");
            }
        }
        
        LocalInner inner = new LocalInner();
        inner.display();
    }
}
```

### ANONYMOUS INNER CLASSES

Anonymous inner classes are used for implementing interfaces or extending classes on the fly. They have no explicit class name and are defined and instantiated in a single expression.

```java
public class Outer {
    void displayMessage() {
        // Anonymous inner class implementing Runnable interface
        Runnable r = new Runnable() {
            @Override
            public void run() {
                System.out.println("Inside anonymous inner class");
            }
        };
        
        Thread t = new Thread(r);
        t.start();
    }
}
```

### INHERITING NESTED TYPES

Nested classes and interfaces can be inherited like any other member of a class. Subclasses can access and override nested types of their superclasses.

```java
public class Outer {
    static class StaticNested {
        void display() {
            System.out.println("Static nested class");
        }
    }
}

public class Subclass extends Outer.StaticNested {
    @Override
    void display() {
        System.out.println("Overridden display method");
    }
}
```

### NESTING IN INTERFACES

Interfaces can contain nested classes and interfaces, promoting logical grouping and reducing the clutter of the global namespace.

```java
public interface Container {
    class NestedClass {
        void display() {
            System.out.println("Nested class inside interface");
        }
    }
    
    interface NestedInterface {
        void display();
    }
}
```

### IMPLEMENTATION OF NESTED TYPES

Nested types are implemented by creating instances within their respective scopes or using them as part of the implementation of their containing class or interface.

```java
public class Main {
    public static void main(String[] args) {
        // Using static nested class
        Outer.StaticNested staticNested = new Outer.StaticNested();
        staticNested.display();
        
        // Using inner class
        Outer outer = new Outer();
        Outer.Inner inner = outer.new Inner();
        inner.display();
        
        // Using local inner class
        outer.outerMethod();
        
        // Using anonymous inner class
        outer.displayMessage();
        
        // Using nested class inside an interface
        Container.NestedClass nestedClass = new Container.NestedClass();
        nestedClass.display();
    }
}
```

This manual provides a comprehensive overview of nested classes and interfaces in Java, covering static nested types, inner classes, local inner classes, anonymous inner classes, inheritance of nested types, nesting in interfaces, and practical implementation examples. For more detailed information, refer to the Java documentation and additional resources.
