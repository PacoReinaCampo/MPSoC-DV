# DATA MODEL

The Python data model describes the structure of Python programs. It defines how objects behave, how they interact, and how various operations are performed. This model underpins many of Python's features, making it essential to understand for writing effective and idiomatic Python code.

## OBJECTS, VALUES, AND TYPES

In Python, everything is an object. Each object has:

- **Identity**: A unique identifier for the object, which can be obtained using the `id()` function.
- **Type**: Defines the kind of object, obtained using the `type()` function. It determines the object's behavior and the operations that can be performed on it.
- **Value**: The data contained in the object.

```python
x = 42
print(id(x))    # Identity: unique identifier of the object
print(type(x))  # Type: <class 'int'>
print(x)        # Value: 42
```

## THE STANDARD TYPE HIERARCHY

Python's type system is organized into a hierarchy of built-in types. Some of the key categories include:

1. **None Type**: Represents the absence of a value.
 
    ```python
    none_value = None
    ```

2. **Numeric Types**: Include integers (`int`), floating-point numbers (`float`), complex numbers (`complex`), and booleans (`bool`).
 
    ```python
    integer = 10
    floating = 3.14
    complex_num = 1 + 2j
    boolean = True
    ```

3. **Sequence Types**: Include strings (`str`), lists (`list`), tuples (`tuple`), and ranges (`range`).
 
    ```python
    string = "Hello"
    list_example = [1, 2, 3]
    tuple_example = (4, 5, 6)
    range_example = range(10)
    ```

4. **Mapping Types**: Include dictionaries (`dict`).
 
    ```python
    dictionary = {'key': 'value'}
    ```

5. **Set Types**: Include sets (`set`) and frozen sets (`frozenset`).
 
    ```python
    set_example = {1, 2, 3}
    frozenset_example = frozenset([4, 5, 6])
    ```

6. **Callables**: Include functions, methods, and classes.
 
    ```python
    def function_example():
        pass

    class ClassExample:
        pass

    instance = ClassExample()
    ```

7. **Modules**: Provide namespaces containing definitions and implementations of functions, variables, and classes.
 
    ```python
    import math
    ```

8. **Classes and Instances**: Define new types.
 
    ```python
    class MyClass:
        def __init__(self, value):
            self.value = value

    instance = MyClass(10)
    ```

## SPECIAL METHOD NAMES

Special method names (also known as "magic methods" or "dunder methods") enable the customization of object behavior in Python. They are surrounded by double underscores. Some common special methods include:

- **`__init__`**: Constructor, called when a new instance is created.
 
    ```python
    class MyClass:
        def __init__(self, value):
            self.value = value
    ```

- **`__str__` and `__repr__`**: String representation of the object.
 
    ```python
    class MyClass:
        def __str__(self):
            return f"MyClass with value {self.value}"
    
        def __repr__(self):
            return f"MyClass({self.value})"
    ```

- **`__len__`**: Defines behavior for the `len()` function.
 
    ```python
    class MyList:
        def __init__(self, items):
            self.items = items

        def __len__(self):
            return len(self.items)
    ```

- **`__getitem__`, `__setitem__`, and `__delitem__`**: Indexing behavior.
 
    ```python
    class MyList:
        def __init__(self):
            self.data = []

        def __getitem__(self, index):
            return self.data[index]

        def __setitem__(self, index, value):
            self.data[index] = value

        def __delitem__(self, index):
            del self.data[index]
    ```

- **`__iter__` and `__next__`**: Iterator protocol.
 
    ```python
    class MyRange:
        def __init__(self, start, end):
            self.current = start
            self.end = end

        def __iter__(self):
            return self

        def __next__(self):
            if self.current >= self.end:
                raise StopIteration
            self.current += 1
            return self.current - 1
    ```

## COROUTINES

Coroutines are a type of function that allow for cooperative multitasking, enabling a function to pause its execution and yield control back to the caller, potentially resuming at a later point. They are defined using `async def` and can use `await` to pause execution until a result is available.

1. **Defining a Coroutine**:

    ```python
    import asyncio

    async def example_coroutine():
        print("Hello")
        await asyncio.sleep(1)
        print("World")
    ```

2. **Running Coroutines**:
    Coroutines are run using an event loop.
 
    ```python
    asyncio.run(example_coroutine())
    ```

3. **Using `await`**:
    Inside a coroutine, `await` is used to pause execution until another coroutine completes.
 
    ```python
    async def main():
        await example_coroutine()

    asyncio.run(main())
    ```

4. **Combining Coroutines**:
    Multiple coroutines can be combined and run concurrently using `asyncio.gather`.
 
    ```python
    async def coroutine_one():
        await asyncio.sleep(1)
        return 1

    async def coroutine_two():
        await asyncio.sleep(2)
        return 2

    async def main():
        results = await asyncio.gather(coroutine_one(), coroutine_two())
        print(results)

    asyncio.run(main())
    ```

Understanding Python's data model, including its object types, type hierarchy, special method names, and coroutines, provides a solid foundation for writing powerful and flexible code.
