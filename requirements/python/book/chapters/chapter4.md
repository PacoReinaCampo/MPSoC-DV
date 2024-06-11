# EXECUTION MODEL

Python's execution model describes how code is structured, how names are associated with objects, and how exceptions are handled during program execution.

## STRUCTURE OF A PROGRAM

A Python program consists of various components organized in a specific manner. The structure typically includes:

1. **Modules**: The highest-level organizational unit in Python, each file containing Python code is a module.
2. **Statements**: The building blocks of Python code. Examples include assignments, loops, conditionals, and function definitions.
3. **Expressions**: Combinations of values and operators that compute to a value.
4. **Functions and Classes**: Define reusable blocks of code and custom data structures.
5. **Blocks and Indentation**: Python uses indentation to define blocks of code for functions, loops, conditionals, etc.

### Example of Program Structure

```python
# MODULE-LEVEL VARIABLES AND IMPORTS
import math

# FUNCTION DEFINITION
def calculate_area(radius):
    return math.pi * radius * radius

# CLASS DEFINITION
class Circle:
    def __init__(self, radius):
        self.radius = radius

    def area(self):
        return calculate_area(self.radius)

# MAIN BLOCK
if __name__ == "__main__":
    circle = Circle(5)
    print(f"Area of the circle: {circle.area()}")
```

## NAMING AND BINDING

Naming refers to the association between names (identifiers) and objects in Python. Binding is the process of associating a name with an object.

### Namespaces

A namespace is a collection of name-to-object mappings. Python has several namespaces:

- **Local**: Inside a function, includes local variables.
- **Enclosing**: In nested functions, refers to the namespace of the enclosing function.
- **Global**: At the module level, includes module-level variables and functions.
- **Built-in**: Includes built-in functions and exceptions.

### Scope

Scope defines the visibility of a name within a namespace. Python determines the scope of a name using the LEGB rule:

- **Local**: Names defined within a function.
- **Enclosing**: Names defined in the enclosing function's scope.
- **Global**: Names defined at the module level.
- **Built-in**: Predefined names in the Python interpreter.

### Binding Names

Binding names to objects occurs through assignments, function definitions, class definitions, and imports.

- **Assignments**:
    ```python
    x = 10  # Binds the name 'x' to the integer object 10
    ```

- **Function and Class Definitions**:
    ```python
    def func():
        pass  # Binds the name 'func' to the function object

    class MyClass:
        pass  # Binds the name 'MyClass' to the class object
    ```

- **Imports**:
    ```python
    import math  # Binds the name 'math' to the imported module
    ```

### Name Resolution

Python resolves names using the LEGB rule, searching through each namespace in order.

### Example

```python
x = 10  # Global scope

def outer():
    x = 20  # Enclosing scope

    def inner():
        x = 30  # Local scope
        print(x)  # Prints 30

    inner()
    print(x)  # Prints 20

outer()
print(x)  # Prints 10
```

## EXCEPTIONS

Exceptions are events that disrupt the normal flow of a program. Python uses exceptions to handle errors and other exceptional events.

### Handling Exceptions

Python uses `try` and `except` blocks to handle exceptions.

- **Basic Exception Handling**:
    ```python
    try:
        result = 10 / 0
    except ZeroDivisionError:
        print("Cannot divide by zero!")
    ```

- **Handling Multiple Exceptions**:
    ```python
    try:
        result = int("abc")
    except (ValueError, TypeError):
        print("Invalid input!")
    ```

- **Catching All Exceptions**:
    ```python
    try:
        result = 10 / 0
    except Exception as e:
        print(f"An error occurred: {e}")
    ```

### Raising Exceptions

You can raise exceptions using the `raise` statement.

- **Raising an Exception**:
    ```python
    raise ValueError("Invalid value")
    ```

### Custom Exceptions

You can define custom exceptions by subclassing the `Exception` class.

- **Defining a Custom Exception**:
    ```python
    class CustomError(Exception):
        pass

    raise CustomError("This is a custom error")
    ```

### Exception Propagation

Exceptions propagate up the call stack until they are caught by an exception handler. If no handler is found, the program terminates with a traceback.

### `finally` and `else` Clauses

- **`finally` Clause**: Executes code regardless of whether an exception occurred.
    ```python
    try:
        result = 10 / 0
    except ZeroDivisionError:
        print("Cannot divide by zero!")
    finally:
        print("This will always execute")
    ```

- **`else` Clause**: Executes code if no exception occurs.
    ```python
    try:
        result = 10 / 2
    except ZeroDivisionError:
        print("Cannot divide by zero!")
    else:
        print("Division successful!")
    ```

Understanding the execution model, including program structure, naming and binding, and exception handling, is crucial for writing robust and maintainable Python code.
