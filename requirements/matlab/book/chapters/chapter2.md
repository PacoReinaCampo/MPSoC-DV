# Language Fundamentals in MATLAB

## Entering Commands

In MATLAB, commands can be entered directly into the Command Window or written in scripts and functions. Here's a guide on how to enter and execute commands effectively:

### Command Window

- **Simple Commands**: Type the command and press Enter.
  ```matlab
  x = 5 + 3;  % Adds 5 and 3 and assigns the result to x
  disp(x);    % Displays the value of x
  ```
- **Suppressing Output**: End the command with a semicolon (`;`) to suppress the output.
  ```matlab
  y = 10;  % No output will be displayed
  ```
- **Multi-line Commands**: Use `...` to continue a command on the next line.
  ```matlab
  z = 1 + 2 + 3 ...
      + 4 + 5;
  ```

## Matrices and Arrays

MATLAB excels at matrix and array operations. Here’s how to create and manipulate them:

### Creating Matrices and Arrays

- **Row Vector**:
  ```matlab
  rowVector = [1, 2, 3, 4, 5];
  ```
- **Column Vector**:
  ```matlab
  colVector = [1; 2; 3; 4; 5];
  ```
- **Matrix**:
  ```matlab
  matrixA = [1, 2, 3; 4, 5, 6; 7, 8, 9];
  ```

### Array Operations

- **Element-wise Operations**:
  ```matlab
  A = [1, 2, 3];
  B = [4, 5, 6];
  C = A .* B;  % Element-wise multiplication
  ```
- **Matrix Multiplication**:
  ```matlab
  D = A * B';  % Matrix multiplication, B' is the transpose of B
  ```

## Data Types

MATLAB supports various data types:

### Numeric Types

- **Integers**:
  ```matlab
  intVar = int32(10);  % 32-bit integer
  ```
- **Floating-point**:
  ```matlab
  floatVar = 10.5;  % Double precision by default
  ```

### Non-numeric Types

- **Characters and Strings**:
  ```matlab
  charVar = 'Hello';
  stringVar = "Hello World";  % String array
  ```
- **Logical**:
  ```matlab
  logicalVar = true;
  ```

### Arrays and Structures

- **Cell Arrays**:
  ```matlab
  cellArray = {1, 'text', [1, 2, 3]};
  ```
- **Structures**:
  ```matlab
  structVar.name = 'John';
  structVar.age = 30;
  ```

## Operators and Elementary Operations

MATLAB provides a variety of operators for performing calculations and data manipulations:

### Arithmetic Operators

- **Addition**: `+`
- **Subtraction**: `-`
- **Multiplication**: `*`
- **Division**: `/`
- **Element-wise operations**: `.*`, `./`, `.^`

### Relational Operators

- **Equal to**: `==`
- **Not equal to**: `~=`
- **Greater than**: `>`
- **Less than**: `<`
- **Greater than or equal to**: `>=`
- **Less than or equal to**: `<=`

### Logical Operators

- **AND**: `&`
- **OR**: `|`
- **NOT**: `~`
- **Short-circuit AND**: `&&`
- **Short-circuit OR**: `||`

### Examples

```matlab
a = 5;
b = 3;
sum = a + b;
product = a * b;
isEqual = (a == b);  % Returns false
logicalAnd = (a > 4) && (b < 4);  % Returns true
```

## Loops and Conditional Statements

Control flow in MATLAB is managed through loops and conditional statements.

### Conditional Statements

- **If-Else**:
  ```matlab
  if a > b
      disp('a is greater than b');
  elseif a < b
      disp('a is less than b');
  else
      disp('a is equal to b');
  end
  ```

- **Switch-Case**:
  ```matlab
  switch a
      case 1
          disp('a is 1');
      case 2
          disp('a is 2');
      otherwise
          disp('a is something else');
  end
  ```

### Loops

- **For Loop**:
  ```matlab
  for i = 1:10
      disp(i);
  end
  ```

- **While Loop**:
  ```matlab
  i = 1;
  while i <= 10
      disp(i);
      i = i + 1;
  end
  ```

- **Break and Continue**:
  ```matlab
  for i = 1:10
      if i == 5
          break;  % Exit the loop
      end
      disp(i);
  end

  for i = 1:10
      if i == 5
          continue;  % Skip the rest of the code in this iteration
      end
      disp(i);
  end
  ```

By mastering these fundamentals, you can begin to leverage MATLAB's powerful capabilities for a wide range of mathematical and engineering applications.
