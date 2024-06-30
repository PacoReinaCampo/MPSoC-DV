# TASKS AND SYNCHRONIZATION

## TASK UNITS AND TASK OBJECTS

### Task Units

Task units in Ada are independently executing units of concurrent execution.

```ada
task My_Task;
```

### Task Objects

Task objects in Ada represent instances of tasks and are created by task activation.

```ada
T : My_Task;
```

## TASK EXECUTION - TASK ACTIVATION

### Task Execution

Task execution in Ada involves the concurrent execution of tasks according to their scheduling policy.

```ada
task body My_Task is
begin
    -- Task execution code
end My_Task;
```

### Task Activation

Task activation in Ada initiates the execution of a task body.

```ada
T : My_Task;
```

## TASK DEPENDENCE - TERMINATION OF TASKS

### Task Dependence

Task dependence in Ada specifies relationships between tasks based on synchronization primitives.

```ada
task A;
task B;
...

A : task := (entry Point => B.Do_Something);
```

### Termination of Tasks

Tasks in Ada terminate when their task body completes execution or when explicitly aborted.

```ada
task body My_Task is
begin
    -- Task execution code
end My_Task;
```

## PROTECTED UNITS AND PROTECTED OBJECTS

### Protected Units

Protected units in Ada provide synchronized access to shared data among tasks.

```ada
protected type Buffer is
    procedure Put (Item : in Integer);
    function Get return Integer;
private
    Data : Integer;
end Buffer;
```

### Protected Objects

Protected objects in Ada encapsulate shared data and synchronize access to it using protected operations.

```ada
protected body Buffer is
    procedure Put (Item : in Integer) is
    begin
        Data := Item;
    end Put;
    
    function Get return Integer is
    begin
        return Data;
    end Get;
end Buffer;
```

## INTERTASK COMMUNICATION

### Protected Subprograms and Protected Actions

Protected subprograms and actions in Ada are procedures and functions declared within a protected unit that can only be accessed by tasks through the protected operations.

```ada
protected type Shared_Data is
    procedure Update (New_Value : in Integer);
    function Retrieve return Integer;
private
    Value : Integer := 0;
end Shared_Data;
```

### Entries and Accept Statements

Entries and accept statements in Ada provide a way for tasks to synchronize through protected objects.

```ada
protected type Counter is
    entry Increment;
    entry Reset;
private
    Count : Integer := 0;
end Counter;
```

### Entry Calls

Entry calls in Ada allow tasks to invoke protected operations.

```ada
protected body Counter is
    entry Increment when Count < 10 is
    begin
        Count := Count + 1;
    end Increment;

    entry Reset when Count > 0 is
    begin
        Count := 0;
    end Reset;
end Counter;
```

### Requeue Statements

Requeue statements in Ada allow entries to transfer control to another entry within the same protected unit.

```ada
protected body Counter is
    entry Increment when Count < 10 is
    begin
        Count := Count + 1;
        if Count = 5 then
            requeue Reset;
        end if;
    end Increment;

    entry Reset when Count > 0 is
    begin
        Count := 0;
    end Reset;
end Counter;
```

## DELAY STATEMENTS, DURATION, AND TIME

### Delay Statements

Delay statements in Ada suspend task execution for a specified period.

```ada
delay 1.0; -- Delay for 1 second
```

### Formatting, Time Zones, and Other Operations for Time

Ada provides facilities for formatting, time zones, and various operations related to time.

```ada
with Ada.Calendar.Formatting;
...
Current_Time : Ada.Calendar.Time := Ada.Calendar.Clock;
```

## SELECT STATEMENTS

### Selective Accept

Selective accept statements in Ada allow tasks to wait for multiple events using select statements.

```ada
select
    Buffer.Put(Item);
    -- Process item
or
    Counter.Increment;
    -- Increment counter
end select;
```

### Timed Entry Calls

Timed entry calls in Ada allow tasks to wait for entry calls with a timeout.

```ada
select
    Counter.Increment;
or
    delay 1.0;
end select;
```

### Conditional Entry Calls

Conditional entry calls in Ada allow tasks to check conditions before calling entries.

```ada
select
    Counter.Increment when Count < 10;
or
    delay 1.0;
end select;
```

### Asynchronous Transfer of Control

Asynchronous transfer of control in Ada allows tasks to transfer control to another task without blocking.

```ada
select
    accept Increment;
or
    abort;  -- Asynchronous transfer of control
end select;
```

## ABORT OF A TASK - ABORT OF A SEQUENCE OF STATEMENTS

### Abort of a Task

Aborting a task in Ada terminates its execution prematurely.

```ada
task body My_Task is
begin
    loop
        delay 1.0;
        exit when Some_Condition;
    end loop;
end My_Task;
```

### Abort of a Sequence of Statements

Aborting a sequence of statements in Ada terminates the execution of statements within a block or loop.

```ada
begin
    ...
    abort;  -- Abort statement
end;
```

## TASK AND ENTRY ATTRIBUTES

### Task and Entry Attributes

Task and entry attributes in Ada provide runtime information about tasks and entries.

```ada
T : My_Task;
E : My_Task.Entry_Id;
...

if T'Running then
    -- Task is running
end if;

if E'Callable then
    -- Entry is callable
end if;
```

## SHARED VARIABLES

### Shared Variables
Shared variables in Ada are variables accessed concurrently by multiple tasks.

```ada
Shared_Variable : Integer;
```

## EXAMPLE OF TASKING AND SYNCHRONIZATION

### Example

An example illustrating tasking and synchronization in Ada.

```ada
task type Producer;
task type Consumer;

protected Buffer is
    entry Insert (Item : in Integer);
    entry Remove return Integer;
private
    Data : Integer;
end Buffer;

protected body Buffer is
    entry Insert (Item : in Integer) when Data = 0 is
    begin
        Data := Item;
    end Insert;

    entry Remove return Integer when Data /= 0 is
        Result : Integer := Data;
    begin
        Data := 0;
        return Result;
    end Remove;
end Buffer;

task body Producer is
begin
    loop
        delay 1.0;
        Buffer.Insert(42);
    end loop;
end Producer;

task body Consumer is
begin
    loop
        delay 2.0;
        Put_Line(Integer'Image(Buffer.Remove));
    end loop;
end Consumer;

```

This manual outline covers the detailed aspects of tasks and synchronization in the Ada programming language, including task units and objects, task execution and activation, task dependence and termination, protected units and objects for synchronization, intertask communication using entries and accept statements, delay statements and time operations, select statements for event handling, abort mechanisms, task and entry attributes, shared variables, and an example illustrating tasking and synchronization. Each section can be expanded with specific syntax rules, examples, and further details as needed.

