# Containers library
The Containers library in C++ provides a wide range of data structures for storing and organizing collections of elements. Let's explore each component you've mentioned:

## vector − deque − array (C++11)
- **vector**: `std::vector` is a dynamic array that provides fast random access and efficient insertion/removal at the end. It dynamically allocates memory to store its elements and automatically resizes when necessary.
- **deque**: `std::deque` (double-ended queue) is a sequence container that allows efficient insertion and deletion at both ends. It provides constant time complexity for adding or removing elements at the beginning or end.
- **array**: `std::array` is a fixed-size array with a size known at compile-time. It provides similar functionality to built-in arrays but adds some additional features such as bounds checking.

## list − forward_list (C++11)
- **list**: `std::list` is a doubly linked list that allows efficient insertion and removal of elements anywhere in the container. It provides constant time complexity for insertion and removal but does not support random access.
- **forward_list**: `std::forward_list` is a singly linked list that allows efficient insertion and removal of elements at the beginning or after a specified element. It consumes less memory than `std::list` but provides similar functionality.

## map − multimap − set − multiset
- **map**: `std::map` is an associative container that stores key-value pairs in sorted order based on the keys. It allows fast lookup, insertion, and deletion of elements based on their keys.
- **multimap**: `std::multimap` is similar to `std::map` but allows duplicate keys. It maintains elements in sorted order based on keys.
- **set**: `std::set` is an associative container that stores unique elements in sorted order. It provides fast lookup, insertion, and deletion of elements.
- **multiset**: `std::multiset` is similar to `std::set` but allows duplicate elements.

## unordered_map (C++11) - unordered_multimap (C++11) - unordered_set (C++11) - unordered_multiset (C++11)
- **unordered_map**: `std::unordered_map` is an associative container that stores key-value pairs in an unordered manner, based on a hash table. It provides fast average constant-time complexity for lookup, insertion, and deletion.
- **unordered_multimap**: `std::unordered_multimap` is similar to `std::unordered_map` but allows duplicate keys.
- **unordered_set**: `std::unordered_set` is an unordered associative container that stores unique elements. It provides fast average constant-time complexity for lookup, insertion, and deletion.
- **unordered_multiset**: `std::unordered_multiset` is similar to `std::unordered_set` but allows duplicate elements.

## Container adaptors
Container adaptors are classes that provide a different interface to underlying containers, typically to restrict the operations that can be performed or to provide additional functionality. Examples include `std::stack`, `std::queue`, and `std::priority_queue`.

## span (C++20) - mdspan (C++23)
- **span**: `std::span` is a non-owning reference to a contiguous sequence of elements. It allows efficient access to elements of arrays, vectors, or other contiguous containers without owning the memory. It is useful for passing arrays to functions and for range-based operations.
- **mdspan**: `std::mdspan` (multi-dimensional span) is a proposed extension to C++ that provides support for multi-dimensional arrays. It extends the functionality of `std::span` to handle multi-dimensional arrays in a uniform and efficient manner.

These containers and adaptors in the C++ Containers library offer a wide range of choices for storing and organizing data, each with its own strengths and trade-offs. They provide efficient and flexible solutions for various programming tasks, enabling developers to write efficient and maintainable code.
