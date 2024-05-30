# Data Types

## Primitive Data Types

### Integer Types
C provides several integer types to accommodate different ranges of values. These types vary in size and whether they can represent signed (both negative and positive) or unsigned (only non-negative) numbers.

- **char**: Typically 1 byte, can be signed or unsigned.
- **int**: Usually 4 bytes, can be signed or unsigned.
- **short**: Usually 2 bytes, can be signed or unsigned.
- **long**: At least 4 bytes, can be signed or unsigned.
- **long long**: At least 8 bytes, can be signed or unsigned.

Example:
```c
char c = 'A';
int num = 100;
short s = 50;
long l = 100000L;
long long ll = 10000000000LL;
unsigned int u = 200;
```

### Real Number Types
Real number types (floating-point types) are used to represent numbers with fractional parts.

- **float**: Single precision, usually 4 bytes.
- **double**: Double precision, usually 8 bytes.
- **long double**: Extended precision, size varies but at least 8 bytes.

Example:
```c
float f = 3.14f;
double d = 2.71828;
long double ld = 1.41421356237L;
```

### Complex Number Types
C99 introduced complex number types, but they're not part of the standard C library and require `<complex.h>`.

#### Standard Complex Number Types
- **float _Complex**
- **double _Complex**
- **long double _Complex**

Example:
```c
#include <complex.h>

float _Complex fc = 1.0 + 2.0*I;
double _Complex dc = 3.0 + 4.0*I;
long double _Complex ldc = 5.0 + 6.0*I;
```

#### GNU Extensions for Complex Number Types
GCC provides `__complex__` keyword as an extension.

Example:
```c
__complex__ float fc_gnu = 1.0 + 2.0*I;
__complex__ double dc_gnu = 3.0 + 4.0*I;
__complex__ long double ldc_gnu = 5.0 + 6.0*I;
```

## Enumerations

Enumerations (`enum`) are user-defined types consisting of a set of named integer constants.

### Defining Enumerations
```c
enum Color { RED, GREEN, BLUE };
```

### Declaring Enumerations
```c
enum Color favoriteColor;
```

## Unions

Unions are similar to structures, but all members share the same memory location. They are useful for saving memory when the value stored in the union will only be one of the types at any time.

### Defining Unions
```c
union Data {
    int i;
    float f;
    char str[20];
};
```

### Declaring Union Variables

#### Declaring Union Variables at Definition
```c
union Data {
    int i;
    float f;
    char str[20];
} data;
```

#### Declaring Union Variables After Definition
```c
union Data data;
```

#### Initializing Union Members
```c
data.i = 10;
```

### Accessing Union Members
```c
printf("%d", data.i);
```

### Size of Unions
The size of a union is the size of its largest member.

```c
printf("%lu", sizeof(union Data));
```

## Structures

Structures are user-defined data types that group different data types together.

### Defining Structures
```c
struct Person {
    char name[50];
    int age;
    float salary;
};
```

### Declaring Structure Variables

#### Declaring Structure Variables at Definition
```c
struct Person {
    char name[50];
    int age;
    float salary;
} person1, person2;
```

#### Declaring Structure Variables After Definition
```c
struct Person person1;
```

#### Initializing Structure Members
```c
struct Person person1 = {"John Doe", 30, 50000.0};
```

### Accessing Structure Members
```c
printf("Name: %s, Age: %d, Salary: %.2f", person1.name, person1.age, person1.salary);
```

### Bit Fields
Bit fields allow the packing of data in a structure, useful for memory-constrained applications.

```c
struct {
    unsigned int age : 3;
} Age;
```

### Size of Structures
The size of a structure is the sum of the sizes of its members, considering padding for alignment.

```c
printf("%lu", sizeof(struct Person));
```

## Arrays

Arrays are collections of elements of the same type stored in contiguous memory locations.

### Declaring Arrays
```c
int numbers[5];
```

### Initializing Arrays
```c
int numbers[5] = {1, 2, 3, 4, 5};
```

### Accessing Array Elements
```c
printf("%d", numbers[0]);
```

### Multidimensional Arrays
```c
int matrix[3][3] = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
};
```

### Arrays as Strings
```c
char str[] = "Hello, World!";
```

### Arrays of Unions
```c
union Data dataArr[5];
```

### Arrays of Structures
```c
struct Person people[5];
```

## Pointers

Pointers are variables that store the memory address of another variable.

### Declaring Pointers
```c
int *p;
```

### Initializing Pointers
```c
int var = 10;
int *p = &var;
```

### Pointers to Unions
```c
union Data data;
union Data *p = &data;
```

### Pointers to Structures
```c
struct Person person;
struct Person *p = &person;
```

## Incomplete Types
An incomplete type is a type that describes objects but lacks information to determine its size.

```c
struct Incomplete;
```

## Type Qualifiers
Type qualifiers add special properties to variables.

- **const**: Immutable data.
- **volatile**: Prevents optimization, indicating the variable can change unexpectedly.
- **restrict**: Pointer type qualifier to indicate no other pointer will access the same data.

Example:
```c
const int ci = 10;
volatile int vi;
int * restrict rp;
```

## Storage Class Specifiers
Storage class specifiers define the scope (visibility) and lifetime of variables/functions.

- **auto**: Default storage class for local variables.
- **register**: Hints to store the variable in a register.
- **static**: Preserves variable value across function calls, changes scope for global variables.
- **extern**: Declares a global variable or function in another file.

Example:
```c
static int count;
extern int globalVar;
```

## Renaming Types
The `typedef` keyword allows creating aliases for existing types.

```c
typedef unsigned long ulong;
ulong myVar;
```

These elements form the core of C's type system, enabling a wide range of data manipulations and operations in programs.
