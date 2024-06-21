# COMPOUND STATEMENTS

Compound statements in Python are blocks of code that control the flow of execution through conditional branching, looping, exception handling, context management, and defining new functions and classes. Let's explore each type of compound statement.

## THE `IF` STATEMENT

The `if` statement allows conditional execution of code blocks.

```python
if condition:
    # Code block to execute if condition is true
elif another_condition:
    # Code block to execute if another_condition is true
else:
    # Code block to execute if no condition is true
```

```python
x = 10
if x > 0:
    print("Positive")
elif x == 0:
    print("Zero")
else:
    print("Negative")
```

## THE `WHILE` STATEMENT

The `while` statement repeatedly executes a block of code as long as a condition is true.

```python
while condition:
    # Code block to execute repeatedly
```

```python
count = 0
while count < 5:
    print(count)
    count += 1
```

## THE `FOR` STATEMENT

The `for` statement iterates over the elements of a sequence (such as a list, tuple, or string).

```python
for variable in sequence:
    # Code block to execute for each element in sequence
```

```python
for i in range(5):
    print(i)
```

## THE `TRY` STATEMENT

The `try` statement handles exceptions that may occur in a block of code.

```python
try:
    # Code block where exceptions might occur
except ExceptionType as e:
    # Code block to handle the exception
else:
    # Code block to execute if no exceptions occur
finally:
    # Code block to execute no matter what
```

```python
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Cannot divide by zero!")
else:
    print("Division successful!")
finally:
    print("This will always execute")
```

## THE `WITH` STATEMENT

The `with` statement is used to wrap the execution of a block of code with methods defined by a context manager.

```python
with context_manager as variable:
    # Code block to execute within the context
```

```python
with open('file.txt', 'r') as file:
    content = file.read()
    print(content)
```

## THE `MATCH` STATEMENT

Introduced in Python 3.10, the `match` statement provides a way to perform pattern matching on values.

```python
match value:
    case pattern1:
        # Code block to execute if value matches pattern1
    case pattern2:
        # Code block to execute if value matches pattern2
    case _:
        # Code block to execute if no pattern matches (default case)
```

```python
def http_status(status):
    match status:
        case 200:
            return "OK"
        case 404:
            return "Not Found"
        case 500:
            return "Internal Server Error"
        case _:
            return "Unknown Status"

print(http_status(200))  # Prints "OK"
```

## FUNCTION DEFINITIONS

Functions are defined using the `def` keyword. They can take arguments and return values.

```python
def function_name(parameters):
    # Code block to execute
    return value
```

```python
def add(a, b):
    return a + b

result = add(3, 4)
print(result)  # Prints 7
```

## CLASS DEFINITIONS

Classes are defined using the `class` keyword and can include methods (functions defined within the class) and attributes (variables defined within the class).

```python
class ClassName:
    def __init__(self, parameters):
        # Initialization code
        self.attribute = value

    def method(self, parameters):
        # Method code
        return value
```

```python
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def greet(self):
        return f"Hello, my name is {self.name} and I am {self.age} years old."

person = Person("Alice", 30)
print(person.greet())  # Prints "Hello, my name is Alice and I am 30 years old."
```

## COROUTINES

Coroutines are special functions defined with `async def` and used for asynchronous programming. They allow execution to be paused and resumed.

```python
import asyncio

async def coroutine_name(parameters):
    # Code block to execute
    await another_coroutine()
```

```python
import asyncio

async def fetch_data():
    await asyncio.sleep(1)
    return "Data fetched"

async def main():
    result = await fetch_data()
    print(result)

asyncio.run(main())
```

## TYPE PARAMETER LISTS

Type parameter lists are used in the context of generic programming to specify type parameters for classes or functions.

```python
from typing import TypeVar, Generic

T = TypeVar('T')

class MyClass(Generic[T]):
    def __init__(self, value: T):
        self.value = value

def my_function(value: T) -> T:
    return value
```

```python
from typing import TypeVar, Generic

T = TypeVar('T')

class Box(Generic[T]):
    def __init__(self, content: T):
        self.content = content

    def get_content(self) -> T:
        return self.content

box = Box 
print(box.get_content())  # Prints 123
```

Understanding compound statements is essential for managing the flow of execution and organizing code in a readable and efficient manner. These statements form the core control structures and definition mechanisms in Python.
