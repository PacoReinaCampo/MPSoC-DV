# EXAMPLES: DYNAMIC PROGRAMMING

`INSERT HERE`

## 0-1 KNAPSACK

`INSERT HERE`

```rust
//! Solves the knapsack problem
use std::cmp::max;

/// knapsack_table(w, weights, values) returns the knapsack table (`n`, `m`) with maximum values, where `n` is number of items
///
/// Arguments:
///     * `w` - knapsack capacity
///     * `weights` - set of weights for each item
///     * `values` - set of values for each item
fn knapsack_table(w: &usize, weights: &[usize], values: &[usize]) -> Vec<Vec<usize>> {
    // Initialize `n` - number of items
    let n: usize = weights.len();
    // Initialize `m`
    // m[i, w] - the maximum value that can be attained with weight less that or equal to `w` using items up to `i`
    let mut m: Vec<Vec<usize>> = vec![vec![0; w + 1]; n + 1];

    for i in 0..=n {
        for j in 0..=*w {
            // m[i, j] compiled according to the following rule:
            if i == 0 || j == 0 {
                m[i][j] = 0;
            } else if weights[i - 1] <= j {
                // If `i` is in the knapsack
                // Then m[i, j] is equal to the maximum value of the knapsack,
                // where the weight `j` is reduced by the weight of the `i-th` item and the set of admissible items plus the value `k`
                m[i][j] = max(values[i - 1] + m[i - 1][j - weights[i - 1]], m[i - 1][j]);
            } else {
                // If the item `i` did not get into the knapsack
                // Then m[i, j] is equal to the maximum cost of a knapsack with the same capacity and a set of admissible items
                m[i][j] = m[i - 1][j]
            }
        }
    }
    m
}

/// knapsack_items(weights, m, i, j) returns the indices of the items of the optimal knapsack (from 1 to `n`)
///
/// Arguments:
///     * `weights` - set of weights for each item
///     * `m` - knapsack table with maximum values
///     * `i` - include items 1 through `i` in knapsack (for the initial value, use `n`)
///     * `j` - maximum weight of the knapsack
fn knapsack_items(weights: &[usize], m: &[Vec<usize>], i: usize, j: usize) -> Vec<usize> {
    if i == 0 {
        return vec![];
    }
    if m[i][j] > m[i - 1][j] {
        let mut knap: Vec<usize> = knapsack_items(weights, m, i - 1, j - weights[i - 1]);
        knap.push(i);
        knap
    } else {
        knapsack_items(weights, m, i - 1, j)
    }
}

/// knapsack(w, weights, values) returns the tuple where first value is `optimal profit`,
/// second value is `knapsack optimal weight` and the last value is `indices of items`, that we got (from 1 to `n`)
///
/// Arguments:
///     * `w` - knapsack capacity
///     * `weights` - set of weights for each item
///     * `values` - set of values for each item
///
/// Complexity
///     - time complexity: O(nw),
///     - space complexity: O(nw),
///
/// where `n` and `w` are `number of items` and `knapsack capacity`
pub fn knapsack(w: usize, weights: Vec<usize>, values: Vec<usize>) -> (usize, usize, Vec<usize>) {
    // Checks if the number of items in the list of weights is the same as the number of items in the list of values
    assert_eq!(weights.len(), values.len(), "Number of items in the list of weights doesn't match the number of items in the list of values!");
    // Initialize `n` - number of items
    let n: usize = weights.len();
    // Find the knapsack table
    let m: Vec<Vec<usize>> = knapsack_table(&w, &weights, &values);
    // Find the indices of the items
    let items: Vec<usize> = knapsack_items(&weights, &m, n, w);
    // Find the total weight of optimal knapsack
    let mut total_weight: usize = 0;
    for i in items.iter() {
        total_weight += weights[i - 1];
    }
    // Return result
    (m[n][w], total_weight, items)
}

#[cfg(test)]
mod tests {
    // Took test datasets from https://people.sc.fsu.edu/~jburkardt/datasets/bin_packing/bin_packing.html
    use super::*;

    #[test]
    fn test_p02() {
        assert_eq!(
            (51, 26, vec![2, 3, 4]),
            knapsack(26, vec![12, 7, 11, 8, 9], vec![24, 13, 23, 15, 16])
        );
    }

    #[test]
    fn test_p04() {
        assert_eq!(
            (150, 190, vec![1, 2, 5]),
            knapsack(
                190,
                vec![56, 59, 80, 64, 75, 17],
                vec![50, 50, 64, 46, 50, 5]
            )
        );
    }

    #[test]
    fn test_p01() {
        assert_eq!(
            (309, 165, vec![1, 2, 3, 4, 6]),
            knapsack(
                165,
                vec![23, 31, 29, 44, 53, 38, 63, 85, 89, 82],
                vec![92, 57, 49, 68, 60, 43, 67, 84, 87, 72]
            )
        );
    }

    #[test]
    fn test_p06() {
        assert_eq!(
            (1735, 169, vec![2, 4, 7]),
            knapsack(
                170,
                vec![41, 50, 49, 59, 55, 57, 60],
                vec![442, 525, 511, 593, 546, 564, 617]
            )
        );
    }

    #[test]
    fn test_p07() {
        assert_eq!(
            (1458, 749, vec![1, 3, 5, 7, 8, 9, 14, 15]),
            knapsack(
                750,
                vec![70, 73, 77, 80, 82, 87, 90, 94, 98, 106, 110, 113, 115, 118, 120],
                vec![135, 139, 149, 150, 156, 163, 173, 184, 192, 201, 210, 214, 221, 229, 240]
            )
        );
    }
}
```

`INSERT HERE`

## EDIT DISTANCE

`INSERT HERE`

```rust
//! Compute the edit distance between two strings

use std::cmp::min;

/// edit_distance(str_a, str_b) returns the edit distance between the two
/// strings This edit distance is defined as being 1 point per insertion,
/// substitution, or deletion which must be made to make the strings equal.
///
/// This function iterates over the bytes in the string, so it may not behave
/// entirely as expected for non-ASCII strings.
///
/// # Complexity
///
/// - time complexity: O(nm),
/// - space complexity: O(nm),
///
/// where n and m are lengths of `str_a` and `str_b`
pub fn edit_distance(str_a: &str, str_b: &str) -> u32 {
    // distances[i][j] = distance between a[..i] and b[..j]
    let mut distances = vec![vec![0; str_b.len() + 1]; str_a.len() + 1];
    // Initialize cases in which one string is empty
    for j in 0..=str_b.len() {
        distances[0][j] = j as u32;
    }
    for (i, item) in distances.iter_mut().enumerate() {
        item[0] = i as u32;
    }
    for i in 1..=str_a.len() {
        for j in 1..=str_b.len() {
            distances[i][j] = min(distances[i - 1][j] + 1, distances[i][j - 1] + 1);
            if str_a.as_bytes()[i - 1] == str_b.as_bytes()[j - 1] {
                distances[i][j] = min(distances[i][j], distances[i - 1][j - 1]);
            } else {
                distances[i][j] = min(distances[i][j], distances[i - 1][j - 1] + 1);
            }
        }
    }
    distances[str_a.len()][str_b.len()]
}

/// The space efficient version of the above algorithm.
///
/// Instead of storing the `m * n` matrix expicitly, only one row (of length `n`) is stored.
/// It keeps overwriting itself based on its previous values with the help of two scalars,
/// gradually reaching the last row. Then, the score is `matrix[n]`.
///
/// # Complexity
///
/// - time complexity: O(nm),
/// - space complexity: O(n),
///
/// where n and m are lengths of `str_a` and `str_b`
pub fn edit_distance_se(str_a: &str, str_b: &str) -> u32 {
    let (str_a, str_b) = (str_a.as_bytes(), str_b.as_bytes());
    let (m, n) = (str_a.len(), str_b.len());
    let mut distances: Vec<u32> = vec![0; n + 1]; // the dynamic programming matrix (only 1 row stored)
    let mut s: u32; // distances[i - 1][j - 1] or distances[i - 1][j]
    let mut c: u32; // distances[i][j - 1] or distances[i][j]
    let mut char_a: u8; // str_a[i - 1] the i-th character in str_a; only needs to be computed once per row
    let mut char_b: u8; // str_b[j - 1] the j-th character in str_b

    // 0th row
    for (j, v) in distances.iter_mut().enumerate().take(n + 1).skip(1) {
        *v = j as u32;
    }
    // rows 1 to m
    for i in 1..=m {
        s = (i - 1) as u32;
        c = i as u32;
        char_a = str_a[i - 1];
        for j in 1..=n {
            // c is distances[i][j-1] and s is distances[i-1][j-1] at the beginning of each round of iteration
            char_b = str_b[j - 1];
            c = min(
                s + u32::from(char_a != char_b),
                min(c + 1, distances[j] + 1),
            );
            // c is updated to distances[i][j], and will thus become distances[i][j-1] for the next cell
            s = distances[j]; // here distances[j] means distances[i-1][j] because it has not been overwritten yet
                              // s is updated to distances[i-1][j], and will thus become distances[i-1][j-1] for the next cell
            distances[j] = c; // now distances[j] is updated to distances[i][j], and will thus become distances[i-1][j] for the next ROW
        }
    }

    distances[n]
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn equal_strings() {
        assert_eq!(0, edit_distance("Hello, world!", "Hello, world!"));
        assert_eq!(0, edit_distance_se("Hello, world!", "Hello, world!"));
        assert_eq!(0, edit_distance("Test_Case_#1", "Test_Case_#1"));
        assert_eq!(0, edit_distance_se("Test_Case_#1", "Test_Case_#1"));
    }

    #[test]
    fn one_edit_difference() {
        assert_eq!(1, edit_distance("Hello, world!", "Hell, world!"));
        assert_eq!(1, edit_distance("Test_Case_#1", "Test_Case_#2"));
        assert_eq!(1, edit_distance("Test_Case_#1", "Test_Case_#10"));
        assert_eq!(1, edit_distance_se("Hello, world!", "Hell, world!"));
        assert_eq!(1, edit_distance_se("Test_Case_#1", "Test_Case_#2"));
        assert_eq!(1, edit_distance_se("Test_Case_#1", "Test_Case_#10"));
    }

    #[test]
    fn several_differences() {
        assert_eq!(2, edit_distance("My Cat", "My Case"));
        assert_eq!(7, edit_distance("Hello, world!", "Goodbye, world!"));
        assert_eq!(6, edit_distance("Test_Case_#3", "Case #3"));
        assert_eq!(2, edit_distance_se("My Cat", "My Case"));
        assert_eq!(7, edit_distance_se("Hello, world!", "Goodbye, world!"));
        assert_eq!(6, edit_distance_se("Test_Case_#3", "Case #3"));
    }
}
```

`INSERT HERE`

## LONGEST COMMON SUBSEQUENCE

`INSERT HERE`

```rust
/// Longest common subsequence via Dynamic Programming

/// longest_common_subsequence(a, b) returns the longest common subsequence
/// between the strings a and b.
pub fn longest_common_subsequence(a: &str, b: &str) -> String {
    let a: Vec<_> = a.chars().collect();
    let b: Vec<_> = b.chars().collect();
    let (na, nb) = (a.len(), b.len());

    // solutions[i][j] is the length of the longest common subsequence
    // between a[0..i-1] and b[0..j-1]
    let mut solutions = vec![vec![0; nb + 1]; na + 1];

    for (i, ci) in a.iter().enumerate() {
        for (j, cj) in b.iter().enumerate() {
            // if ci == cj, there is a new common character;
            // otherwise, take the best of the two solutions
            // at (i-1,j) and (i,j-1)
            solutions[i + 1][j + 1] = if ci == cj {
                solutions[i][j] + 1
            } else {
                solutions[i][j + 1].max(solutions[i + 1][j])
            }
        }
    }

    // reconstitute the solution string from the lengths
    let mut result: Vec<char> = Vec::new();
    let (mut i, mut j) = (na, nb);
    while i > 0 && j > 0 {
        if a[i - 1] == b[j - 1] {
            result.push(a[i - 1]);
            i -= 1;
            j -= 1;
        } else if solutions[i - 1][j] > solutions[i][j - 1] {
            i -= 1;
        } else {
            j -= 1;
        }
    }

    result.reverse();
    result.iter().collect()
}

#[cfg(test)]
mod tests {
    use super::longest_common_subsequence;

    #[test]
    fn test_longest_common_subsequence() {
        // empty case
        assert_eq!(&longest_common_subsequence("", ""), "");
        assert_eq!(&longest_common_subsequence("", "abcd"), "");
        assert_eq!(&longest_common_subsequence("abcd", ""), "");

        // simple cases
        assert_eq!(&longest_common_subsequence("abcd", "c"), "c");
        assert_eq!(&longest_common_subsequence("abcd", "d"), "d");
        assert_eq!(&longest_common_subsequence("abcd", "e"), "");
        assert_eq!(&longest_common_subsequence("abcdefghi", "acegi"), "acegi");

        // less simple cases
        assert_eq!(&longest_common_subsequence("abcdgh", "aedfhr"), "adh");
        assert_eq!(&longest_common_subsequence("aggtab", "gxtxayb"), "gtab");

        // unicode
        assert_eq!(
            &longest_common_subsequence("你好，世界", "再见世界"),
            "世界"
        );
    }
}
```

`INSERT HERE`

## LONGEST CONTINUOUS INCREASING SUBSEQUENCE

`INSERT HERE`

```rust
pub fn longest_continuous_increasing_subsequence<T: Ord>(input_array: &[T]) -> &[T] {
    let length: usize = input_array.len();

    //Handle the base cases
    if length <= 1 {
        return input_array;
    }

    //Create the array to store the longest subsequence at each location
    let mut tracking_vec = vec![1; length];

    //Iterate through the input and store longest subsequences at each location in the vector
    for i in (0..length - 1).rev() {
        if input_array[i] < input_array[i + 1] {
            tracking_vec[i] = tracking_vec[i + 1] + 1;
        }
    }

    //Find the longest subsequence
    let mut max_index: usize = 0;
    let mut max_value: i32 = 0;
    for (index, value) in tracking_vec.iter().enumerate() {
        if value > &max_value {
            max_value = *value;
            max_index = index;
        }
    }

    &input_array[max_index..max_index + max_value as usize]
}

#[cfg(test)]
mod tests {
    use super::longest_continuous_increasing_subsequence;

    #[test]
    fn test_longest_increasing_subsequence() {
        //Base Cases
        let base_case_array: [i32; 0] = [];
        assert_eq!(
            &longest_continuous_increasing_subsequence(&base_case_array),
            &[]
        );
        assert_eq!(&longest_continuous_increasing_subsequence(&[1]), &[1]);

        //Normal i32 Cases
        assert_eq!(
            &longest_continuous_increasing_subsequence(&[1, 2, 3, 4]),
            &[1, 2, 3, 4]
        );
        assert_eq!(
            &longest_continuous_increasing_subsequence(&[1, 2, 2, 3, 4, 2]),
            &[2, 3, 4]
        );
        assert_eq!(
            &longest_continuous_increasing_subsequence(&[5, 4, 3, 2, 1]),
            &[5]
        );
        assert_eq!(
            &longest_continuous_increasing_subsequence(&[5, 4, 3, 4, 2, 1]),
            &[3, 4]
        );

        //Non-Numeric case
        assert_eq!(
            &longest_continuous_increasing_subsequence(&['a', 'b', 'c']),
            &['a', 'b', 'c']
        );
        assert_eq!(
            &longest_continuous_increasing_subsequence(&['d', 'c', 'd']),
            &['c', 'd']
        );
    }
}
```

`INSERT HERE`

## LONGEST INCREASING SUBSEQUENCE

`INSERT HERE`

```rust
/// Finds the longest increasing subsequence and returns it.
///
/// If multiple subsequences with the longest possible subsequence length can be found, the
/// subsequence which appeared first will be returned (see `test_example_1`).
///
/// Inspired by [this LeetCode problem](https://leetcode.com/problems/longest-increasing-subsequence/).
pub fn longest_increasing_subsequence<T: Ord + Clone>(input_array: &[T]) -> Vec<T> {
    let n = input_array.len();
    if n <= 1 {
        return input_array.to_vec();
    }

    let mut increasing_sequence: Vec<(T, usize)> = Vec::new();
    let mut previous = vec![0_usize; n];

    increasing_sequence.push((input_array[0].clone(), 1));
    for i in 1..n {
        let value = input_array[i].clone();
        if value > increasing_sequence.last().unwrap().0 {
            previous[i] = increasing_sequence.last().unwrap().1 - 1;
            increasing_sequence.push((value, i + 1));
            continue;
        }

        let change_position = increasing_sequence
            .binary_search(&(value.clone(), 0))
            .unwrap_or_else(|x| x);
        increasing_sequence[change_position] = (value, i + 1);
        previous[i] = match change_position {
            0 => i,
            other => increasing_sequence[other - 1].1 - 1,
        };
    }

    // Construct subsequence
    let mut out: Vec<T> = Vec::with_capacity(increasing_sequence.len());

    out.push(increasing_sequence.last().unwrap().0.clone());
    let mut current_index = increasing_sequence.last().unwrap().1 - 1;
    while previous[current_index] != current_index {
        current_index = previous[current_index];
        out.push(input_array[current_index].clone());
    }

    out.into_iter().rev().collect()
}

#[cfg(test)]
mod tests {
    use super::longest_increasing_subsequence;

    #[test]
    /// Need to specify generic type T in order to function
    fn test_empty_vec() {
        assert_eq!(longest_increasing_subsequence::<i32>(&vec![]), vec![]);
    }

    #[test]
    fn test_example_1() {
        assert_eq!(
            longest_increasing_subsequence(&vec![10, 9, 2, 5, 3, 7, 101, 18]),
            vec![2, 3, 7, 18]
        );
    }

    #[test]
    fn test_example_2() {
        assert_eq!(
            longest_increasing_subsequence(&vec![0, 1, 0, 3, 2, 3]),
            vec![0, 1, 2, 3]
        );
    }

    #[test]
    fn test_example_3() {
        assert_eq!(
            longest_increasing_subsequence(&vec![7, 7, 7, 7, 7, 7, 7]),
            vec![7]
        );
    }

    #[test]
    fn test_tle() {
        let mut input_array = vec![0i64; 1e5 as usize];
        let mut expected_result: Vec<i64> = Vec::with_capacity(5e4 as usize);
        for (idx, num) in input_array.iter_mut().enumerate() {
            match idx % 2 {
                0 => {
                    *num = idx as i64;
                    expected_result.push(*num);
                }
                1 => *num = -(idx as i64),
                _ => unreachable!(),
            }
        }
        expected_result[0] = -1;
        assert_eq!(
            longest_increasing_subsequence(&input_array),
            expected_result
        );
        // should be [-1, 2, 4, 6, 8, ...]
        // the first number is not 0, it would be replaced by -1 before 2 is added
    }

    #[test]
    fn test_negative_elements() {
        assert_eq!(longest_increasing_subsequence(&vec![-2, -1]), vec![-2, -1]);
    }
}
```

`INSERT HERE`

## K-MEANS CLUSTERING

`INSERT HERE`

```rust
// Macro to implement kmeans for both f64 and f32 without writing everything
// twice or importing the `num` crate
macro_rules! impl_kmeans {
    ($kind: ty, $modname: ident) => {
        // Since we can't overload methods in rust, we have to use namespacing
        pub mod $modname {
            use std::$modname::INFINITY;

            /// computes sum of squared deviation between two identically sized vectors
            /// `x`, and `y`.
            fn distance(x: &[$kind], y: &[$kind]) -> $kind {
                x.iter()
                    .zip(y.iter())
                    .fold(0.0, |dist, (&xi, &yi)| dist + (xi - yi).powi(2))
            }

            /// Returns a vector containing the indices z<sub>i</sub> in {0, ..., K-1} of
            /// the centroid nearest to each datum.
            fn nearest_centroids(xs: &[Vec<$kind>], centroids: &[Vec<$kind>]) -> Vec<usize> {
                xs.iter()
                    .map(|xi| {
                        // Find the argmin by folding using a tuple containing the argmin
                        // and the minimum distance.
                        let (argmin, _) = centroids.iter().enumerate().fold(
                            (0_usize, INFINITY),
                            |(min_ix, min_dist), (ix, ci)| {
                                let dist = distance(xi, ci);
                                if dist < min_dist {
                                    (ix, dist)
                                } else {
                                    (min_ix, min_dist)
                                }
                            },
                        );
                        argmin
                    })
                    .collect()
            }

            /// Recompute the centroids given the current clustering
            fn recompute_centroids(
                xs: &[Vec<$kind>],
                clustering: &[usize],
                k: usize,
            ) -> Vec<Vec<$kind>> {
                let ndims = xs[0].len();

                // NOTE: Kind of inefficient because we sweep all the data from each of the
                // k centroids.
                (0..k)
                    .map(|cluster_ix| {
                        let mut centroid: Vec<$kind> = vec![0.0; ndims];
                        let mut n_cluster: $kind = 0.0;
                        xs.iter().zip(clustering.iter()).for_each(|(xi, &zi)| {
                            if zi == cluster_ix {
                                n_cluster += 1.0;
                                xi.iter().enumerate().for_each(|(j, &x_ij)| {
                                    centroid[j] += x_ij;
                                });
                            }
                        });
                        centroid.iter().map(|&c_j| c_j / n_cluster).collect()
                    })
                    .collect()
            }

            /// Assign the N D-dimensional data, `xs`, to `k` clusters using K-Means clustering
            pub fn kmeans(xs: Vec<Vec<$kind>>, k: usize) -> Vec<usize> {
                assert!(xs.len() >= k);

                // Rather than pulling in a dependency to radomly select the staring
                // points for the centroids, we're going to deterministally choose them by
                // slecting evenly spaced points in `xs`
                let n_per_cluster: usize = xs.len() / k;
                let centroids: Vec<Vec<$kind>> =
                    (0..k).map(|j| xs[j * n_per_cluster].clone()).collect();

                let mut clustering = nearest_centroids(&xs, &centroids);

                loop {
                    let centroids = recompute_centroids(&xs, &clustering, k);
                    let new_clustering = nearest_centroids(&xs, &centroids);

                    // loop until the clustering doesn't change after the new centroids are computed
                    if new_clustering
                        .iter()
                        .zip(clustering.iter())
                        .all(|(&za, &zb)| za == zb)
                    {
                        // We need to use `return` to break out of the `loop`
                        return clustering;
                    } else {
                        clustering = new_clustering;
                    }
                }
            }
        }
    };
}

// generate code for kmeans for f32 and f64 data
impl_kmeans!(f64, f64);
impl_kmeans!(f32, f32);

#[cfg(test)]
mod test {
    use self::super::f64::kmeans;

    #[test]
    fn easy_univariate_clustering() {
        let xs: Vec<Vec<f64>> = vec![
            vec![-1.1],
            vec![-1.2],
            vec![-1.3],
            vec![-1.4],
            vec![1.1],
            vec![1.2],
            vec![1.3],
            vec![1.4],
        ];
        let clustering = kmeans(xs, 2);
        assert_eq!(clustering, vec![0, 0, 0, 0, 1, 1, 1, 1]);
    }

    #[test]
    fn easy_univariate_clustering_odd_number_of_data() {
        let xs: Vec<Vec<f64>> = vec![
            vec![-1.1],
            vec![-1.2],
            vec![-1.3],
            vec![-1.4],
            vec![1.1],
            vec![1.2],
            vec![1.3],
            vec![1.4],
            vec![1.5],
        ];
        let clustering = kmeans(xs, 2);
        assert_eq!(clustering, vec![0, 0, 0, 0, 1, 1, 1, 1, 1]);
    }

    #[test]
    fn easy_bivariate_clustering() {
        let xs: Vec<Vec<f64>> = vec![
            vec![-1.1, 0.2],
            vec![-1.2, 0.3],
            vec![-1.3, 0.1],
            vec![-1.4, 0.4],
            vec![1.1, -1.1],
            vec![1.2, -1.0],
            vec![1.3, -1.2],
            vec![1.4, -1.3],
        ];
        let clustering = kmeans(xs, 2);
        assert_eq!(clustering, vec![0, 0, 0, 0, 1, 1, 1, 1]);
    }

    #[test]
    fn high_dims() {
        let xs: Vec<Vec<f64>> = vec![
            vec![-2.7825343, -1.7604825, -5.5550113, -2.9752946, -2.7874138],
            vec![-2.9847919, -3.8209332, -2.1531757, -2.2710119, -2.3582877],
            vec![-3.0109320, -2.2366132, -2.8048492, -1.2632331, -4.5755581],
            vec![-2.8432186, -1.0383805, -2.2022826, -2.7435962, -2.0013399],
            vec![-2.6638082, -3.5520086, -1.3684702, -2.1562444, -1.3186447],
            vec![1.7409171, 1.9687576, 4.7162628, 4.5743537, 3.7905611],
            vec![3.2932369, 2.8508700, 2.5580937, 2.0437325, 4.2192562],
            vec![2.5843321, 2.8329818, 2.1329531, 3.2562319, 2.4878733],
            vec![2.1859638, 3.2880048, 3.7018615, 2.3641232, 1.6281994],
            vec![2.6201773, 0.9006588, 2.6774097, 1.8188620, 1.6076493],
        ];

        let clustering = kmeans(xs, 2);
        assert_eq!(clustering, vec![0, 0, 0, 0, 0, 1, 1, 1, 1, 1]);
    }
}
```

`INSERT HERE`

## COIN CHANGE

`INSERT HERE`

```rust
/// Coin change via Dynamic Programming

/// coin_change(coins, amount) returns the fewest number of coins that need to make up that amount.
/// If that amount of money cannot be made up by any combination of the coins, return `None`.
///
/// Arguments:
///     * `coins` - coins of different denominations
///     * `amount` - a total amount of money be made up.
/// Complexity
///     - time complexity: O(amount * coins.length),
///     - space complexity: O(amount),
pub fn coin_change(coins: &[usize], amount: usize) -> Option<usize> {
    let mut dp = vec![None; amount + 1];
    dp[0] = Some(0);

    // Assume dp[i] is the fewest number of coins making up amount i,
    // then for every coin in coins, dp[i] = min(dp[i - coin] + 1).
    for i in 0..=amount {
        for &coin in coins {
            if i >= coin {
                dp[i] = match dp[i - coin] {
                    Some(prev_coins) => match dp[i] {
                        Some(curr_coins) => Some(curr_coins.min(prev_coins + 1)),
                        None => Some(prev_coins + 1),
                    },
                    None => dp[i],
                };
            }
        }
    }

    dp[amount]
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn basic() {
        // 11 = 5 * 2 + 1 * 1
        let coins = vec![1, 2, 5];
        assert_eq!(Some(3), coin_change(&coins, 11));

        // 119 = 11 * 10 + 7 * 1 + 2 * 1
        let coins = vec![2, 3, 5, 7, 11];
        assert_eq!(Some(12), coin_change(&coins, 119));
    }

    #[test]
    fn coins_empty() {
        let coins = vec![];
        assert_eq!(None, coin_change(&coins, 1));
    }

    #[test]
    fn amount_zero() {
        let coins = vec![1, 2, 3];
        assert_eq!(Some(0), coin_change(&coins, 0));
    }

    #[test]
    fn fail_change() {
        // 3 can't be change by 2.
        let coins = vec![2];
        assert_eq!(None, coin_change(&coins, 3));
        let coins = vec![10, 20, 50, 100];
        assert_eq!(None, coin_change(&coins, 5));
    }
}
```

`INSERT HERE`

## ROD CUTTING

`INSERT HERE`

```rust
//! Solves the rod-cutting problem
use std::cmp::max;

/// `rod_cut(p)` returns the maximum possible profit if a rod of length `n` = `p.len()`
/// is cut into up to `n` pieces, where the profit gained from each piece of length
/// `l` is determined by `p[l - 1]` and the total profit is the sum of the profit
/// gained from each piece.
///
/// # Arguments
///    - `p` - profit for rods of length 1 to n inclusive
///
/// # Complexity
///    - time complexity: O(n^2),
///    - space complexity: O(n^2),
///
/// where n is the length of `p`.
pub fn rod_cut(p: &[usize]) -> usize {
    let n = p.len();
    // f is the dynamic programming table
    let mut f = vec![0; n];

    for i in 0..n {
        let mut max_price = p[i];
        for j in 1..=i {
            max_price = max(max_price, p[j - 1] + f[i - j]);
        }
        f[i] = max_price;
    }

    // accomodate for input with length zero
    if n != 0 {
        f[n - 1]
    } else {
        0
    }
}

#[cfg(test)]
mod tests {
    use super::rod_cut;

    #[test]
    fn test_rod_cut() {
        assert_eq!(0, rod_cut(&[]));
        assert_eq!(15, rod_cut(&[5, 8, 2]));
        assert_eq!(10, rod_cut(&[1, 5, 8, 9]));
        assert_eq!(25, rod_cut(&[5, 8, 2, 1, 7]));
        assert_eq!(87, rod_cut(&[0, 0, 0, 0, 0, 87]));
        assert_eq!(49, rod_cut(&[7, 6, 5, 4, 3, 2, 1]));
        assert_eq!(22, rod_cut(&[1, 5, 8, 9, 10, 17, 17, 20]));
        assert_eq!(60, rod_cut(&[6, 4, 8, 2, 5, 8, 2, 3, 7, 11]));
        assert_eq!(30, rod_cut(&[1, 5, 8, 9, 10, 17, 17, 20, 24, 30]));
        assert_eq!(12, rod_cut(&[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]));
    }
}
```

`INSERT HERE`

## EGG DROPPING PUZZLE

`INSERT HERE`

```rust
/// # Egg Dropping Puzzle

/// `egg_drop(eggs, floors)` returns the least number of egg droppings
///     required to determine the highest floor from which an egg will not
///     break upon dropping
///
/// Assumptions: n > 0
pub fn egg_drop(eggs: u32, floors: u32) -> u32 {
    assert!(eggs > 0);

    // Explicity handle edge cases (optional)
    if eggs == 1 || floors == 0 || floors == 1 {
        return floors;
    }

    let eggs_index = eggs as usize;
    let floors_index = floors as usize;

    // Store solutions to subproblems in 2D Vec,
    // where egg_drops[i][j] represents the solution to the egg dropping
    // problem with i eggs and j floors
    let mut egg_drops: Vec<Vec<u32>> = vec![vec![0; floors_index + 1]; eggs_index + 1];

    // Assign solutions for egg_drop(n, 0) = 0, egg_drop(n, 1) = 1
    for egg_drop in egg_drops.iter_mut().skip(1) {
        egg_drop[0] = 0;
        egg_drop[1] = 1;
    }

    // Assign solutions to egg_drop(1, k) = k
    for j in 1..=floors_index {
        egg_drops[1][j] = j as u32;
    }

    // Complete solutions vector using optimal substructure property
    for i in 2..=eggs_index {
        for j in 2..=floors_index {
            egg_drops[i][j] = std::u32::MAX;

            for k in 1..=j {
                let res = 1 + std::cmp::max(egg_drops[i - 1][k - 1], egg_drops[i][j - k]);

                if res < egg_drops[i][j] {
                    egg_drops[i][j] = res;
                }
            }
        }
    }

    egg_drops[eggs_index][floors_index]
}

#[cfg(test)]
mod tests {
    use super::egg_drop;

    #[test]
    fn zero_floors() {
        assert_eq!(egg_drop(5, 0), 0);
    }

    #[test]
    fn one_egg() {
        assert_eq!(egg_drop(1, 8), 8);
    }

    #[test]
    fn eggs2_floors2() {
        assert_eq!(egg_drop(2, 2), 2);
    }

    #[test]
    fn eggs3_floors5() {
        assert_eq!(egg_drop(3, 5), 3);
    }

    #[test]
    fn eggs2_floors10() {
        assert_eq!(egg_drop(2, 10), 4);
    }

    #[test]
    fn eggs2_floors36() {
        assert_eq!(egg_drop(2, 36), 8);
    }

    #[test]
    fn large_floors() {
        assert_eq!(egg_drop(2, 100), 14);
    }
}
```

`INSERT HERE`

## MAXIMUM SUBARRAY

`INSERT HERE`

```rust
/// ## maximum subarray via Dynamic Programming

/// maximum_subarray(array) find the subarray (containing at least one number) which has the largest sum
/// and return its sum.
///
/// A subarray is a contiguous part of an array.
///
/// Arguments:
///     * `array` - an integer array
/// Complexity
///     - time complexity: O(array.length),
///     - space complexity: O(array.length),
pub fn maximum_subarray(array: &[i32]) -> i32 {
    let mut dp = vec![0; array.len()];
    dp[0] = array[0];
    let mut result = dp[0];

    for i in 1..array.len() {
        if dp[i - 1] > 0 {
            dp[i] = dp[i - 1] + array[i];
        } else {
            dp[i] = array[i];
        }
        result = result.max(dp[i]);
    }

    result
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn non_negative() {
        //the maximum value: 1 + 0 + 5 + 8 = 14
        let array = vec![1, 0, 5, 8];
        assert_eq!(maximum_subarray(&array), 14);
    }

    #[test]
    fn negative() {
        //the maximum value: -1
        let array = vec![-3, -1, -8, -2];
        assert_eq!(maximum_subarray(&array), -1);
    }

    #[test]
    fn normal() {
        //the maximum value: 3 + (-2) + 5 = 6
        let array = vec![-4, 3, -2, 5, -8];
        assert_eq!(maximum_subarray(&array), 6);
    }

    #[test]
    fn single_element() {
        let array = vec![6];
        assert_eq!(maximum_subarray(&array), 6);
        let array = vec![-6];
        assert_eq!(maximum_subarray(&array), -6);
    }
}
```

`INSERT HERE`

## IS SUBSEQUENCE

`INSERT HERE`

```rust
// Given two strings str1 and str2, return true if str1 is a subsequence of str2, or false otherwise.
// A subsequence of a string is a new string that is formed from the original string
// by deleting some (can be none) of the characters without disturbing the relative
// positions of the remaining characters.
// (i.e., "ace" is a subsequence of "abcde" while "aec" is not).
pub fn is_subsequence(str1: String, str2: String) -> bool {
    let mut it1 = 0;
    let mut it2 = 0;

    let byte1 = str1.as_bytes();
    let byte2 = str2.as_bytes();

    while it1 < str1.len() && it2 < str2.len() {
        if byte1[it1] == byte2[it2] {
            it1 += 1;
        }

        it2 += 1;
    }

    it1 == str1.len()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test() {
        assert_eq!(
            is_subsequence(String::from("abc"), String::from("ahbgdc")),
            true
        );
        assert_eq!(
            is_subsequence(String::from("axc"), String::from("ahbgdc")),
            false
        );
    }
}
```

`INSERT HERE`

## MAXIMAL SQUARE

`INSERT HERE`

```rust
use std::cmp::max;
use std::cmp::min;

/// Maximal Square
/// Given an m x n binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.
/// https://leetcode.com/problems/maximal-square/
///
/// Arguments:
///     * `matrix` - an array of integer array
/// Complexity
///     - time complexity: O(n^2),
///     - space complexity: O(n),
pub fn maximal_square(matrix: &mut [Vec<i32>]) -> i32 {
    if matrix.is_empty() {
        return 0;
    }

    let rows = matrix.len();
    let cols = matrix[0].len();
    let mut result: i32 = 0;

    for row in 0..rows {
        for col in 0..cols {
            if matrix[row][col] == 1 {
                if row == 0 || col == 0 {
                    result = max(result, 1);
                } else {
                    let temp = min(matrix[row - 1][col - 1], matrix[row - 1][col]);

                    let count: i32 = min(temp, matrix[row][col - 1]) + 1;
                    result = max(result, count);

                    matrix[row][col] = count;
                }
            }
        }
    }

    result * result
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test() {
        assert_eq!(maximal_square(&mut vec![]), 0);

        let mut matrix = vec![vec![0, 1], vec![1, 0]];
        assert_eq!(maximal_square(&mut matrix), 1);

        let mut matrix = vec![
            vec![1, 0, 1, 0, 0],
            vec![1, 0, 1, 1, 1],
            vec![1, 1, 1, 1, 1],
            vec![1, 0, 0, 1, 0],
        ];
        assert_eq!(maximal_square(&mut matrix), 4);

        let mut matrix = vec![vec![0]];
        assert_eq!(maximal_square(&mut matrix), 0);
    }
}
```

`INSERT HERE`
