# Feature test macros (C++20)

In C++, feature test macros are preprocessor directives used to check for the availability of specific language and library features at compile-time. They allow programmers to conditionally compile code based on the availability of certain features, ensuring compatibility across different compilers and versions of the language standard.

With the introduction of C++20, feature test macros have become increasingly important due to the continuous evolution of the language. Here's how feature test macros work in C++20:

1. **Header Files**: Feature test macros are typically defined before including any standard library headers. This ensures that the macros are evaluated before any feature-dependent code is encountered.

2. **Standard Macros**: C++20 introduces a set of standard macros that can be used to check for the availability of specific language and library features. These macros are defined in the `<version>` header.

3. **__cplusplus Macro**: The `__cplusplus` macro is commonly used to check the version of the C++ standard being used by the compiler. In C++20, its value is `202002L`.

4. **Feature Test Macros**: C++20 introduces new macros for checking the availability of features introduced in the standard. For example:
   - `__cpp_concepts` to check for Concepts support.
   - `__cpp_modules` to check for Modules support.
   - `__cpp_coroutines` to check for Coroutines support.
   - `__cpp_constexpr_dynamic_alloc` to check for dynamic memory allocation support in constexpr functions.

5. **Usage**: Feature test macros are typically used in conditional compilation directives such as `#ifdef` and `#if`. For example:
   ```cpp
   #include <iostream>
   #ifdef __cpp_concepts
   // Code that uses Concepts
   #else
   // Fallback code for compilers without Concepts support
   #endif
   ```

6. **Compiler Flags**: In addition to feature test macros, compiler flags can also be used to enable or disable specific features. Feature test macros provide a more granular and portable way of checking for feature availability.

By using feature test macros, C++ programmers can write code that gracefully handles variations in compiler support for language and library features. This helps ensure that code remains compatible across different environments and versions of the language standard, facilitating easier maintenance and portability.
