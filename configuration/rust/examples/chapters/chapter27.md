# EXAMPLES: GENERAL

`INSERT HERE`

## CONVEX HULL: GRAHAM SCAN

`INSERT HERE`

```rust
use std::cmp::Ordering::Equal;

fn sort_by_min_angle(pts: &[(f64, f64)], min: &(f64, f64)) -> Vec<(f64, f64)> {
    let mut points: Vec<(f64, f64, (f64, f64))> = pts
        .iter()
        .map(|x| {
            (
                ((x.1 - min.1) as f64).atan2((x.0 - min.0) as f64),
                // angle
                ((x.1 - min.1) as f64).hypot((x.0 - min.0) as f64),
                // distance (we want the closest to be first)
                *x,
            )
        })
        .collect();
    points.sort_by(|a, b| a.partial_cmp(b).unwrap_or(Equal));
    points.into_iter().map(|x| x.2).collect()
}

// calculates the z coordinate of the vector product of vectors ab and ac
fn calc_z_coord_vector_product(a: &(f64, f64), b: &(f64, f64), c: &(f64, f64)) -> f64 {
    (b.0 - a.0) * (c.1 - a.1) - (c.0 - a.0) * (b.1 - a.1)
}

/*
    If three points are aligned and are part of the convex hull then the three are kept.
    If one doesn't want to keep those points, it is easy to iterate the answer and remove them.

    The first point is the one with the lowest y-coordinate and the lowest x-coordinate.
    Points are then given counter-clockwise, and the closest one is given first if needed.
*/
pub fn convex_hull_graham(pts: &[(f64, f64)]) -> Vec<(f64, f64)> {
    if pts.is_empty() {
        return vec![];
    }

    let mut stack: Vec<(f64, f64)> = vec![];
    let min = pts
        .iter()
        .min_by(|a, b| {
            let ord = a.1.partial_cmp(&b.1).unwrap_or(Equal);
            match ord {
                Equal => a.0.partial_cmp(&b.0).unwrap_or(Equal),
                o => o,
            }
        })
        .unwrap();
    let points = sort_by_min_angle(pts, min);

    if points.len() <= 3 {
        return points;
    }

    for point in points {
        while stack.len() > 1
            && calc_z_coord_vector_product(&stack[stack.len() - 2], &stack[stack.len() - 1], &point)
                < 0.
        {
            stack.pop();
        }
        stack.push(point);
    }

    stack
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn empty() {
        assert_eq!(convex_hull_graham(&vec![]), vec![]);
    }

    #[test]
    fn not_enough_points() {
        let list = vec![(0f64, 0f64)];
        assert_eq!(convex_hull_graham(&list), list);
    }

    #[test]
    fn not_enough_points1() {
        let list = vec![(2f64, 2f64), (1f64, 1f64), (0f64, 0f64)];
        let ans = vec![(0f64, 0f64), (1f64, 1f64), (2f64, 2f64)];
        assert_eq!(convex_hull_graham(&list), ans);
    }

    #[test]
    fn not_enough_points2() {
        let list = vec![(2f64, 2f64), (1f64, 2f64), (0f64, 0f64)];
        let ans = vec![(0f64, 0f64), (2f64, 2f64), (1f64, 2f64)];
        assert_eq!(convex_hull_graham(&list), ans);
    }

    #[test]
    // from https://codegolf.stackexchange.com/questions/11035/find-the-convex-hull-of-a-set-of-2d-points
    fn lots_of_points() {
        let list = vec![
            (4.4, 14.),
            (6.7, 15.25),
            (6.9, 12.8),
            (2.1, 11.1),
            (9.5, 14.9),
            (13.2, 11.9),
            (10.3, 12.3),
            (6.8, 9.5),
            (3.3, 7.7),
            (0.6, 5.1),
            (5.3, 2.4),
            (8.45, 4.7),
            (11.5, 9.6),
            (13.8, 7.3),
            (12.9, 3.1),
            (11., 1.1),
        ];
        let ans = vec![
            (11., 1.1),
            (12.9, 3.1),
            (13.8, 7.3),
            (13.2, 11.9),
            (9.5, 14.9),
            (6.7, 15.25),
            (4.4, 14.),
            (2.1, 11.1),
            (0.6, 5.1),
            (5.3, 2.4),
        ];

        assert_eq!(convex_hull_graham(&list), ans);
    }

    #[test]
    // from https://codegolf.stackexchange.com/questions/11035/find-the-convex-hull-of-a-set-of-2d-points
    fn lots_of_points2() {
        let list = vec![
            (1., 0.),
            (1., 1.),
            (1., -1.),
            (0.68957, 0.283647),
            (0.909487, 0.644276),
            (0.0361877, 0.803816),
            (0.583004, 0.91555),
            (-0.748169, 0.210483),
            (-0.553528, -0.967036),
            (0.316709, -0.153861),
            (-0.79267, 0.585945),
            (-0.700164, -0.750994),
            (0.452273, -0.604434),
            (-0.79134, -0.249902),
            (-0.594918, -0.397574),
            (-0.547371, -0.434041),
            (0.958132, -0.499614),
            (0.039941, 0.0990732),
            (-0.891471, -0.464943),
            (0.513187, -0.457062),
            (-0.930053, 0.60341),
            (0.656995, 0.854205),
        ];
        let ans = vec![
            (1., -1.),
            (1., 0.),
            (1., 1.),
            (0.583004, 0.91555),
            (0.0361877, 0.803816),
            (-0.930053, 0.60341),
            (-0.891471, -0.464943),
            (-0.700164, -0.750994),
            (-0.553528, -0.967036),
        ];

        assert_eq!(convex_hull_graham(&list), ans);
    }
}
```

`INSERT HERE`

## N-QUEENS PROBLEM

`INSERT HERE`

```rust
/*
The n-Queens search is a backtracking algorithm. Each row of the Chess board where a Queen is
placed is dependent on all earlier rows. As only one Queen can fit per row, a one-dimensional
integer array is used to represent the Queen's offset on each row.
*/
pub fn nqueens(board_width: i64) -> Result<Vec<i64>, &'static str> {
    let mut board_rows = vec![0; board_width as usize];
    let mut conflict;
    let mut current_row = 0;

    //Process by row up to the current active row
    loop {
        conflict = false;

        //Column review of previous rows
        for review_index in 0..current_row {
            //Calculate the diagonals of earlier rows where a Queen would be a conflict
            let left = board_rows[review_index] - (current_row as i64 - review_index as i64);
            let right = board_rows[review_index] + (current_row as i64 - review_index as i64);

            if board_rows[current_row] == board_rows[review_index]
                || (left >= 0 && left == board_rows[current_row])
                || (right < board_width as i64 && right == board_rows[current_row])
            {
                conflict = true;
                break;
            }
        }

        match conflict {
            true => {
                board_rows[current_row] += 1;

                if current_row == 0 && board_rows[current_row] == board_width {
                    return Err("No solution exists for specificed board size.");
                }

                while board_rows[current_row] == board_width {
                    board_rows[current_row] = 0;

                    if current_row == 0 {
                        return Err("No solution exists for specificed board size.");
                    }

                    current_row -= 1;
                    board_rows[current_row] += 1;
                }
            }
            _ => {
                current_row += 1;

                if current_row as i64 == board_width {
                    break;
                }
            }
        }
    }

    Ok(board_rows)
}

#[cfg(test)]
mod test {
    use super::*;

    fn check_board(board: &Vec<i64>) -> bool {
        for current_row in 0..board.len() {
            //Column review
            for review_index in 0..current_row {
                //Look for any conflict.
                let left = board[review_index] - (current_row as i64 - review_index as i64);
                let right = board[review_index] + (current_row as i64 - review_index as i64);

                if board[current_row] == board[review_index]
                    || (left >= 0 && left == board[current_row])
                    || (right < board.len() as i64 && right == board[current_row])
                {
                    return false;
                }
            }
        }
        true
    }

    #[test]
    fn test_board_size_4() {
        let board = nqueens(4).expect("Error propagated.");
        assert_eq!(board, vec![1, 3, 0, 2]);
        assert!(check_board(&board));
    }

    #[test]
    fn test_board_size_7() {
        let board = nqueens(7).expect("Error propagated.");
        assert_eq!(board, vec![0, 2, 4, 6, 1, 3, 5]);
        assert!(check_board(&board));
    }
}
```

`INSERT HERE`

## TOWER OF HANOI

`INSERT HERE`

```rust
pub fn hanoi(n: i32, from: i32, to: i32, via: i32, moves: &mut Vec<(i32, i32)>) {
    if n > 0 {
        hanoi(n - 1, from, via, to, moves);
        moves.push((from, to));
        hanoi(n - 1, via, to, from, moves);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn hanoi_simple() {
        let correct_solution: Vec<(i32, i32)> =
            vec![(1, 3), (1, 2), (3, 2), (1, 3), (2, 1), (2, 3), (1, 3)];
        let mut our_solution: Vec<(i32, i32)> = Vec::new();
        hanoi(3, 1, 3, 2, &mut our_solution);
        assert_eq!(correct_solution, our_solution);
    }
}
```

`INSERT HERE`

## KMEANS

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

## TWO SUM

`INSERT HERE`

```rust
use std::collections::HashMap;

/// Given an array of integers nums and an integer target,
/// return indices of the two numbers such that they add up to target.
///
/// # Parameters
///
/// - `nums`: A list of numbers to check.
/// - `target`: The target sum.
///
/// # Returns
///
/// If the target sum is found in the array, the indices of the augend and
/// addend are returned as a tuple.
///
/// If the target sum cannot be found in the array, `None` is returned.
///
pub fn two_sum(nums: Vec<i32>, target: i32) -> Option<(usize, usize)> {
    // This HashMap is used to look up a corresponding index in the `nums` list.
    // Given that we know where we are at in the array, we can look up our
    // complementary value using this table and only go through the list once.
    //
    // We populate this table with distances from the target. As we go through
    // the list, a distance is computed like so:
    //
    //     `target - current_value`
    //
    // This distance also tells us about the complementary value we're looking
    // for in the array. If we don't find that value, we insert `current_value`
    // into the table for future look-ups. As we iterate through the list,
    // the number we just inserted might be the perfect distance for another
    // number, and we've found a match!
    //
    let mut distance_table: HashMap<i32, usize> = HashMap::new();

    for (i, current_value) in nums.iter().enumerate() {
        match distance_table.get(&(target - current_value)) {
            Some(j) => return Some((i, *j)),
            _ => distance_table.insert(*current_value, i),
        };
    }

    // No match was found!
    None
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn test() {
        let nums = vec![2, 7, 11, 15];
        assert_eq!(two_sum(nums, 9), Some((1, 0)));

        let nums = vec![3, 2, 4];
        assert_eq!(two_sum(nums, 6), Some((2, 1)));

        let nums = vec![3, 3];
        assert_eq!(two_sum(nums, 6), Some((1, 0)));

        let nums = vec![2, 7, 11, 15];
        assert_eq!(two_sum(nums, 16), None);
    }
}
```

`INSERT HERE`

## HUFFMAN ENCODING

`INSERT HERE`

```rust
use std::{
    cmp::Ordering,
    collections::{BTreeMap, BinaryHeap},
};

#[derive(Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Debug, Default)]
pub struct HuffmanValue {
    // For the `value` to overflow, the sum of frequencies should be bigger
    // than u64. So we should be safe here
    /// The encoded value
    pub value: u64,
    /// number of bits used (up to 64)
    pub bits: u32,
}

pub struct HuffmanNode<T> {
    pub left: Option<Box<HuffmanNode<T>>>,
    pub right: Option<Box<HuffmanNode<T>>>,
    pub symbol: Option<T>,
    pub frequency: u64,
}

impl<T> PartialEq for HuffmanNode<T> {
    fn eq(&self, other: &Self) -> bool {
        self.frequency == other.frequency
    }
}

impl<T> PartialOrd for HuffmanNode<T> {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(self.frequency.cmp(&other.frequency).reverse())
    }
}

impl<T> Eq for HuffmanNode<T> {}

impl<T> Ord for HuffmanNode<T> {
    fn cmp(&self, other: &Self) -> Ordering {
        self.frequency.cmp(&other.frequency).reverse()
    }
}

impl<T: Clone + Copy + Ord> HuffmanNode<T> {
    /// Turn the tree into the map that can be used in encoding
    pub fn get_alphabet(
        height: u32,
        path: u64,
        node: &HuffmanNode<T>,
        map: &mut BTreeMap<T, HuffmanValue>,
    ) {
        match node.symbol {
            Some(s) => {
                map.insert(
                    s,
                    HuffmanValue {
                        value: path,
                        bits: height,
                    },
                );
            }
            None => {
                Self::get_alphabet(height + 1, path, node.left.as_ref().unwrap(), map);
                Self::get_alphabet(
                    height + 1,
                    path | (1 << height),
                    node.right.as_ref().unwrap(),
                    map,
                );
            }
        }
    }
}

pub struct HuffmanDictionary<T> {
    pub alphabet: BTreeMap<T, HuffmanValue>,
    pub root: HuffmanNode<T>,
}

impl<T: Clone + Copy + Ord> HuffmanDictionary<T> {
    /// The list of alphabet symbols and their respective frequency should
    /// be given as input
    pub fn new(alphabet: &[(T, u64)]) -> Self {
        let mut alph: BTreeMap<T, HuffmanValue> = BTreeMap::new();
        let mut queue: BinaryHeap<HuffmanNode<T>> = BinaryHeap::new();
        for (symbol, freq) in alphabet.iter() {
            queue.push(HuffmanNode {
                left: None,
                right: None,
                symbol: Some(*symbol),
                frequency: *freq,
            });
        }
        for _ in 1..alphabet.len() {
            let left = queue.pop().unwrap();
            let right = queue.pop().unwrap();
            let sm_freq = left.frequency + right.frequency;
            queue.push(HuffmanNode {
                left: Some(Box::new(left)),
                right: Some(Box::new(right)),
                symbol: None,
                frequency: sm_freq,
            });
        }
        let root = queue.pop().unwrap();
        HuffmanNode::get_alphabet(0, 0, &root, &mut alph);
        HuffmanDictionary {
            alphabet: alph,
            root,
        }
    }
    pub fn encode(&self, data: &[T]) -> HuffmanEncoding {
        let mut result = HuffmanEncoding::new();
        data.iter()
            .for_each(|value| result.add_data(*self.alphabet.get(value).unwrap()));
        result
    }
}
pub struct HuffmanEncoding {
    pub num_bits: u64,
    pub data: Vec<u64>,
}

impl Default for HuffmanEncoding {
    fn default() -> Self {
        Self::new()
    }
}

impl HuffmanEncoding {
    pub fn new() -> Self {
        HuffmanEncoding {
            num_bits: 0,
            data: vec![0],
        }
    }
    #[inline]
    pub fn add_data(&mut self, data: HuffmanValue) {
        let shift = (self.num_bits & 63) as u32;
        let val = data.value;
        *self.data.last_mut().unwrap() |= val.wrapping_shl(shift);
        if (shift + data.bits) >= 64 {
            self.data.push(val.wrapping_shr(64 - shift));
        }
        self.num_bits += data.bits as u64;
    }
    fn get_bit(&self, pos: u64) -> bool {
        (self.data[(pos >> 6) as usize] & (1 << (pos & 63))) != 0
    }
    /// In case the encoding is invalid, `None` is returned
    pub fn decode<T: Clone + Copy + Ord>(&self, dict: &HuffmanDictionary<T>) -> Option<Vec<T>> {
        let mut state = &dict.root;
        let mut result: Vec<T> = vec![];
        for i in 0..self.num_bits {
            if state.symbol.is_some() {
                result.push(state.symbol.unwrap());
                state = &dict.root;
            }
            match self.get_bit(i) {
                false => state = state.left.as_ref().unwrap(),
                true => state = state.right.as_ref().unwrap(),
            }
        }
        if self.num_bits > 0 {
            result.push(state.symbol?);
        }
        Some(result)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    fn get_frequency(bytes: &[u8]) -> Vec<(u8, u64)> {
        let mut cnts: Vec<u64> = vec![0; 256];
        bytes.iter().for_each(|&b| cnts[b as usize] += 1);
        let mut result = vec![];
        cnts.iter()
            .enumerate()
            .filter(|(_, &v)| v > 0)
            .for_each(|(b, &cnt)| result.push((b as u8, cnt)));
        result
    }
    #[test]
    fn small_text() {
        let text = "Hello world";
        let bytes = text.as_bytes();
        let freq = get_frequency(bytes);
        let dict = HuffmanDictionary::new(&freq);
        let encoded = dict.encode(bytes);
        assert_eq!(encoded.num_bits, 32);
        let decoded = encoded.decode(&dict).unwrap();
        assert_eq!(decoded, bytes);
    }
    #[test]
    fn lorem_ipsum() {
        let text = concat!(
            "The quick brown fox jumped over the lazy dog.",
            "Lorem ipsum dolor sit amet, consectetur ",
            "adipiscing elit, sed do eiusmod tempor incididunt ut labore et ",
            "dolore magna aliqua. Facilisis magna etiam tempor orci. Nullam ",
            "non nisi est sit amet facilisis magna. Commodo nulla facilisi ",
            "nullam vehicula. Interdum posuere lorem ipsum dolor. Elit eget ",
            "gravida cum sociis natoque penatibus. Dictum sit amet justo donec ",
            "enim. Tempor commodo ullamcorper a lacus vestibulum sed. Nisl ",
            "suscipit adipiscing bibendum est ultricies. Sit amet aliquam id ",
            "diam maecenas ultricies."
        );
        let bytes = text.as_bytes();
        let freq = get_frequency(bytes);
        let dict = HuffmanDictionary::new(&freq);
        let encoded = dict.encode(bytes);
        assert_eq!(encoded.num_bits, 2372);
        let decoded = encoded.decode(&dict).unwrap();
        assert_eq!(decoded, bytes);

        let text = "The dictionary should work on other texts too";
        let bytes = text.as_bytes();
        let encoded = dict.encode(bytes);
        assert_eq!(encoded.num_bits, 215);
        let decoded = encoded.decode(&dict).unwrap();
        assert_eq!(decoded, bytes);
    }
}
```

`INSERT HERE`
