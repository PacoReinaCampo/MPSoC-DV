# Simple Statements

Simple statements are single-line statements that perform various operations. They are typically followed by a newline or a semicolon if multiple statements are on the same line.

## Expression Statements

Expression statements evaluate an expression and discard the result. They are often used to call functions or methods.

```python
print("Hello, World!")  # Expression statement
x + y  # An expression statement with no effect
```

## Assignment Statements

Assignment statements bind a name to an object or assign a new value to an existing name.

```python
x = 10  # Simple assignment
x, y = 5, 7  # Multiple assignment
x += 1  # Augmented assignment
```

## The `assert` Statement

The `assert` statement is used for debugging purposes. It tests an expression and triggers an `AssertionError` if the expression evaluates to `False`.

```python
assert 2 + 2 == 4  # No error
assert 2 + 2 == 5  # AssertionError
```

## The `pass` Statement

The `pass` statement is a no-operation statement. It is used as a placeholder in control structures or functions where code is syntactically required but not yet implemented.

```python
def empty_function():
    pass  # Placeholder for future code
```

## The `del` Statement

The `del` statement deletes names or items from a collection.

```python
x = [1, 2, 3]
del x[1]  # Deletes the second item, x becomes [1, 3]

y = 10
del y  # Deletes the name 'y'
```

## The `return` Statement

The `return` statement exits a function and optionally returns a value.

```python
def add(a, b):
    return a + b

result = add(3, 4)  # result is 7
```

## The `yield` Statement

The `yield` statement is used in a function to return a generator iterator. It allows the function to yield values one at a time, suspending its state between each yield.

```python
def generate_numbers():
    yield 1
    yield 2
    yield 3

for number in generate_numbers():
    print(number)
```

## The `raise` Statement

The `raise` statement is used to trigger an exception.

```python
raise ValueError("An error occurred")
```

## The `break` Statement

The `break` statement exits the nearest enclosing loop.

```python
for i in range(10):
    if i == 5:
        break
    print(i)  # Prints 0 to 4
```

## The `continue` Statement

The `continue` statement skips the rest of the current loop iteration and moves to the next iteration.

```python
for i in range(10):
    if i % 2 == 0:
        continue
    print(i)  # Prints odd numbers from 0 to 9
```

## The `import` Statement

The `import` statement is used to include modules in the current namespace.

```python
import math
print(math.sqrt(16))  # Prints 4.0

from math import sqrt
print(sqrt(16))  # Prints 4.0
```

## The `global` Statement

The `global` statement declares that a variable inside a function refers to a globally defined variable.

```python
x = 10

def modify_global():
    global x
    x = 20

modify_global()
print(x)  # Prints 20
```

## The `nonlocal` Statement

The `nonlocal` statement is used to declare that a variable refers to a variable in the nearest enclosing scope that is not global.

```python
def outer():
    x = 10

    def inner():
        nonlocal x
        x = 20

    inner()
    print(x)  # Prints 20

outer()
```

## The `type` Statement

While there isn't a `type` statement in Python, the `type` function is used to determine the type of an object or create a new type dynamically.

- **Determining the type**:
    ```python
    print(type(42))  # <class 'int'>
    print(type('Hello'))  # <class 'str'>
    ```

- **Creating a new type**:
    ```python
    MyClass = type('MyClass', (object,), {'attr': 42})
    instance = MyClass()
    print(instance.attr)  # Prints 42
    ```

Understanding simple statements and their usage is crucial for writing clear and effective Python code. These statements form the core constructs for controlling the flow and behavior of your programs.
