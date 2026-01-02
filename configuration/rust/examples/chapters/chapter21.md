# EXAMPLES: SORT ALGORITHMS

`INSERT HERE`

## BUBBLE

`INSERT HERE`

```rust
pub fn bubble_sort<T: Ord>(arr: &mut [T]) {
    if arr.is_empty() {
        return;
    }
    let mut sorted = false;
    let mut n = arr.len();
    while !sorted {
        sorted = true;
        for i in 0..n - 1 {
            if arr[i] > arr[i + 1] {
                arr.swap(i, i + 1);
                sorted = false;
            }
        }
        n -= 1;
    }
}

#[cfg(test)]
mod tests {
    use super::super::is_sorted;
    use super::*;

    #[test]
    fn descending() {
        //descending
        let mut ve1 = vec![6, 5, 4, 3, 2, 1];
        bubble_sort(&mut ve1);
        assert!(is_sorted(&ve1));
    }

    #[test]
    fn ascending() {
        //pre-sorted
        let mut ve2 = vec![1, 2, 3, 4, 5, 6];
        bubble_sort(&mut ve2);
        assert!(is_sorted(&ve2));
    }
    #[test]
    fn empty() {
        let mut ve3: Vec<usize> = vec![];
        bubble_sort(&mut ve3);
        assert!(is_sorted(&ve3));
    }
}
```

`INSERT HERE`

## BUCKET

`INSERT HERE`

```rust
/// Sort a slice using bucket sort algorithm.
///
/// Time complexity is `O(n + k)` on average, where `n` is the number of elements,
/// `k` is the number of buckets used in process.
///
/// Space complexity is `O(n + k)`, as it sorts not in-place.
pub fn bucket_sort(arr: &[usize]) -> Vec<usize> {
    if arr.is_empty() {
        return vec![];
    }

    let max = *arr.iter().max().unwrap();
    let len = arr.len();
    let mut buckets = vec![vec![]; len + 1];

    for x in arr {
        buckets[len * *x / max].push(*x);
    }

    for bucket in buckets.iter_mut() {
        super::insertion_sort(bucket);
    }

    let mut result = vec![];
    for bucket in buckets {
        for x in bucket {
            result.push(x);
        }
    }

    result
}

#[cfg(test)]
mod tests {
    use super::super::is_sorted;
    use super::*;

    #[test]
    fn empty() {
        let arr: [usize; 0] = [];
        let res = bucket_sort(&arr);
        assert!(is_sorted(&res));
    }

    #[test]
    fn one_element() {
        let arr: [usize; 1] = [4];
        let res = bucket_sort(&arr);
        assert!(is_sorted(&res));
    }

    #[test]
    fn already_sorted() {
        let arr: [usize; 3] = [10, 9, 105];
        let res = bucket_sort(&arr);
        assert!(is_sorted(&res));
    }

    #[test]
    fn basic() {
        let arr: [usize; 4] = [35, 53, 1, 0];
        let res = bucket_sort(&arr);
        assert!(is_sorted(&res));
    }

    #[test]
    fn odd_number_of_elements() {
        let arr: Vec<usize> = vec![1, 21, 5, 11, 58];
        let res = bucket_sort(&arr);
        assert!(is_sorted(&res));
    }

    #[test]
    fn repeated_elements() {
        let arr: Vec<usize> = vec![542, 542, 542, 542];
        let res = bucket_sort(&arr);
        assert!(is_sorted(&res));
    }
}
```

`INSERT HERE`

## COCKTAIL-SHAKER

`INSERT HERE`

```rust
pub fn cocktail_shaker_sort<T: Ord>(arr: &mut [T]) {
    let len = arr.len();

    if len == 0 {
        return;
    }

    loop {
        let mut swapped = false;

        for i in 0..(len - 1).clamp(0, len) {
            if arr[i] > arr[i + 1] {
                arr.swap(i, i + 1);
                swapped = true;
            }
        }

        if !swapped {
            break;
        }

        swapped = false;

        for i in (0..(len - 1).clamp(0, len)).rev() {
            if arr[i] > arr[i + 1] {
                arr.swap(i, i + 1);
                swapped = true;
            }
        }

        if !swapped {
            break;
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn basic() {
        let mut arr = vec![5, 2, 1, 3, 4, 6];
        cocktail_shaker_sort(&mut arr);
        assert_eq!(arr, vec![1, 2, 3, 4, 5, 6]);
    }

    #[test]
    fn empty() {
        let mut arr = Vec::<i32>::new();
        cocktail_shaker_sort(&mut arr);
        assert_eq!(arr, vec![]);
    }

    #[test]
    fn one_element() {
        let mut arr = vec![1];
        cocktail_shaker_sort(&mut arr);
        assert_eq!(arr, vec![1]);
    }

    #[test]
    fn pre_sorted() {
        let mut arr = vec![1, 2, 3, 4, 5, 6];
        cocktail_shaker_sort(&mut arr);
        assert_eq!(arr, vec![1, 2, 3, 4, 5, 6]);
    }
}
```

`INSERT HERE`

## COUNTING

`INSERT HERE`

```rust
/// In place counting sort for collections of u32
/// O(n + maxval) in time, where maxval is the biggest value an input can possibly take
/// O(maxval) in memory
/// u32 is chosen arbitrarly, a counting sort probably should'nt be used on data that
/// requires bigger types.

pub fn counting_sort(arr: &mut [u32], maxval: usize) {
    let mut occurences: Vec<usize> = vec![0; maxval + 1];

    for &data in arr.iter() {
        occurences[data as usize] += 1;
    }

    let mut i = 0;
    for (data, &number) in occurences.iter().enumerate() {
        for _ in 0..number {
            arr[i] = data as u32;
            i += 1;
        }
    }
}

use std::ops::AddAssign;
/// Generic implementation of a counting sort for all usigned types
pub fn generic_counting_sort<T: Into<u64> + From<u8> + AddAssign + Copy>(
    arr: &mut [T],
    maxval: usize,
) {
    let mut occurences: Vec<usize> = vec![0; maxval + 1];

    for &data in arr.iter() {
        occurences[data.into() as usize] += 1;
    }

    // Current index in output array
    let mut i = 0;

    // current data point, necessary to be type-safe
    let mut data = T::from(0);

    // This will iterate from 0 to the largest data point in `arr`
    // `number` contains the occurances of the data point `data`
    for &number in occurences.iter() {
        for _ in 0..number {
            arr[i] = data;
            i += 1;
        }

        data += T::from(1);
    }
}

#[cfg(test)]
mod test {
    use super::super::is_sorted;
    use super::*;

    #[test]
    fn counting_sort_descending() {
        let mut ve1 = vec![6, 5, 4, 3, 2, 1];
        counting_sort(&mut ve1, 6);

        assert!(is_sorted(&ve1));
    }

    #[test]
    fn counting_sort_pre_sorted() {
        let mut ve2 = vec![1, 2, 3, 4, 5, 6];
        counting_sort(&mut ve2, 6);

        assert!(is_sorted(&ve2));
    }

    #[test]
    fn generic_counting_sort() {
        let mut ve1: Vec<u8> = vec![100, 30, 60, 10, 20, 120, 1];
        super::generic_counting_sort(&mut ve1, 120);

        assert!(is_sorted(&ve1));
    }

    #[test]
    fn presorted_u64_counting_sort() {
        let mut ve2: Vec<u64> = vec![1, 2, 3, 4, 5, 6];
        super::generic_counting_sort(&mut ve2, 6);

        assert!(is_sorted(&ve2));
    }
}
```

`INSERT HERE`

## CYCLE

`INSERT HERE`

```rust
// sorts with the minimum number of rewrites. Runs through all values in the array,
// placing them in their correct spots. O(n^2).

pub fn cycle_sort(arr: &mut [i32]) {
    for cycle_start in 0..arr.len() {
        let mut item = arr[cycle_start];
        let mut pos = cycle_start;
        for i in arr.iter().skip(cycle_start + 1) {
            if *i < item {
                pos += 1;
            }
        }
        if pos == cycle_start {
            continue;
        }
        while item == arr[pos] {
            pos += 1;
        }
        std::mem::swap(&mut arr[pos], &mut item);
        while pos != cycle_start {
            pos = cycle_start;
            for i in arr.iter().skip(cycle_start + 1) {
                if *i < item {
                    pos += 1;
                }
            }
            while item == arr[pos] {
                pos += 1;
            }
            std::mem::swap(&mut arr[pos], &mut item);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::super::is_sorted;
    use super::*;
    #[test]
    fn it_works() {
        let mut arr1 = [6, 5, 4, 3, 2, 1];
        cycle_sort(&mut arr1);
        assert!(is_sorted(&arr1));
        arr1 = [12, 343, 21, 90, 3, 21];
        cycle_sort(&mut arr1);
        assert!(is_sorted(&arr1));
        let mut arr2 = [1];
        cycle_sort(&mut arr2);
        assert!(is_sorted(&arr2));
        let mut arr3 = [213, 542, 90, -23412, -32, 324, -34, 3324, 54];
        cycle_sort(&mut arr3);
        assert!(is_sorted(&arr3));
    }
}
```

`INSERT HERE`

## EXCHANGE

`INSERT HERE`

```rust
// sorts through swapping the first value until it is at the right position, and
// repeating for all the following.

pub fn exchange_sort(arr: &mut [i32]) {
    let length = arr.len();
    for number1 in 0..length {
        for number2 in (number1 + 1)..length {
            if arr[number2] < arr[number1] {
                arr.swap(number1, number2)
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::super::is_sorted;
    use super::*;
    #[test]
    fn it_works() {
        let mut arr1 = [6, 5, 4, 3, 2, 1];
        exchange_sort(&mut arr1);
        assert!(is_sorted(&arr1));
        arr1 = [12, 343, 21, 90, 3, 21];
        exchange_sort(&mut arr1);
        assert!(is_sorted(&arr1));
        let mut arr2 = [1];
        exchange_sort(&mut arr2);
        assert!(is_sorted(&arr2));
        let mut arr3 = [213, 542, 90, -23412, -32, 324, -34, 3324, 54];
        exchange_sort(&mut arr3);
        assert!(is_sorted(&arr3));
    }
}
```

`INSERT HERE`

## HEAP

`INSERT HERE`

```rust
/// Sort a mutable slice using heap sort.
///
/// Heap sort is an in-place O(n log n) sorting algorithm. It is based on a
/// max heap, a binary tree data structure whose main feature is that
/// parent nodes are always greater or equal to their child nodes.
///
/// # Max Heap Implementation
///
/// A max heap can be efficiently implemented with an array.
/// For example, the binary tree:
/// ```text
///     1
///  2     3
/// 4 5   6 7
/// ```
///
/// ... is represented by the following array:
/// ```text
/// 1 23 4567
/// ```
///
/// Given the index `i` of a node, parent and child indices can be calculated
/// as follows:
/// ```text
/// parent(i)      = (i-1) / 2
/// left_child(i)  = 2*i + 1
/// right_child(i) = 2*i + 2
/// ```

/// # Algorithm
///
/// Heap sort has two steps:
///   1. Convert the input array to a max heap.
///   2. Partition the array into heap part and sorted part. Initially the
///      heap consists of the whole array and the sorted part is empty:
///      ```text
///      arr: [ heap                    |]
///      ```
///
///      Repeatedly swap the root (i.e. the largest) element of the heap with
///      the last element of the heap and increase the sorted part by one:
///      ```text
///      arr: [ root ...   last | sorted ]
///       --> [ last ... | root   sorted ]
///      ```
///
///      After each swap, fix the heap to make it a valid max heap again.
///      Once the heap is empty, `arr` is completely sorted.
pub fn heap_sort<T: Ord>(arr: &mut [T]) {
    if arr.len() <= 1 {
        return; // already sorted
    }

    heapify(arr);

    for end in (1..arr.len()).rev() {
        arr.swap(0, end);
        move_down(&mut arr[..end], 0);
    }
}

/// Convert `arr` into a max heap.
fn heapify<T: Ord>(arr: &mut [T]) {
    let last_parent = (arr.len() - 2) / 2;
    for i in (0..=last_parent).rev() {
        move_down(arr, i);
    }
}

/// Move the element at `root` down until `arr` is a max heap again.
///
/// This assumes that the subtrees under `root` are valid max heaps already.
fn move_down<T: Ord>(arr: &mut [T], mut root: usize) {
    let last = arr.len() - 1;
    loop {
        let left = 2 * root + 1;
        if left > last {
            break;
        }
        let right = left + 1;
        let max = if right <= last && arr[right] > arr[left] {
            right
        } else {
            left
        };

        if arr[max] > arr[root] {
            arr.swap(root, max);
        }
        root = max;
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn empty() {
        let mut arr: Vec<i32> = Vec::new();
        heap_sort(&mut arr);
        assert_eq!(&arr, &[]);
    }

    #[test]
    fn single_element() {
        let mut arr = vec![1];
        heap_sort(&mut arr);
        assert_eq!(&arr, &[1]);
    }

    #[test]
    fn sorted_array() {
        let mut arr = vec![1, 2, 3, 4];
        heap_sort(&mut arr);
        assert_eq!(&arr, &[1, 2, 3, 4]);
    }

    #[test]
    fn unsorted_array() {
        let mut arr = vec![3, 4, 2, 1];
        heap_sort(&mut arr);
        assert_eq!(&arr, &[1, 2, 3, 4]);
    }

    #[test]
    fn odd_number_of_elements() {
        let mut arr = vec![3, 4, 2, 1, 7];
        heap_sort(&mut arr);
        assert_eq!(&arr, &[1, 2, 3, 4, 7]);
    }

    #[test]
    fn repeated_elements() {
        let mut arr = vec![542, 542, 542, 542];
        heap_sort(&mut arr);
        assert_eq!(&arr, &vec![542, 542, 542, 542]);
    }
}
```

`INSERT HERE`

## INSERTION

`INSERT HERE`

```rust
use std::cmp;

/// Sorts a mutable slice using in-place insertion sort algorithm.
///
/// Time complexity is `O(n^2)`, where `n` is the number of elements.
/// Space complexity is `O(1)` as it sorts elements in-place.
pub fn insertion_sort<T>(arr: &mut [T])
where
    T: cmp::PartialOrd + Copy,
{
    for i in 1..arr.len() {
        let cur = arr[i];
        let mut j = i - 1;

        while arr[j] > cur {
            arr[j + 1] = arr[j];
            if j == 0 {
                break;
            }
            j -= 1;
        }

        // we exit the loop from that break statement
        if j == 0 && arr[0] > cur {
            arr[0] = cur;
        } else {
            // `arr[j] > cur` is not satsified, exit from condition judgement
            arr[j + 1] = cur;
        }
    }
}

#[cfg(test)]
mod tests {
    use super::super::is_sorted;
    use super::*;

    #[test]
    fn empty() {
        let mut arr: [u8; 0] = [];
        insertion_sort(&mut arr);
        assert!(is_sorted(&arr));
    }

    #[test]
    fn one_element() {
        let mut arr: [char; 1] = ['a'];
        insertion_sort(&mut arr);
        assert!(is_sorted(&arr));
    }

    #[test]
    fn already_sorted() {
        let mut arr: [&str; 3] = ["a", "b", "c"];
        insertion_sort(&mut arr);
        assert!(is_sorted(&arr));
    }

    #[test]
    fn basic() {
        let mut arr: [&str; 4] = ["d", "a", "c", "b"];
        insertion_sort(&mut arr);
        assert!(is_sorted(&arr));
    }

    #[test]
    fn odd_number_of_elements() {
        let mut arr: Vec<&str> = vec!["d", "a", "c", "e", "b"];
        insertion_sort(&mut arr);
        assert!(is_sorted(&arr));
    }

    #[test]
    fn repeated_elements() {
        let mut arr: Vec<usize> = vec![542, 542, 542, 542];
        insertion_sort(&mut arr);
        assert!(is_sorted(&arr));
    }
}
```

`INSERT HERE`

## GNOME

`INSERT HERE`

```rust
use std::cmp;

pub fn gnome_sort<T>(arr: &[T]) -> Vec<T>
where
    T: cmp::PartialEq + cmp::PartialOrd + Clone,
{
    let mut arr = arr.to_vec();
    let mut i: usize = 1;
    let mut j: usize = 2;

    while i < arr.len() {
        if arr[i - 1] < arr[i] {
            i = j;
            j = i + 1;
        } else {
            arr.swap(i - 1, i);
            i -= 1;
            if i == 0 {
                i = j;
                j += 1;
            }
        }
    }
    arr
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn basic() {
        let res = gnome_sort(&vec![6, 5, -8, 3, 2, 3]);
        assert_eq!(res, vec![-8, 2, 3, 3, 5, 6]);
    }

    #[test]
    fn already_sorted() {
        let res = gnome_sort(&vec!["a", "b", "c"]);
        assert_eq!(res, vec!["a", "b", "c"]);
    }

    #[test]
    fn odd_number_of_elements() {
        let res = gnome_sort(&vec!["d", "a", "c", "e", "b"]);
        assert_eq!(res, vec!["a", "b", "c", "d", "e"]);
    }

    #[test]
    fn one_element() {
        let res = gnome_sort(&vec![3]);
        assert_eq!(res, vec![3]);
    }

    #[test]
    fn empty() {
        let res = gnome_sort(&Vec::<u8>::new());
        assert_eq!(res, vec![]);
    }
}
```

`INSERT HERE`

## MERGE

`INSERT HERE`

```rust
fn merge<T: Ord + Copy>(arr: &mut [T], mid: usize) {
    // Create temporary vectors to support the merge.
    let left_half = arr[..mid].to_vec();
    let right_half = arr[mid..].to_vec();

    // Indexes to track the positions while merging.
    let mut l = 0;
    let mut r = 0;

    for v in arr {
        // Choose either the smaller element, or from whichever vec is not exhausted.
        if r == right_half.len() || (l < left_half.len() && left_half[l] < right_half[r]) {
            *v = left_half[l];
            l += 1;
        } else {
            *v = right_half[r];
            r += 1;
        }
    }
}

pub fn top_down_merge_sort<T: Ord + Copy>(arr: &mut [T]) {
    if arr.len() > 1 {
        let mid = arr.len() / 2;
        // Sort the left half recursively.
        top_down_merge_sort(&mut arr[..mid]);
        // Sort the right half recursively.
        top_down_merge_sort(&mut arr[mid..]);
        // Combine the two halves.
        merge(arr, mid);
    }
}

pub fn bottom_up_merge_sort<T: Copy + Ord>(a: &mut [T]) {
    if a.len() > 1 {
        let len: usize = a.len();
        let mut sub_array_size: usize = 1;
        while sub_array_size < len {
            let mut start_index: usize = 0;
            // still have more than one sub-arrays to merge
            while len - start_index > sub_array_size {
                let end_idx: usize = if start_index + 2 * sub_array_size > len {
                    len
                } else {
                    start_index + 2 * sub_array_size
                };
                // merge a[start_index..start_index+sub_array_size] and
                // a[start_index+sub_array_size..end_idx]
                // NOTE: mid is a relative index number starting from `start_index`
                merge(&mut a[start_index..end_idx], sub_array_size);
                // update `start_index` to merge the next sub-arrays
                start_index = end_idx;
            }
            sub_array_size *= 2;
        }
    }
}

#[cfg(test)]
mod tests {
    #[cfg(test)]
    mod top_down_merge_sort {
        use super::super::*;

        #[test]
        fn basic() {
            let mut res = vec![10, 8, 4, 3, 1, 9, 2, 7, 5, 6];
            top_down_merge_sort(&mut res);
            assert_eq!(res, vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
        }

        #[test]
        fn basic_string() {
            let mut res = vec!["a", "bb", "d", "cc"];
            top_down_merge_sort(&mut res);
            assert_eq!(res, vec!["a", "bb", "cc", "d"]);
        }

        #[test]
        fn empty() {
            let mut res = Vec::<u8>::new();
            top_down_merge_sort(&mut res);
            assert_eq!(res, vec![]);
        }

        #[test]
        fn one_element() {
            let mut res = vec![1];
            top_down_merge_sort(&mut res);
            assert_eq!(res, vec![1]);
        }

        #[test]
        fn pre_sorted() {
            let mut res = vec![1, 2, 3, 4];
            top_down_merge_sort(&mut res);
            assert_eq!(res, vec![1, 2, 3, 4]);
        }

        #[test]
        fn reverse_sorted() {
            let mut res = vec![4, 3, 2, 1];
            top_down_merge_sort(&mut res);
            assert_eq!(res, vec![1, 2, 3, 4]);
        }
    }

    #[cfg(test)]
    mod bottom_up_merge_sort {
        use super::super::*;

        #[test]
        fn basic() {
            let mut res = vec![10, 8, 4, 3, 1, 9, 2, 7, 5, 6];
            bottom_up_merge_sort(&mut res);
            assert_eq!(res, vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
        }

        #[test]
        fn basic_string() {
            let mut res = vec!["a", "bb", "d", "cc"];
            bottom_up_merge_sort(&mut res);
            assert_eq!(res, vec!["a", "bb", "cc", "d"]);
        }

        #[test]
        fn empty() {
            let mut res = Vec::<u8>::new();
            bottom_up_merge_sort(&mut res);
            assert_eq!(res, vec![]);
        }

        #[test]
        fn one_element() {
            let mut res = vec![1];
            bottom_up_merge_sort(&mut res);
            assert_eq!(res, vec![1]);
        }

        #[test]
        fn pre_sorted() {
            let mut res = vec![1, 2, 3, 4];
            bottom_up_merge_sort(&mut res);
            assert_eq!(res, vec![1, 2, 3, 4]);
        }

        #[test]
        fn reverse_sorted() {
            let mut res = vec![4, 3, 2, 1];
            bottom_up_merge_sort(&mut res);
            assert_eq!(res, vec![1, 2, 3, 4]);
        }
    }
}
```

`INSERT HERE`

## ODD-EVEN

`INSERT HERE`

```rust
pub fn odd_even_sort<T: Ord>(arr: &mut [T]) {
    let len = arr.len();
    if len == 0 {
        return;
    }

    let mut sorted = false;
    while !sorted {
        sorted = true;

        for i in (1..len - 1).step_by(2) {
            if arr[i] > arr[i + 1] {
                arr.swap(i, i + 1);
                sorted = false;
            }
        }

        for i in (0..len - 1).step_by(2) {
            if arr[i] > arr[i + 1] {
                arr.swap(i, i + 1);
                sorted = false;
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn basic() {
        let mut arr = vec![3, 5, 1, 2, 4, 6];
        odd_even_sort(&mut arr);
        assert_eq!(arr, vec![1, 2, 3, 4, 5, 6]);
    }

    #[test]
    fn empty() {
        let mut arr = Vec::<i32>::new();
        odd_even_sort(&mut arr);
        assert_eq!(arr, vec![]);
    }

    #[test]
    fn one_element() {
        let mut arr = vec![3];
        odd_even_sort(&mut arr);
        assert_eq!(arr, vec![3]);
    }

    #[test]
    fn pre_sorted() {
        let mut arr = vec![0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
        odd_even_sort(&mut arr);
        assert_eq!(arr, vec![0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
    }
}
```

`INSERT HERE`

## PANCAKE

`INSERT HERE`

```rust
use std::cmp;

pub fn pancake_sort<T>(arr: &mut [T]) -> Vec<T>
where
    T: cmp::PartialEq + cmp::Ord + cmp::PartialOrd + Clone,
{
    let len = arr.len();
    if len < 2 {
        arr.to_vec();
    }
    for i in (0..len).rev() {
        let max_index = arr
            .iter()
            .take(i + 1)
            .enumerate()
            .max_by_key(|&(_, elem)| elem)
            .map(|(idx, _)| idx)
            .unwrap();
        if max_index != i {
            arr[0..max_index + 1].reverse();
            arr[0..i + 1].reverse();
        }
    }
    arr.to_vec()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn basic() {
        let res = pancake_sort(&mut vec![6, 5, -8, 3, 2, 3]);
        assert_eq!(res, vec![-8, 2, 3, 3, 5, 6]);
    }

    #[test]
    fn already_sorted() {
        let res = pancake_sort(&mut vec!["a", "b", "c"]);
        assert_eq!(res, vec!["a", "b", "c"]);
    }

    #[test]
    fn odd_number_of_elements() {
        let res = pancake_sort(&mut vec!["d", "a", "c", "e", "b"]);
        assert_eq!(res, vec!["a", "b", "c", "d", "e"]);
    }

    #[test]
    fn one_element() {
        let res = pancake_sort(&mut vec![3]);
        assert_eq!(res, vec![3]);
    }

    #[test]
    fn empty() {
        let res = pancake_sort(&mut Vec::<u8>::new());
        assert_eq!(res, vec![]);
    }
}
```

`INSERT HERE`

## PIGEONHOLE

`INSERT HERE`

```rust
// From Wikipedia: Pigeonhole sorting is a sorting algorithm that is suitable for sorting
// lists of elements where the number of elements (n) and the length of the range of
// possible key values (N) are approximately the same. It requires O(n + N) time.

pub fn pigeonhole_sort(array: &mut [i32]) {
    if let (Some(min), Some(max)) = (array.iter().min(), array.iter().max()) {
        let holes_range: usize = (max - min + 1) as usize;
        let mut holes = vec![0; holes_range];
        let mut holes_repeat = vec![0; holes_range];
        for i in array.iter() {
            let index = *i - min;
            holes[index as usize] = *i;
            holes_repeat[index as usize] += 1;
        }
        let mut index = 0;
        for i in 0..holes_range {
            while holes_repeat[i] > 0 {
                array[index] = holes[i];
                index += 1;
                holes_repeat[i] -= 1;
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::super::is_sorted;
    use super::*;

    #[test]
    fn test1() {
        let mut arr1 = [3, 3, 3, 1, 2, 6, 5, 5, 5, 4, 1, 6, 3];
        pigeonhole_sort(&mut arr1);
        assert!(is_sorted(&arr1));
        let mut arr2 = [6, 5, 4, 3, 2, 1];
        pigeonhole_sort(&mut arr2);
        assert!(is_sorted(&arr2));
    }
}
```

`INSERT HERE`

## QUICK

`INSERT HERE`

```rust
use std::cmp::PartialOrd;

pub fn partition<T: PartialOrd>(arr: &mut [T], lo: isize, hi: isize) -> isize {
    let pivot = hi as usize;
    let mut i = lo - 1;
    let mut j = hi;

    loop {
        i += 1;
        while arr[i as usize] < arr[pivot] {
            i += 1;
        }
        j -= 1;
        while j >= 0 && arr[j as usize] > arr[pivot] {
            j -= 1;
        }
        if i >= j {
            break;
        } else {
            arr.swap(i as usize, j as usize);
        }
    }
    arr.swap(i as usize, pivot as usize);
    i
}

fn _quick_sort<T: Ord>(arr: &mut [T], lo: isize, hi: isize) {
    if lo < hi {
        let p = partition(arr, lo, hi);
        _quick_sort(arr, lo, p - 1);
        _quick_sort(arr, p + 1, hi);
    }
}

pub fn quick_sort<T: Ord>(arr: &mut [T]) {
    let len = arr.len();
    if len > 1 {
        _quick_sort(arr, 0, (len - 1) as isize);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn basic() {
        let mut res = vec![10, 8, 4, 3, 1, 9, 2, 7, 5, 6];
        quick_sort(&mut res);
        assert_eq!(res, vec![1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    }

    #[test]
    fn basic_string() {
        let mut res = vec!["a", "bb", "d", "cc"];
        quick_sort(&mut res);
        assert_eq!(res, vec!["a", "bb", "cc", "d"]);
    }

    #[test]
    fn empty() {
        let mut res = Vec::<u8>::new();
        quick_sort(&mut res);
        assert_eq!(res, vec![]);
    }

    #[test]
    fn one_element() {
        let mut res = vec![1];
        quick_sort(&mut res);
        assert_eq!(res, vec![1]);
    }

    #[test]
    fn pre_sorted() {
        let mut res = vec![1, 2, 3, 4];
        quick_sort(&mut res);
        assert_eq!(res, vec![1, 2, 3, 4]);
    }

    #[test]
    fn reverse_sorted() {
        let mut res = vec![4, 3, 2, 1];
        quick_sort(&mut res);
        assert_eq!(res, vec![1, 2, 3, 4]);
    }
}
```

`INSERT HERE`

## RADIX

`INSERT HERE`

```rust
/// Sorts the elements of `arr` in-place using radix sort.
///
/// Time complexity is `O((n + b) * logb(k))`, where `n` is the number of elements,
/// `b` is the base (the radix), and `k` is the largest element.
/// When `n` and `b` are roughly the same maginitude, this algorithm runs in linear time.
///
/// Space complexity is `O(n + b)`.
pub fn radix_sort(arr: &mut [u64]) {
    let max: usize = match arr.iter().max() {
        Some(&x) => x as usize,
        None => return,
    };
    // Make radix a power of 2 close to arr.len() for optimal runtime
    let radix = arr.len().next_power_of_two();
    // Counting sort by each digit from least to most significant
    let mut place = 1;
    while place <= max {
        let digit_of = |x| x as usize / place % radix;
        // Count digit occurrences
        let mut counter = vec![0; radix];
        for &x in arr.iter() {
            counter[digit_of(x)] += 1;
        }
        // Compute last index of each digit
        for i in 1..radix {
            counter[i] += counter[i - 1];
        }
        // Write elements to their new indices
        for &x in arr.to_owned().iter().rev() {
            counter[digit_of(x)] -= 1;
            arr[counter[digit_of(x)]] = x;
        }
        place *= radix;
    }
}

#[cfg(test)]
mod tests {
    use super::super::is_sorted;
    use super::radix_sort;

    #[test]
    fn empty() {
        let mut a: [u64; 0] = [];
        radix_sort(&mut a);
        assert!(is_sorted(&a));
    }

    #[test]
    fn descending() {
        let mut v = vec![201, 127, 64, 37, 24, 4, 1];
        radix_sort(&mut v);
        assert!(is_sorted(&v));
    }

    #[test]
    fn ascending() {
        let mut v = vec![1, 4, 24, 37, 64, 127, 201];
        radix_sort(&mut v);
        assert!(is_sorted(&v));
    }
}
```

`INSERT HERE`

## SELECTION

`INSERT HERE`

```rust
pub fn selection_sort<T: Ord>(arr: &mut [T]) {
    let len = arr.len();
    for left in 0..len {
        let mut smallest = left;
        for right in (left + 1)..len {
            if arr[right] < arr[smallest] {
                smallest = right;
            }
        }
        arr.swap(smallest, left);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn basic() {
        let mut res = vec!["d", "a", "c", "b"];
        selection_sort(&mut res);
        assert_eq!(res, vec!["a", "b", "c", "d"]);
    }

    #[test]
    fn empty() {
        let mut res = Vec::<u8>::new();
        selection_sort(&mut res);
        assert_eq!(res, vec![]);
    }

    #[test]
    fn one_element() {
        let mut res = vec!["a"];
        selection_sort(&mut res);
        assert_eq!(res, vec!["a"]);
    }

    #[test]
    fn pre_sorted() {
        let mut res = vec!["a", "b", "c"];
        selection_sort(&mut res);
        assert_eq!(res, vec!["a", "b", "c"]);
    }
}
```

`INSERT HERE`

## SHELL

`INSERT HERE`

```rust
pub fn shell_sort<T: Ord + Copy>(values: &mut [T]) {
    // shell sort works by swiping the value at a given gap and decreasing the gap to 1
    fn insertion<T: Ord + Copy>(values: &mut [T], start: usize, gap: usize) {
        for i in ((start + gap)..values.len()).step_by(gap) {
            let val_current = values[i];
            let mut pos = i;
            // make swaps
            while pos >= gap && values[pos - gap] > val_current {
                values[pos] = values[pos - gap];
                pos -= gap;
            }
            values[pos] = val_current;
        }
    }

    let mut count_sublist = values.len() / 2; // makes gap as long as half of the array
    while count_sublist > 0 {
        for pos_start in 0..count_sublist {
            insertion(values, pos_start, count_sublist);
        }
        count_sublist /= 2; // makes gap as half of previous
    }
}

#[cfg(test)]
mod test {
    use super::shell_sort;

    #[test]
    fn basic() {
        let mut vec = vec![3, 5, 6, 3, 1, 4];
        shell_sort(&mut vec);
        for i in 0..vec.len() - 1 {
            assert!(vec[i] <= vec[i + 1]);
        }
    }

    #[test]
    fn empty() {
        let mut vec: Vec<i32> = vec![];
        shell_sort(&mut vec);
        assert_eq!(vec, vec![]);
    }

    #[test]
    fn reverse() {
        let mut vec = vec![6, 5, 4, 3, 2, 1];
        shell_sort(&mut vec);
        for i in 0..vec.len() - 1 {
            assert!(vec[i] <= vec[i + 1]);
        }
    }

    #[test]
    fn already_sorted() {
        let mut vec = vec![1, 2, 3, 4, 5, 6];
        shell_sort(&mut vec);
        for i in 0..vec.len() - 1 {
            assert!(vec[i] <= vec[i + 1]);
        }
    }
}
```

`INSERT HERE`

## STOOGE

`INSERT HERE`

```rust
fn _stooge_sort<T: Ord>(arr: &mut [T], start: usize, end: usize) {
    if arr[start] > arr[end] {
        arr.swap(start, end);
    }

    if start + 1 >= end {
        return;
    }

    let k = (end - start + 1) / 3;

    _stooge_sort(arr, start, end - k);
    _stooge_sort(arr, start + k, end);
    _stooge_sort(arr, start, end - k);
}

pub fn stooge_sort<T: Ord>(arr: &mut [T]) {
    let len = arr.len();
    if len == 0 {
        return;
    }

    _stooge_sort(arr, 0, len - 1);
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn basic() {
        let mut vec = vec![3, 5, 6, 3, 1, 4];
        stooge_sort(&mut vec);
        for i in 0..vec.len() - 1 {
            assert!(vec[i] <= vec[i + 1]);
        }
    }

    #[test]
    fn empty() {
        let mut vec: Vec<i32> = vec![];
        stooge_sort(&mut vec);
        assert_eq!(vec, vec![]);
    }

    #[test]
    fn reverse() {
        let mut vec = vec![6, 5, 4, 3, 2, 1];
        stooge_sort(&mut vec);
        for i in 0..vec.len() - 1 {
            assert!(vec[i] <= vec[i + 1]);
        }
    }

    #[test]
    fn already_sorted() {
        let mut vec = vec![1, 2, 3, 4, 5, 6];
        stooge_sort(&mut vec);
        for i in 0..vec.len() - 1 {
            assert!(vec[i] <= vec[i + 1]);
        }
    }
}
```

`INSERT HERE`

## COMB

`INSERT HERE`

```rust
pub fn comb_sort<T: Ord>(arr: &mut [T]) {
    let mut gap = arr.len();
    let shrink = 1.3;
    let mut sorted = false;

    while !sorted {
        gap = (gap as f32 / shrink).floor() as usize;
        if gap <= 1 {
            gap = 1;
            sorted = true;
        }
        for i in 0..arr.len() - gap {
            let j = i + gap;
            if arr[i] > arr[j] {
                arr.swap(i, j);
                sorted = false;
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn descending() {
        //descending
        let mut ve1 = vec![6, 5, 4, 3, 2, 1];
        comb_sort(&mut ve1);
        for i in 0..ve1.len() - 1 {
            assert!(ve1[i] <= ve1[i + 1]);
        }
    }

    #[test]
    fn ascending() {
        //pre-sorted
        let mut ve2 = vec![1, 2, 3, 4, 5, 6];
        comb_sort(&mut ve2);
        for i in 0..ve2.len() - 1 {
            assert!(ve2[i] <= ve2[i + 1]);
        }
    }
}
```

`INSERT HERE`

## BUCKET

`INSERT HERE`

```rust
/// Sort a slice using bucket sort algorithm.
///
/// Time complexity is `O(n + k)` on average, where `n` is the number of elements,
/// `k` is the number of buckets used in process.
///
/// Space complexity is `O(n + k)`, as it sorts not in-place.
pub fn bucket_sort(arr: &[usize]) -> Vec<usize> {
    if arr.is_empty() {
        return vec![];
    }

    let max = *arr.iter().max().unwrap();
    let len = arr.len();
    let mut buckets = vec![vec![]; len + 1];

    for x in arr {
        buckets[len * *x / max].push(*x);
    }

    for bucket in buckets.iter_mut() {
        super::insertion_sort(bucket);
    }

    let mut result = vec![];
    for bucket in buckets {
        for x in bucket {
            result.push(x);
        }
    }

    result
}

#[cfg(test)]
mod tests {
    use super::super::is_sorted;
    use super::*;

    #[test]
    fn empty() {
        let arr: [usize; 0] = [];
        let res = bucket_sort(&arr);
        assert!(is_sorted(&res));
    }

    #[test]
    fn one_element() {
        let arr: [usize; 1] = [4];
        let res = bucket_sort(&arr);
        assert!(is_sorted(&res));
    }

    #[test]
    fn already_sorted() {
        let arr: [usize; 3] = [10, 9, 105];
        let res = bucket_sort(&arr);
        assert!(is_sorted(&res));
    }

    #[test]
    fn basic() {
        let arr: [usize; 4] = [35, 53, 1, 0];
        let res = bucket_sort(&arr);
        assert!(is_sorted(&res));
    }

    #[test]
    fn odd_number_of_elements() {
        let arr: Vec<usize> = vec![1, 21, 5, 11, 58];
        let res = bucket_sort(&arr);
        assert!(is_sorted(&res));
    }

    #[test]
    fn repeated_elements() {
        let arr: Vec<usize> = vec![542, 542, 542, 542];
        let res = bucket_sort(&arr);
        assert!(is_sorted(&res));
    }
}
```

`INSERT HERE`

## TIMSORT

`INSERT HERE`

```rust
use std::cmp;

static MIN_MERGE: usize = 32;

fn min_run_length(mut n: usize) -> usize {
    let mut r = 0;
    while n >= MIN_MERGE {
        r |= n & 1;
        n >>= 1;
    }
    n + r
}

fn insertion_sort(arr: &mut Vec<i32>, left: usize, right: usize) -> &Vec<i32> {
    for i in (left + 1)..(right + 1) {
        let temp = arr[i];
        let mut j = (i - 1) as i32;

        while j >= (left as i32) && arr[j as usize] > temp {
            arr[(j + 1) as usize] = arr[j as usize];
            j -= 1;
        }
        arr[(j + 1) as usize] = temp;
    }
    arr
}

fn merge(arr: &mut Vec<i32>, l: usize, m: usize, r: usize) -> &Vec<i32> {
    let len1 = m - l + 1;
    let len2 = r - m;
    let mut left = vec![0; len1 as usize];
    let mut right = vec![0; len2 as usize];

    left[..len1].clone_from_slice(&arr[l..(len1 + l)]);

    for x in 0..len2 {
        right[x] = arr[m + 1 + x];
    }

    let mut i = 0;
    let mut j = 0;
    let mut k = l;

    while i < len1 && j < len2 {
        if left[i] <= right[j] {
            arr[k] = left[i];
            i += 1;
        } else {
            arr[k] = right[j];
            j += 1;
        }
        k += 1;
    }

    while i < len1 {
        arr[k] = left[i];
        k += 1;
        i += 1;
    }

    while j < len2 {
        arr[k] = right[j];
        k += 1;
        j += 1;
    }
    arr
}

pub fn tim_sort(arr: &mut Vec<i32>, n: usize) {
    let min_run = min_run_length(MIN_MERGE) as usize;

    let mut i = 0;
    while i < n {
        insertion_sort(arr, i, cmp::min(i + MIN_MERGE - 1, n - 1));
        i += min_run;
    }

    let mut size = min_run;
    while size < n {
        let mut left = 0;
        while left < n {
            let mid = left + size - 1;
            let right = cmp::min(left + 2 * size - 1, n - 1);
            if mid < right {
                merge(arr, left, mid, right);
            }

            left += 2 * size;
        }
        size *= 2;
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn basic() {
        let mut array = vec![-2, 7, 15, -14, 0, 15, 0, 7, -7, -4, -13, 5, 8, -14, 12];
        let arr_len = array.len();
        tim_sort(&mut array, arr_len);
        for i in 0..array.len() - 1 {
            assert!(array[i] <= array[i + 1]);
        }
    }

    #[test]
    fn empty() {
        let mut array = Vec::<i32>::new();
        let arr_len = array.len();
        tim_sort(&mut array, arr_len);
        assert_eq!(array, vec![]);
    }

    #[test]
    fn one_element() {
        let mut array = vec![3];
        let arr_len = array.len();
        tim_sort(&mut array, arr_len);
        assert_eq!(array, vec![3]);
    }

    #[test]
    fn pre_sorted() {
        let mut array = vec![0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
        let arr_len = array.len();
        tim_sort(&mut array, arr_len);
        assert_eq!(array, vec![0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
    }
}
```

`INSERT HERE`

## SLEEP

`INSERT HERE`

```rust
use std::sync::mpsc;
use std::thread;
use std::time::Duration;

pub fn sleep_sort(vec: &[usize]) -> Vec<usize> {
    let len = vec.len();
    let (tx, rx) = mpsc::channel();

    for &x in vec.iter() {
        let tx: mpsc::Sender<usize> = tx.clone();
        thread::spawn(move || {
            thread::sleep(Duration::from_millis((20 * x) as u64));
            tx.send(x).expect("panic");
        });
    }
    let mut sorted_list: Vec<usize> = Vec::new();

    for _ in 0..len {
        sorted_list.push(rx.recv().unwrap())
    }

    sorted_list
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn empty() {
        let mut arr: Vec<usize> = Vec::new();
        let res = sleep_sort(&mut arr);
        assert_eq!(res, &[]);
    }

    #[test]
    fn single_element() {
        let mut arr = vec![1];
        let res = sleep_sort(&mut arr);
        assert_eq!(res, &[1]);
    }

    #[test]
    fn sorted_array() {
        let mut arr = vec![1, 2, 3, 4];
        let res = sleep_sort(&mut arr);
        assert_eq!(res, &[1, 2, 3, 4]);
    }

    #[test]
    fn unsorted_array() {
        let mut arr = vec![3, 4, 2, 1];
        let res = sleep_sort(&mut arr);
        assert_eq!(res, &[1, 2, 3, 4]);
    }

    #[test]
    fn odd_number_of_elements() {
        let mut arr = vec![3, 1, 7];
        let res = sleep_sort(&mut arr);
        assert_eq!(res, &[1, 3, 7]);
    }

    #[test]
    fn repeated_elements() {
        let mut arr = vec![1, 1, 1, 1];
        let res = sleep_sort(&mut arr);
        assert_eq!(res, &[1, 1, 1, 1]);
    }

    #[test]
    fn random_elements() {
        let mut arr = vec![5, 3, 7, 10, 1, 0, 8];
        let res = sleep_sort(&mut arr);
        assert_eq!(res, &[0, 1, 3, 5, 7, 8, 10]);
    }
}
```

`INSERT HERE`

