# EXAMPLES: STRINGS

`INSERT HERE`

## AHO-CORASICK ALGORITHM

`INSERT HERE`

```rust
use std::cell::RefCell;
use std::collections::BTreeMap;
use std::collections::VecDeque;
use std::rc::{Rc, Weak};

#[derive(Default)]
struct ACNode {
    trans: BTreeMap<char, Rc<RefCell<ACNode>>>,
    suffix: Weak<RefCell<ACNode>>, // the suffix(fail) link
    lengths: Vec<usize>,           // lengths of matched patterns ended at this node
}

#[derive(Default)]
pub struct AhoCorasick {
    root: Rc<RefCell<ACNode>>,
}

impl AhoCorasick {
    pub fn new(words: &[&str]) -> Self {
        let root = Rc::new(RefCell::new(ACNode::default()));
        for word in words {
            let mut cur = Rc::clone(&root);
            for c in word.chars() {
                cur = Rc::clone(Rc::clone(&cur).borrow_mut().trans.entry(c).or_default());
            }
            cur.borrow_mut().lengths.push(word.len());
        }
        Self::build_suffix(Rc::clone(&root));
        Self { root }
    }

    fn build_suffix(root: Rc<RefCell<ACNode>>) {
        let mut q = VecDeque::new();
        q.push_back(Rc::clone(&root));
        while let Some(parent) = q.pop_front() {
            let parent = parent.borrow();
            for (c, child) in &parent.trans {
                q.push_back(Rc::clone(child));
                let mut child = child.borrow_mut();
                let mut suffix = parent.suffix.upgrade();
                loop {
                    match &suffix {
                        None => {
                            child.lengths.extend(root.borrow().lengths.clone());
                            child.suffix = Rc::downgrade(&root);
                            break;
                        }
                        Some(node) => {
                            if node.borrow().trans.contains_key(c) {
                                let node = &node.borrow().trans[c];
                                child.lengths.extend(node.borrow().lengths.clone());
                                child.suffix = Rc::downgrade(node);
                                break;
                            } else {
                                suffix = suffix.unwrap().borrow().suffix.upgrade();
                            }
                        }
                    }
                }
            }
        }
    }

    pub fn search<'a>(&self, s: &'a str) -> Vec<&'a str> {
        let mut ans = vec![];
        let mut cur = Rc::clone(&self.root);
        let mut position: usize = 0;
        for (_, c) in s.chars().enumerate() {
            loop {
                if let Some(child) = Rc::clone(&cur).borrow().trans.get(&c) {
                    cur = Rc::clone(child);
                    break;
                }
                let suffix = cur.borrow().suffix.clone();
                match suffix.upgrade() {
                    Some(node) => cur = node,
                    None => break,
                }
            }
            position += c.len_utf8();
            for &len in &cur.borrow().lengths {
                ans.push(&s[position - len..position]);
            }
        }
        ans
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_aho_corasick() {
        let dict = ["abc", "abcd", "xyz", "acxy", "efg", "123", "678", "6543"];
        let ac = AhoCorasick::new(&dict);
        let res = ac.search("ababcxyzacxy12678acxy6543");
        assert_eq!(res, ["abc", "xyz", "acxy", "678", "acxy", "6543",]);
    }

    #[test]
    fn test_aho_corasick_with_utf8() {
        let dict = [
            "abc",
            "中文",
            "abc中",
            "abcd",
            "xyz",
            "acxy",
            "efg",
            "123",
            "678",
            "6543",
            "ハンバーガー",
        ];
        let ac = AhoCorasick::new(&dict);
        let res = ac.search("ababc中xyzacxy12678acxyハンバーガー6543中文");
        assert_eq!(
            res,
            [
                "abc",
                "abc中",
                "xyz",
                "acxy",
                "678",
                "acxy",
                "ハンバーガー",
                "6543",
                "中文"
            ]
        );
    }
}
```

`INSERT HERE`

## BOYER-MOORE STRING SEARCH ALGORITHM

`INSERT HERE`

```rust
// In computer science, the Boyer–Moore string-search algorithm is an efficient string-searching algorithm,
// that is the standard benchmark for practical string-search literature. Source: https://en.wikipedia.org/wiki/Boyer%E2%80%93Moore_string-search_algorithm

use std::collections::HashMap;

pub fn boyer_moore_search(text: &str, pattern: &str) -> Vec<usize> {
    let mut positions = Vec::new();
    let n = text.len() as i32;
    let m = pattern.len() as i32;
    let pattern: Vec<char> = pattern.chars().collect();
    let text: Vec<char> = text.chars().collect();
    if n == 0 || m == 0 {
        return positions;
    }
    let mut collection = HashMap::new();
    for (i, c) in pattern.iter().enumerate() {
        collection.insert(c, i as i32);
    }
    let mut shift: i32 = 0;
    while shift <= (n - m) as i32 {
        let mut j = (m - 1) as i32;
        while j >= 0 && pattern[j as usize] == text[(shift + j) as usize] {
            j -= 1;
        }
        if j < 0 {
            positions.push(shift as usize);
            let add_to_shift = {
                if (shift + m) < n {
                    let c = text[(shift + m) as usize];
                    let index = collection.get(&c).unwrap_or(&-1);
                    m - index
                } else {
                    1
                }
            };
            shift += add_to_shift;
        } else {
            let c = text[(shift + j) as usize];
            let index = collection.get(&c).unwrap_or(&-1);
            let add_to_shift = std::cmp::max(1, j - index);
            shift += add_to_shift;
        }
    }
    positions
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_boyer_moore_search() {
        let a = boyer_moore_search("AABCAB12AFAABCABFFEGABCAB", "ABCAB");
        assert_eq!(a, [1, 11, 20]);
        let a = boyer_moore_search("AABCAB12AFAABCABFFEGABCAB", "FFF");
        assert_eq!(a, []);
        let a = boyer_moore_search("AABCAB12AFAABCABFFEGABCAB", "CAB");
        assert_eq!(a, [3, 13, 22]);
    }
}
```

`INSERT HERE`

## BURROWS-WHEELER TRANSFORM

`INSERT HERE`

```rust
pub fn burrows_wheeler_transform(input: String) -> (String, usize) {
    let len = input.len();

    let mut table = Vec::<String>::with_capacity(len);
    for i in 0..len {
        table.push(input[i..].to_owned() + &input[..i]);
    }
    table.sort_by_key(|a| a.to_lowercase());

    let mut encoded = String::new();
    let mut index: usize = 0;
    for (i, item) in table.iter().enumerate().take(len) {
        encoded.push(item.chars().last().unwrap());
        if item.eq(&input) {
            index = i;
        }
    }

    (encoded, index)
}

pub fn inv_burrows_wheeler_transform(input: (String, usize)) -> String {
    let len = input.0.len();
    let mut table = Vec::<(usize, char)>::with_capacity(len);
    for i in 0..len {
        table.push((i, input.0.chars().nth(i).unwrap()));
    }

    table.sort_by(|a, b| a.1.cmp(&b.1));

    let mut decoded = String::new();
    let mut idx = input.1;
    for _ in 0..len {
        decoded.push(table[idx].1);
        idx = table[idx].0;
    }

    decoded
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    //Ensure function stand-alone legitimacy
    fn stand_alone_function() {
        assert_eq!(
            burrows_wheeler_transform("CARROT".to_string()),
            ("CTRRAO".to_string(), 1usize)
        );
        assert_eq!(
            inv_burrows_wheeler_transform(("CTRRAO".to_string(), 1usize)),
            ("CARROT".to_string())
        );
        assert_eq!(
            burrows_wheeler_transform("THEALGORITHMS".to_string()),
            ("EHLTTRAHGOMSI".to_string(), 11usize)
        );
        assert_eq!(
            inv_burrows_wheeler_transform(("EHLTTRAHGOMSI".to_string(), 11usize)),
            ("THEALGORITHMS".to_string())
        );
        assert_eq!(
            burrows_wheeler_transform("!.!.!??.=::".to_string()),
            (":..!!?:=.?!".to_string(), 0usize)
        );
        assert_eq!(
            inv_burrows_wheeler_transform((":..!!?:=.?!".to_string(), 0usize)),
            "!.!.!??.=::"
        );
    }
    #[test]
    fn basic_characters() {
        assert_eq!(
            inv_burrows_wheeler_transform(burrows_wheeler_transform("CARROT".to_string())),
            "CARROT"
        );
        assert_eq!(
            inv_burrows_wheeler_transform(burrows_wheeler_transform("TOMATO".to_string())),
            "TOMATO"
        );
        assert_eq!(
            inv_burrows_wheeler_transform(burrows_wheeler_transform("THISISATEST".to_string())),
            "THISISATEST"
        );
        assert_eq!(
            inv_burrows_wheeler_transform(burrows_wheeler_transform("THEALGORITHMS".to_string())),
            "THEALGORITHMS"
        );
        assert_eq!(
            inv_burrows_wheeler_transform(burrows_wheeler_transform("RUST".to_string())),
            "RUST"
        );
    }

    #[test]
    fn special_characters() {
        assert_eq!(
            inv_burrows_wheeler_transform(burrows_wheeler_transform("!.!.!??.=::".to_string())),
            "!.!.!??.=::"
        );
        assert_eq!(
            inv_burrows_wheeler_transform(burrows_wheeler_transform(
                "!{}{}(((&&%%!??.=::".to_string()
            )),
            "!{}{}(((&&%%!??.=::"
        );
        assert_eq!(
            inv_burrows_wheeler_transform(burrows_wheeler_transform("//&$[]".to_string())),
            "//&$[]"
        );
    }

    #[test]
    fn empty() {
        assert_eq!(
            inv_burrows_wheeler_transform(burrows_wheeler_transform("".to_string())),
            ""
        );
    }
}
```

`INSERT HERE`

## KNUTH MORRIS PRATT

`INSERT HERE`

```rust
pub fn knuth_morris_pratt(st: String, pat: String) -> Vec<usize> {
    if st.is_empty() || pat.is_empty() {
        return vec![];
    }

    let string = st.into_bytes();
    let pattern = pat.into_bytes();

    // build the partial match table
    let mut partial = vec![0];
    for i in 1..pattern.len() {
        let mut j = partial[i - 1];
        while j > 0 && pattern[j] != pattern[i] {
            j = partial[j - 1];
        }
        partial.push(if pattern[j] == pattern[i] { j + 1 } else { j });
    }

    // and read 'string' to find 'pattern'
    let mut ret = vec![];
    let mut j = 0;

    for (i, &c) in string.iter().enumerate() {
        while j > 0 && c != pattern[j] {
            j = partial[j - 1];
        }
        if c == pattern[j] {
            j += 1;
        }
        if j == pattern.len() {
            ret.push(i + 1 - j);
            j = partial[j - 1];
        }
    }

    ret
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn each_letter_matches() {
        let index = knuth_morris_pratt("aaa".to_string(), "a".to_string());
        assert_eq!(index, vec![0, 1, 2]);
    }

    #[test]
    fn a_few_separate_matches() {
        let index = knuth_morris_pratt("abababa".to_string(), "ab".to_string());
        assert_eq!(index, vec![0, 2, 4]);
    }

    #[test]
    fn one_match() {
        let index =
            knuth_morris_pratt("ABC ABCDAB ABCDABCDABDE".to_string(), "ABCDABD".to_string());
        assert_eq!(index, vec![15]);
    }

    #[test]
    fn lots_of_matches() {
        let index = knuth_morris_pratt("aaabaabaaaaa".to_string(), "aa".to_string());
        assert_eq!(index, vec![0, 1, 4, 7, 8, 9, 10]);
    }

    #[test]
    fn lots_of_intricate_matches() {
        let index = knuth_morris_pratt("ababababa".to_string(), "aba".to_string());
        assert_eq!(index, vec![0, 2, 4, 6]);
    }

    #[test]
    fn not_found0() {
        let index = knuth_morris_pratt("abcde".to_string(), "f".to_string());
        assert_eq!(index, vec![]);
    }

    #[test]
    fn not_found1() {
        let index = knuth_morris_pratt("abcde".to_string(), "ac".to_string());
        assert_eq!(index, vec![]);
    }

    #[test]
    fn not_found2() {
        let index = knuth_morris_pratt("ababab".to_string(), "bababa".to_string());
        assert_eq!(index, vec![]);
    }

    #[test]
    fn empty_string() {
        let index = knuth_morris_pratt("".to_string(), "abcdef".to_string());
        assert_eq!(index, vec![]);
    }
}
```

`INSERT HERE`

## LEVENSHTEIN DISTANCE

`INSERT HERE`

```rust
use std::cmp::min;

pub fn levenshtein_distance(string1: &str, string2: &str) -> usize {
    if string1.is_empty() {
        return string2.len();
    }

    let mut d = Vec::with_capacity(string1.len());
    for i in 0..=string1.len() {
        d.push(i);
    }

    let mut j = 1;
    for c2 in string2.chars() {
        let mut previous_substitution_cost = d[0];
        d[0] = j;

        let mut i = 1;
        for c1 in string1.chars() {
            let deletion_cost = d[i - 1] + 1;
            let insertion_cost = d[i] + 1;
            let substitution_cost = previous_substitution_cost + if c1 == c2 { 0 } else { 1 };

            previous_substitution_cost = d[i];
            d[i] = min3(deletion_cost, insertion_cost, substitution_cost);

            i += 1;
        }

        j += 1;
    }

    d[d.len() - 1]
}

#[cfg(test)]
mod levenshtein_distance_should {
    use super::levenshtein_distance;

    #[test]
    fn return_0_with_empty_strings() {
        assert_eq!(0, levenshtein_distance("", ""));
    }

    #[test]
    fn return_1_with_empty_and_a() {
        assert_eq!(1, levenshtein_distance("", "a"));
    }

    #[test]
    fn return_1_with_a_and_empty() {
        assert_eq!(1, levenshtein_distance("a", ""));
    }

    #[test]
    fn return_1_with_ab_and_a() {
        assert_eq!(1, levenshtein_distance("ab", "a"));
    }

    #[test]
    fn return_0_with_foobar_and_foobar() {
        assert_eq!(0, levenshtein_distance("foobar", "foobar"));
    }

    #[test]
    fn return_6_with_foobar_and_barfoo() {
        assert_eq!(6, levenshtein_distance("foobar", "barfoo"));
    }

    #[test]
    fn return_1_with_kind_and_bind() {
        assert_eq!(1, levenshtein_distance("kind", "bind"));
    }

    #[test]
    fn return_3_with_winner_and_win() {
        assert_eq!(3, levenshtein_distance("winner", "win"));
    }
}

fn min3(a: usize, b: usize, c: usize) -> usize {
    min(a, min(b, c))
}

#[cfg(test)]
mod min3_should {
    use super::min3;

    #[test]
    fn return_1_with_1_2_3() {
        assert_eq!(1, min3(1, 2, 3));
    }

    #[test]
    fn return_1_with_3_2_1() {
        assert_eq!(1, min3(3, 2, 1));
    }

    #[test]
    fn return_1_with_2_3_1() {
        assert_eq!(1, min3(2, 3, 1));
    }
}
```

`INSERT HERE`

## MANACHER

`INSERT HERE`

```rust
pub fn manacher(s: String) -> String {
    let l = s.len();
    if l <= 1 {
        return s;
    }

    // MEMO: We need to detect odd palindrome as well,
    // therefore, inserting dummy string so that
    // we can find a pair with dummy center character.
    let mut chars: Vec<char> = Vec::with_capacity(s.len() * 2 + 1);
    for c in s.chars() {
        chars.push('#');
        chars.push(c);
    }
    chars.push('#');

    // List: storing the length of palindrome at each index of string
    let mut length_of_palindrome = vec![1usize; chars.len()];
    // Integer: Current checking palindrome's center index
    let mut current_center: usize = 0;
    // Integer: Right edge index existing the radius away from current center
    let mut right_from_current_center: usize = 0;

    for i in 0..chars.len() {
        // 1: Check if we are looking at right side of palindrome.
        if right_from_current_center > i && i > current_center {
            // 1-1: If so copy from the left side of palindrome.
            // If the value + index exceeds the right edge index, we should cut and check palindrome later #3.
            length_of_palindrome[i] = std::cmp::min(
                right_from_current_center - i,
                length_of_palindrome[2 * current_center - i],
            );
            // 1-2: Move the checking palindrome to new index if it exceeds the right edge.
            if length_of_palindrome[i] + i >= right_from_current_center {
                current_center = i;
                right_from_current_center = length_of_palindrome[i] + i;
                // 1-3: If radius exceeds the end of list, it means checking is over.
                // You will never get the larger value because the string will get only shorter.
                if right_from_current_center >= chars.len() - 1 {
                    break;
                }
            } else {
                // 1-4: If the checking index doesn't exceeds the right edge,
                // it means the length is just as same as the left side.
                // You don't need to check anymore.
                continue;
            }
        }

        // Integer: Current radius from checking index
        // If it's copied from left side and more than 1,
        // it means it's ensured so you don't need to check inside radius.
        let mut radius: usize = (length_of_palindrome[i] - 1) / 2;
        radius += 1;
        // 2: Checking palindrome.
        // Need to care about overflow usize.
        while i >= radius && i + radius <= chars.len() - 1 && chars[i - radius] == chars[i + radius]
        {
            length_of_palindrome[i] += 2;
            radius += 1;
        }
    }

    // 3: Find the maximum length and generate answer.
    let center_of_max = length_of_palindrome
        .iter()
        .enumerate()
        .max_by_key(|(_, &value)| value)
        .map(|(idx, _)| idx)
        .unwrap();
    let radius_of_max = (length_of_palindrome[center_of_max] - 1) / 2;
    let answer = &chars[(center_of_max - radius_of_max)..(center_of_max + radius_of_max + 1)]
        .iter()
        .collect::<String>();
    answer.replace('#', "")
}

#[cfg(test)]
mod tests {
    use super::manacher;

    #[test]
    fn get_longest_palindrome_by_manacher() {
        assert_eq!(manacher("babad".to_string()), "aba".to_string());
        assert_eq!(manacher("cbbd".to_string()), "bb".to_string());
        assert_eq!(manacher("a".to_string()), "a".to_string());

        let ac_ans = manacher("ac".to_string());
        assert!(ac_ans == *"a" || ac_ans == *"c");
    }
}
```

`INSERT HERE`

## RABIN CARP

`INSERT HERE`

```rust
const MODULUS: u16 = 101;
const BASE: u16 = 256;

pub fn rabin_karp(target: String, pattern: String) -> Vec<usize> {
    // Quick exit
    if target.is_empty() || pattern.is_empty() || pattern.len() > target.len() {
        return vec![];
    }

    let pattern_hash = hash(pattern.as_str());

    // Pre-calculate BASE^(n-1)
    let mut pow_rem: u16 = 1;
    for _ in 0..pattern.len() - 1 {
        pow_rem *= BASE;
        pow_rem %= MODULUS;
    }

    let mut rolling_hash = 0;
    let mut ret = vec![];
    for i in 0..=target.len() - pattern.len() {
        rolling_hash = if i == 0 {
            hash(&target[0..pattern.len()])
        } else {
            recalculate_hash(
                target.as_str(),
                i - 1,
                i + pattern.len() - 1,
                rolling_hash,
                pow_rem,
            )
        };
        if rolling_hash == pattern_hash && pattern[..] == target[i..i + pattern.len()] {
            ret.push(i);
        }
    }
    ret
}

// hash(s) is defined as BASE^(n-1) * s_0 + BASE^(n-2) * s_1 + ... + BASE^0 * s_(n-1)
fn hash(s: &str) -> u16 {
    let mut res: u16 = 0;
    for &c in s.as_bytes().iter() {
        res = (res * BASE % MODULUS + c as u16) % MODULUS;
    }
    res
}

// new_hash = (old_hash - BASE^(n-1) * s_(i-n)) * BASE + s_i
fn recalculate_hash(
    s: &str,
    old_index: usize,
    new_index: usize,
    old_hash: u16,
    pow_rem: u16,
) -> u16 {
    let mut new_hash = old_hash;
    let (old_ch, new_ch) = (
        s.as_bytes()[old_index] as u16,
        s.as_bytes()[new_index] as u16,
    );
    new_hash = (new_hash + MODULUS - pow_rem * old_ch % MODULUS) % MODULUS;
    new_hash = (new_hash * BASE + new_ch) % MODULUS;
    new_hash
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn hi_hash() {
        let hash_result = hash("hi");
        assert_eq!(hash_result, 65);
    }

    #[test]
    fn abr_hash() {
        let hash_result = hash("abr");
        assert_eq!(hash_result, 4);
    }

    #[test]
    fn bra_hash() {
        let hash_result = hash("bra");
        assert_eq!(hash_result, 30);
    }

    // Attribution to @pgimalac for his tests from Knuth-Morris-Pratt
    #[test]
    fn each_letter_matches() {
        let index = rabin_karp("aaa".to_string(), "a".to_string());
        assert_eq!(index, vec![0, 1, 2]);
    }

    #[test]
    fn a_few_separate_matches() {
        let index = rabin_karp("abababa".to_string(), "ab".to_string());
        assert_eq!(index, vec![0, 2, 4]);
    }

    #[test]
    fn one_match() {
        let index = rabin_karp("ABC ABCDAB ABCDABCDABDE".to_string(), "ABCDABD".to_string());
        assert_eq!(index, vec![15]);
    }

    #[test]
    fn lots_of_matches() {
        let index = rabin_karp("aaabaabaaaaa".to_string(), "aa".to_string());
        assert_eq!(index, vec![0, 1, 4, 7, 8, 9, 10]);
    }

    #[test]
    fn lots_of_intricate_matches() {
        let index = rabin_karp("ababababa".to_string(), "aba".to_string());
        assert_eq!(index, vec![0, 2, 4, 6]);
    }

    #[test]
    fn not_found0() {
        let index = rabin_karp("abcde".to_string(), "f".to_string());
        assert_eq!(index, vec![]);
    }

    #[test]
    fn not_found1() {
        let index = rabin_karp("abcde".to_string(), "ac".to_string());
        assert_eq!(index, vec![]);
    }

    #[test]
    fn not_found2() {
        let index = rabin_karp("ababab".to_string(), "bababa".to_string());
        assert_eq!(index, vec![]);
    }

    #[test]
    fn empty_string() {
        let index = rabin_karp("".to_string(), "abcdef".to_string());
        assert_eq!(index, vec![]);
    }
}
```

`INSERT HERE`

## REVERSE

`INSERT HERE`

```rust
pub fn reverse(text: &str) -> String {
    text.chars().rev().collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_simple() {
        assert_eq!(reverse("racecar"), "racecar");
    }

    #[test]
    fn test_assymetric() {
        assert_eq!(reverse("abcdef"), "fedcba")
    }

    #[test]
    fn test_sentence() {
        assert_eq!(reverse("step on no pets"), "step on no pets");
    }
}
```

`INSERT HERE`

## RUN LENGTH ENCODING

`INSERT HERE`

```rust

```

`INSERT HERE`

## HAMMING DISTANCE

`INSERT HERE`

```rust
pub fn run_length_encoding(target: String) -> String {
    if target.trim().is_empty() {
        return "String is Empty!".to_string();
    }
    let mut count: i32 = 0;
    let mut base_character: String = "".to_string();
    let mut encoded_target = String::new();

    for c in target.as_str().chars() {
        if base_character == *"" {
            base_character = c.to_string();
        }
        if c.to_string() == base_character {
            count += 1;
        } else {
            encoded_target.push_str(&count.to_string());
            count = 1;
            encoded_target.push_str(&base_character);
            base_character = c.to_string();
        }
    }
    encoded_target.push_str(&count.to_string());
    encoded_target.push_str(&base_character);

    encoded_target
}

pub fn run_length_decoding(target: String) -> String {
    if target.trim().is_empty() {
        return "String is Empty!".to_string();
    }

    let mut character_count: String = String::new();
    let mut decoded_target = String::new();

    for c in target.as_str().chars() {
        character_count.push(c);
        let is_numeric: bool = character_count.parse::<i32>().is_ok();

        if !is_numeric {
            let pop_char: char = character_count.pop().unwrap();
            decoded_target.push_str(
                &pop_char
                    .to_string()
                    .repeat(character_count.parse().unwrap()),
            );
            character_count = "".to_string();
        }
    }

    decoded_target
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn encode_empty() {
        assert_eq!(
            (run_length_encoding("".to_string())),
            "String is Empty!".to_string()
        )
    }

    #[test]
    fn encode_identical_character() {
        assert_eq!(
            (run_length_encoding("aaaaaaaaaa".to_string())),
            "10a".to_string()
        )
    }
    #[test]
    fn encode_continuous_character() {
        assert_eq!(
            (run_length_encoding("abcdefghijk".to_string())),
            "1a1b1c1d1e1f1g1h1i1j1k".to_string()
        )
    }

    #[test]
    fn encode_random_character() {
        assert_eq!(
            (run_length_encoding("aaaaabbbcccccdddddddddd".to_string())),
            "5a3b5c10d".to_string()
        )
    }

    #[test]
    fn encode_long_character() {
        assert_eq!(
            (run_length_encoding(
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbcccccdddddddddd".to_string()
            )),
            "200a3b5c10d".to_string()
        )
    }
    #[test]
    fn decode_empty() {
        assert_eq!(
            (run_length_decoding("".to_string())),
            "String is Empty!".to_string()
        )
    }

    #[test]
    fn decode_identical_character() {
        assert_eq!(
            (run_length_decoding("10a".to_string())),
            "aaaaaaaaaa".to_string()
        )
    }
    #[test]
    fn decode_continuous_character() {
        assert_eq!(
            (run_length_decoding("1a1b1c1d1e1f1g1h1i1j1k".to_string())),
            "abcdefghijk".to_string()
        )
    }

    #[test]
    fn decode_random_character() {
        assert_eq!(
            (run_length_decoding("5a3b5c10d".to_string())),
            "aaaaabbbcccccdddddddddd".to_string()
        )
    }

    #[test]
    fn decode_long_character() {
        assert_eq!(
            (run_length_decoding(
                "200a3b5c10d".to_string()
            )),
            "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbcccccdddddddddd".to_string()
        )
    }
}
```

`INSERT HERE`

## JARO-WINKLER DISTANCE

`INSERT HERE`

```rust
// In computer science and statistics,
// the Jaro–Winkler distance is a string metric measuring an edit distance
// between two sequences.
// It is a variant proposed in 1990 by William E. Winkler
// of the Jaro distance metric (1989, Matthew A. Jaro).

pub fn jaro_winkler_distance(str1: &str, str2: &str) -> f64 {
    if str1.is_empty() || str2.is_empty() {
        return 0.0;
    }
    fn get_matched_characters(s1: &str, s2: &str) -> String {
        let mut s2 = s2.to_string();
        let mut matched: Vec<char> = Vec::new();
        let limit = std::cmp::min(s1.len(), s2.len()) / 2;
        for (i, l) in s1.chars().enumerate() {
            let left = std::cmp::max(0, i as i32 - limit as i32) as usize;
            let right = std::cmp::min(i + limit + 1, s2.len());
            if s2[left..right].contains(l) {
                matched.push(l);
                let a = &s2[0..s2.find(l).expect("this exists")];
                let b = &s2[(s2.find(l).expect("this exists") + 1)..];
                s2 = format!("{a} {b}");
            }
        }
        matched.iter().collect::<String>()
    }

    let matching_1 = get_matched_characters(str1, str2);
    let matching_2 = get_matched_characters(str2, str1);
    let match_count = matching_1.len();

    // transposition
    let transpositions = {
        let mut count = 0;
        for (c1, c2) in matching_1.chars().zip(matching_2.chars()) {
            if c1 != c2 {
                count += 1;
            }
        }
        count / 2
    };

    let jaro: f64 = {
        if match_count == 0 {
            return 0.0;
        } else {
            (1_f64 / 3_f64)
                * (match_count as f64 / str1.len() as f64
                    + match_count as f64 / str2.len() as f64
                    + (match_count - transpositions) as f64 / match_count as f64)
        }
    };

    let mut prefix_len = 0.0;
    let bound = std::cmp::min(std::cmp::min(str1.len(), str2.len()), 4);
    for (c1, c2) in str1[..bound].chars().zip(str2[..bound].chars()) {
        if c1 == c2 {
            prefix_len += 1.0;
        } else {
            break;
        }
    }
    jaro + (0.1 * prefix_len * (1.0 - jaro))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_jaro_winkler_distance() {
        let a = jaro_winkler_distance("hello", "world");
        assert_eq!(a, 0.4666666666666666);
        let a = jaro_winkler_distance("martha", "marhta");
        assert_eq!(a, 0.9611111111111111);
        let a = jaro_winkler_distance("martha", "marhat");
        assert_eq!(a, 0.9611111111111111);
        let a = jaro_winkler_distance("test", "test");
        assert_eq!(a, 1.0);
        let a = jaro_winkler_distance("test", "");
        assert_eq!(a, 0.0);
        let a = jaro_winkler_distance("hello world", "HeLLo W0rlD");
        assert_eq!(a, 0.6363636363636364);
    }
}
```

`INSERT HERE`

## SUFFIX TREE

`INSERT HERE`

```rust
// In computer science, a suffix tree (also called PAT tree or, in an earlier form, position tree)
// is a compressed trie containing all the suffixes of the given text as their keys and positions
// in the text as their values. Suffix trees allow particularly fast implementations of many
// important string operations. Source: https://en.wikipedia.org/wiki/Suffix_tree

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct Node {
    pub sub: String,    // substring of input string
    pub ch: Vec<usize>, // vector of child nodes
}

impl Node {
    fn new(sub: String, children: Vec<usize>) -> Self {
        Node {
            sub,
            ch: children.to_vec(),
        }
    }
    pub fn empty() -> Self {
        Node {
            sub: "".to_string(),
            ch: vec![],
        }
    }
}

pub struct SuffixTree {
    pub nodes: Vec<Node>,
}

impl SuffixTree {
    pub fn new(s: String) -> Self {
        let mut suf_tree = SuffixTree {
            nodes: vec![Node::empty()],
        };
        for i in 0..s.len() {
            let (_, substr) = s.split_at(i);
            suf_tree.add_suffix(substr);
        }
        suf_tree
    }
    fn add_suffix(&mut self, suf: &str) {
        let mut n = 0;
        let mut i = 0;
        while i < suf.len() {
            let b = suf.chars().nth(i);
            let mut x2 = 0;
            let mut n2: usize;
            loop {
                let children = &self.nodes[n].ch;
                if children.len() == x2 {
                    n2 = self.nodes.len();
                    self.nodes.push(Node::new(
                        {
                            let (_, sub) = suf.split_at(i);
                            sub.to_string()
                        },
                        vec![],
                    ));
                    self.nodes[n].ch.push(n2);
                    return;
                }
                n2 = children[x2];
                if self.nodes[n2].sub.chars().next() == b {
                    break;
                }
                x2 += 1;
            }
            let sub2 = self.nodes[n2].sub.clone();
            let mut j = 0;
            while j < sub2.len() {
                if suf.chars().nth(i + j) != sub2.chars().nth(j) {
                    let n3 = n2;
                    n2 = self.nodes.len();
                    self.nodes.push(Node::new(
                        {
                            let (sub, _) = sub2.split_at(j);
                            sub.to_string()
                        },
                        vec![n3],
                    ));
                    let (_, temp_sub) = sub2.split_at(j);
                    self.nodes[n3].sub = temp_sub.to_string();
                    self.nodes[n].ch[x2] = n2;
                    break;
                }
                j += 1;
            }
            i += j;
            n = n2;
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_suffix_tree() {
        let suf_tree = SuffixTree::new("banana$".to_string());
        assert_eq!(
            suf_tree.nodes,
            vec![
                Node {
                    sub: "".to_string(),
                    ch: vec![1, 8, 6, 10]
                },
                Node {
                    sub: "banana$".to_string(),
                    ch: vec![]
                },
                Node {
                    sub: "na$".to_string(),
                    ch: vec![]
                },
                Node {
                    sub: "na$".to_string(),
                    ch: vec![]
                },
                Node {
                    sub: "na".to_string(),
                    ch: vec![2, 5]
                },
                Node {
                    sub: "$".to_string(),
                    ch: vec![]
                },
                Node {
                    sub: "na".to_string(),
                    ch: vec![3, 7]
                },
                Node {
                    sub: "$".to_string(),
                    ch: vec![]
                },
                Node {
                    sub: "a".to_string(),
                    ch: vec![4, 9]
                },
                Node {
                    sub: "$".to_string(),
                    ch: vec![]
                },
                Node {
                    sub: "$".to_string(),
                    ch: vec![]
                }
            ]
        );
    }
}
```

`INSERT HERE`

## SUFFIX ARRAY

`INSERT HERE`

```rust
// In computer science, a suffix array is a sorted array of all suffixes of a string.
// It is a data structure used in, among others, full-text indices, data-compression algorithms,
// and the field of bibliometrics. Source: https://en.wikipedia.org/wiki/Suffix_array

use std::cmp::Ordering;

#[derive(Clone)]
struct Suffix {
    index: usize,
    rank: (i32, i32),
}

impl Suffix {
    fn cmp(&self, b: &Self) -> Ordering {
        let a = self;
        let ((a1, a2), (b1, b2)) = (a.rank, b.rank);
        match a1.cmp(&b1) {
            Ordering::Equal => {
                if a2 < b2 {
                    Ordering::Less
                } else {
                    Ordering::Greater
                }
            }
            o => o,
        }
    }
}

pub fn generate_suffix_array(txt: &str) -> Vec<usize> {
    let n = txt.len();
    let mut suffixes: Vec<Suffix> = vec![
        Suffix {
            index: 0,
            rank: (-1, -1)
        };
        n
    ];
    for (i, suf) in suffixes.iter_mut().enumerate() {
        suf.index = i;
        suf.rank.0 = (txt.chars().nth(i).expect("this should exist") as u32 - 'a' as u32) as i32;
        suf.rank.1 = if (i + 1) < n {
            (txt.chars().nth(i + 1).expect("this should exist") as u32 - 'a' as u32) as i32
        } else {
            -1
        }
    }
    suffixes.sort_by(|a, b| a.cmp(b));
    let mut ind = vec![0; n];
    let mut k = 4;
    while k < 2 * n {
        let mut rank = 0;
        let mut prev_rank = suffixes[0].rank.0;
        suffixes[0].rank.0 = rank;
        ind[suffixes[0].index] = 0;

        for i in 1..n {
            if suffixes[i].rank.0 == prev_rank && suffixes[i].rank.1 == suffixes[i - 1].rank.1 {
                prev_rank = suffixes[i].rank.0;
                suffixes[i].rank.0 = rank;
            } else {
                prev_rank = suffixes[i].rank.0;
                rank += 1;
                suffixes[i].rank.0 = rank;
            }
            ind[suffixes[i].index] = i;
        }
        for i in 0..n {
            let next_index = suffixes[i].index + (k / 2);
            suffixes[i].rank.1 = if next_index < n {
                suffixes[ind[next_index]].rank.0
            } else {
                -1
            }
        }
        suffixes.sort_by(|a, b| a.cmp(b));
        k *= 2;
    }
    let mut suffix_arr = Vec::new();
    for suf in suffixes {
        suffix_arr.push(suf.index);
    }
    suffix_arr
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_suffix_array() {
        let a = generate_suffix_array("banana");
        assert_eq!(a, vec![5, 3, 1, 0, 4, 2]);
    }
}
```

`INSERT HERE`
