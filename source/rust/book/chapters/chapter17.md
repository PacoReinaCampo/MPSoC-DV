# Object Oriented Programming Features of Rust
Let's delve into each aspect:

## Characteristics of Object-Oriented Languages
Object-oriented programming (OOP) languages typically exhibit several key characteristics, including:
- **Encapsulation:** Bundling data and methods that operate on that data into a single unit, called an object.
- **Inheritance:** Defining relationships between classes where one class can inherit properties and behavior from another.
- **Polymorphism:** The ability for objects of different types to be treated as objects of a common superclass.

While Rust is not a purely object-oriented language like Java or C++, it does support some object-oriented features. However, it takes a different approach to achieve similar goals using traits and trait objects.

## Using Trait Objects That Allow for Values of Different Types
In Rust, trait objects allow for dynamic dispatch, enabling you to work with values of different types that implement a common trait. This is similar to polymorphism in traditional OOP languages.

```rust
trait Shape {
    fn area(&self) -> f64;
}

struct Circle {
    radius: f64,
}

impl Shape for Circle {
    fn area(&self) -> f64 {
        std::f64::consts::PI * self.radius * self.radius
    }
}

struct Rectangle {
    width: f64,
    height: f64,
}

impl Shape for Rectangle {
    fn area(&self) -> f64 {
        self.width * self.height
    }
}

fn print_area(shape: &dyn Shape) {
    println!("Area: {}", shape.area());
}

fn main() {
    let circle = Circle { radius: 3.0 };
    let rectangle = Rectangle { width: 2.0, height: 4.0 };

    print_area(&circle);
    print_area(&rectangle);
}
```

In this example, both `Circle` and `Rectangle` implement the `Shape` trait, allowing them to be passed to the `print_area` function as trait objects (`&dyn Shape`).

## Implementing an Object-Oriented Design Pattern
Rust supports implementing object-oriented design patterns using traits and composition. For example, you can use the builder pattern to construct objects with complex initialization logic in a fluent and readable manner.

```rust
struct PersonBuilder {
    name: Option<String>,
    age: Option<u32>,
}

impl PersonBuilder {
    fn new() -> Self {
        Self {
            name: None,
            age: None,
        }
    }

    fn name(mut self, name: &str) -> Self {
        self.name = Some(name.to_string());
        self
    }

    fn age(mut self, age: u32) -> Self {
        self.age = Some(age);
        self
    }

    fn build(self) -> Person {
        Person {
            name: self.name.unwrap(),
            age: self.age.unwrap(),
        }
    }
}

struct Person {
    name: String,
    age: u32,
}

fn main() {
    let person = PersonBuilder::new()
        .name("Alice")
        .age(30)
        .build();

    println!("Name: {}, Age: {}", person.name, person.age);
}
```

In this example, the builder pattern is implemented using a builder struct (`PersonBuilder`) with methods to set each attribute of the target struct (`Person`). The `build` method constructs the final object with the specified attributes. This pattern allows for flexible and expressive object creation.
