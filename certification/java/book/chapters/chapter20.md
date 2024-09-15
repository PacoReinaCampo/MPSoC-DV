# THE I/O PACKAGE

Java I/O (Input/Output) package provides classes and interfaces for reading and writing data from/to different sources, such as files, network connections, and memory.

### STREAMS OVERVIEW

Streams are sequences of data elements. Java I/O provides two types of streams:
   * **Byte Streams**: Handles raw binary data.
   * **Character Streams**: Handles text data using Unicode characters.

### BYTE STREAMS

Byte streams are used for handling binary data:
   * **`InputStream`** and **`OutputStream`**: Abstract classes for reading and writing byte-oriented data.
   * **`FileInputStream`** and **`FileOutputStream`**: Reads from and writes to files respectively.

```java
try (FileInputStream fis = new FileInputStream("input.txt");
     FileOutputStream fos = new FileOutputStream("output.txt")) {
    int byteRead;
    while ((byteRead = fis.read()) != -1) {
        fos.write(byteRead);
    }
}
```

### CHARACTER STREAMS

Character streams are used for handling text data using Unicode characters:
   * **`Reader`** and **`Writer`**: Abstract classes for reading and writing character-oriented data.
   * **`FileReader`** and **`FileWriter`**: Reads from and writes to files using character encoding.

```java
try (FileReader reader = new FileReader("input.txt");
     FileWriter writer = new FileWriter("output.txt")) {
    int character;
    while ((character = reader.read()) != -1) {
        writer.write(character);
    }
}
```

### INPUTSTREAMREADER AND OUTPUTSTREAMWRITER

Converts byte streams to character streams and vice versa:
   * **`InputStreamReader`**: Reads bytes and decodes them into characters.
   * **`OutputStreamWriter`**: Converts characters into bytes for output.

```java
try (FileInputStream fis = new FileInputStream("input.txt");
     InputStreamReader isr = new InputStreamReader(fis);
     FileOutputStream fos = new FileOutputStream("output.txt");
     OutputStreamWriter osw = new OutputStreamWriter(fos)) {
    int character;
    while ((character = isr.read()) != -1) {
        osw.write(character);
    }
}
```

### A QUICK TOUR OF THE STREAM CLASSES

Java I/O includes various stream classes like `BufferedInputStream`, `BufferedOutputStream`, `BufferedReader`, `BufferedWriter`, etc., for efficient reading and writing operations.

### THE DATA BYTE STREAMS

Data streams (`DataInputStream` and `DataOutputStream`) provide methods for reading and writing primitive data types (int, float, boolean, etc.) directly as binary data.

```java
try (DataOutputStream dos = new DataOutputStream(new FileOutputStream("data.bin"))) {
    dos.writeInt(123);
    dos.writeDouble(456.789);
    dos.writeBoolean(true);
}
```

### WORKING WITH FILES

Java provides classes like `File`, `Path`, `Files`, and `FilePermission` for file handling operations, including creating, reading, writing, and deleting files.

```java
File file = new File("example.txt");
if (file.exists()) {
    // File operations
}
```

### OBJECT SERIALIZATION

Serialization (`Serializable` interface) allows objects to be converted into a byte stream for storage or transmission and reconstructed back into objects.

```java
try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("object.bin"));
     ObjectInputStream ois = new ObjectInputStream(new FileInputStream("object.bin"))) {
    MyObject obj = new MyObject();
    oos.writeObject(obj);
    MyObject objFromFile = (MyObject) ois.readObject();
}
```

### THE IOEXCEPTION CLASSES

Java I/O operations may throw `IOException` and its subclasses (`FileNotFoundException`, `EOFException`, `IOException`, etc.) to handle I/O errors gracefully.

```java
try {
    FileInputStream fis = new FileInputStream("input.txt");
    // Perform read operations
} catch (IOException e) {
    e.printStackTrace();
}
```

### A TASTE OF NEW I/O

New I/O (NIO) (`java.nio` package) provides non-blocking I/O operations using channels and buffers for efficient handling of large data:

```java
Path path = Paths.get("input.txt");
try (SeekableByteChannel channel = Files.newByteChannel(path, StandardOpenOption.READ)) {
    ByteBuffer buffer = ByteBuffer.allocate(1024);
    while (channel.read(buffer) > 0) {
        buffer.flip();
        // Process data in buffer
        buffer.clear();
    }
} catch (IOException e) {
    e.printStackTrace();
}
```

This manual provides a comprehensive overview of the I/O package in Java, covering byte and character streams, `InputStreamReader` and `OutputStreamWriter`, stream classes, data byte streams, file handling, object serialization, handling `IOException` classes, and a brief introduction to New I/O (NIO). For more detailed information, refer to the Java documentation and additional resources on Java I/O.
