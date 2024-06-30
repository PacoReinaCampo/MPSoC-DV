# GARBAGE COLLECTION AND MEMORY

Garbage collection in Java automates memory management by reclaiming memory occupied by objects that are no longer reachable.

### GARBAGE COLLECTION

Garbage collection (GC) is the process of automatically identifying and reclaiming memory occupied by objects that are no longer reachable or referenced by the application.

### A SIMPLE MODEL

Java uses a generational garbage collector that categorizes objects into young generation (Eden and Survivor spaces) and old generation (Tenured space).

- **Young Generation**: Newly allocated objects.
- **Old Generation**: Long-lived objects that survived multiple GC cycles.

### FINALIZATION

Finalization is the process of cleaning up resources before an object is garbage collected. It's managed by the `finalize()` method, but it's generally not recommended due to unpredictable execution and potential performance impact.

```java
public class MyClass {
    // Finalize method
    protected void finalize() {
        // Cleanup resources
    }
}
```

### INTERACTING WITH THE GARBAGE COLLECTOR

Java provides limited interaction with the garbage collector through `System.gc()` and `Runtime.getRuntime().gc()` methods, but their effectiveness is platform-dependent.

```java
// Explicitly trigger garbage collection
System.gc();
```

### REACHABILITY STATES AND REFERENCE OBJECTS

Java defines different reachability states for objects using reference objects (`java.lang.ref` package):

- **Strong References**: Normal references that prevent the referenced object from being garbage collected.
- **Soft References**: Objects eligible for GC when memory is low.
- **Weak References**: Objects eligible for GC when no strong or soft references exist.
- **Phantom References**: Objects enqueued for cleanup before GC.

```java
// Creating soft reference
SoftReference<MyObject> softRef = new SoftReference<>(new MyObject());

// Checking reference status
if (softRef.get() == null) {
    // Object has been garbage collected
}
```

This manual provides a comprehensive overview of garbage collection and memory management in Java, covering garbage collection process, memory model with young and old generations, finalization, interacting with the garbage collector, and reachability states using reference objects. For more detailed information, refer to the Java documentation and additional resources.
