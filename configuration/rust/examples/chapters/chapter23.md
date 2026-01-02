# EXAMPLES: MATH

`INSERT HERE`

## AMICABLE NUMBERS BELOW N

`INSERT HERE`

```rust
// Operations based around amicable numbers
// Suports u32 but should be interchangable with other types
// Wikipedia reference: https://en.wikipedia.org/wiki/Amicable_numbers

// Returns vec of amicable pairs below N
// N must be positive
pub fn amicable_pairs_under_n(n: u32) -> Option<Vec<(u32, u32)>> {
    let mut factor_sums = vec![0; n as usize];

    // Make a list of the sum of the factors of each number below N
    for i in 1..n {
        for j in (i * 2..n).step_by(i as usize) {
            factor_sums[j as usize] += i;
        }
    }

    // Default value of (0, 0) if no pairs are found
    let mut out = vec![(0, 0)];
    // Check if numbers are amicable then append
    for (i, x) in factor_sums.iter().enumerate() {
        if (*x != i as u32) && (*x < n) && (factor_sums[*x as usize] == i as u32) && (*x > i as u32)
        {
            out.push((i as u32, *x));
        }
    }

    // Check if anything was added to the vec, if so remove the (0, 0) and return
    if out.len() == 1 {
        None
    } else {
        out.remove(0);
        Some(out)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    pub fn test_amicable_numbers_below_n() {
        // First 10 amicable numbers, sorted (low, high)
        let expected_result = vec![
            (220, 284),
            (1184, 1210),
            (2620, 2924),
            (5020, 5564),
            (6232, 6368),
            (10744, 10856),
            (12285, 14595),
            (17296, 18416),
            (63020, 76084),
            (66928, 66992),
        ];

        // Generate pairs under 100,000
        let mut result = amicable_pairs_under_n(100_000).unwrap();

        // There should be 13 pairs under 100,000
        assert_eq!(result.len(), 13);

        // Check the first 10 against known values
        result = result[..10].to_vec();
        assert_eq!(result, expected_result);

        // N that does not have any amicable pairs below it, the result should be None
        assert_eq!(amicable_pairs_under_n(100), None);
    }
}
```

`INSERT HERE`

## BABY-STEP GIANT-STEP ALGORITHM

`INSERT HERE`

```rust
/// Baby-step Giant-step algorithm
///
/// Solving discrete logarithm problem:
///     a^x = b (mod n) , with respect to gcd(a, n) == 1
/// with O(sqrt(n)) time complexity.
///
/// Wikipedia reference: https://en.wikipedia.org/wiki/Baby-step_giant-step
/// When a is the primitive root modulo n, the answer is unique.
/// Otherwise it will return the smallest positive solution
use std::collections::HashMap;

pub fn baby_step_giant_step(a: usize, b: usize, n: usize) -> Option<usize> {
    if b == 1 {
        return Some(n);
    }

    let mut h_map = HashMap::new();
    let m = (n as f64).sqrt().ceil() as usize;
    // baby step
    let mut step = 1;
    for i in 0..m {
        h_map.insert((step * b) % n, i);
        step = (step * a) % n;
    }
    // Now step = a^m (mod n), giant step
    let giant_step = step;
    for i in (m..=n).step_by(m) {
        if let Some(v) = h_map.get(&step) {
            return Some(i - v);
        }
        step = (step * giant_step) % n;
    }
    None
}

#[cfg(test)]
mod tests {
    use super::baby_step_giant_step;

    #[test]
    fn small_numbers() {
        assert_eq!(baby_step_giant_step(5, 3, 11), Some(2));
        assert_eq!(baby_step_giant_step(3, 83, 100), Some(9));
    }

    #[test]
    fn primitive_root_tests() {
        assert_eq!(
            baby_step_giant_step(3, 311401496, 998244353),
            Some(178105253)
        );
        assert_eq!(
            baby_step_giant_step(5, 324637211, 1000000007),
            Some(976653449)
        );
    }

    #[test]
    fn random_numbers() {
        assert_eq!(baby_step_giant_step(174857, 48604, 150991), Some(177));
        assert_eq!(baby_step_giant_step(912103, 53821, 75401), Some(2644));
        assert_eq!(baby_step_giant_step(448447, 365819, 671851), Some(23242));
        assert_eq!(
            baby_step_giant_step(220757103, 92430653, 434948279),
            Some(862704)
        );
        assert_eq!(
            baby_step_giant_step(176908456, 23538399, 142357679),
            Some(14215560)
        );
    }
}
```

`INSERT HERE`

## CEIL

`INSERT HERE`

```rust
// In mathematics and computer science, the ceiling function maps x to the least integer greater than or equal to x
// Source: https://en.wikipedia.org/wiki/Floor_and_ceiling_functions

pub fn ceil(x: f64) -> f64 {
    let x_round = x.round();
    if (x_round * 10.0).round() < (x * 10.0).round() {
        x_round + 1.0
    } else {
        x_round
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn positive_decimal() {
        let num = 1.10;
        assert_eq!(ceil(num), num.ceil());
    }

    #[test]
    fn positive_integer() {
        let num = 1.00;
        assert_eq!(ceil(num), num.ceil());
    }

    #[test]
    fn negative_decimal() {
        let num = -1.10;
        assert_eq!(ceil(num), num.ceil());
    }

    #[test]
    fn negative_integer() {
        let num = -1.00;
        assert_eq!(ceil(num), num.ceil());
    }

    #[test]
    fn zero() {
        let num = 0.00;
        assert_eq!(ceil(num), num.ceil());
    }
}
```

`INSERT HERE`

## CHINESE REMAINDER THEOREM

`INSERT HERE`

```rust
use super::extended_euclidean_algorithm;

fn mod_inv(x: i32, n: i32) -> Option<i32> {
    let (g, x, _) = extended_euclidean_algorithm(x, n);
    if g == 1 {
        Some((x % n + n) % n)
    } else {
        None
    }
}

pub fn chinese_remainder_theorem(residues: &[i32], modulli: &[i32]) -> Option<i32> {
    let prod = modulli.iter().product::<i32>();

    let mut sum = 0;

    for (&residue, &modulus) in residues.iter().zip(modulli) {
        let p = prod / modulus;
        sum += residue * mod_inv(p, modulus)? * p
    }
    Some(sum % prod)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn basic() {
        assert_eq!(chinese_remainder_theorem(&[3, 5, 7], &[2, 3, 1]), Some(5));
        assert_eq!(chinese_remainder_theorem(&[1, 4, 6], &[3, 5, 7]), Some(34));
        assert_eq!(chinese_remainder_theorem(&[1, 4, 6], &[1, 2, 0]), None);
        assert_eq!(chinese_remainder_theorem(&[2, 5, 7], &[6, 9, 15]), None);
    }
}
```

`INSERT HERE`

## EXTENDED EUCLIDEAN ALGORITHM

`INSERT HERE`

```rust
fn update_step(a: &mut i32, old_a: &mut i32, quotient: i32) {
    let temp = *a;
    *a = *old_a - quotient * temp;
    *old_a = temp;
}

pub fn extended_euclidean_algorithm(a: i32, b: i32) -> (i32, i32, i32) {
    let (mut old_r, mut rem) = (a, b);
    let (mut old_s, mut coeff_s) = (1, 0);
    let (mut old_t, mut coeff_t) = (0, 1);

    while rem != 0 {
        let quotient = old_r / rem;

        update_step(&mut rem, &mut old_r, quotient);
        update_step(&mut coeff_s, &mut old_s, quotient);
        update_step(&mut coeff_t, &mut old_t, quotient);
    }

    (old_r, old_s, old_t)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn basic() {
        assert_eq!(extended_euclidean_algorithm(101, 13), (1, 4, -31));
        assert_eq!(extended_euclidean_algorithm(123, 19), (1, -2, 13));
        assert_eq!(extended_euclidean_algorithm(25, 36), (1, 13, -9));
        assert_eq!(extended_euclidean_algorithm(69, 54), (3, -7, 9));
        assert_eq!(extended_euclidean_algorithm(55, 79), (1, 23, -16));
        assert_eq!(extended_euclidean_algorithm(33, 44), (11, -1, 1));
        assert_eq!(extended_euclidean_algorithm(50, 70), (10, 3, -2));
    }
}
```

`INSERT HERE`

## FAST INVERSE SQUARE ROOT 'QUAKE' ALGORITHM

`INSERT HERE`

```rust
/// squre_root returns the square root
/// of a f64 number using Newtons method
pub fn square_root(num: f64) -> f64 {
    if num < 0.0_f64 {
        return f64::NAN;
    }

    let mut root = 1.0_f64;

    while (root * root - num).abs() > 1e-10_f64 {
        root -= (root * root - num) / (2.0_f64 * root);
    }

    root
}

// fast_inv_sqrt returns an approximation of the inverse square root
// This algorithm was fist used in Quake and has been reimplimented in a few other languages
// This crate impliments it more throughly: https://docs.rs/quake-inverse-sqrt/latest/quake_inverse_sqrt/
pub fn fast_inv_sqrt(num: f32) -> f32 {
    // If you are confident in your input this can be removed for speed
    if num < 0.0f32 {
        return f32::NAN;
    }

    let i = num.to_bits();
    let i = 0x5f3759df - (i >> 1);
    let y = f32::from_bits(i);

    println!("num: {:?}, out: {:?}", num, y * (1.5 - 0.5 * num * y * y));
    // First iteration of newton approximation
    y * (1.5 - 0.5 * num * y * y)
    // The above can be repeated again for more precision
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_fast_inv_sqrt() {
        // Negatives don't have square roots:
        assert!(fast_inv_sqrt(-1.0f32).is_nan());

        // Test a few cases, expect less than 1% error:
        let test_pairs = [(4.0, 0.5), (16.0, 0.25), (25.0, 0.2)];
        for pair in test_pairs {
            assert!((fast_inv_sqrt(pair.0) - pair.1).abs() <= (0.01 * pair.0));
        }
    }

    #[test]
    fn test_sqare_root() {
        assert!((square_root(4.0_f64) - 2.0_f64).abs() <= 1e-10_f64);
        assert!(square_root(-4.0_f64).is_nan());
    }
}
```

`INSERT HERE`

## GAUSSIAN ELIMINATION

`INSERT HERE`

```rust
// Gaussian Elimination of Quadratic Matrices
// Takes an augmented matrix as input, returns vector of results
// Wikipedia reference: augmented matrix: https://en.wikipedia.org/wiki/Augmented_matrix
// Wikipedia reference: algorithm: https://en.wikipedia.org/wiki/Gaussian_elimination

pub fn gaussian_elimination(matrix: &mut [Vec<f32>]) -> Vec<f32> {
    let size = matrix.len();
    assert_eq!(size, matrix[0].len() - 1);

    for i in 0..size - 1 {
        for j in i..size - 1 {
            echelon(matrix, i, j);
        }
    }

    for i in (1..size).rev() {
        eliminate(matrix, i);
    }

    // Disable cargo clippy warnings about needless range loops.
    // Checking the diagonal like this is simpler than any alternative.
    #[allow(clippy::needless_range_loop)]
    for i in 0..size {
        if matrix[i][i] == 0f32 {
            println!("Infinitely many solutions");
        }
    }

    let mut result: Vec<f32> = vec![0f32; size];
    for i in 0..size {
        result[i] = matrix[i][size] / matrix[i][i];
    }
    result
}

fn echelon(matrix: &mut [Vec<f32>], i: usize, j: usize) {
    let size = matrix.len();
    if matrix[i][i] == 0f32 {
    } else {
        let factor = matrix[j + 1][i] as f32 / matrix[i][i] as f32;
        (i..size + 1).for_each(|k| {
            matrix[j + 1][k] -= factor * matrix[i][k];
        });
    }
}

fn eliminate(matrix: &mut [Vec<f32>], i: usize) {
    let size = matrix.len();
    if matrix[i][i] == 0f32 {
    } else {
        for j in (1..i + 1).rev() {
            let factor = matrix[j - 1][i] as f32 / matrix[i][i] as f32;
            for k in (0..size + 1).rev() {
                matrix[j - 1][k] -= factor * matrix[i][k] as f32;
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::gaussian_elimination;

    #[test]
    fn test_gauss() {
        let mut matrix: Vec<Vec<f32>> = vec![
            vec![1.5, 2.0, 1.0, -1.0, -2.0, 1.0, 1.0],
            vec![3.0, 3.0, -1.0, 16.0, 18.0, 1.0, 1.0],
            vec![1.0, 1.0, 3.0, -2.0, -6.0, 1.0, 1.0],
            vec![1.0, 1.0, 99.0, 19.0, 2.0, 1.0, 1.0],
            vec![1.0, -2.0, 16.0, 1.0, 9.0, 10.0, 1.0],
            vec![1.0, 3.0, 1.0, -5.0, 1.0, 1.0, 95.0],
        ];
        let result = vec![
            -264.05893, 159.63196, -6.156921, 35.310387, -18.806696, 81.67839,
        ];
        assert_eq!(gaussian_elimination(&mut matrix), result);
    }
}
```

`INSERT HERE`

## GREATEST COMMON DIVISOR

`INSERT HERE`

```rust
/// Greatest Common Divisor.
///
/// greatest_common_divisor(num1, num2) returns the greatest number of num1 and num2.
///
/// Wikipedia reference: https://en.wikipedia.org/wiki/Greatest_common_divisor
/// gcd(a, b) = gcd(a, -b) = gcd(-a, b) = gcd(-a, -b) by definition of divisibility

pub fn greatest_common_divisor_recursive(a: i64, b: i64) -> i64 {
    if a == 0 {
        b.abs()
    } else {
        greatest_common_divisor_recursive(b % a, a)
    }
}

pub fn greatest_common_divisor_iterative(mut a: i64, mut b: i64) -> i64 {
    while a != 0 {
        let remainder = b % a;
        b = a;
        a = remainder;
    }
    b.abs()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn positive_number_recursive() {
        assert_eq!(greatest_common_divisor_recursive(4, 16), 4);
        assert_eq!(greatest_common_divisor_recursive(16, 4), 4);
        assert_eq!(greatest_common_divisor_recursive(3, 5), 1);
        assert_eq!(greatest_common_divisor_recursive(40, 40), 40);
        assert_eq!(greatest_common_divisor_recursive(27, 12), 3);
    }

    #[test]
    fn positive_number_iterative() {
        assert_eq!(greatest_common_divisor_iterative(4, 16), 4);
        assert_eq!(greatest_common_divisor_iterative(16, 4), 4);
        assert_eq!(greatest_common_divisor_iterative(3, 5), 1);
        assert_eq!(greatest_common_divisor_iterative(40, 40), 40);
        assert_eq!(greatest_common_divisor_iterative(27, 12), 3);
    }

    #[test]
    fn negative_number_recursive() {
        assert_eq!(greatest_common_divisor_recursive(-32, -8), 8);
        assert_eq!(greatest_common_divisor_recursive(-8, -32), 8);
        assert_eq!(greatest_common_divisor_recursive(-3, -5), 1);
        assert_eq!(greatest_common_divisor_recursive(-40, -40), 40);
        assert_eq!(greatest_common_divisor_recursive(-12, -27), 3);
    }

    #[test]
    fn negative_number_iterative() {
        assert_eq!(greatest_common_divisor_iterative(-32, -8), 8);
        assert_eq!(greatest_common_divisor_iterative(-8, -32), 8);
        assert_eq!(greatest_common_divisor_iterative(-3, -5), 1);
        assert_eq!(greatest_common_divisor_iterative(-40, -40), 40);
        assert_eq!(greatest_common_divisor_iterative(-12, -27), 3);
    }

    #[test]
    fn mix_recursive() {
        assert_eq!(greatest_common_divisor_recursive(0, -5), 5);
        assert_eq!(greatest_common_divisor_recursive(-5, 0), 5);
        assert_eq!(greatest_common_divisor_recursive(-64, 32), 32);
        assert_eq!(greatest_common_divisor_recursive(-32, 64), 32);
        assert_eq!(greatest_common_divisor_recursive(-40, 40), 40);
        assert_eq!(greatest_common_divisor_recursive(12, -27), 3);
    }

    #[test]
    fn mix_iterative() {
        assert_eq!(greatest_common_divisor_iterative(0, -5), 5);
        assert_eq!(greatest_common_divisor_iterative(-5, 0), 5);
        assert_eq!(greatest_common_divisor_iterative(-64, 32), 32);
        assert_eq!(greatest_common_divisor_iterative(-32, 64), 32);
        assert_eq!(greatest_common_divisor_iterative(-40, 40), 40);
        assert_eq!(greatest_common_divisor_iterative(12, -27), 3);
    }
}
```

`INSERT HERE`

## GREATEST COMMON DIVISOR OF N NUMBERS

`INSERT HERE`

```rust
/// returns the greatest common divisor of n numbers
pub fn gcd(nums: &[usize]) -> usize {
    if nums.len() == 1 {
        return nums[0];
    }
    let a = nums[0];
    let b = gcd(&nums[1..]);
    gcd_of_two_numbers(a, b)
}

fn gcd_of_two_numbers(a: usize, b: usize) -> usize {
    if b == 0 {
        return a;
    }
    gcd_of_two_numbers(b, a % b)
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn it_works() {
        assert_eq!(gcd(&[1, 2, 3, 4, 5]), 1);
        assert_eq!(gcd(&[2, 4, 6, 8, 10]), 2);
        assert_eq!(gcd(&[3, 6, 9, 12, 15]), 3);
        assert_eq!(gcd(&[10]), 10);
        assert_eq!(gcd(&[21, 110]), 1);
    }
}
```

`INSERT HERE`

## LEAST COMMON MULTIPLE OF N NUMBERS

`INSERT HERE`

```rust
// returns the least common multiple of n numbers

pub fn lcm(nums: &[usize]) -> usize {
    if nums.len() == 1 {
        return nums[0];
    }
    let a = nums[0];
    let b = lcm(&nums[1..]);
    a * b / gcd_of_two_numbers(a, b)
}

fn gcd_of_two_numbers(a: usize, b: usize) -> usize {
    if b == 0 {
        return a;
    }
    gcd_of_two_numbers(b, a % b)
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn it_works() {
        assert_eq!(lcm(&[1, 2, 3, 4, 5]), 60);
        assert_eq!(lcm(&[2, 4, 6, 8, 10]), 120);
        assert_eq!(lcm(&[3, 6, 9, 12, 15]), 180);
        assert_eq!(lcm(&[10]), 10);
        assert_eq!(lcm(&[21, 110]), 2310);
    }
}
```

`INSERT HERE`

## MILLER RABIN PRIMALITY TEST

`INSERT HERE`

```rust
fn modulo_power(mut base: u64, mut power: u64, modulo: u64) -> u64 {
    base %= modulo;
    if base == 0 {
        return 0; // return zero if base is divisible by modulo
    }
    let mut ans: u128 = 1;
    let mut bbase: u128 = base as u128;
    while power > 0 {
        if (power % 2) == 1 {
            ans = (ans * bbase) % (modulo as u128);
        }
        bbase = (bbase * bbase) % (modulo as u128);
        power /= 2;
    }
    ans as u64
}

fn check_prime_base(number: u64, base: u64, two_power: u64, odd_power: u64) -> bool {
    // returns false if base is a witness
    let mut x: u128 = modulo_power(base, odd_power, number) as u128;
    let bnumber: u128 = number as u128;
    if x == 1 || x == (bnumber - 1) {
        return true;
    }
    for _ in 1..two_power {
        x = (x * x) % bnumber;
        if x == (bnumber - 1) {
            return true;
        }
    }
    false
}

pub fn miller_rabin(number: u64, bases: &[u64]) -> u64 {
    // returns zero on a probable prime, and a witness if number is not prime
    // A base set for deterministic performance on 64 bit numbers is:
    // [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37]
    // another one for 32 bits:
    // [2, 3, 5, 7], with smallest number to fail 3'215'031'751 = 151 * 751 * 28351
    // note that all bases should be prime
    if number <= 4 {
        match number {
            0 => {
                panic!("0 is invalid input for Miller-Rabin. 0 is not prime by definition, but has no witness");
            }
            2 => return 0,
            3 => return 0,
            _ => return number,
        }
    }
    if bases.contains(&number) {
        return 0;
    }
    let two_power: u64 = (number - 1).trailing_zeros() as u64;
    let odd_power = (number - 1) >> two_power;
    for base in bases {
        if !check_prime_base(number, *base, two_power, odd_power) {
            return *base;
        }
    }
    0
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn basic() {
        let default_bases = vec![2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37];
        // these bases make miller rabin deterministic for any number < 2 ^ 64
        // can use smaller number of bases for deterministic performance for numbers < 2 ^ 32

        assert_eq!(miller_rabin(3, &default_bases), 0);
        assert_eq!(miller_rabin(7, &default_bases), 0);
        assert_eq!(miller_rabin(11, &default_bases), 0);
        assert_eq!(miller_rabin(2003, &default_bases), 0);

        assert_ne!(miller_rabin(1, &default_bases), 0);
        assert_ne!(miller_rabin(4, &default_bases), 0);
        assert_ne!(miller_rabin(6, &default_bases), 0);
        assert_ne!(miller_rabin(21, &default_bases), 0);
        assert_ne!(miller_rabin(2004, &default_bases), 0);

        // bigger test cases.
        // primes are generated using openssl
        // non primes are randomly picked and checked using openssl

        // primes:
        assert_eq!(miller_rabin(3629611793, &default_bases), 0);
        assert_eq!(miller_rabin(871594686869, &default_bases), 0);
        assert_eq!(miller_rabin(968236663804121, &default_bases), 0);
        assert_eq!(miller_rabin(6920153791723773023, &default_bases), 0);

        // random non primes:
        assert_ne!(miller_rabin(4546167556336341257, &default_bases), 0);
        assert_ne!(miller_rabin(4363186415423517377, &default_bases), 0);
        assert_ne!(miller_rabin(815479701131020226, &default_bases), 0);
        // these two are made of two 31 bit prime factors:
        // 1950202127 * 2058609037 = 4014703722618821699
        assert_ne!(miller_rabin(4014703722618821699, &default_bases), 0);
        // 1679076769 * 2076341633 = 3486337000477823777
        assert_ne!(miller_rabin(3486337000477823777, &default_bases), 0);
    }
}
```

`INSERT HERE`

## PASCAL'S TRIANGLE

`INSERT HERE`

```rust
/// ## Paslcal's triangle problem

/// pascal_triangle(num_rows) returns the first num_rows of Pascal's triangle.
/// About Pascal's triangle: https://en.wikipedia.org/wiki/Pascal%27s_triangle
///
/// Arguments:
///     * `num_rows` - number of rows of triangle
/// Complexity
///     - time complexity: O(n^2),
///     - space complexity: O(n^2),
pub fn pascal_triangle(num_rows: i32) -> Vec<Vec<i32>> {
    let mut ans: Vec<Vec<i32>> = vec![];

    for i in 1..num_rows + 1 {
        let mut vec: Vec<i32> = vec![1];

        let mut res: i32 = 1;
        for k in 1..i {
            res *= i - k;
            res /= k;
            vec.push(res);
        }
        ans.push(vec);
    }

    ans
}

#[cfg(test)]
mod tests {
    use super::pascal_triangle;

    #[test]
    fn test() {
        assert_eq!(pascal_triangle(3), vec![vec![1], vec![1, 1], vec![1, 2, 1]]);
        assert_eq!(
            pascal_triangle(4),
            vec![vec![1], vec![1, 1], vec![1, 2, 1], vec![1, 3, 3, 1]]
        );
        assert_eq!(
            pascal_triangle(5),
            vec![
                vec![1],
                vec![1, 1],
                vec![1, 2, 1],
                vec![1, 3, 3, 1],
                vec![1, 4, 6, 4, 1]
            ]
        );
    }
}
```

`INSERT HERE`

## SQUARE ROOT WITH NEWTON'S METHOD

`INSERT HERE`

```rust
/// squre_root returns the square root
/// of a f64 number using Newtons method
pub fn square_root(num: f64) -> f64 {
    if num < 0.0_f64 {
        return f64::NAN;
    }

    let mut root = 1.0_f64;

    while (root * root - num).abs() > 1e-10_f64 {
        root -= (root * root - num) / (2.0_f64 * root);
    }

    root
}

// fast_inv_sqrt returns an approximation of the inverse square root
// This algorithm was fist used in Quake and has been reimplimented in a few other languages
// This crate impliments it more throughly: https://docs.rs/quake-inverse-sqrt/latest/quake_inverse_sqrt/
pub fn fast_inv_sqrt(num: f32) -> f32 {
    // If you are confident in your input this can be removed for speed
    if num < 0.0f32 {
        return f32::NAN;
    }

    let i = num.to_bits();
    let i = 0x5f3759df - (i >> 1);
    let y = f32::from_bits(i);

    println!("num: {:?}, out: {:?}", num, y * (1.5 - 0.5 * num * y * y));
    // First iteration of newton approximation
    y * (1.5 - 0.5 * num * y * y)
    // The above can be repeated again for more precision
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_fast_inv_sqrt() {
        // Negatives don't have square roots:
        assert!(fast_inv_sqrt(-1.0f32).is_nan());

        // Test a few cases, expect less than 1% error:
        let test_pairs = [(4.0, 0.5), (16.0, 0.25), (25.0, 0.2)];
        for pair in test_pairs {
            assert!((fast_inv_sqrt(pair.0) - pair.1).abs() <= (0.01 * pair.0));
        }
    }

    #[test]
    fn test_sqare_root() {
        assert!((square_root(4.0_f64) - 2.0_f64).abs() <= 1e-10_f64);
        assert!(square_root(-4.0_f64).is_nan());
    }
}
```

`INSERT HERE`

## FAST POWER ALGORITHM

`INSERT HERE`

```rust
/// fast_power returns the result of base^power mod modulus
pub fn fast_power(mut base: usize, mut power: usize, modulus: usize) -> usize {
    assert!(base >= 1);

    let mut res = 1;
    while power > 0 {
        if power & 1 == 1 {
            res = (res * base) % modulus;
        }
        base = (base * base) % modulus;
        power >>= 1;
    }
    res
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test() {
        const MOD: usize = 1000000007;
        assert_eq!(fast_power(2, 1, MOD), 2);
        assert_eq!(fast_power(2, 2, MOD), 4);
        assert_eq!(fast_power(2, 4, MOD), 16);
        assert_eq!(fast_power(3, 4, MOD), 81);
        assert_eq!(fast_power(2, 100, MOD), 976371285);
    }
}
```

`INSERT HERE`

## PERFECT NUMBER

`INSERT HERE`

```rust
pub fn is_perfect_number(num: usize) -> bool {
    let mut sum = 0;

    for i in 1..num - 1 {
        if num % i == 0 {
            sum += i;
        }
    }

    num == sum
}

pub fn perfect_numbers(max: usize) -> Vec<usize> {
    let mut result: Vec<usize> = Vec::new();

    // It is not known if there are any odd perfect numbers, so we go around all the numbers.
    for i in 1..max + 1 {
        if is_perfect_number(i) {
            result.push(i);
        }
    }

    result
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn basic() {
        assert_eq!(is_perfect_number(6), true);
        assert_eq!(is_perfect_number(28), true);
        assert_eq!(is_perfect_number(496), true);
        assert_eq!(is_perfect_number(8128), true);

        assert_eq!(is_perfect_number(5), false);
        assert_eq!(is_perfect_number(86), false);
        assert_eq!(is_perfect_number(497), false);
        assert_eq!(is_perfect_number(8120), false);

        assert_eq!(perfect_numbers(10), vec![6]);
        assert_eq!(perfect_numbers(100), vec![6, 28]);
        assert_eq!(perfect_numbers(496), vec![6, 28, 496]);
        assert_eq!(perfect_numbers(1000), vec![6, 28, 496]);
    }
}
```

`INSERT HERE`

## PRIME FACTORS

`INSERT HERE`

```rust
// Finds the prime factors of a number in increasing order, with repetition.

pub fn prime_factors(n: u64) -> Vec<u64> {
    let mut i = 2;
    let mut n = n;
    let mut factors = Vec::new();
    if n == 0 {
        return factors;
    }
    if n == 1 {
        factors.push(1);
        return factors;
    }
    while i * i <= n {
        if n % i != 0 {
            if i != 2 {
                i += 1;
            }
            i += 1;
        } else {
            n /= i;
            factors.push(i);
        }
    }
    if n > 1 {
        factors.push(n);
    }
    factors
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn it_works() {
        assert_eq!(prime_factors(0), vec![]);
        assert_eq!(prime_factors(11), vec![11]);
        assert_eq!(prime_factors(25), vec![5, 5]);
        assert_eq!(prime_factors(33), vec![3, 11]);
        assert_eq!(prime_factors(2560), vec![2, 2, 2, 2, 2, 2, 2, 2, 2, 5]);
    }
}
```

`INSERT HERE`

## PRIME NUMBER

`INSERT HERE`

```rust
pub fn prime_numbers(max: usize) -> Vec<usize> {
    let mut result: Vec<usize> = Vec::new();

    if max >= 2 {
        result.push(2)
    }
    for i in (3..max + 1).step_by(2) {
        let stop: usize = (i as f64).sqrt() as usize + 1;
        let mut status: bool = true;

        for j in (3..stop).step_by(2) {
            if i % j == 0 {
                status = false;
                break;
            }
        }
        if status {
            result.push(i)
        }
    }

    result
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn basic() {
        assert_eq!(prime_numbers(0), vec![]);
        assert_eq!(prime_numbers(11), vec![2, 3, 5, 7, 11]);
        assert_eq!(prime_numbers(25), vec![2, 3, 5, 7, 11, 13, 17, 19, 23]);
        assert_eq!(
            prime_numbers(33),
            vec![2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31]
        );
    }
}
```

`INSERT HERE`

## LINEAR SIEVE

`INSERT HERE`

```rust
/*
Linear Sieve algorithm:
Time complexity is indeed O(n) with O(n) memory, but the sieve generally
runs slower than a well implemented sieve of Eratosthenes. Some use cases are:
- factorizing any number k in the sieve in O(log(k))
- calculating arbitrary multiplicative functions on sieve numbers
  without increasing the time complexity
- As a by product, all prime numbers less than `max_number` are stored
  in `primes` vector.
 */
pub struct LinearSieve {
    max_number: usize,
    pub primes: Vec<usize>,
    pub minimum_prime_factor: Vec<usize>,
}

impl LinearSieve {
    pub const fn new() -> Self {
        LinearSieve {
            max_number: 0,
            primes: vec![],
            minimum_prime_factor: vec![],
        }
    }

    pub fn prepare(&mut self, max_number: usize) -> Result<(), &'static str> {
        if max_number <= 1 {
            return Err("Sieve size should be more than 1");
        }
        if self.max_number > 0 {
            return Err("Sieve already initialized");
        }
        self.max_number = max_number;
        self.minimum_prime_factor.resize(max_number + 1, 0);
        for i in 2..=max_number {
            if self.minimum_prime_factor[i] == 0 {
                self.minimum_prime_factor[i] = i;
                self.primes.push(i);
                /*
                   if needed, a multiplicative function can be
                   calculated for this prime number here:
                   function[i] = base_case(i);
                */
            }
            for p in self.primes.iter() {
                let mlt = (*p) * i;
                if *p > i || mlt > max_number {
                    break;
                }
                self.minimum_prime_factor[mlt] = *p;
                /*
                   multiplicative function for mlt can be calculated here:
                   if i % p:
                       function[mlt] = add_to_prime_exponent(function[i], i, p);
                   else:
                       function[mlt] = function[i] * function[p]
                */
            }
        }
        Ok(())
    }

    pub fn factorize(&self, mut number: usize) -> Result<Vec<usize>, &'static str> {
        if number > self.max_number {
            return Err("Number is too big, its minimum_prime_factor was not calculated");
        }
        if number == 0 {
            return Err("Number is zero");
        }
        let mut result: Vec<usize> = Vec::new();
        while number > 1 {
            result.push(self.minimum_prime_factor[number]);
            number /= self.minimum_prime_factor[number];
        }
        Ok(result)
    }
}

#[cfg(test)]
mod tests {
    use super::LinearSieve;

    #[test]
    fn small_primes_list() {
        let mut ls = LinearSieve::new();
        ls.prepare(25).unwrap();
        assert_eq!(ls.primes, vec![2, 3, 5, 7, 11, 13, 17, 19, 23]);
    }

    #[test]
    fn divisible_by_mpf() {
        let mut ls = LinearSieve::new();
        ls.prepare(1000).unwrap();
        for i in 2..=1000 {
            let div = i / ls.minimum_prime_factor[i];
            assert_eq!(i % ls.minimum_prime_factor[i], 0);
            if div == 1 {
                // Number must be prime
                assert!(ls.primes.binary_search(&i).is_ok());
            }
        }
    }

    #[test]
    fn check_factorization() {
        let mut ls = LinearSieve::new();
        ls.prepare(1000).unwrap();
        for i in 1..=1000 {
            let factorization = ls.factorize(i).unwrap();
            let mut product = 1usize;
            for (idx, p) in factorization.iter().enumerate() {
                assert!(ls.primes.binary_search(&p).is_ok());
                product *= *p;
                if idx > 0 {
                    assert!(*p >= factorization[idx - 1]);
                }
            }
            assert_eq!(product, i);
        }
    }

    #[test]
    fn check_number_of_primes() {
        let mut ls = LinearSieve::new();
        ls.prepare(100_000).unwrap();
        assert_eq!(ls.primes.len(), 9592);
    }
}
```

`INSERT HERE`

## POLLARD'S RHO ALGORITHM

`INSERT HERE`

```rust
use super::miller_rabin;

struct LinearCongruenceGenerator {
    // modulus as 2 ^ 32
    multiplier: u32,
    increment: u32,
    state: u32,
}

impl LinearCongruenceGenerator {
    fn new(multiplier: u32, increment: u32, state: u32) -> Self {
        Self {
            multiplier,
            increment,
            state,
        }
    }
    fn next(&mut self) -> u32 {
        self.state = (self.multiplier as u64 * self.state as u64 + self.increment as u64) as u32;
        self.state
    }
    fn get_64bits(&mut self) -> u64 {
        ((self.next() as u64) << 32) | (self.next() as u64)
    }
}

fn gcd(mut a: u64, mut b: u64) -> u64 {
    while a != 0 {
        let tmp = b % a;
        b = a;
        a = tmp;
    }
    b
}

#[inline]
fn advance(x: u128, c: u64, number: u64) -> u128 {
    ((x * x) + c as u128) % number as u128
}

fn pollard_rho_customizable(
    number: u64,
    x0: u64,
    c: u64,
    iterations_before_check: u32,
    iterations_cutoff: u32,
) -> u64 {
    /*
    Here we are using Brent's method for finding cycle.
    It is generally faster because we will not use `advance` function as often
    as Floyd's method.
    We also wait to do a few iterations before calculating the GCD, because
    it is an expensive function. We will correct for overshooting later.
    This function may return either 1, `number` or a proper divisor of `number`
     */
    let mut x = x0 as u128; // tortoise
    let mut x_start = 0_u128; // to save the starting tortoise if we overshoot
    let mut y = 0_u128; // hare
    let mut remainder = 1_u128;
    let mut current_gcd = 1_u64;
    let mut max_iterations = 1_u32;
    while current_gcd == 1 {
        y = x;
        for _ in 1..max_iterations {
            x = advance(x, c, number);
        }
        let mut big_iteration = 0_u32;
        while big_iteration < max_iterations && current_gcd == 1 {
            x_start = x;
            let mut small_iteration = 0_u32;
            while small_iteration < iterations_before_check
                && small_iteration < (max_iterations - big_iteration)
            {
                small_iteration += 1;
                x = advance(x, c, number);
                let diff = x.abs_diff(y);
                remainder = (remainder * diff) % number as u128;
            }
            current_gcd = gcd(remainder as u64, number);
            big_iteration += iterations_before_check;
        }
        max_iterations *= 2;
        if max_iterations > iterations_cutoff {
            break;
        }
    }
    if current_gcd == number {
        while current_gcd == 1 {
            x_start = advance(x_start, c, number);
            current_gcd = gcd(x_start.abs_diff(y) as u64, number);
        }
    }
    current_gcd
}

/*
Note: using this function with `check_is_prime` = false
and a prime number will result in an infinite loop.

RNG's internal state is represented as `seed`. It is
advisable (but not mandatory) to reuse the saved seed value
In subsequent calls to this function.
 */
pub fn pollard_rho_get_one_factor(number: u64, seed: &mut u32, check_is_prime: bool) -> u64 {
    // LCG parameters from wikipedia
    let mut rng = LinearCongruenceGenerator::new(1103515245, 12345, *seed);
    if number <= 1 {
        return number;
    }
    if check_is_prime {
        let mut bases = vec![2u64, 3, 5, 7];
        if number > 3_215_031_000 {
            bases.append(&mut vec![11, 13, 17, 19, 23, 29, 31, 37]);
        }
        if miller_rabin(number, &bases) == 0 {
            return number;
        }
    }
    let mut factor = 1u64;
    while factor == 1 || factor == number {
        let x = rng.get_64bits();
        let c = rng.get_64bits();
        factor = pollard_rho_customizable(
            number,
            (x % (number - 3)) + 2,
            (c % (number - 2)) + 1,
            32,
            1 << 18, // This shouldn't take much longer than number ^ 0.25
        );
        // These numbers were selected based on local testing.
        // For specific applications there maybe better choices.
    }
    *seed = rng.state;
    factor
}

fn get_small_factors(mut number: u64, primes: &[usize]) -> (u64, Vec<u64>) {
    let mut result: Vec<u64> = Vec::new();
    for p in primes {
        while (number % *p as u64) == 0 {
            number /= *p as u64;
            result.push(*p as u64);
        }
    }
    (number, result)
}

fn factor_using_mpf(mut number: usize, mpf: &[usize]) -> Vec<u64> {
    let mut result = Vec::new();
    while number > 1 {
        result.push(mpf[number] as u64);
        number /= mpf[number];
    }
    result
}

/*
`primes` and `minimum_prime_factors` use usize because so does
LinearSieve implementation in this repository
 */
pub fn pollard_rho_factorize(
    mut number: u64,
    seed: &mut u32,
    primes: &[usize],
    minimum_prime_factors: &[usize],
) -> Vec<u64> {
    if number <= 1 {
        return vec![];
    }
    let mut result: Vec<u64> = Vec::new();
    {
        // Create a new scope to keep the outer scope clean
        let (rem, mut res) = get_small_factors(number, primes);
        number = rem;
        result.append(&mut res);
    }
    if number == 1 {
        return result;
    }
    let mut to_be_factored = vec![number];
    while !to_be_factored.is_empty() {
        let last = to_be_factored.pop().unwrap();
        if last < minimum_prime_factors.len() as u64 {
            result.append(&mut factor_using_mpf(last as usize, minimum_prime_factors));
            continue;
        }
        let fact = pollard_rho_get_one_factor(last, seed, true);
        if fact == last {
            result.push(last);
            continue;
        }
        to_be_factored.push(fact);
        to_be_factored.push(last / fact);
    }
    result.sort_unstable();
    result
}

#[cfg(test)]
mod test {
    use super::super::LinearSieve;
    use super::*;

    fn check_is_proper_factor(number: u64, factor: u64) -> bool {
        factor > 1 && factor < number && ((number % factor) == 0)
    }

    fn check_factorization(number: u64, factors: &[u64]) -> bool {
        let bases = vec![2u64, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37];
        let mut prod = 1_u64;
        let mut prime_check = 0_u64;
        for p in factors {
            prod *= *p;
            prime_check |= miller_rabin(*p, &bases);
        }
        prime_check == 0 && prod == number
    }

    #[test]
    fn one_factor() {
        // a few small cases
        let mut sieve = LinearSieve::new();
        sieve.prepare(1e5 as usize).unwrap();
        let numbers = vec![1235, 239874233, 4353234, 456456, 120983];
        let mut seed = 314159_u32; // first digits of pi; nothing up my sleeve
        for num in numbers {
            let factor = pollard_rho_get_one_factor(num, &mut seed, true);
            assert!(check_is_proper_factor(num, factor));
            let factor = pollard_rho_get_one_factor(num, &mut seed, false);
            assert!(check_is_proper_factor(num, factor));
            assert!(check_factorization(
                num,
                &pollard_rho_factorize(num, &mut seed, &sieve.primes, &sieve.minimum_prime_factor)
            ));
        }
        // check if it goes into infinite loop if `number` is prime
        let numbers = vec![
            2, 3, 5, 7, 11, 13, 101, 998244353, 1000000007, 1000000009, 1671398671, 1652465729,
            1894404511, 1683402997, 1661963047, 1946039987, 2071566551, 1867816303, 1952199377,
            1622379469, 1739317499, 1775433631, 1994828917, 1818930719, 1672996277,
        ];
        for num in numbers {
            assert_eq!(pollard_rho_get_one_factor(num, &mut seed, true), num);
            assert!(check_factorization(
                num,
                &pollard_rho_factorize(num, &mut seed, &sieve.primes, &sieve.minimum_prime_factor)
            ));
        }
    }
    #[test]
    fn big_numbers() {
        // Bigger cases:
        // Each of these numbers is a product of two 31 bit primes
        // This shouldn't take more than a 10ms per number on a modern PC
        let mut seed = 314159_u32; // first digits of pi; nothing up my sleeve
        let numbers: Vec<u64> = vec![
            2761929023323646159,
            3189046231347719467,
            3234246546378360389,
            3869305776707280953,
            3167208188639390813,
            3088042782711408869,
            3628455596280801323,
            2953787574901819241,
            3909561575378030219,
            4357328471891213977,
            2824368080144930999,
            3348680054093203003,
            2704267100962222513,
            2916169237307181179,
            3669851121098875703,
        ];
        for num in numbers {
            assert!(check_factorization(
                num,
                &pollard_rho_factorize(num, &mut seed, &vec![], &vec![])
            ));
        }
    }
}
```

`INSERT HERE`

## QUADRATIC RESIDUE

`INSERT HERE`

```rust
/// Cipolla algorithm
///
/// Solving quadratic residue problem:
///     x^2 = a (mod p) , p is an odd prime
/// with O(M*log(n)) time complexity, M depends on the complexity of complex numbers multiplication.
///
/// Wikipedia reference: https://en.wikipedia.org/wiki/Cipolla%27s_algorithm
/// When a is the primitive root modulo n, the answer is unique.
/// Otherwise it will return the smallest positive solution
use std::rc::Rc;
use std::time::{SystemTime, UNIX_EPOCH};

use super::{fast_power, PCG32};

#[derive(Debug)]
struct CustomFiniteFiled {
    modulus: u64,
    i_square: u64,
}

impl CustomFiniteFiled {
    pub fn new(modulus: u64, i_square: u64) -> Self {
        Self { modulus, i_square }
    }
}

#[derive(Clone, Debug)]
struct CustomComplexNumber {
    real: u64,
    imag: u64,
    f: Rc<CustomFiniteFiled>,
}

impl CustomComplexNumber {
    pub fn new(real: u64, imag: u64, f: Rc<CustomFiniteFiled>) -> Self {
        Self { real, imag, f }
    }

    pub fn mult_other(&mut self, rhs: &Self) {
        let tmp = (self.imag * rhs.real + self.real * rhs.imag) % self.f.modulus;
        self.real = (self.real * rhs.real
            + ((self.imag * rhs.imag) % self.f.modulus) * self.f.i_square)
            % self.f.modulus;
        self.imag = tmp;
    }

    pub fn mult_self(&mut self) {
        let tmp = (self.imag * self.real + self.real * self.imag) % self.f.modulus;
        self.real = (self.real * self.real
            + ((self.imag * self.imag) % self.f.modulus) * self.f.i_square)
            % self.f.modulus;
        self.imag = tmp;
    }

    pub fn fast_power(mut base: Self, mut power: u64) -> Self {
        let mut result = CustomComplexNumber::new(1, 0, base.f.clone());
        while power != 0 {
            if (power & 1) != 0 {
                result.mult_other(&base); // result *= base;
            }
            base.mult_self(); // base *= base;
            power >>= 1;
        }
        result
    }
}

fn is_residue(x: u64, modulus: u64) -> bool {
    let power = (modulus - 1) >> 1;
    x != 0 && fast_power(x as usize, power as usize, modulus as usize) == 1
}

// return two solutions (x1, x2) for Quadratic Residue problem x^2 = a (mod p), where p is an odd prime
// if a is Quadratic Nonresidues, return None
pub fn cipolla(a: u32, p: u32, seed: Option<u64>) -> Option<(u32, u32)> {
    // The params should be kept in u32 range for multiplication overflow issue
    // But inside we use u64 for convenience
    let a = a as u64;
    let p = p as u64;
    if a == 0 {
        return Some((0, 0));
    }
    if !is_residue(a, p) {
        return None;
    }
    let seed = match seed {
        Some(seed) => seed,
        None => SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap()
            .as_secs(),
    };
    let mut rng = PCG32::new_default(seed);
    let r = loop {
        let r = rng.get_u64() % p;
        if r == 0 || !is_residue((p + r * r - a) % p, p) {
            break r;
        }
    };
    let filed = Rc::new(CustomFiniteFiled::new(p, (p + r * r - a) % p));
    let comp = CustomComplexNumber::new(r, 1, filed);
    let power = (p + 1) >> 1;
    let x0 = CustomComplexNumber::fast_power(comp, power).real as u32;
    let x1 = p as u32 - x0 as u32;
    if x0 < x1 {
        Some((x0, x1))
    } else {
        Some((x1, x0))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn small_numbers() {
        assert_eq!(cipolla(1, 43, None), Some((1, 42)));
        assert_eq!(cipolla(2, 23, None), Some((5, 18)));
        assert_eq!(cipolla(17, 83, Some(42)), Some((10, 73)));
    }

    #[test]
    fn random_numbers() {
        assert_eq!(cipolla(392203, 852167, None), Some((413252, 438915)));
        assert_eq!(
            cipolla(379606557, 425172197, None),
            Some((143417827, 281754370))
        );
        assert_eq!(
            cipolla(585251669, 892950901, None),
            Some((192354555, 700596346))
        );
        assert_eq!(
            cipolla(404690348, 430183399, Some(19260817)),
            Some((57227138, 372956261))
        );
        assert_eq!(
            cipolla(210205747, 625380647, Some(998244353)),
            Some((76810367, 548570280))
        );
    }

    #[test]
    fn no_answer() {
        assert_eq!(cipolla(650927, 852167, None), None);
    }
}
```

`INSERT HERE`

## SIMPSON'S RULE FOR INTEGRATION

`INSERT HERE`

```rust
// This gives a better approximation than naive approach
// See https://en.wikipedia.org/wiki/Simpson%27s_rule
pub fn simpson_integration<F: Fn(f64) -> f64>(
    start: f64,
    end: f64,
    steps: u64,
    function: F,
) -> f64 {
    let mut result = function(start) + function(end);
    let step = (end - start) / steps as f64;
    for i in 1..steps {
        let x = start + step * i as f64;
        match i % 2 {
            0 => result += function(x) * 2.0,
            1 => result += function(x) * 4.0,
            _ => unreachable!(),
        }
    }
    result *= step / 3.0;
    result
}

#[cfg(test)]
mod tests {

    use super::*;
    const EPSILON: f64 = 1e-9;

    fn almost_equal(a: f64, b: f64, eps: f64) -> bool {
        (a - b).abs() < eps
    }

    #[test]
    fn parabola_curve_length() {
        // Calculate the length of the curve f(x) = x^2 for -5 <= x <= 5
        // We should integrate sqrt(1 + (f'(x))^2)
        let function = |x: f64| -> f64 { (1.0 + 4.0 * x * x).sqrt() };
        let result = simpson_integration(-5.0, 5.0, 1_000, function);
        let integrated = |x: f64| -> f64 { (x * function(x) / 2.0) + ((2.0 * x).asinh() / 4.0) };
        let expected = integrated(5.0) - integrated(-5.0);
        assert!(almost_equal(result, expected, EPSILON));
    }

    #[test]
    fn area_under_cosine() {
        use std::f64::consts::PI;
        // Calculate area under f(x) = cos(x) + 5 for -pi <= x <= pi
        // cosine should cancel out and the answer should be 2pi * 5
        let function = |x: f64| -> f64 { x.cos() + 5.0 };
        let result = simpson_integration(-PI, PI, 1_000, function);
        let expected = 2.0 * PI * 5.0;
        assert!(almost_equal(result, expected, EPSILON));
    }
}
```

`INSERT HERE`

## FAST FOURIER TRANSFORM

`INSERT HERE`

```rust
use std::ops::{Add, Mul, MulAssign, Sub};

// f64 complex
#[derive(Clone, Copy, Debug)]
pub struct Complex64 {
    pub re: f64,
    pub im: f64,
}

impl Complex64 {
    #[inline]
    pub fn new(re: f64, im: f64) -> Self {
        Self { re, im }
    }

    #[inline]
    pub fn square_norm(&self) -> f64 {
        self.re * self.re + self.im * self.im
    }

    #[inline]
    pub fn norm(&self) -> f64 {
        self.square_norm().sqrt()
    }

    #[inline]
    pub fn inverse(&self) -> Complex64 {
        let nrm = self.square_norm();
        Complex64 {
            re: self.re / nrm,
            im: -self.im / nrm,
        }
    }
}

impl Default for Complex64 {
    #[inline]
    fn default() -> Self {
        Self { re: 0.0, im: 0.0 }
    }
}

impl Add<Complex64> for Complex64 {
    type Output = Complex64;

    #[inline]
    fn add(self, other: Complex64) -> Complex64 {
        Complex64 {
            re: self.re + other.re,
            im: self.im + other.im,
        }
    }
}

impl Sub<Complex64> for Complex64 {
    type Output = Complex64;

    #[inline]
    fn sub(self, other: Complex64) -> Complex64 {
        Complex64 {
            re: self.re - other.re,
            im: self.im - other.im,
        }
    }
}

impl Mul<Complex64> for Complex64 {
    type Output = Complex64;

    #[inline]
    fn mul(self, other: Complex64) -> Complex64 {
        Complex64 {
            re: self.re * other.re - self.im * other.im,
            im: self.re * other.im + self.im * other.re,
        }
    }
}

impl MulAssign<Complex64> for Complex64 {
    #[inline]
    fn mul_assign(&mut self, other: Complex64) {
        let tmp = self.re * other.im + self.im * other.re;
        self.re = self.re * other.re - self.im * other.im;
        self.im = tmp;
    }
}

pub fn fast_fourier_transform_input_permutation(length: usize) -> Vec<usize> {
    let mut result = Vec::new();
    result.reserve_exact(length);
    for i in 0..length {
        result.push(i);
    }
    let mut reverse = 0_usize;
    let mut position = 1_usize;
    while position < length {
        let mut bit = length >> 1;
        while bit & reverse != 0 {
            reverse ^= bit;
            bit >>= 1;
        }
        reverse ^= bit;
        // This is equivalent to adding 1 to a reversed number
        if position < reverse {
            // Only swap each element once
            result.swap(position, reverse);
        }
        position += 1;
    }
    result
}

pub fn fast_fourier_transform(input: &[f64], input_permutation: &[usize]) -> Vec<Complex64> {
    let n = input.len();
    let mut result = Vec::new();
    result.reserve_exact(n);
    for position in input_permutation {
        result.push(Complex64::new(input[*position], 0.0));
    }
    let mut segment_length = 1_usize;
    while segment_length < n {
        segment_length <<= 1;
        let angle: f64 = std::f64::consts::TAU / segment_length as f64;
        let w_len = Complex64::new(angle.cos(), angle.sin());
        for segment_start in (0..n).step_by(segment_length) {
            let mut w = Complex64::new(1.0, 0.0);
            for position in segment_start..(segment_start + segment_length / 2) {
                let a = result[position];
                let b = result[position + segment_length / 2] * w;
                result[position] = a + b;
                result[position + segment_length / 2] = a - b;
                w *= w_len;
            }
        }
    }
    result
}

pub fn inverse_fast_fourier_transform(
    input: &[Complex64],
    input_permutation: &[usize],
) -> Vec<f64> {
    let n = input.len();
    let mut result = Vec::new();
    result.reserve_exact(n);
    for position in input_permutation {
        result.push(input[*position]);
    }
    let mut segment_length = 1_usize;
    while segment_length < n {
        segment_length <<= 1;
        let angle: f64 = -std::f64::consts::TAU / segment_length as f64;
        let w_len = Complex64::new(angle.cos(), angle.sin());
        for segment_start in (0..n).step_by(segment_length) {
            let mut w = Complex64::new(1.0, 0.0);
            for position in segment_start..(segment_start + segment_length / 2) {
                let a = result[position];
                let b = result[position + segment_length / 2] * w;
                result[position] = a + b;
                result[position + segment_length / 2] = a - b;
                w *= w_len;
            }
        }
    }
    let scale = 1.0 / n as f64;
    result.iter().map(|x| x.re * scale).collect()
}

#[cfg(test)]
mod tests {
    use super::*;
    fn almost_equal(a: f64, b: f64, epsilon: f64) -> bool {
        (a - b).abs() < epsilon
    }

    const EPSILON: f64 = 1e-6;

    #[test]
    fn small_polynomial_returns_self() {
        let polynomial = vec![1.0f64, 1.0, 0.0, 2.5];
        let permutation = fast_fourier_transform_input_permutation(polynomial.len());
        let fft = fast_fourier_transform(&polynomial, &permutation);
        let ifft = inverse_fast_fourier_transform(&fft, &permutation);
        for (x, y) in ifft.iter().zip(polynomial.iter()) {
            assert!(almost_equal(*x, *y, EPSILON));
        }
    }

    #[test]
    fn square_small_polynomial() {
        let mut polynomial = vec![1.0f64, 1.0, 0.0, 2.0];
        polynomial.append(&mut vec![0.0; 4]);
        let permutation = fast_fourier_transform_input_permutation(polynomial.len());
        let mut fft = fast_fourier_transform(&polynomial, &permutation);
        fft.iter_mut().for_each(|num| *num *= *num);
        let ifft = inverse_fast_fourier_transform(&fft, &permutation);
        let expected = vec![1.0, 2.0, 1.0, 4.0, 4.0, 0.0, 4.0, 0.0, 0.0];
        for (x, y) in ifft.iter().zip(expected.iter()) {
            assert!(almost_equal(*x, *y, EPSILON));
        }
    }

    #[test]
    #[ignore]
    fn square_big_polynomial() {
        // This test case takes ~1050ms on my machine in unoptimized mode,
        // but it takes ~70ms in release mode.
        let n = 1 << 17; // ~100_000
        let mut polynomial = vec![1.0f64; n];
        polynomial.append(&mut vec![0.0f64; n]);
        let permutation = fast_fourier_transform_input_permutation(polynomial.len());
        let mut fft = fast_fourier_transform(&polynomial, &permutation);
        fft.iter_mut().for_each(|num| *num *= *num);
        let ifft = inverse_fast_fourier_transform(&fft, &permutation);
        let mut expected = vec![0.0; n << 1];
        for i in 0..((n << 1) - 1) {
            expected[i] = std::cmp::min(i + 1, (n << 1) - 1 - i) as f64;
        }
        for (x, y) in ifft.iter().zip(expected.iter()) {
            assert!(almost_equal(*x, *y, EPSILON));
        }
    }
}
```

`INSERT HERE`

## ARMSTRONG NUMBER

`INSERT HERE`

```rust
pub fn is_armstrong_number(number: u32) -> bool {
    let mut digits: Vec<u32> = Vec::new();
    let mut num: u32 = number;

    loop {
        digits.push(num % 10);
        num /= 10;
        if num == 0 {
            break;
        }
    }

    let sum_nth_power_of_digits: u32 = digits
        .iter()
        .map(|digit| digit.pow(digits.len() as u32))
        .sum();
    sum_nth_power_of_digits == number
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn one_digit_armstrong_number() {
        assert!(is_armstrong_number(1))
    }
    #[test]
    fn two_digit_numbers_are_not_armstrong_numbers() {
        assert!(!is_armstrong_number(15))
    }
    #[test]
    fn three_digit_armstrong_number() {
        assert!(is_armstrong_number(153))
    }
    #[test]
    fn three_digit_non_armstrong_number() {
        assert!(!is_armstrong_number(105))
    }
    #[test]
    fn big_armstrong_number() {
        assert!(is_armstrong_number(912985153))
    }
}
```

`INSERT HERE`

## PERMUTED CONGRUENTIAL RANDOM NUMBER GENERATOR

`INSERT HERE`

```rust
/*
Permuted Congruential Generator
https://en.wikipedia.org/wiki/Permuted_congruential_generator

Note that this is _NOT_ intended for serious applications. Use this generator
at your own risk and only use your own values instead of the default ones if
you really know what you are doing.
 */
pub struct PCG32 {
    state: u64,
    multiplier: u64,
    increment: u64,
}

pub const PCG32_MULTIPLIER: u64 = 6364136223846793005_u64;
pub const PCG32_INCREMENT: u64 = 1442695040888963407_u64;

pub struct IterMut<'a> {
    pcg: &'a mut PCG32,
}

impl PCG32 {
    /// `stream` should be less than 1 << 63
    pub fn new(seed: u64, multiplier: u64, stream: u64) -> Self {
        // We should make sure that increment is odd
        let increment = (stream << 1) | 1;
        let mut pcg = PCG32 {
            state: seed.wrapping_add(increment),
            multiplier,
            increment,
        };
        pcg.next();
        pcg
    }
    pub fn new_default(seed: u64) -> Self {
        let multiplier = PCG32_MULTIPLIER;
        let increment = PCG32_INCREMENT;
        let mut pcg = PCG32 {
            state: seed.wrapping_add(increment),
            multiplier,
            increment,
        };
        pcg.next();
        pcg
    }
    #[inline]
    pub fn next(&mut self) {
        self.state = self
            .state
            .wrapping_mul(self.multiplier)
            .wrapping_add(self.increment);
    }
    #[inline]
    /// Advance the PCG by `delta` steps in O(lg(`delta`)) time. By passing
    /// a negative i64 as u64, it can go back too.
    pub fn advance(&mut self, mut delta: u64) {
        let mut acc_mult = 1u64;
        let mut acc_incr = 0u64;
        let mut curr_mlt = self.multiplier;
        let mut curr_inc = self.increment;
        while delta > 0 {
            if delta & 1 != 0 {
                acc_mult = acc_mult.wrapping_mul(curr_mlt);
                acc_incr = acc_incr.wrapping_mul(curr_mlt).wrapping_add(curr_inc);
            }
            curr_inc = curr_mlt.wrapping_add(1).wrapping_mul(curr_inc);
            curr_mlt = curr_mlt.wrapping_mul(curr_mlt);
            delta >>= 1;
        }
        self.state = acc_mult.wrapping_mul(self.state).wrapping_add(acc_incr);
    }
    #[inline]
    pub fn get_u32(&mut self) -> u32 {
        let mut x = self.state;
        let count = (x >> 59) as u32;

        self.next();

        x ^= x >> 18;
        ((x >> 27) as u32).rotate_right(count)
    }
    #[inline]
    pub fn get_u64(&mut self) -> u64 {
        self.get_u32() as u64 ^ ((self.get_u32() as u64) << 32)
    }
    #[inline]
    pub fn get_u16(&mut self) -> (u16, u16) {
        let res = self.get_u32();
        (res as u16, (res >> 16) as u16)
    }
    #[inline]
    pub fn get_u8(&mut self) -> (u8, u8, u8, u8) {
        let res = self.get_u32();
        (
            res as u8,
            (res >> 8) as u8,
            (res >> 16) as u8,
            (res >> 24) as u8,
        )
    }
    #[inline]
    pub fn get_state(&self) -> u64 {
        self.state
    }
    pub fn iter_mut(&mut self) -> IterMut {
        IterMut { pcg: self }
    }
}

impl<'a> Iterator for IterMut<'a> {
    type Item = u32;
    fn next(&mut self) -> Option<Self::Item> {
        Some(self.pcg.get_u32())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn no_birthday() {
        // If the distribution is not almost uniform, the probability of
        // birthday paradox increases. For n=2^32 and k=1e5, the probability
        // of not having a collision is about (1 - (k+1)/n) ^ (k/2) which is
        // 0.3121 for this (n, k).
        // So this test is a (dumb) test for distribution, and for speed. This
        // is only basic sanity checking, as the actual algorithm was
        // rigorously tested by others before.
        let numbers = 1e5 as usize;
        let mut pcg = PCG32::new_default(314159);
        let mut pcg2 = PCG32::new_default(314159);
        assert_eq!(pcg.get_u32(), pcg2.get_u32());
        let mut randoms: Vec<u32> = pcg.iter_mut().take(numbers).collect::<Vec<u32>>();
        pcg2.advance(1000);
        assert_eq!(pcg2.get_u32(), randoms[1000]);
        pcg2.advance((-1001_i64) as u64);
        assert_eq!(pcg2.get_u32(), randoms[0]);
        randoms.sort_unstable();
        randoms.dedup();
        assert_eq!(randoms.len(), numbers);
    }
}
```

`INSERT HERE`

## ZELLER'S CONGRUENCE ALGORITHM

`INSERT HERE`

```rust
// returns the day of the week from the Gregorian Date

pub fn zellers_congruence_algorithm(date: i32, month: i32, year: i32, as_string: bool) -> String {
    let q = date;
    let mut m = month;
    let mut y = year;
    if month < 3 {
        m = month + 12;
        y = year - 1;
    }
    let day: i32 =
        (q + (26 * (m + 1) / 10) + (y % 100) + ((y % 100) / 4) + ((y / 100) / 4) + (5 * (y / 100)))
            % 7;
    if as_string {
        number_to_day(day)
    } else {
        day.to_string()
    }
    /* Note that the day follows the following guidelines:
    0 = Saturday
    1 = Sunday
    2 = Monday
    3 = Tuesday
    4 = Wednesday
    5 = Thursday
    6 = Friday
    */
}

fn number_to_day(number: i32) -> String {
    let days = [
        "Saturday",
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
    ];
    String::from(days[number as usize])
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn it_works() {
        assert_eq!(zellers_congruence_algorithm(25, 1, 2013, false), "6");
        assert_eq!(zellers_congruence_algorithm(25, 1, 2013, true), "Friday");
        assert_eq!(zellers_congruence_algorithm(16, 4, 2022, false), "0");
        assert_eq!(zellers_congruence_algorithm(16, 4, 2022, true), "Saturday");
        assert_eq!(zellers_congruence_algorithm(14, 12, 1978, false), "5");
        assert_eq!(zellers_congruence_algorithm(15, 6, 2021, false), "3");
    }
}
```

`INSERT HERE`

## KARATSUBA MULTIPLICATION ALGORITHM

`INSERT HERE`

```rust
/*
Finds the product of two numbers using Karatsuba Algorithm
 */
use std::cmp::max;
const TEN: i128 = 10;

pub fn multiply(num1: i128, num2: i128) -> i128 {
    _multiply(num1, num2)
}

fn _multiply(num1: i128, num2: i128) -> i128 {
    if num1 < 10 || num2 < 10 {
        return num1 * num2;
    }
    let mut num1_str = num1.to_string();
    let mut num2_str = num2.to_string();

    let n = max(num1_str.len(), num2_str.len());
    num1_str = normalize(num1_str, n);
    num2_str = normalize(num2_str, n);

    let a = &num1_str[0..n / 2];
    let b = &num1_str[n / 2..];
    let c = &num2_str[0..n / 2];
    let d = &num2_str[n / 2..];

    let ac = _multiply(a.parse().unwrap(), c.parse().unwrap());
    let bd = _multiply(b.parse().unwrap(), d.parse().unwrap());
    let a_b: i128 = a.parse::<i128>().unwrap() + b.parse::<i128>().unwrap();
    let c_d: i128 = c.parse::<i128>().unwrap() + d.parse::<i128>().unwrap();
    let ad_bc = _multiply(a_b, c_d) - (ac + bd);

    let m = n / 2 + n % 2;
    (TEN.pow(2 * m as u32) * ac) + (TEN.pow(m as u32) * ad_bc) + (bd)
}

fn normalize(mut a: String, n: usize) -> String {
    for (counter, _) in (a.len()..n).enumerate() {
        a.insert(counter, '0');
    }
    a
}
#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn test_1() {
        let n1: i128 = 314159265;
        let n2: i128 = 314159265;
        let ans = multiply(n1, n2);
        assert_eq!(ans, n1 * n2);
    }

    #[test]
    fn test_2() {
        let n1: i128 = 3141592653589793232;
        let n2: i128 = 2718281828459045233;
        let ans = multiply(n1, n2);
        assert_eq!(ans, n1 * n2);
    }

    #[test]
    fn test_3() {
        let n1: i128 = 123456789;
        let n2: i128 = 101112131415;
        let ans = multiply(n1, n2);
        assert_eq!(ans, n1 * n2);
    }
}
```

`INSERT HERE`

## FINANCIAL INTEREST

`INSERT HERE`

```rust
// value of e
use std::f64::consts::E;

// function to calculate simple interest
pub fn simple_interest(principal: f64, annual_rate: f64, years: f64) -> (f64, f64) {
    let interest = principal * annual_rate * years;
    let value = principal * (1.0 + (annual_rate * years));

    println!("Interest earned: {:?}", interest);
    println!("Future value: {:?}", value);

    (interest, value)
}

// function to calculate compound interest compounded over periods or continuously
pub fn compound_interest(principal: f64, annual_rate: f64, years: f64, period: Option<f64>) -> f64 {
    // checks if the the period is None type, if so calculates continuous compounding interest
    let value = if period.is_none() {
        principal * E.powf(annual_rate * years)
    } else {
        // unwraps the option type or defaults to 0 if None type and assigns it to prim_period
        let prim_period: f64 = period.unwrap_or(0.0);
        // checks if the period is less than or equal to zero
        if prim_period <= 0.0_f64 {
            return f64::NAN;
        }
        principal * (1.0 + (annual_rate / prim_period).powf(prim_period * years))
    };
    println!("Future value: {:?}", value);
    value
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn test_simple() {
        let x = 385.65_f64 * 0.03_f64 * 5.0_f64;
        let y = 385.65_f64 * (1.0 + (0.03_f64 * 5.0_f64));
        assert_eq!(simple_interest(385.65_f64, 0.03_f64, 5.0_f64), (x, y));
    }
    #[test]
    fn test_compounding() {
        let x = 385.65_f64 * E.powf(0.03_f64 * 5.0_f64);
        assert_eq!(compound_interest(385.65_f64, 0.03_f64, 5.0_f64, None), x);

        let y = 385.65_f64 * (1.0 + (0.03_f64 / 5.0_f64).powf(5.0_f64 * 5.0_f64));
        assert_eq!(
            compound_interest(385.65_f64, 0.03_f64, 5.0_f64, Some(5.0_f64)),
            y
        );
        assert!(compound_interest(385.65_f64, 0.03_f64, 5.0_f64, Some(-5.0_f64)).is_nan());
        assert!(compound_interest(385.65_f64, 0.03_f64, 5.0_f64, Some(0.0_f64)).is_nan());
    }
}
```

`INSERT HERE`

