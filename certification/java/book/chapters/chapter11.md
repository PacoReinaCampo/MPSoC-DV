# GENERIC TYPES

Generic types in Java provide a way to create classes, interfaces, and methods that operate on objects of specified types while providing compile-time type safety.

### GENERIC TYPE DECLARATIONS

Generic types are declared using angle brackets `<T>`, `<E>`, `<K, V>`, etc., where `T`, `E`, `K`, and `V` are type parameters:

```java
public class Box<T> {
    private T content;
    
    public void setContent(T content) {
        this.content = content;
    }
    
    public T getContent() {
        return content;
    }
}
```

### WORKING WITH GENERIC TYPES

Generic types allow classes to be type-safe without casting and provide flexibility in defining reusable components:

```java
Box<Integer> integerBox = new Box<>();
integerBox.setContent(42);
int num = integerBox.getContent(); // no casting needed
```

### GENERIC METHODS AND CONSTRUCTORS

Methods and constructors can also be generic, independently of the containing class:

```java
public class Utils {
    public static <T> T getLastElement(List<T> list) {
        return list.get(list.size() - 1);
    }
}
```

```java
List<Integer> numbers = Arrays.asList(1, 2, 3);
Integer lastNumber = Utils.<Integer>getLastElement(numbers);
```

### WILDCARD CAPTURE

Wildcard types (`?`) in generics allow flexibility in method parameters and return types without specifying a specific type:

```java
public void printList(List<?> list) {
    for (Object obj : list) {
        System.out.println(obj);
    }
}
```

### UNDER THE HOOD: ERASURE AND RAW TYPES

Java generics use type erasure at runtime, meaning type parameters are removed during compilation and replaced with casting. Raw types allow backward compatibility with non-generic code:

```java
Box rawBox = new Box(); // Raw type
Box<Integer> genericBox = new Box<>(); // Generic type
```

### FINDING THE RIGHT METHOD REVISITED

Java's compiler ensures that the correct method is chosen based on the generic type specified:

```java
public class Utils {
    public static <T> T getLastElement(List<T> list) {
        return list.get(list.size() - 1);
    }
    
    public static void printElements(List<?> list) {
        for (Object obj : list) {
            System.out.println(obj);
        }
    }
}
```

### CLASS EXTENSION AND GENERIC TYPES

Classes can extend generic types or be extended by generic types to maintain type safety and reuse:

```java
public class Pair<K, V> {
    private K key;
    private V value;
    
    // constructor, getters and setters
}

public class OrderedPair<K, V> extends Pair<K, V> {
    // additional methods or overrides
}
```

This manual provides a comprehensive overview of generic types in Java, covering generic type declarations, working with generic types, generic methods and constructors, wildcard capture, type erasure and raw types, method resolution with generics, and class extension with generics. For more detailed information, refer to the Java documentation and additional resources.
