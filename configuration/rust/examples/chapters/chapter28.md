# EXAMPLES: SEARCH ALGORITHMS

`INSERT HERE`

## LINEAR

`INSERT HERE`

```rust
use std::cmp::PartialEq;

pub fn linear_search<T: PartialEq>(item: &T, arr: &[T]) -> Option<usize> {
    for (i, data) in arr.iter().enumerate() {
        if item == data {
            return Some(i);
        }
    }

    None
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn search_strings() {
        let index = linear_search(&"a", &vec!["a", "b", "c", "d", "google", "zoo"]);
        assert_eq!(index, Some(0));
    }

    #[test]
    fn search_ints() {
        let index = linear_search(&4, &vec![1, 2, 3, 4]);
        assert_eq!(index, Some(3));

        let index = linear_search(&3, &vec![1, 2, 3, 4]);
        assert_eq!(index, Some(2));

        let index = linear_search(&2, &vec![1, 2, 3, 4]);
        assert_eq!(index, Some(1));

        let index = linear_search(&1, &vec![1, 2, 3, 4]);
        assert_eq!(index, Some(0));
    }

    #[test]
    fn not_found() {
        let index = linear_search(&5, &vec![1, 2, 3, 4]);
        assert_eq!(index, None);
    }

    #[test]
    fn empty() {
        let index = linear_search(&1, &vec![]);
        assert_eq!(index, None);
    }
}
```

`INSERT HERE`

## BINARY

`INSERT HERE`

```rust
use std::cmp::Ordering;

pub fn binary_search<T: Ord>(item: &T, arr: &[T]) -> Option<usize> {
    let mut is_asc = true;
    if arr.len() > 1 {
        is_asc = arr[0] < arr[(arr.len() - 1)];
    }
    let mut left = 0;
    let mut right = arr.len();

    while left < right {
        let mid = left + (right - left) / 2;

        if is_asc {
            match item.cmp(&arr[mid]) {
                Ordering::Less => right = mid,
                Ordering::Equal => return Some(mid),
                Ordering::Greater => left = mid + 1,
            }
        } else {
            match item.cmp(&arr[mid]) {
                Ordering::Less => left = mid + 1,
                Ordering::Equal => return Some(mid),
                Ordering::Greater => right = mid,
            }
        }
    }
    None
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn empty() {
        let index = binary_search(&"a", &[]);
        assert_eq!(index, None);
    }

    #[test]
    fn one_item() {
        let index = binary_search(&"a", &["a"]);
        assert_eq!(index, Some(0));
    }

    #[test]
    fn search_strings_asc() {
        let index = binary_search(&"a", &["a", "b", "c", "d", "google", "zoo"]);
        assert_eq!(index, Some(0));

        let index = binary_search(&"google", &["a", "b", "c", "d", "google", "zoo"]);
        assert_eq!(index, Some(4));
    }

    #[test]
    fn search_strings_desc() {
        let index = binary_search(&"a", &["zoo", "google", "d", "c", "b", "a"]);
        assert_eq!(index, Some(5));

        let index = binary_search(&"zoo", &["zoo", "google", "d", "c", "b", "a"]);
        assert_eq!(index, Some(0));

        let index = binary_search(&"google", &["zoo", "google", "d", "c", "b", "a"]);
        assert_eq!(index, Some(1));
    }

    #[test]
    fn search_ints_asc() {
        let index = binary_search(&4, &[1, 2, 3, 4]);
        assert_eq!(index, Some(3));

        let index = binary_search(&3, &[1, 2, 3, 4]);
        assert_eq!(index, Some(2));

        let index = binary_search(&2, &[1, 2, 3, 4]);
        assert_eq!(index, Some(1));

        let index = binary_search(&1, &[1, 2, 3, 4]);
        assert_eq!(index, Some(0));
    }

    #[test]
    fn search_ints_desc() {
        let index = binary_search(&4, &[4, 3, 2, 1]);
        assert_eq!(index, Some(0));

        let index = binary_search(&3, &[4, 3, 2, 1]);
        assert_eq!(index, Some(1));

        let index = binary_search(&2, &[4, 3, 2, 1]);
        assert_eq!(index, Some(2));

        let index = binary_search(&1, &[4, 3, 2, 1]);
        assert_eq!(index, Some(3));
    }

    #[test]
    fn not_found() {
        let index = binary_search(&5, &[1, 2, 3, 4]);
        assert_eq!(index, None);

        let index = binary_search(&5, &[4, 3, 2, 1]);
        assert_eq!(index, None);
    }
}```

`INSERT HERE`

## RECURSIVE BINARY

`INSERT HERE`

```rust
use std::cmp::Ordering;

pub fn binary_search_rec<T: Ord>(
    list_of_items: &[T],
    target: &T,
    left: &usize,
    right: &usize,
) -> Option<usize> {
    if left >= right {
        return None;
    }

    let is_asc = list_of_items[0] < list_of_items[list_of_items.len() - 1];

    let middle: usize = left + (right - left) / 2;

    if is_asc {
        match target.cmp(&list_of_items[middle]) {
            Ordering::Less => binary_search_rec(list_of_items, target, left, &middle),
            Ordering::Greater => binary_search_rec(list_of_items, target, &(middle + 1), right),
            Ordering::Equal => Some(middle),
        }
    } else {
        match target.cmp(&list_of_items[middle]) {
            Ordering::Less => binary_search_rec(list_of_items, target, &(middle + 1), right),
            Ordering::Greater => binary_search_rec(list_of_items, target, left, &middle),
            Ordering::Equal => Some(middle),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const LEFT: usize = 0;

    #[test]
    fn fail_empty_list() {
        let list_of_items = vec![];
        assert_eq!(
            binary_search_rec(&list_of_items, &1, &LEFT, &list_of_items.len()),
            None
        );
    }

    #[test]
    fn success_one_item() {
        let list_of_items = vec![30];
        assert_eq!(
            binary_search_rec(&list_of_items, &30, &LEFT, &list_of_items.len()),
            Some(0)
        );
    }

    #[test]
    fn success_search_strings_asc() {
        let say_hello_list = vec!["hi", "olá", "salut"];
        let right = say_hello_list.len();
        assert_eq!(
            binary_search_rec(&say_hello_list, &"hi", &LEFT, &right),
            Some(0)
        );
        assert_eq!(
            binary_search_rec(&say_hello_list, &"salut", &LEFT, &right),
            Some(2)
        );
    }

    #[test]
    fn success_search_strings_desc() {
        let say_hello_list = vec!["salut", "olá", "hi"];
        let right = say_hello_list.len();
        assert_eq!(
            binary_search_rec(&say_hello_list, &"hi", &LEFT, &right),
            Some(2)
        );
        assert_eq!(
            binary_search_rec(&say_hello_list, &"salut", &LEFT, &right),
            Some(0)
        );
    }

    #[test]
    fn fail_search_strings_asc() {
        let say_hello_list = vec!["hi", "olá", "salut"];
        for target in &["adiós", "你好"] {
            assert_eq!(
                binary_search_rec(&say_hello_list, target, &LEFT, &say_hello_list.len()),
                None
            );
        }
    }

    #[test]
    fn fail_search_strings_desc() {
        let say_hello_list = vec!["salut", "olá", "hi"];
        for target in &["adiós", "你好"] {
            assert_eq!(
                binary_search_rec(&say_hello_list, target, &LEFT, &say_hello_list.len()),
                None
            );
        }
    }

    #[test]
    fn success_search_integers_asc() {
        let integers = vec![0, 10, 20, 30, 40, 50, 60, 70, 80, 90];
        for (index, target) in integers.iter().enumerate() {
            assert_eq!(
                binary_search_rec(&integers, target, &LEFT, &integers.len()),
                Some(index)
            )
        }
    }

    #[test]
    fn success_search_integers_desc() {
        let integers = vec![90, 80, 70, 60, 50, 40, 30, 20, 10, 0];
        for (index, target) in integers.iter().enumerate() {
            assert_eq!(
                binary_search_rec(&integers, target, &LEFT, &integers.len()),
                Some(index)
            )
        }
    }

    #[test]
    fn fail_search_integers() {
        let integers = vec![0, 10, 20, 30, 40, 50, 60, 70, 80, 90];
        for target in &[100, 444, 336] {
            assert_eq!(
                binary_search_rec(&integers, target, &LEFT, &integers.len()),
                None
            );
        }
    }

    #[test]
    fn success_search_string_in_middle_of_unsorted_list() {
        let unsorted_strings = vec!["salut", "olá", "hi"];
        assert_eq!(
            binary_search_rec(&unsorted_strings, &"olá", &LEFT, &unsorted_strings.len()),
            Some(1)
        );
    }

    #[test]
    fn success_search_integer_in_middle_of_unsorted_list() {
        let unsorted_integers = vec![90, 80, 70];
        assert_eq!(
            binary_search_rec(&unsorted_integers, &80, &LEFT, &unsorted_integers.len()),
            Some(1)
        );
    }
}
```

`INSERT HERE`

## KTH SMALLEST

`INSERT HERE`

```rust
use crate::sorting::partition;
use std::cmp::{Ordering, PartialOrd};

/// Returns k-th smallest element of an array, i.e. its order statistics.
/// Time complexity is O(n^2) in the worst case, but only O(n) on average.
/// It mutates the input, and therefore does not require additional space.
pub fn kth_smallest<T>(input: &mut [T], k: usize) -> Option<T>
where
    T: PartialOrd + Copy,
{
    if input.is_empty() {
        return None;
    }

    let kth = _kth_smallest(input, k, 0, input.len() - 1);
    Some(kth)
}

fn _kth_smallest<T>(input: &mut [T], k: usize, lo: usize, hi: usize) -> T
where
    T: PartialOrd + Copy,
{
    if lo == hi {
        return input[lo];
    }

    let pivot = partition(input, lo as isize, hi as isize) as usize;
    let i = pivot - lo + 1;

    match k.cmp(&i) {
        Ordering::Equal => input[pivot],
        Ordering::Less => _kth_smallest(input, k, lo, pivot - 1),
        Ordering::Greater => _kth_smallest(input, k - i, pivot + 1, hi),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn empty() {
        let mut zero: [u8; 0] = [];
        let first = kth_smallest(&mut zero, 1);

        assert_eq!(None, first);
    }

    #[test]
    fn one_element() {
        let mut one = [1];
        let first = kth_smallest(&mut one, 1);

        assert_eq!(1, first.unwrap());
    }

    #[test]
    fn many_elements() {
        // 0 1 3 4 5 7 8 9 9 10 12 13 16 17
        let mut many = [9, 17, 3, 16, 13, 10, 1, 5, 7, 12, 4, 8, 9, 0];

        let first = kth_smallest(&mut many, 1);
        let third = kth_smallest(&mut many, 3);
        let sixth = kth_smallest(&mut many, 6);
        let fourteenth = kth_smallest(&mut many, 14);

        assert_eq!(0, first.unwrap());
        assert_eq!(3, third.unwrap());
        assert_eq!(7, sixth.unwrap());
        assert_eq!(17, fourteenth.unwrap());
    }
}
```

`INSERT HERE`

## EXPONENTIAL

`INSERT HERE`

```rust
use std::cmp::Ordering;

pub fn exponential_search<T: Ord>(item: &T, arr: &[T]) -> Option<usize> {
    let len = arr.len();
    if len == 0 {
        return None;
    }
    let mut upper = 1;
    while (upper < len) && (&arr[upper] <= item) {
        upper *= 2;
    }
    if upper > len {
        upper = len
    }

    // binary search
    let mut lower = upper / 2;
    while lower < upper {
        let mid = lower + (upper - lower) / 2;

        match item.cmp(&arr[mid]) {
            Ordering::Less => upper = mid,
            Ordering::Equal => return Some(mid),
            Ordering::Greater => lower = mid + 1,
        }
    }
    None
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn empty() {
        let index = exponential_search(&"a", &vec![]);
        assert_eq!(index, None);
    }

    #[test]
    fn one_item() {
        let index = exponential_search(&"a", &vec!["a"]);
        assert_eq!(index, Some(0));
    }

    #[test]
    fn search_strings() {
        let index = exponential_search(&"a", &vec!["a", "b", "c", "d", "google", "zoo"]);
        assert_eq!(index, Some(0));
    }

    #[test]
    fn search_ints() {
        let index = exponential_search(&4, &vec![1, 2, 3, 4]);
        assert_eq!(index, Some(3));

        let index = exponential_search(&3, &vec![1, 2, 3, 4]);
        assert_eq!(index, Some(2));

        let index = exponential_search(&2, &vec![1, 2, 3, 4]);
        assert_eq!(index, Some(1));

        let index = exponential_search(&1, &vec![1, 2, 3, 4]);
        assert_eq!(index, Some(0));
    }

    #[test]
    fn not_found() {
        let index = exponential_search(&5, &vec![1, 2, 3, 4]);
        assert_eq!(index, None);
    }
}
```

`INSERT HERE`

## JUMP

`INSERT HERE`

```rust
use std::cmp::min;

pub fn jump_search<T: Ord>(item: &T, arr: &[T]) -> Option<usize> {
    let len = arr.len();
    if len == 0 {
        return None;
    }
    let mut step = (len as f64).sqrt() as usize;
    let mut prev = 0;

    while &arr[min(len, step) - 1] < item {
        prev = step;
        step += (len as f64).sqrt() as usize;
        if prev >= len {
            return None;
        }
    }
    while &arr[prev] < item {
        prev += 1;
        if prev == min(step, len) {
            return None;
        }
    }
    if &arr[prev] == item {
        return Some(prev);
    }
    None
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn empty() {
        let index = jump_search(&"a", &vec![]);
        assert_eq!(index, None);
    }

    #[test]
    fn one_item() {
        let index = jump_search(&"a", &vec!["a"]);
        assert_eq!(index, Some(0));
    }

    #[test]
    fn search_strings() {
        let index = jump_search(&"a", &vec!["a", "b", "c", "d", "google", "zoo"]);
        assert_eq!(index, Some(0));
    }

    #[test]
    fn search_ints() {
        let index = jump_search(&4, &vec![1, 2, 3, 4]);
        assert_eq!(index, Some(3));

        let index = jump_search(&3, &vec![1, 2, 3, 4]);
        assert_eq!(index, Some(2));

        let index = jump_search(&2, &vec![1, 2, 3, 4]);
        assert_eq!(index, Some(1));

        let index = jump_search(&1, &vec![1, 2, 3, 4]);
        assert_eq!(index, Some(0));
    }

    #[test]
    fn not_found() {
        let index = jump_search(&5, &vec![1, 2, 3, 4]);
        assert_eq!(index, None);
    }
}
```

`INSERT HERE`

## FIBONACCI

`INSERT HERE`

```rust
use std::cmp::min;
use std::cmp::Ordering;

pub fn fibonacci_search<T: Ord>(item: &T, arr: &[T]) -> Option<usize> {
    let len = arr.len();
    if len == 0 {
        return None;
    }
    let mut start = -1;

    let mut f0 = 0;
    let mut f1 = 1;
    let mut f2 = 1;
    while f2 < len {
        f0 = f1;
        f1 = f2;
        f2 = f0 + f1;
    }
    while f2 > 1 {
        let index = min((f0 as isize + start) as usize, len - 1);
        match item.cmp(&arr[index]) {
            Ordering::Less => {
                f2 = f0;
                f1 -= f0;
                f0 = f2 - f1;
            }
            Ordering::Equal => return Some(index),
            Ordering::Greater => {
                f2 = f1;
                f1 = f0;
                f0 = f2 - f1;
                start = index as isize;
            }
        }
    }
    if (f1 != 0) && (&arr[len - 1] == item) {
        return Some(len - 1);
    }
    None
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn empty() {
        let index = fibonacci_search(&"a", &vec![]);
        assert_eq!(index, None);
    }

    #[test]
    fn one_item() {
        let index = fibonacci_search(&"a", &vec!["a"]);
        assert_eq!(index, Some(0));
    }

    #[test]
    fn search_strings() {
        let index = fibonacci_search(&"a", &vec!["a", "b", "c", "d", "google", "zoo"]);
        assert_eq!(index, Some(0));
    }

    #[test]
    fn search_ints() {
        let index = fibonacci_search(&4, &vec![1, 2, 3, 4]);
        assert_eq!(index, Some(3));

        let index = fibonacci_search(&3, &vec![1, 2, 3, 4]);
        assert_eq!(index, Some(2));

        let index = fibonacci_search(&2, &vec![1, 2, 3, 4]);
        assert_eq!(index, Some(1));

        let index = fibonacci_search(&1, &vec![1, 2, 3, 4]);
        assert_eq!(index, Some(0));
    }

    #[test]
    fn not_found() {
        let index = fibonacci_search(&5, &vec![1, 2, 3, 4]);
        assert_eq!(index, None);
    }
}
```

`INSERT HERE`

## QUICK SELECT

`INSERT HERE`

```rust
// https://en.wikipedia.org/wiki/Quickselect

fn partition(list: &mut [i32], left: usize, right: usize, pivot_index: usize) -> usize {
    let pivot_value = list[pivot_index];
    list.swap(pivot_index, right); // Move pivot to end
    let mut store_index = left;
    for i in left..(right + 1) {
        if list[i] < pivot_value {
            list.swap(store_index, i);
            store_index += 1;
        }
        list.swap(right, store_index); // Move pivot to its final place
    }
    store_index
}

pub fn quick_select(list: &mut [i32], left: usize, right: usize, index: usize) -> i32 {
    if left == right {
        // If the list contains only one element,
        return list[left];
    } // return that element
    let mut pivot_index = ((left + right) / 2) + 1; // select a pivotIndex between left and right
    pivot_index = partition(list, left, right, pivot_index);
    // The pivot is in its final sorted position
    match index {
        x if x == pivot_index => list[index],
        x if x < pivot_index => quick_select(list, left, pivot_index - 1, index),
        _ => quick_select(list, pivot_index + 1, right, index),
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn it_works() {
        let mut arr1 = [2, 3, 4, 5];
        assert_eq!(quick_select(&mut arr1, 0, 3, 1), 3);
        let mut arr2 = [2, 5, 9, 12, 16];
        assert_eq!(quick_select(&mut arr2, 1, 3, 2), 12);
        let mut arr2 = [0, 3, 8];
        assert_eq!(quick_select(&mut arr2, 0, 0, 0), 0);
    }
}
```

`INSERT HERE`
