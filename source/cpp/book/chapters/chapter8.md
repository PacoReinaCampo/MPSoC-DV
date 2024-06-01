# Memory management library

The Memory Management library in C++ offers a set of tools for efficient and safe management of memory resources. Let's explore the components you've mentioned:

## unique_ptr (C++11)

`std::unique_ptr` is a smart pointer introduced in C++11 that provides exclusive ownership semantics. It manages dynamically allocated objects and automatically releases the memory when the pointer goes out of scope or is explicitly reset. Unique pointers cannot be copied but can be moved, ensuring exclusive ownership of the managed resource.

## shared_ptr (C++11)

`std::shared_ptr` is another smart pointer introduced in C++11 that implements shared ownership semantics. Multiple `shared_ptr` instances can point to the same dynamically allocated object, and the memory is automatically deallocated when the last `shared_ptr` pointing to it is destroyed. It keeps track of the number of references through a control block, allowing for safe sharing of resources.

## weak_ptr (C++11)

`std::weak_ptr` is a companion to `std::shared_ptr` introduced in C++11. It provides a non-owning weak reference to an object managed by `std::shared_ptr`. Unlike `std::shared_ptr`, `std::weak_ptr` does not contribute to the reference count of the managed object, preventing cyclic dependencies and memory leaks. It is typically used to break circular references in data structures.

## Memory resources (C++17)

The Memory Resources feature introduced in C++17 provides a flexible mechanism for customizing memory allocation behavior. It allows developers to specify custom memory allocation strategies, such as memory pools or specialized allocators, to better suit the requirements of their applications. Memory resources are used in conjunction with memory containers like `std::pmr::vector` and `std::pmr::string`.

## Allocators - Low level management

Allocators in C++ provide a low-level interface for managing memory allocation and deallocation. They abstract away the details of memory management and allow containers and other data structures to be decoupled from specific memory allocation strategies. C++ standard library containers can be customized with user-defined allocators to control how memory is allocated and deallocated for their elements.

Together, these components of the Memory Management library in C++ offer a comprehensive suite of tools for managing memory efficiently, safely, and flexibly in C++ programs. They promote best practices such as resource ownership semantics, memory sharing, and customizable allocation strategies, contributing to robust and reliable software development.
