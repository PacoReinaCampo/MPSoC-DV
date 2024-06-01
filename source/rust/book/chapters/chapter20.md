# Final Project: Building a Multithreaded Web Server

Let's delve into each aspect of building a multithreaded web server in Rust:

## Building a Single-Threaded Web Server

To build a web server in Rust, you typically use a library like `hyper`, which provides an ergonomic and efficient foundation for building HTTP servers. In a single-threaded implementation, the server listens for incoming connections and processes each request sequentially.

```rust
use hyper::{Body, Request, Response, Server};
use hyper::service::{make_service_fn, service_fn};
use std::convert::Infallible;

async fn handle_request(_: Request<Body>) -> Result<Response<Body>, Infallible> {
    Ok(Response::new(Body::from("Hello, World!")))
}

#[tokio::main]

async fn main() {
    let addr = ([127, 0, 0, 1], 8080).into();
    let make_svc = make_service_fn(|_conn| async { Ok::<_, Infallible>(service_fn(handle_request)) });
    let server = Server::bind(&addr).serve(make_svc);

    println!("Server running at http://{}", addr);

    if let Err(e) = server.await {
        eprintln!("Server error: {}", e);
    }
}
```

In this example, `handle_request` is a function that processes HTTP requests and returns a response. We use `hyper::Server` to bind to a socket address and serve incoming connections using the `handle_request` function.

## Turning Our Single-Threaded Server into a Multithreaded Server

To improve the performance and scalability of our web server, we can make it multithreaded. This involves spawning multiple threads to handle incoming connections concurrently, allowing the server to process multiple requests simultaneously.

```rust
use hyper::{Body, Request, Response, Server};
use hyper::service::{make_service_fn, service_fn};
use std::convert::Infallible;
use futures_util::future;
use std::net::SocketAddr;

async fn handle_request(_: Request<Body>) -> Result<Response<Body>, Infallible> {
    Ok(Response::new(Body::from("Hello, World!")))
}

#[tokio::main]

async fn main() {
    let addr = SocketAddr::from(([127, 0, 0, 1], 8080));
    let make_svc = make_service_fn(|_conn| {
        async {
            Ok::<_, Infallible>(service_fn(handle_request))
        }
    });
    let server = Server::bind(&addr)
        .serve(make_svc)
        .with_graceful_shutdown(shutdown_signal());

    println!("Server running at http://{}", addr);

    if let Err(e) = server.await {
        eprintln!("Server error: {}", e);
    }
}

async fn shutdown_signal() {
    tokio::signal::ctrl_c()
        .await
        .expect("Failed to install CTRL+C signal handler");
}
```

In this example, we use the `tokio` library to spawn a new task for each incoming connection, allowing the server to handle multiple requests concurrently. We also implement graceful shutdown using a signal handler to gracefully stop the server when a shutdown signal is received (e.g., pressing Ctrl+C).

## Graceful Shutdown and Cleanup

Graceful shutdown is an essential feature for web servers to ensure that existing connections are completed before shutting down. In Rust, we can implement graceful shutdown using asynchronous signal handling.

```rust
use hyper::{Body, Request, Response, Server};
use hyper::service::{make_service_fn, service_fn};
use std::convert::Infallible;
use futures_util::future;
use std::net::SocketAddr;

async fn handle_request(_: Request<Body>) -> Result<Response<Body>, Infallible> {
    Ok(Response::new(Body::from("Hello, World!")))
}

#[tokio::main]

async fn main() {
    let addr = SocketAddr::from(([127, 0, 0, 1], 8080));
    let make_svc = make_service_fn(|_conn| {
        async {
            Ok::<_, Infallible>(service_fn(handle_request))
        }
    });
    let server = Server::bind(&addr)
        .serve(make_svc)
        .with_graceful_shutdown(shutdown_signal());

    println!("Server running at http://{}", addr);

    if let Err(e) = server.await {
        eprintln!("Server error: {}", e);
    }
}

async fn shutdown_signal() {
    tokio::signal::ctrl_c()
        .await
        .expect("Failed to install CTRL+C signal handler");
}
```

In this example, we use the `tokio::signal::ctrl_c()` function to create a future that resolves when a Ctrl+C signal is received. We then pass this future to `Server::with_graceful_shutdown()` to handle the shutdown process gracefully. When a shutdown signal is received, the server will stop accepting new connections and wait for existing connections to complete before shutting down.
