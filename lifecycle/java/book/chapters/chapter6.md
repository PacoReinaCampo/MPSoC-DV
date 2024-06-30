# ENUMERATION TYPES

Enums in Java are a special type of class used to define collections of constants. They provide a way to represent fixed sets of constants, enhancing type safety and readability in code.

### A SIMPLE ENUM EXAMPLE

Enums are declared using the `enum` keyword. Each constant within an enum is implicitly a public static final instance of the enum type.

```java
public enum Day {
    SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY
}
```

### ENUM DECLARATIONS

Enums can have fields, constructors, and methods like regular classes. They cannot be instantiated using `new` and can implement interfaces but cannot extend other classes.

```java
public enum Day {
    SUNDAY("Sun"), 
    MONDAY("Mon"), 
    TUESDAY("Tue"), 
    WEDNESDAY("Wed"), 
    THURSDAY("Thu"), 
    FRIDAY("Fri"), 
    SATURDAY("Sat");
    
    private String abbreviation;
    
    private Day(String abbreviation) {
        this.abbreviation = abbreviation;
    }
    
    public String getAbbreviation() {
        return abbreviation;
    }
}
```

### ENUM CONSTANT DECLARATIONS

Enum constants are declared at the beginning of the enum declaration. Each constant is an instance of the enum type and is comma-separated.

```java
public enum Season {
    WINTER, SPRING, SUMMER, FALL
}
```

### JAVA.LANG.ENUM

All enums implicitly extend the `java.lang.Enum` class, which provides useful methods like `values()`, `valueOf(String name)`, and `ordinal()`.

```java
public class EnumExample {
    public static void main(String[] args) {
        Day[] days = Day.values();
        
        for (Day day : days) {
            System.out.println(day + " abbreviation: " + day.getAbbreviation());
        }
        
        Day monday = Day.valueOf("MONDAY");
        System.out.println("MONDAY ordinal: " + monday.ordinal());
    }
}
```

### TO ENUM OR NOT

Use enums when you have a fixed set of related constants that won't change at runtime. They provide type safety, readability, and can simplify code maintenance. Avoid enums if the set of constants is not clearly defined or if they are mutable.

This manual provides a comprehensive overview of enumeration types (enums) in Java, covering enum declarations, enum constant declarations, `java.lang.Enum` class, and guidelines for when to use enums. For more detailed information, refer to the Java documentation and additional resources.
