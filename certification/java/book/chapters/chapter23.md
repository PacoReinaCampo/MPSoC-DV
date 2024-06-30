# SYSTEM PROGRAMMING

System programming in Java involves interacting with the system environment, managing processes, handling shutdown, and addressing security concerns.

### THE SYSTEM CLASS

The `System` class provides access to system properties and methods for managing I/O, time, and environment variables:

```java
String osName = System.getProperty("os.name");
String javaVersion = System.getProperty("java.version");
```

### CREATING PROCESSES

Java allows creating new processes using `ProcessBuilder` and `Runtime` classes:

```java
// Using ProcessBuilder
ProcessBuilder builder = new ProcessBuilder("cmd.exe", "/c", "dir");
Process process = builder.start();

// Using Runtime
Runtime runtime = Runtime.getRuntime();
Process process = runtime.exec("notepad.exe");
```

### SHUTDOWN

Java provides mechanisms to handle application shutdown gracefully:

- **Shutdown Hooks**: Allows executing cleanup code before JVM shuts down.

```java
Runtime.getRuntime().addShutdownHook(new Thread(() -> {
    // Cleanup code
}));
```

### THE REST OF RUNTIME

The `Runtime` class provides information about the Java runtime environment and allows executing system processes:

```java
long freeMemory = Runtime.getRuntime().freeMemory();
int processors = Runtime.getRuntime().availableProcessors();
```

### SECURITY

Java security ensures that applications run safely and securely:

- **Security Manager**: Enforces security policies to restrict access to system resources.
- **Security Policies**: Configure policies to grant or deny permissions to application code.

```java
SecurityManager securityManager = new SecurityManager();
System.setSecurityManager(securityManager);
```

This manual provides a comprehensive overview of system programming in Java, covering the `System` class for accessing system properties, creating processes using `ProcessBuilder` and `Runtime`, handling shutdown with shutdown hooks, obtaining runtime information with the `Runtime` class, and addressing security with the Security Manager and security policies. For more detailed information, refer to the Java documentation and additional resources on Java system programming and security.
