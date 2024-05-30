# Named requirements
In C++, "Named Requirements" refer to a set of specifications or constraints placed on template parameters in order to use certain standard library algorithms and components effectively. Named requirements help ensure that template parameters meet specific criteria, allowing them to be used interchangeably in generic code without sacrificing functionality or efficiency. Here are some commonly used Named Requirements in C++:

1. **EqualityComparable**: A type that supports the `==` and `!=` operators for comparison. This requirement allows objects of the type to be compared for equality.

2. **LessThanComparable**: A type that supports the `<` operator for comparison. This requirement allows objects of the type to be ordered in a sequence.

3. **CopyAssignable**: A type that can be assigned to from another object of the same type. This requirement allows objects of the type to be copied.

4. **CopyConstructible**: A type that can be constructed from another object of the same type. This requirement allows objects of the type to be copied using copy constructors.

5. **MoveAssignable**: A type that can be assigned to from an rvalue of the same type. This requirement allows objects of the type to be moved.

6. **MoveConstructible**: A type that can be constructed from an rvalue of the same type. This requirement allows objects of the type to be moved using move constructors.

7. **Destructible**: A type that can be destroyed using its destructor. This requirement ensures that objects of the type can be properly cleaned up when they are no longer needed.

8. **DefaultConstructible**: A type that can be constructed without any arguments. This requirement allows objects of the type to be default-initialized.

9. **Swappable**: A type that can be swapped with another object of the same type using the `std::swap` function. This requirement allows objects of the type to be efficiently exchanged.

10. **Hashable**: A type for which a hash function is defined, typically required for types used as keys in associative containers like `std::unordered_map` or `std::unordered_set`.

These Named Requirements serve as contracts that template parameters must fulfill in order to be compatible with various standard library algorithms and containers. By adhering to these requirements, C++ programmers can write generic code that is both flexible and efficient, leveraging the full power of the standard library.
