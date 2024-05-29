# Mathematics in MATLAB

MATLAB is a powerful tool for performing mathematical computations. Here's a detailed guide on various mathematical topics in MATLAB:

## Elementary Math

Elementary math operations in MATLAB include basic arithmetic, exponentiation, logarithms, and trigonometric functions.

### Arithmetic Operations
```matlab
a = 10;
b = 5;
sum = a + b;
difference = a - b;
product = a * b;
quotient = a / b;
remainder = mod(a, b);
```

### Exponentiation and Logarithms
```matlab
exp_val = exp(1);  % e^1
log_val = log(10);  % Natural logarithm
log10_val = log10(100);  % Base-10 logarithm
```

### Trigonometric Functions
```matlab
theta = pi / 4;
sine_val = sin(theta);
cosine_val = cos(theta);
tangent_val = tan(theta);
```

## Linear Algebra

MATLAB is particularly strong in linear algebra, offering extensive functionality for matrix operations.

### Matrix Operations
```matlab
A = [1, 2; 3, 4];
B = [5, 6; 7, 8];
sum_matrix = A + B;
product_matrix = A * B;
transpose_A = A';
inverse_A = inv(A);
```

### Solving Linear Systems
```matlab
A = [1, 2; 3, 4];
b = [5; 6];
x = A \ b;  % Solution to Ax = b
```

### Eigenvalues and Singular Value Decomposition
```matlab
eig_vals = eig(A);
[U, S, V] = svd(A);  % Singular value decomposition
```

## Random Number Generation

Generating random numbers is essential for simulations and statistical analysis.

### Basic Random Numbers
```matlab
rand_val = rand();  % Uniformly distributed random number in (0,1)
randn_val = randn();  % Normally distributed random number with mean 0 and variance 1
```

### Random Numbers with Specific Distributions
```matlab
uniform_rand = rand(1, 100);  % 1x100 array of uniform random numbers
normal_rand = randn(1, 100);  % 1x100 array of normal random numbers
```

## Interpolation

Interpolation is used to estimate values between data points.

### Linear Interpolation
```matlab
x = [1, 2, 3, 4, 5];
y = [2, 4, 6, 8, 10];
xi = 2.5;
yi = interp1(x, y, xi);  % Linear interpolation
```

### Spline Interpolation
```matlab
yi_spline = interp1(x, y, xi, 'spline');  % Spline interpolation
```

## Optimization

Optimization involves finding the minimum or maximum of functions.

### Finding Minima and Maxima
```matlab
f = @(x) (x-2).^2 + 3;
[x_min, fval_min] = fminbnd(f, 0, 4);  % Find minimum in the interval [0,4]

g = @(x) -((x-2).^2 + 3);
[x_max, fval_max] = fminbnd(g, 0, 4);  % Find maximum by minimizing the negative function
```

### Nonlinear Optimization
```matlab
fun = @(x) x(1)^2 + x(2)^2;  % Objective function
x0 = [1, 2];  % Initial guess
x_opt = fminunc(fun, x0);  % Find minimum
```

## Numerical Integration and Differential Equations

MATLAB provides functions for numerical integration and solving differential equations.

### Numerical Integration
```matlab
f = @(x) sin(x);
integral_val = integral(f, 0, pi);  % Definite integral of sin(x) from 0 to pi
```

### Solving Ordinary Differential Equations (ODEs)
```matlab
ode_fun = @(t, y) -2*y;  % dy/dt = -2y
tspan = [0 5];
y0 = 1;
[t, y] = ode45(ode_fun, tspan, y0);  % Solve ODE using ode45
```

## Fourier Analysis and Filtering

Fourier analysis is used for frequency domain analysis of signals.

### Fourier Transform
```matlab
x = linspace(0, 2*pi, 100);
y = sin(x);
y_fft = fft(y);  % Compute the Fast Fourier Transform
```

### Filtering
```matlab
fs = 1000;  % Sampling frequency
t = 0:1/fs:1-1/fs;
x = cos(2*pi*100*t) + randn(size(t));  % Noisy signal
[b, a] = butter(2, 0.2);  % Butterworth filter design
filtered_x = filter(b, a, x);  % Apply filter
```

## Sparse Matrices

Sparse matrices are used for efficiently storing and manipulating large, sparse datasets.

### Creating and Manipulating Sparse Matrices
```matlab
A = sparse([1, 2, 3], [1, 2, 3], [10, 20, 30], 5, 5);  % Create a sparse matrix
full_A = full(A);  % Convert to full matrix
```

## Graph and Network Algorithms

MATLAB supports graph theory and network analysis.

### Creating and Analyzing Graphs
```matlab
s = [1, 2, 3];
t = [2, 3, 4];
G = graph(s, t);  % Create a graph
plot(G);  % Plot the graph

shortest_path = shortestpath(G, 1, 4);  % Find the shortest path from node 1 to node 4
degree = degree(G);  % Degree of each node
```

## Computational Geometry

MATLAB provides tools for computational geometry tasks like convex hulls, Delaunay triangulation, etc.

### Convex Hull
```matlab
points = rand(10, 2);
k = convhull(points(:,1), points(:,2));
plot(points(:,1), points(:,2), 'o', points(k,1), points(k,2), '-');
```

### Delaunay Triangulation
```matlab
tri = delaunay(points(:,1), points(:,2));
triplot(tri, points(:,1), points(:,2));
```

## Quantum Computing

MATLAB offers support for quantum computing, including quantum algorithms and simulation of quantum systems.

### Quantum Gates and Circuits
```matlab
H = [1, 1; 1, -1]/sqrt(2);  % Hadamard gate
X = [0, 1; 1, 0];  % Pauli-X gate
I = eye(2);  % Identity matrix
CNOT = kron(I, I) + kron(X, X);  % CNOT gate using Kronecker product

initial_state = [1; 0];  % Initial state |0>
result_state = H * initial_state;  % Apply Hadamard gate
```

### Quantum Algorithms
```matlab
% Example: Grover's algorithm or Shor's algorithm implementation (requires specialized functions and toolboxes)
```

By utilizing these mathematical tools in MATLAB, you can efficiently solve a wide range of mathematical problems and perform advanced data analysis.
