# Programming in MATLAB

MATLAB offers a versatile environment for programming, enabling the creation of scripts, functions, live scripts, classes, and more. Here's a detailed guide on various programming aspects in MATLAB:

## Scripts

Scripts are files containing a sequence of MATLAB commands. They are useful for automating tasks that require a series of commands.

### Creating and Running Scripts

- **Creating a Script**:
  - Open MATLAB Editor.
  - Type the series of commands.
  - Save the file with a `.m` extension, e.g., `myScript.m`.

- **Running a Script**:
  ```matlab
  myScript;  % Run the script named myScript.m
  ```

Example:
```matlab
% myScript.m
x = linspace(0, 2*pi, 100);
y = sin(x);
plot(x, y);
title('Sine Wave');
```

## Functions

Functions are files that accept input arguments and return output arguments. They are useful for encapsulating reusable code.

### Creating and Using Functions

- **Defining a Function**:
  - Open MATLAB Editor.
  - Define the function using the `function` keyword.
  - Save the file with the function name and a `.m` extension, e.g., `myFunction.m`.

- **Function Syntax**:
  ```matlab
  function [out1, out2, ...] = functionName(in1, in2, ...)
      % Function body
  end
  ```

Example:
```matlab
% myFunction.m
function result = myFunction(a, b)
    result = a + b;
end
```

- **Calling a Function**:
  ```matlab
  result = myFunction(5, 3);  % Calls myFunction with inputs 5 and 3
  ```

## Live Scripts and Functions

Live scripts and functions combine code, output, and formatted text in an interactive environment. They have a `.mlx` extension.

### Creating Live Scripts and Functions

- **Creating a Live Script**:
  - Open MATLAB.
  - Select "New Live Script" from the Home tab.
  - Enter code, text, and equations interactively.

Example:
```matlab
% This is a live script with formatted text and code
a = 10;
b = 20;
result = myFunction(a, b);
disp(result);
```

## Classes

MATLAB supports object-oriented programming through classes, enabling the definition of objects with properties and methods.

### Defining and Using Classes

- **Defining a Class**:
  - Open MATLAB Editor.
  - Define the class using the `classdef` keyword.
  - Save the file with the class name and a `.m` extension, e.g., `MyClass.m`.

- **Class Syntax**:
  ```matlab
  classdef MyClass
      properties
          Property1
          Property2
      end
      methods
          function obj = MyClass(inputArg1, inputArg2)
              obj.Property1 = inputArg1;
              obj.Property2 = inputArg2;
          end
          function output = myMethod(obj, inputArg)
              output = obj.Property1 + inputArg;
          end
      end
  end
  ```

Example:
```matlab
% MyClass.m
classdef MyClass
    properties
        Value
    end
    methods
        function obj = MyClass(val)
            obj.Value = val;
        end
        function result = doubleValue(obj)
            result = obj.Value * 2;
        end
    end
end
```

- **Creating Objects and Calling Methods**:
  ```matlab
  obj = MyClass(10);
  result = obj.doubleValue();
  disp(result);
  ```

## Files and Folders

Managing files and folders is essential for organizing code and data.

### Working with Files and Folders

- **Listing Files and Folders**:
  ```matlab
  files = dir;  % List files and folders in the current directory
  ```

- **Changing Directories**:
  ```matlab
  cd('C:\path\to\folder');  % Change current directory
  ```

- **Creating and Removing Folders**:
  ```matlab
  mkdir('newFolder');  % Create a new folder
  rmdir('newFolder', 's');  % Remove a folder and its contents
  ```

## Code Execution

Executing MATLAB code can be done interactively or via scripts and functions.

### Interactive Execution

- **Command Window**:
  Type commands directly in the Command Window.

### Batch Execution

- **Scripts and Functions**:
  Run scripts and functions from the Command Window or using the `run` command.
  ```matlab
  run('myScript.m');  % Run a script
  ```

## Exception Handling

MATLAB provides error handling mechanisms to manage runtime errors.

### Try-Catch Blocks

- **Using Try-Catch**:
  ```matlab
  try
      % Code that may cause an error
      result = riskyFunction();
  catch ME
      % Handle the error
      disp('An error occurred:');
      disp(ME.message);
  end
  ```

Example:
```matlab
try
    result = 10 / 0;  % This will cause an error
catch ME
    disp('Caught an error:');
    disp(ME.message);
end
```

## Security in MATLAB Code

Ensuring the security of MATLAB code involves safeguarding against unauthorized access and malicious code execution.

### Security Practices

- **Avoid Using `eval`**:
  The `eval` function can execute arbitrary code and pose a security risk.
  ```matlab
  % Avoid this:
  eval('disp(''Hello World'')');
  
  % Use direct function calls instead:
  disp('Hello World');
  ```

- **Validate Inputs**:
  Validate input arguments to functions and scripts to prevent injection attacks.
  ```matlab
  function safeFunction(inputArg)
      validateattributes(inputArg, {'numeric'}, {'nonempty'});
      % Proceed with processing
  end
  ```

- **Use Access Control**:
  Control access to sensitive data and functions using private functions and properties.
  ```matlab
  classdef SecureClass
      properties (Access = private)
          SensitiveData
      end
      methods
          function obj = SecureClass(data)
              obj.SensitiveData = data;
          end
          function data = getSensitiveData(obj)
              data = obj.SensitiveData;
          end
      end
  end
  ```

By leveraging these programming features in MATLAB, you can write efficient, reusable, and secure code for a wide range of applications.
