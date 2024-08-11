# FEARLESS CONCURRENCY

Let's delve into each of these aspects:

## USING THREADS TO RUN CODE SIMULTANEOUSLY

In Rust, you can create threads to run code concurrently using the `std::thread` module. Threads allow you to execute multiple pieces of code simultaneously, taking advantage of multi-core CPUs. Rust's ownership and borrowing rules ensure thread safety and prevent data races.

```rust
use std::thread;
use std::time::Duration;

fn main() {
    thread::spawn(|| {
        for i in 1..=5 {
            println!("Thread: {}", i);
            thread::sleep(Duration::from_millis(500));
        }
    });

    for i in 1..=3 {
        println!("Main: {}", i);
        thread::sleep(Duration::from_millis(1000));
    }
}
```

In this example, `thread::spawn()` creates a new thread that executes the provided closure concurrently with the main thread.

## USING MESSAGE PASSING TO TRANSFER DATA BETWEEN THREADS

In Rust, you can use channels for message passing between threads. Channels provide a way for threads to communicate by sending and receiving messages. Rust's ownership system ensures thread safety and prevents data races when using channels.

```rust
use std::sync::mpsc;
use std::thread;

fn main() {
    let (sender, receiver) = mpsc::channel();

    thread::spawn(move || {
        let val = "Hello from the other side";
        sender.send(val).unwrap();
    });

    let received = receiver.recv().unwrap();
    println!("Received: {}", received);
}
```

In this example, `mpsc::channel()` creates a channel, and `sender.send(val)` sends a message (`val`) through the channel. The main thread receives the message using `receiver.recv()`.

## SHARED-STATE CONCURRENCY

In Rust, shared-state concurrency refers to multiple threads accessing and modifying shared data concurrently. Rust ensures thread safety and prevents data races by using ownership and borrowing rules, as well as synchronization primitives like mutexes (`std::sync::Mutex`) and atomic types (`std::sync::atomic`).

```rust
use std::sync::{Arc, Mutex};
use std::thread;

fn main() {
    let counter = Arc::new(Mutex::new(0));
    let mut handles = vec![];

    for _ in 0..5 {
        let counter = Arc::clone(&counter);
        let handle = thread::spawn(move || {
            let mut num = counter.lock().unwrap();
            *num += 1;
        });
        handles.push(handle);
    }

    for handle in handles {
        handle.join().unwrap();
    }

    println!("Counter: {}", *counter.lock().unwrap());
}
```

In this example, `Arc::new(Mutex::new(0))` creates a shared counter protected by a mutex. Each thread increments the counter by locking the mutex (`counter.lock().unwrap()`) and modifying the shared data.

## EXTENSIBLE CONCURRENCY WITH THE SYNC AND SEND TRAITS

In Rust, the `Sync` and `Send` traits ensure that types can be safely shared between threads (`Send`) and accessed concurrently (`Sync`). By default, types are `Send` and `Sync` if they are thread-safe. You can implement these traits manually for custom types to make them thread-safe.

```rust
use std::sync::Arc;
use std::thread;

struct MyStruct {}

unsafe impl Send for MyStruct {}
unsafe impl Sync for MyStruct {}

fn main() {
    let data = Arc::new(MyStruct {});

    let thread = thread::spawn(move || {
        // Access and modify data
    });

    thread.join().unwrap();
}
```

In this example, `MyStruct` implements the `Send` and `Sync` traits manually to make it thread-safe for sharing between threads. Then, `Arc::new(MyStruct {})` creates an atomic reference-counted pointer to `MyStruct`, allowing it to be safely shared between threads.
