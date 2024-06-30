# MISCELLANEOUS UTILITIES

Java provides several utility classes to handle various tasks efficiently.

### FORMATTER

The `Formatter` class provides support for formatted output:

```java
Formatter formatter = new Formatter();
formatter.format("Hello, %s!", "world");
String formattedString = formatter.toString();
formatter.close();
```

### BITSET

The `BitSet` class manages a set of bits:

```java
BitSet bitSet = new BitSet(8); // Initializes with 8 bits
bitSet.set(1);
boolean isSet = bitSet.get(1);
```

### OBSERVER/OBSERVABLE

The `Observer` and `Observable` classes support the Observer pattern for event handling:

```java
class MyObservable extends Observable {
    public void notifyObservers(Object arg) {
        setChanged();
        super.notifyObservers(arg);
    }
}

class MyObserver implements Observer {
    public void update(Observable o, Object arg) {
        // Handle update
    }
}
```

### RANDOM

The `Random` class generates pseudo-random numbers:

```java
Random random = new Random();
int randomNumber = random.nextInt(100); // Generates a random integer between 0 and 99
```

### SCANNER

The `Scanner` class allows parsing of primitive types and strings:

```java
Scanner scanner = new Scanner(System.in);
System.out.print("Enter your name: ");
String name = scanner.nextLine();
```

### STRINGTOKENIZER

The `StringTokenizer` class breaks a string into tokens:

```java
StringTokenizer tokenizer = new StringTokenizer("Hello, World!", ",");
while (tokenizer.hasMoreTokens()) {
    String token = tokenizer.nextToken();
}
```

### TIMER AND TIMERTASK

The `Timer` and `TimerTask` classes schedule tasks for execution:

```java
Timer timer = new Timer();
TimerTask task = new TimerTask() {
    public void run() {
        // Task implementation
    }
};
timer.schedule(task, 1000, 2000); // Schedule task after 1 second and repeat every 2 seconds
```

### UUID

The `UUID` class generates universally unique identifiers:

```java
UUID uuid = UUID.randomUUID();
String randomUUIDString = uuid.toString();
```

### MATH AND STRICTMATH

The `Math` and `StrictMath` classes provide mathematical functions:

```java
double sqrtValue = Math.sqrt(25.0);
double cosValue = StrictMath.cos(Math.PI);
```

This manual provides a comprehensive overview of miscellaneous utilities in Java, covering the `Formatter` for formatted output, `BitSet` for managing bits, `Observer`/`Observable` for event handling, `Random` for generating random numbers, `Scanner` for parsing input, `StringTokenizer` for breaking strings into tokens, `Timer` and `TimerTask` for scheduling tasks, `UUID` for generating unique identifiers, and `Math`/`StrictMath` for mathematical functions. For more detailed information, refer to the Java documentation and additional resources on Java utilities.
