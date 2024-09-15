# COLLECTIONS

Collections in Java provide a framework of classes and interfaces for storing and manipulating groups of data elements.

### ITERATION

Iteration over collections is typically done using iterators or enhanced for loops (for-each):

```java
List<String> list = new ArrayList<>();
list.add("apple");
list.add("banana");

// Using iterator
Iterator<String> iterator = list.iterator();
while (iterator.hasNext()) {
    String fruit = iterator.next();
    System.out.println(fruit);
}

// Using enhanced for loop
for (String fruit : list) {
    System.out.println(fruit);
}
```

### ORDERING WITH COMPARABLE AND COMPARATOR

Objects can be ordered using the `Comparable` interface (natural ordering) or `Comparator` interface (custom ordering):

```java
public class Fruit implements Comparable<Fruit> {
    private String name;

    @Override
    public int compareTo(Fruit other) {
        return this.name.compareTo(other.name);
    }
}
```

### THE COLLECTION INTERFACE

The `Collection` interface is the root interface in the collection hierarchy, providing basic operations for collections:

```java
public interface Collection<E> {
    boolean add(E element);
    boolean remove(Object o);
    boolean contains(Object o);
    int size();
}
```

### SET AND SORTEDSET

   * **`Set`**: A collection that does not allow duplicate elements.
   * **`SortedSet`**: A set that maintains elements in ascending order.

```java
Set<String> set = new HashSet<>();
set.add("apple");
set.add("banana");
```

### LIST

   * **`List`**: An ordered collection (allowing duplicate elements) with index-based access.

```java
List<String> list = new ArrayList<>();
list.add("apple");
list.add("banana");
String fruit = list.get(0); // Accessing element
```

### QUEUE

   * **`Queue`**: A collection designed for holding elements prior to processing, typically using FIFO (First-In-First-Out) order.

```java
Queue<String> queue = new LinkedList<>();
queue.offer("apple");
queue.offer("banana");
String first = queue.poll(); // Retrieving and removing the head of the queue
```

### MAP AND SORTEDMAP

   * **`Map`**: An object that maps keys to values (no duplicate keys).
   * **`SortedMap`**: A map that maintains its keys in ascending order.

```java
Map<String, Integer> map = new HashMap<>();
map.put("apple", 10);
map.put("banana", 5);
int count = map.get("apple"); // Retrieving value
```

### ENUM COLLECTIONS

Java provides specialized collections for handling enums, such as `EnumSet` and `EnumMap`:

```java
EnumSet<DayOfWeek> days = EnumSet.allOf(DayOfWeek.class);
EnumMap<DayOfWeek, String> dayMap = new EnumMap<>(DayOfWeek.class);
dayMap.put(DayOfWeek.MONDAY, "Monday");
```

### WRAPPED COLLECTIONS AND THE COLLECTIONS CLASS

The `Collections` class provides utility methods for manipulating collections, such as sorting, searching, and synchronization:

```java
List<String> list = new ArrayList<>();
list.add("apple");
list.add("banana");
Collections.sort(list); // Sorting elements
```

### SYNCHRONIZED WRAPPERS AND CONCURRENT COLLECTIONS

Java provides synchronized wrappers for making collections thread-safe, and concurrent collections optimized for concurrent access:

```java
List<String> syncList = Collections.synchronizedList(new ArrayList<>());
Map<String, Integer> concurrentMap = new ConcurrentHashMap<>();
```

### THE ARRAYS UTILITY CLASS

The `Arrays` class provides utility methods for working with arrays, such as sorting and searching:

```java
String[] fruits = { "apple", "banana", "cherry" };
Arrays.sort(fruits); // Sorting array
int index = Arrays.binarySearch(fruits, "banana"); // Searching element
```

### WRITING ITERATOR IMPLEMENTATIONS

Implement the `Iterator` interface to create custom iterators for iterating over collections:

```java
public class CustomIterator<E> implements Iterator<E> {
    private int currentIndex;
    private List<E> elements;

    @Override
    public boolean hasNext() {
        return currentIndex < elements.size();
    }

    @Override
    public E next() {
        return elements.get(currentIndex++);
    }
}
```

### WRITING COLLECTION IMPLEMENTATIONS

Implement the `Collection` interface or extend existing collection classes to create custom collection implementations:

```java
public class CustomCollection<E> implements Collection<E> {
    // Implement required methods
}
```

### THE LEGACY COLLECTION TYPES

Legacy collection types (e.g., `Vector`, `Hashtable`) are synchronized but less efficient than their modern counterparts (`ArrayList`, `HashMap`):

```java
Vector<String> vector = new Vector<>();
vector.add("apple");
vector.add("banana");
```

### PROPERTIES

The `Properties` class manages application configuration stored as key-value pairs:

```java
Properties props = new Properties();
props.load(new FileInputStream("config.properties"));
String value = props.getProperty("key");
```

This manual provides a comprehensive overview of collections in Java, covering collection interfaces (`Collection`, `Set`, `List`, `Queue`, `Map`), ordering with `Comparable` and `Comparator`, utility classes (`Collections`, `Arrays`), concurrent collections, legacy collection types, properties, and writing custom collection implementations. For more detailed information, refer to the Java documentation and additional resources on Java collections.
