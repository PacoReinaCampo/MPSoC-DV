# REFLECTION

Reflection in Java allows inspection of classes, interfaces, fields, methods, and constructors at runtime, enabling dynamic class loading, instantiation, and method invocation.

### THE CLASS CLASS

The `Class` class represents classes and interfaces in Java and provides methods to examine class metadata:

```java
Class<?> cls = MyClass.class;

// Getting class name
String className = cls.getName();

// Getting superclass
Class<?> superclass = cls.getSuperclass();

// Getting declared methods
Method[] methods = cls.getDeclaredMethods();

// Checking if class is an interface
boolean isInterface = cls.isInterface();
```

### ANNOTATION QUERIES

Reflection allows querying annotations present on classes, methods, fields, and other elements:

```java
@MyAnnotation(value = "example")
public class MyClass {
    // Class, method, or field with annotations
}

Class<?> cls = MyClass.class;

// Querying class-level annotation
if (cls.isAnnotationPresent(MyAnnotation.class)) {
    MyAnnotation annotation = cls.getAnnotation(MyAnnotation.class);
    String value = annotation.value();
}
```

### THE MODIFIER CLASS

The `Modifier` class provides static methods to decode class, method, and field modifiers:

```java
import java.lang.reflect.Modifier;

Class<?> cls = MyClass.class;
int modifiers = cls.getModifiers();

// Checking modifiers
if (Modifier.isPublic(modifiers)) {
    System.out.println("Class is public");
}
```

### THE MEMBER CLASSES

Reflection provides access to member classes (nested classes) within a class:

```java
Class<?>[] memberClasses = cls.getDeclaredClasses();
```

### ACCESS CHECKING AND ACCESSIBLEOBJECT

Reflection can override access checks using `AccessibleObject` to access non-public members:

```java
Field privateField = cls.getDeclaredField("fieldName");
privateField.setAccessible(true);
Object value = privateField.get(instance);
```

### THE FIELD CLASS

The `Field` class represents fields of a class and provides methods to manipulate field values:

```java
Field field = cls.getDeclaredField("fieldName");
Object value = field.get(instance); // Get field value
field.set(instance, newValue); // Set field value
```

### THE METHOD CLASS

The `Method` class represents methods of a class and provides methods to invoke methods dynamically:

```java
Method method = cls.getDeclaredMethod("methodName", parameterTypes);
Object result = method.invoke(instance, args);
```

### CREATING NEW OBJECTS AND THE CONSTRUCTOR CLASS

Reflection allows creating new objects and invoking constructors dynamically using the `Constructor` class:

```java
Constructor<?> constructor = cls.getDeclaredConstructor(parameterTypes);
Object instance = constructor.newInstance(args);
```

### GENERIC TYPE INSPECTION

Reflection provides access to generic type information of fields, methods, and classes:

```java
Field field = cls.getDeclaredField("fieldName");
Type fieldType = field.getGenericType();
```

### ARRAYS

Reflection provides methods to work with arrays dynamically:

```java
Class<?> componentType = String[].class.getComponentType();
```

### PACKAGES

Reflection provides access to package information:

```java
Package pkg = cls.getPackage();
String packageName = pkg.getName();
```

### THE PROXY CLASS

The `Proxy` class enables creating dynamic proxy instances:

```java
InvocationHandler handler = new MyInvocationHandler();
Class<?>[] interfaces = new Class[] { MyInterface.class };
MyInterface proxy = (MyInterface) Proxy.newProxyInstance(
    getClass().getClassLoader(), interfaces, handler);
```

### LOADING CLASSES

Reflection allows loading classes dynamically using class loaders:

```java
Class<?> loadedClass = Class.forName("com.example.MyClass");
```

### CONTROLLING ASSERTIONS AT RUNTIME

Assertions can be enabled or disabled at runtime using the `-ea` (enable assertions) or `-da` (disable assertions) JVM arguments:

```java
java -ea MyApp // Enable assertions
java -da MyApp // Disable assertions
```

This manual provides a comprehensive overview of reflection in Java, covering the `Class` class, annotation queries, the `Modifier` class, member classes, access checking, the `Field` and `Method` classes, creating objects dynamically, generic type inspection, arrays, packages, the `Proxy` class, loading classes, and controlling assertions at runtime. For more detailed information, refer to the Java documentation and additional resources.
