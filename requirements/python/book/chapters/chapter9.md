# TOP-LEVEL COMPONENTS

In Python, top-level components refer to the various ways in which Python code can be executed and interacted with, including complete programs, file input, interactive input, and expression input. Let’s explore each of these components.

## COMPLETE PYTHON PROGRAMS

Complete Python programs are scripts or modules that are executed from start to finish. These programs typically consist of a sequence of statements and definitions that are executed when the script is run.

Running a Script

You can run a complete Python program by executing a Python script file. For example, if you have a script named `script.py`, you can run it using the following command:

```bash
python script.py
```

Example Script

```python
# SCRIPT.PY
def main():
    print("Hello, World!")

if __name__ == "__main__":
    main()
```

In this example, the script defines a `main` function and calls it if the script is executed as the main module.

## FILE INPUT

File input involves reading code from a file and executing it. This is often done within a script or from an interactive Python session.

Reading and Executing a File

You can use the `exec` function to read and execute Python code from a file.

```python
# CONTENT OF EXAMPLE.PY
print("This code is from a file.")
```

```python
# MAIN SCRIPT
with open('example.py', 'r') as file:
    code = file.read()
    exec(code)
```

This script reads the contents of `example.py` and executes it using `exec`.

## INTERACTIVE INPUT

Interactive input allows users to enter Python commands directly into the Python interpreter. This is typically done in a Python shell or an interactive environment like IPython or Jupyter Notebook.

Python Shell

You can start an interactive Python session by simply running `python` in your terminal:

```bash
python
```

Example Interaction

```python
>>> x = 5
>>> y = 10
>>> print(x + y)
15
```

In this interactive session, you can enter and execute Python code line by line.

## EXPRESSION INPUT

Expression input refers to evaluating individual expressions and returning their results. This is commonly done in interactive environments or when using the `eval` function.

Using `eval`

The `eval` function takes a string containing a Python expression and evaluates it.

```python
expression = "3 + 4 * 2"
result = eval(expression)
print(result)  # Prints 11
```

Interactive Expression Evaluation

In an interactive session, you can evaluate expressions directly:

```python
>>> 3 + 4 * 2
11
```

Combining Components

You can combine these top-level components to create versatile and interactive Python programs. For instance, a script can read code from a file, execute it, and interact with the user based on the results of the execution.

Example Combined Script

```python
# COMBINED_SCRIPT.PY
def read_and_execute(filename):
    with open(filename, 'r') as file:
        code = file.read()
        exec(code)

def main():
    filename = input("Enter the filename to execute: ")
    read_and_execute(filename)
    expression = input("Enter an expression to evaluate: ")
    result = eval(expression)
    print(f"The result of the expression is: {result}")

if __name__ == "__main__":
    main()
```

In this combined script, the user is prompted to enter a filename, which is then read and executed. The user can then input an expression to be evaluated.

Understanding these top-level components is essential for effectively running and interacting with Python code in various contexts, from complete programs to interactive sessions.
