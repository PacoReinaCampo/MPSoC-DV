# THREADS

Threads in Java allow concurrent execution of tasks and are fundamental for developing applications that require multitasking and responsiveness.

### CREATING THREADS

Threads in Java can be created by extending the `Thread` class or implementing the `Runnable` interface:

#### Extending `Thread` class:

```java
class MyThread extends Thread {
    public void run() {
        System.out.println("Thread running...");
    }
}

// Creating and starting a thread
MyThread thread = new MyThread();
thread.start();
```

#### Implementing `Runnable` interface:

```java
class MyRunnable implements Runnable {
    public void run() {
        System.out.println("Runnable running...");
    }
}

// Creating a thread using Runnable
Thread thread = new Thread(new MyRunnable());
thread.start();
```

### USING RUNNABLE

Implementing `Runnable` is preferred over extending `Thread` for better flexibility and code reusability.

### SYNCHRONIZATION

Synchronization in Java ensures that only one thread can access a block of code or method at a time, preventing data corruption in concurrent environments:

```java
class Counter {
    private int count = 0;

    public synchronized void increment() {
        count++;
    }
}
```

### WAIT, NOTIFYALL, AND NOTIFY

Methods from `Object` class used for thread communication and synchronization:

   * **`wait()`**: Suspends a thread until another thread notifies it.
   * **`notify()`**: Wakes up a single thread that is waiting on this object's monitor.
   * **`notifyAll()`**: Wakes up all threads that are waiting on this object's monitor.

### DETAILS OF WAITING AND NOTIFICATION

Threads can wait and notify each other using synchronized blocks and methods to coordinate their actions.

### THREAD SCHEDULING

Java's thread scheduler determines the order in which threads execute based on priority and fairness policies.

### DEADLOCKS

Deadlock occurs when two or more threads are blocked forever, waiting for each other to release resources. It can be avoided by careful synchronization.

### ENDING THREAD EXECUTION

Threads can finish execution naturally by returning from `run()` method or by calling `Thread.interrupt()` to interrupt a thread's execution.

### ENDING APPLICATION EXECUTION

Java application terminates when all non-daemon threads complete execution or when `System.exit()` is called explicitly.

### THE MEMORY MODEL: SYNCHRONIZATION AND VOLATILE

Java's memory model ensures visibility of shared data between threads using `synchronized` blocks/methods and `volatile` variables.

### THREAD MANAGEMENT, SECURITY, AND THREADGROUP

Java provides APIs to manage threads, set their priorities, and handle security aspects using `ThreadGroup` and related classes.

### THREADS AND EXCEPTIONS

Threads can propagate exceptions to their callers or handle exceptions locally within the thread.

### THREADLOCAL VARIABLES

`ThreadLocal` variables provide thread-local storage, allowing each thread to have its own independently initialized copy of the variable.

### DEBUGGING THREADS

Debugging multi-threaded applications can be challenging but tools like IDE debuggers and `jstack` utility help analyze thread states and diagnose issues.

This manual provides a comprehensive overview of threads in Java, covering thread creation (`Thread` and `Runnable`), synchronization, thread communication (`wait`, `notify`, `notifyAll`), thread scheduling, deadlocks, ending thread execution, application termination, memory model (`synchronized` and `volatile`), thread management, exceptions, `ThreadLocal` variables, and debugging threads. For more detailed information, refer to the Java documentation and additional resources.
