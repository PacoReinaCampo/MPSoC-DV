# LEXICAL ELEMENTS

## CHARACTER SET

Ada uses the ASCII character set, which includes characters from 0 to 127, providing support for uppercase letters, lowercase letters, digits, and special characters such as punctuation marks and symbols.

## LEXICAL ELEMENTS, SEPARATORS, AND DELIMITERS

Ada uses whitespace characters (space, tab, newline) as separators and delimiters. Additionally, the following characters serve as delimiters:

   * `,` (comma)
   * `.` (dot)
   * `:` (colon)
   * `;` (semicolon)
   * `(` and `)` (parentheses)
   * `[` and `]` (square brackets)
   * `{` and `}` (curly braces)

## IDENTIFIERS

Identifiers in Ada consist of letters, digits, and underscores (`_`), starting with a letter. They are case-insensitive. Examples include `Counter`, `MAX_SIZE`, and `my_variable`.

## NUMERIC LITERALS

### Decimal Literals

Decimal literals in Ada consist of digits (0-9) and can include underscores (`_`) for readability. Examples: `123`, `3_000_000`, `42_42_42`.

### Based Literals

Based literals in Ada are expressed in binary (`2#...#`), octal (`8#...#`), or hexadecimal (`16#...#`) formats. Example: `16#1A#` (hexadecimal).

## CHARACTER LITERALS

Character literals are enclosed in single quotes (`'`) and represent a single ASCII character. Examples: `'A'`, `'9'`, `'%'`.

## STRING LITERALS

String literals are sequences of characters enclosed in double quotes (`"`). They can span multiple lines using double quotes on each line. Example: `"Hello, World!"`.

## COMMENTS

Comments in Ada start with `--` and extend to the end of the line. They can be used for single-line comments. Example:

```ada
-- This is a comment in Ada
```
Ada also supports nested comments using `(* ... *)` for multi-line comments.

## PRAGMAS

Pragmas in Ada provide instructions to the compiler or linker, influencing program compilation or behavior. They are typically written as `pragma` followed by a keyword and optional parameters. Example:

```ada
pragma Task_Dispatching_Policy (FIFO_Within_Priorities);
```

## RESERVED WORDS

Reserved words in Ada are keywords that have special meaning and cannot be used as identifiers. Examples include `declare`, `begin`, `end`, `procedure`, `function`, `if`, `else`, `case`, `loop`, `while`, `for`, `and`, `or`, `not`, `type`, `subtype`, `is`, `null`, `exception`, `return`, `package`, `task`, `protected`, `private`, `with`, `use`, `interface`, `procedure`, `function`, `generic`, `task`, `body`, `in`, `out`, `access`, `new`, `reverse`, `range`, `delta`, `digits`, `of`, `mod`, `rem`, `exit`, `goto`, `raise`, `exception`, `all`, `some`, `abs`, `sqr`, `sqrt`, `exp`, `log`, `sin`, `cos`, `tan`, `arctan`, `succ`, `pred`, `min`, `max`, `rem`, `mod`, `abs`, `not`, `and`, `or`, `xor`, `function`, `procedure`, `entry`, `requeue`, `delay`, `until`, `select`, `when`, `others`, `abort`, `end`,

