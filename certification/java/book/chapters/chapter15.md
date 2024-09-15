# ANNOTATIONS

Annotations in Java provide metadata that can be added to classes, methods, variables, and other program elements to provide additional information to the compiler, tools, or runtime environment.

### A SIMPLE ANNOTATION EXAMPLE

Annotations are defined using the `@interface` keyword:

```java
import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface MyAnnotation {
    String value() default "default value";
}
```

### ANNOTATION TYPES

Annotations can be:
   * **Marker Annotations**: Annotations without elements.
   * **Single-Value Annotations**: Annotations with a single element.
   * **Full Annotations**: Annotations with multiple elements.

```java
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
public @interface Author {
    String name();
    String date();
}
```

### ANNOTATING ELEMENTS

Elements of a class, method, or variable can be annotated:

```java
@Author(name = "John Doe", date = "2024-06-30")
public class MyClass {

    @MyAnnotation("someValue")
    public void myMethod() {
        // Method implementation
    }
}
```

### RESTRICTING ANNOTATION APPLICABILITY

Annotations can be restricted to apply only to specific types of elements (`TYPE`, `METHOD`, `FIELD`, etc.):

```java
@Target({ElementType.TYPE, ElementType.METHOD})
public @interface MyAnnotation {
    String value() default "default";
}
```

### RETENTION POLICIES

Retention policies specify how long annotations are retained:
   * **`RetentionPolicy.SOURCE`**: Annotations are discarded by the compiler.
   * **`RetentionPolicy.CLASS`**: Annotations are retained by the compiler but not available at runtime.
   * **`RetentionPolicy.RUNTIME`**: Annotations are retained by the JVM and can be accessed at runtime using reflection.

```java
@Retention(RetentionPolicy.RUNTIME)
public @interface MyAnnotation {
    String value() default "default";
}
```

### WORKING WITH ANNOTATIONS

Annotations can be processed at runtime using reflection to access metadata and perform additional actions based on annotated elements:

```java
public class AnnotationProcessor {

    public static void main(String[] args) throws Exception {
        Class<MyClass> cls = MyClass.class;

        // Accessing class-level annotation
        if (cls.isAnnotationPresent(Author.class)) {
            Author author = cls.getAnnotation(Author.class);
            System.out.println("Author: " + author.name() + ", Date: " + author.date());
        }

        // Accessing method-level annotation
        Method method = cls.getMethod("myMethod");
        if (method.isAnnotationPresent(MyAnnotation.class)) {
            MyAnnotation annotation = method.getAnnotation(MyAnnotation.class);
            System.out.println("Annotation value: " + annotation.value());
        }
    }
}
```

This manual provides a comprehensive overview of annotations in Java, covering simple annotation examples, annotation types, annotating elements, restricting annotation applicability, retention policies, and working with annotations using reflection. For more detailed information, refer to the Java documentation and additional resources.
