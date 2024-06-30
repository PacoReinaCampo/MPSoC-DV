# STATEMENTS

## SIMPLE AND COMPOUND STATEMENTS - SEQUENCES OF STATEMENTS

### Simple Statements

Simple statements in Ada are basic executable units terminated by a semicolon (`;`). Examples include assignments, procedure calls, and null statements.

```ada
X := 10;
Put_Line("Hello, World!");
```

### Compound Statements

Compound statements in Ada are sequences of statements enclosed in `begin ... end` blocks. They allow grouping multiple statements into a single executable unit.

```ada
begin
    X := X + 1;
    Y := Y * 2;
end;
```

## ASSIGNMENT STATEMENTS

Assignment statements in Ada assign values to variables or components.

```ada
X := 42;
Array_Name(Index) := Value;
Record_Name.Component := Expression;
```

## IF STATEMENTS

If statements in Ada conditionally execute blocks of statements based on a Boolean expression.

```ada
if Condition then
    -- statements
elsif Other_Condition then
    -- statements
else
    -- statements
end if;
```

## CASE STATEMENTS

Case statements in Ada select one of several alternatives based on the value of an expression.

```ada
case Selector is
    when Choice1 =>
        -- statements
    when Choice2 =>
        -- statements
    when others =>
        -- statements
end case;
```

## LOOP STATEMENTS

### User-Defined Iterator Types

Loop statements in Ada iterate over a sequence of statements.

```ada
for I in 1 .. 10 loop
    -- statements
end loop;
```

### Generalized Loop Iteration

Generalized loop iteration in Ada allows iterating over collections and sequences.

```ada
for Item of Collection loop
    -- statements
end loop;
```

## BLOCK STATEMENTS

Block statements in Ada define scopes for local declarations and executable statements.

```ada
declare
    -- local declarations
begin
    -- statements
end;
```

## EXIT STATEMENTS

Exit statements in Ada prematurely terminate loops or blocks.

```ada
loop
    exit when Condition;
    -- statements
end loop;
```

## GOTO STATEMENTS

Goto statements in Ada transfer control to a labeled statement.

```ada
goto Label_Name;
...
Label_Name:
    -- statements
```

This manual outline covers the detailed aspects of statements in the Ada programming language, including simple and compound statements, assignment statements, control flow statements like if and case, loop statements, block statements, exit statements, and goto statements. Each section can be expanded with specific syntax rules, examples, and further details as needed.

