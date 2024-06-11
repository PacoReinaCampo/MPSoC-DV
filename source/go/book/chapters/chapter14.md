# EMBEDDING

Embedding in Go is a powerful feature that allows one struct type to include another struct type as a field, effectively inheriting its properties and behaviors. It is a way to achieve composition and reuse code without using traditional inheritance found in object-oriented languages.

## STRUCT EMBEDDING

In Go, struct embedding is achieved by declaring a field of one struct type within another struct type, without specifying a field name. This creates an anonymous field, and the fields and methods of the embedded type become part of the embedding struct.

```go
type Person struct {
  FirstName string
  LastName  string
}

type Employee struct {
  Person // Embedded struct
  EmployeeID int
}
```

In this example, the `Employee` struct embeds the `Person` struct anonymously. This means that an `Employee` object inherits the fields (`FirstName` and `LastName`) and methods of the `Person` struct.

## ACCESSING EMBEDDED FIELDS AND METHODS

Embedded fields and methods are promoted to the embedding struct, meaning they can be accessed directly from the embedding struct without prefixing them with the embedded type's name.

```go
func main() {
  emp := Employee{
    Person: Person{
      FirstName: "John",
      LastName:  "Doe",
    },
    EmployeeID: 12345,
  }

  fmt.Println(emp.FirstName) // Accessing embedded field
}
```

In this example, the `FirstName` field of the `Person` struct is accessed directly from an `Employee` object.

## METHOD OVERRIDING

If the embedding struct declares a method with the same name as a method in the embedded struct, the method in the embedding struct overrides the method in the embedded struct. This allows for method customization and specialization.

```go
func (p Person) FullName() string {
  return p.FirstName + " " + p.LastName
}

func (e Employee) FullName() string {
  return e.FirstName + " " + e.LastName + " (Employee)"
}
```

Here, the `FullName` method is overridden in the `Employee` struct to include an additional designation.

## EMBEDDING INTERFACES

Interfaces can also be embedded within other interfaces or structs. When a struct embeds an interface, it implicitly implements that interface if it provides implementations for all the methods defined in the embedded interface.

```go
type Reader interface {
  Read() string
}

type FileReader struct {
  Reader // Embedding the Reader interface
}

func (f FileReader) Read() string {
  return "Reading file..."
}
```

In this example, `FileReader` implicitly implements the `Reader` interface by providing an implementation for the `Read` method.

Embedding in Go promotes code reuse, composition, and flexibility, enabling developers to build modular and maintainable software systems. It is a key feature of Go's design philosophy, which emphasizes simplicity, clarity, and efficiency.
