# Examples: Ciphers

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## Caesar

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

```rust
//! Caesar Cipher
//! Based on cipher_crypt::caesar
//!
//! # Algorithm
//!
//! Rotate each ascii character by shift. The most basic example is ROT 13, which rotates
//! 'a' to
//! 'n'. This implementation does not rotate unicode characters.

/// Caesar cipher to rotate cipher text by shift and return an owned String.
pub fn caesar(cipher: &str, shift: u8) -> String {
    cipher
        .chars()
        .map(|c| {
            if c.is_ascii_alphabetic() {
                let first = if c.is_ascii_lowercase() { b'a' } else { b'A' };
                // modulo the distance to keep character range
                (first + (c as u8 + shift - first) % 26) as char
            } else {
                c
            }
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn empty() {
        assert_eq!(caesar("", 13), "");
    }

    #[test]
    fn caesar_rot_13() {
        assert_eq!(caesar("rust", 13), "ehfg");
    }

    #[test]
    fn caesar_unicode() {
        assert_eq!(caesar("attack at dawn 攻", 5), "fyyfhp fy ifbs 攻");
    }
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## Morse Code

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

```rust
use std::collections::HashMap;
use std::io;

const UNKNOWN_CHARACTER: &str = "........";
const _UNKNOWN_MORSE_CHARACTER: &str = "_";

pub fn encode(message: &str) -> String {
    let dictionary = _morse_dictionary();
    message
        .chars()
        .into_iter()
        .map(|char| char.to_uppercase().to_string())
        .map(|letter| dictionary.get(letter.as_str()))
        .map(|option| option.unwrap_or(&UNKNOWN_CHARACTER).to_string())
        .collect::<Vec<String>>()
        .join(" ")
}

// Declaritive macro for creating readable map declarations, for more info see
// https://doc.rust-lang.org/book/ch19-06-macros.html
macro_rules! map {
    ($($key:expr => $value:expr),* $(,)?) => {
        std::iter::Iterator::collect(IntoIterator::into_iter([$(($key, $value),)*]))
    };
}

fn _morse_dictionary() -> HashMap<&'static str, &'static str> {
    map! {
        "A" => ".-",      "B" => "-...",    "C" => "-.-.",
        "D" => "-..",     "E" => ".",       "F" => "..-.",
        "G" => "--.",     "H" => "....",    "I" => "..",
        "J" => ".---",    "K" => "-.-",     "L" => ".-..",
        "M" => "--",      "N" => "-.",      "O" => "---",
        "P" => ".--.",    "Q" => "--.-",    "R" => ".-.",
        "S" => "...",     "T" => "-",       "U" => "..-",
        "V" => "...-",    "W" => ".--",     "X" => "-..-",
        "Y" => "-.--",    "Z" => "--..",

        "1" => ".----",   "2" => "..---",   "3" => "...--",
        "4" => "....-",   "5" => ".....",   "6" => "-....",
        "7" => "--...",   "8" => "---..",   "9" => "----.",
        "0" => "-----",

        "&" => ".-...",   "@" => ".--.-.",  ":" => "---...",
        "," => "--..--",  "." => ".-.-.-",  "'" => ".----.",
        "\"" => ".-..-.", "?" => "..--..",  "/" => "-..-.",
        "=" => "-...-",   "+" => ".-.-.",   "-" => "-....-",
        "(" => "-.--.",   ")" => "-.--.-",  " " => "/",
        "!" => "-.-.--",
    }
}

fn _morse_to_alphanumeric_dictionary() -> HashMap<&'static str, &'static str> {
    map! {
        ".-"   =>  "A",    "-..." => "B",    "-.-."  => "C",
        "-.."  =>  "D",    "."    => "E",    "..-."  => "F",
        "--."  =>  "G",    "...." => "H",    ".."    => "I",
        ".---" =>  "J",    "-.-"  => "K",    ".-.."  => "L",
        "--"   =>  "M",    "-."   => "N",    "---"   => "O",
        ".--." =>  "P",    "--.-" => "Q",    ".-."   => "R",
        "..."  =>  "S",    "-"    => "T",    "..-"   => "U",
        "...-" =>  "V",    ".--"  => "W",    "-..-"  => "X",
        "-.--" =>  "Y",    "--.." => "Z",

        ".----" => "1",    "..---" => "2",   "...--" => "3",
        "....-" => "4",    "....." => "5",   "-...." => "6",
        "--..." => "7",    "---.." => "8",   "----." => "9",
        "-----" => "0",

        ".-..."  => "&",   ".--.-." => "@",  "---..." => ":",
        "--..--" => ",",   ".-.-.-" => ".",  ".----." => "'",
        ".-..-." => "\"",  "..--.." => "?",  "-..-."  => "/",
        "-...-"  => "=",   ".-.-."  => "+",  "-....-" => "-",
        "-.--."  => "(",   "-.--.-" => ")",  "/"      => " ",
        "-.-.--" => "!",   " "      => " ",  ""       => ""
    }
}

fn _check_part(string: &str) -> bool {
    for c in string.chars() {
        match c {
            '.' | '-' | ' ' => (),
            _ => return false,
        }
    }
    true
}

fn _check_all_parts(string: &str) -> bool {
    string.split('/').all(_check_part)
}

fn _decode_token(string: &str) -> String {
    _morse_to_alphanumeric_dictionary()
        .get(string)
        .unwrap_or(&_UNKNOWN_MORSE_CHARACTER)
        .to_string()
}

fn _decode_part(string: &str) -> String {
    string
        .split(' ')
        .map(_decode_token)
        .collect::<Vec<String>>()
        .join("")
}

/// Convert morse code to ascii.
///
/// Given a morse code, return the corresponding message.
/// If the code is invalid, the undecipherable part of the code is replaced by `_`.
pub fn decode(string: &str) -> Result<String, io::Error> {
    if !_check_all_parts(string) {
        return Err(io::Error::new(
            io::ErrorKind::InvalidData,
            "Invalid morse code",
        ));
    }

    let mut partitions: Vec<String> = vec![];

    for part in string.split('/') {
        partitions.push(_decode_part(part));
    }

    Ok(partitions.join(" "))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn encrypt_only_letters() {
        let message = "Hello Morse";
        let cipher = encode(message);
        assert_eq!(
            cipher,
            ".... . .-.. .-.. --- / -- --- .-. ... .".to_string()
        )
    }

    #[test]
    fn encrypt_letters_and_special_characters() {
        let message = "What's a great day!";
        let cipher = encode(message);
        assert_eq!(
            cipher,
            ".-- .... .- - .----. ... / .- / --. .-. . .- - / -.. .- -.-- -.-.--".to_string()
        )
    }

    #[test]
    fn encrypt_message_with_unsupported_character() {
        let message = "Error?? {}";
        let cipher = encode(message);
        assert_eq!(
            cipher,
            ". .-. .-. --- .-. ..--.. ..--.. / ........ ........".to_string()
        )
    }

    #[test]
    fn decrypt_valid_morsecode_with_spaces() {
        let expected = "Hello Morse! How's it goin, \"eh\"?"
            .to_string()
            .to_uppercase();
        let encypted = encode(&expected);
        let result = decode(&encypted).unwrap();

        assert_eq!(expected, result);
    }

    #[test]
    fn decrypt_valid_character_set_invalid_morsecode() {
        let expected = format!(
            "{}{}{}{} {}",
            _UNKNOWN_MORSE_CHARACTER,
            _UNKNOWN_MORSE_CHARACTER,
            _UNKNOWN_MORSE_CHARACTER,
            _UNKNOWN_MORSE_CHARACTER,
            _UNKNOWN_MORSE_CHARACTER,
        );

        let encypted = ".-.-.--.-.-. --------. ..---.-.-. .-.-.--.-.-. / .-.-.--.-.-.".to_string();
        let result = decode(&encypted).unwrap();

        assert_eq!(expected, result);
    }

    #[test]
    fn decrypt_invalid_morsecode_with_spaces() {
        let encypted = "1... . .-.. .-.. --- / -- --- .-. ... .";
        let result = decode(encypted).map_err(|e| e.kind());
        let expected = Err(io::ErrorKind::InvalidData);

        assert_eq!(expected, result);
    }
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## Polybius

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

```rust
/// Encode an ASCII string into its location in a Polybius square.
/// Only alphabetical characters are encoded.
pub fn encode_ascii(string: &str) -> String {
    string
        .chars()
        .map(|c| match c {
            'a' | 'A' => "11",
            'b' | 'B' => "12",
            'c' | 'C' => "13",
            'd' | 'D' => "14",
            'e' | 'E' => "15",
            'f' | 'F' => "21",
            'g' | 'G' => "22",
            'h' | 'H' => "23",
            'i' | 'I' | 'j' | 'J' => "24",
            'k' | 'K' => "25",
            'l' | 'L' => "31",
            'm' | 'M' => "32",
            'n' | 'N' => "33",
            'o' | 'O' => "34",
            'p' | 'P' => "35",
            'q' | 'Q' => "41",
            'r' | 'R' => "42",
            's' | 'S' => "43",
            't' | 'T' => "44",
            'u' | 'U' => "45",
            'v' | 'V' => "51",
            'w' | 'W' => "52",
            'x' | 'X' => "53",
            'y' | 'Y' => "54",
            'z' | 'Z' => "55",
            _ => "",
        })
        .collect()
}

/// Decode a string of ints into their corresponding
/// letters in a Polybius square.
///
/// Any invalid characters, or whitespace will be ignored.
pub fn decode_ascii(string: &str) -> String {
    string
        .chars()
        .filter(|c| !c.is_whitespace())
        .collect::<String>()
        .as_bytes()
        .chunks(2)
        .map(|s| match std::str::from_utf8(s) {
            Ok(v) => v.parse::<i32>().unwrap_or(0),
            Err(_) => 0,
        })
        .map(|i| match i {
            11 => 'A',
            12 => 'B',
            13 => 'C',
            14 => 'D',
            15 => 'E',
            21 => 'F',
            22 => 'G',
            23 => 'H',
            24 => 'I',
            25 => 'K',
            31 => 'L',
            32 => 'M',
            33 => 'N',
            34 => 'O',
            35 => 'P',
            41 => 'Q',
            42 => 'R',
            43 => 'S',
            44 => 'T',
            45 => 'U',
            51 => 'V',
            52 => 'W',
            53 => 'X',
            54 => 'Y',
            55 => 'Z',
            _ => ' ',
        })
        .collect::<String>()
        .replace(' ', "")
}

#[cfg(test)]
mod tests {
    use super::{decode_ascii, encode_ascii};

    #[test]
    fn encode_empty() {
        assert_eq!(encode_ascii(""), "");
    }

    #[test]
    fn encode_valid_string() {
        assert_eq!(encode_ascii("This is a test"), "4423244324431144154344");
    }

    #[test]
    fn encode_emoji() {
        assert_eq!(encode_ascii("🙂"), "");
    }

    #[test]
    fn decode_empty() {
        assert_eq!(decode_ascii(""), "");
    }

    #[test]
    fn decode_valid_string() {
        assert_eq!(
            decode_ascii("44 23 24 43 24 43 11 44 15 43 44 "),
            "THISISATEST"
        );
    }

    #[test]
    fn decode_emoji() {
        assert_eq!(decode_ascii("🙂"), "");
    }

    #[test]
    fn decode_string_with_whitespace() {
        assert_eq!(
            decode_ascii("44\n23\t\r24\r\n43   2443\n 11 \t 44\r \r15 \n43 44"),
            "THISISATEST"
        );
    }

    #[test]
    fn decode_unknown_string() {
        assert_eq!(decode_ascii("94 63 64 83 64 48 77 00 05 47 48 "), "");
    }

    #[test]
    fn decode_odd_length() {
        assert_eq!(decode_ascii("11 22 33 4"), "AGN");
    }

    #[test]
    fn encode_and_decode() {
        let string = "Do you ever wonder why we're here?";
        let encode = encode_ascii(string);
        assert_eq!(
            "1434543445155115425234331415425223545215421523154215",
            encode,
        );
        assert_eq!("DOYOUEVERWONDERWHYWEREHERE", decode_ascii(&encode));
    }
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## SHA-2

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

```rust
/*!
 * SHA-2 256 bit implementation
 * This implementation is based on RFC6234
 * Keep in mind that the amount of data (in bits) processed should always be an
 * integer multiple of 8
 */

// The constants are tested to make sure they are correct
pub const H0: [u32; 8] = [
    0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a, 0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19,
];

pub const K: [u32; 64] = [
    0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
    0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
    0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
    0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
    0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
    0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
    0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
    0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
];

// The following functions are implemented according to page 10 of RFC6234
#[inline]
fn ch(x: u32, y: u32, z: u32) -> u32 {
    (x & y) ^ ((!x) & z)
}

#[inline]
fn maj(x: u32, y: u32, z: u32) -> u32 {
    (x & y) ^ (x & z) ^ (y & z)
}

#[inline]
fn bsig0(x: u32) -> u32 {
    x.rotate_right(2) ^ x.rotate_right(13) ^ x.rotate_right(22)
}

#[inline]
fn bsig1(x: u32) -> u32 {
    x.rotate_right(6) ^ x.rotate_right(11) ^ x.rotate_right(25)
}

#[inline]
fn ssig0(x: u32) -> u32 {
    x.rotate_right(7) ^ x.rotate_right(18) ^ (x >> 3)
}

#[inline]
fn ssig1(x: u32) -> u32 {
    x.rotate_right(17) ^ x.rotate_right(19) ^ (x >> 10)
}

pub struct SHA256 {
    /// The current block to be processed, 512 bits long
    buffer: [u32; 16],
    /// Length (bits) of the message, should always be a multiple of 8
    length: u64,
    /// The current hash value. Note: this value is invalid unless `finalize`
    /// is called
    pub h: [u32; 8],
    /// Message schedule
    w: [u32; 64],
    pub finalized: bool,
    // Temporary values:
    round: [u32; 8],
}

fn process_block(h: &mut [u32; 8], w: &mut [u32; 64], round: &mut [u32; 8], buf: &[u32; 16]) {
    // Prepare the message schedule:
    w[..buf.len()].copy_from_slice(&buf[..]);
    for i in buf.len()..w.len() {
        w[i] = ssig1(w[i - 2])
            .wrapping_add(w[i - 7])
            .wrapping_add(ssig0(w[i - 15]))
            .wrapping_add(w[i - 16]);
    }
    round.copy_from_slice(h);
    for i in 0..w.len() {
        let t1 = round[7]
            .wrapping_add(bsig1(round[4]))
            .wrapping_add(ch(round[4], round[5], round[6]))
            .wrapping_add(K[i])
            .wrapping_add(w[i]);
        let t2 = bsig0(round[0]).wrapping_add(maj(round[0], round[1], round[2]));
        round[7] = round[6];
        round[6] = round[5];
        round[5] = round[4];
        round[4] = round[3].wrapping_add(t1);
        round[3] = round[2];
        round[2] = round[1];
        round[1] = round[0];
        round[0] = t1.wrapping_add(t2);
    }
    for i in 0..h.len() {
        h[i] = h[i].wrapping_add(round[i]);
    }
}

impl SHA256 {
    pub fn new_default() -> Self {
        SHA256 {
            buffer: [0u32; 16],
            length: 0,
            h: H0,
            w: [0u32; 64],
            round: [0u32; 8],
            finalized: false,
        }
    }
    /// Note: buffer should be empty before calling this!
    pub fn process_block(&mut self, buf: &[u32; 16]) {
        process_block(&mut self.h, &mut self.w, &mut self.round, buf);
        self.length += 512;
    }

    pub fn update(&mut self, data: &[u8]) {
        if data.is_empty() {
            return;
        }
        let offset = (((32 - (self.length & 31)) & 31) >> 3) as usize;
        let mut buf_ind = ((self.length & 511) >> 5) as usize;
        for (i, &byte) in data.iter().enumerate().take(offset) {
            self.buffer[buf_ind] ^= (byte as u32) << ((offset - i - 1) << 3);
        }
        self.length += (data.len() as u64) << 3;
        if offset > data.len() {
            return;
        }
        if offset > 0 {
            buf_ind += 1;
        }
        if data.len() > 3 {
            for i in (offset..(data.len() - 3)).step_by(4) {
                if buf_ind & 16 == 16 {
                    process_block(&mut self.h, &mut self.w, &mut self.round, &self.buffer);
                    buf_ind = 0;
                }
                self.buffer[buf_ind] = ((data[i] as u32) << 24)
                    ^ ((data[i + 1] as u32) << 16)
                    ^ ((data[i + 2] as u32) << 8)
                    ^ data[i + 3] as u32;
                buf_ind += 1;
            }
        }
        if buf_ind & 16 == 16 {
            process_block(&mut self.h, &mut self.w, &mut self.round, &self.buffer);
            buf_ind = 0;
        }
        self.buffer[buf_ind] = 0;
        let rem_ind = offset + ((data.len() - offset) & !0b11);
        for (i, &byte) in data[rem_ind..].iter().enumerate() {
            self.buffer[buf_ind] ^= (byte as u32) << ((3 - i) << 3);
        }
    }

    pub fn get_hash(&mut self) -> [u8; 32] {
        // we should first add a `1` bit to the end of the buffer, then we will
        // add enough 0s so that the length becomes (512k + 448). After that we
        // will append the binary representation of length to the data
        if !self.finalized {
            self.finalized = true;
            let clen = (self.length + 8) & 511;
            let num_0 = match clen.cmp(&448) {
                std::cmp::Ordering::Greater => (448 + 512 - clen) >> 3,
                _ => (448 - clen) >> 3,
            };
            let mut padding: Vec<u8> = vec![0_u8; (num_0 + 9) as usize];
            let len = padding.len();
            padding[0] = 0x80;
            padding[len - 8] = (self.length >> 56) as u8;
            padding[len - 7] = (self.length >> 48) as u8;
            padding[len - 6] = (self.length >> 40) as u8;
            padding[len - 5] = (self.length >> 32) as u8;
            padding[len - 4] = (self.length >> 24) as u8;
            padding[len - 3] = (self.length >> 16) as u8;
            padding[len - 2] = (self.length >> 8) as u8;
            padding[len - 1] = self.length as u8;
            self.update(&padding);
        }
        assert_eq!(self.length & 511, 0);
        let mut result = [0u8; 32];
        for i in (0..32).step_by(4) {
            result[i] = (self.h[i >> 2] >> 24) as u8;
            result[i + 1] = (self.h[i >> 2] >> 16) as u8;
            result[i + 2] = (self.h[i >> 2] >> 8) as u8;
            result[i + 3] = self.h[i >> 2] as u8;
        }
        result
    }
}

impl super::Hasher<32> for SHA256 {
    fn new_default() -> Self {
        SHA256::new_default()
    }

    fn update(&mut self, data: &[u8]) {
        self.update(data);
    }

    fn get_hash(&mut self) -> [u8; 32] {
        self.get_hash()
    }
}

#[cfg(test)]
pub mod tests {
    use super::*;
    use crate::math::LinearSieve;
    use std::fmt::Write;

    // Let's keep this utility function
    pub fn get_hash_string(hash: &[u8; 32]) -> String {
        let mut result = String::new();
        result.reserve(64);
        for &ch in hash {
            write!(&mut result, "{ch:02x}").unwrap();
        }
        result
    }

    #[test]
    fn test_constants() {
        let mut ls = LinearSieve::new();
        ls.prepare(311).unwrap();
        assert_eq!(64, ls.primes.len());
        assert_eq!(311, ls.primes[63]);

        let float_len = 52;
        let constant_len = 32;
        for (pos, &k) in K.iter().enumerate() {
            let a: f64 = ls.primes[pos] as f64;
            let bits = a.cbrt().to_bits();
            let exp = bits >> float_len;
            // The sign bit is already 0
            //(exp - 1023) can be bigger than 0, we must include more bits.
            let k_ref = ((bits & ((1_u64 << float_len) - 1))
                >> (float_len - constant_len + 1023 - exp)) as u32;
            assert_eq!(k, k_ref);
        }

        for (pos, &h) in H0.iter().enumerate() {
            let a: f64 = ls.primes[pos] as f64;
            let bits = a.sqrt().to_bits();
            let exp = bits >> float_len;
            let h_ref = ((bits & ((1_u64 << float_len) - 1))
                >> (float_len - constant_len + 1023 - exp)) as u32;
            assert_eq!(h, h_ref);
        }
    }

    // To test the hashes, you can use the following command on linux:
    // echo -n 'STRING' | sha256sum
    // the `-n` is because by default, echo adds a `\n` to its output

    #[test]
    fn empty() {
        let mut res = SHA256::new_default();
        assert_eq!(
            res.get_hash(),
            [
                0xe3, 0xb0, 0xc4, 0x42, 0x98, 0xfc, 0x1c, 0x14, 0x9a, 0xfb, 0xf4, 0xc8, 0x99, 0x6f,
                0xb9, 0x24, 0x27, 0xae, 0x41, 0xe4, 0x64, 0x9b, 0x93, 0x4c, 0xa4, 0x95, 0x99, 0x1b,
                0x78, 0x52, 0xb8, 0x55
            ]
        );
    }

    #[test]
    fn ascii() {
        let mut res = SHA256::new_default();
        res.update(&b"The quick brown fox jumps over the lazy dog".to_vec());
        assert_eq!(
            res.get_hash(),
            [
                0xD7, 0xA8, 0xFB, 0xB3, 0x07, 0xD7, 0x80, 0x94, 0x69, 0xCA, 0x9A, 0xBC, 0xB0, 0x08,
                0x2E, 0x4F, 0x8D, 0x56, 0x51, 0xE4, 0x6D, 0x3C, 0xDB, 0x76, 0x2D, 0x02, 0xD0, 0xBF,
                0x37, 0xC9, 0xE5, 0x92
            ]
        )
    }

    #[test]
    fn ascii_avalanche() {
        let mut res = SHA256::new_default();
        res.update(&b"The quick brown fox jumps over the lazy dog.".to_vec());
        assert_eq!(
            res.get_hash(),
            [
                0xEF, 0x53, 0x7F, 0x25, 0xC8, 0x95, 0xBF, 0xA7, 0x82, 0x52, 0x65, 0x29, 0xA9, 0xB6,
                0x3D, 0x97, 0xAA, 0x63, 0x15, 0x64, 0xD5, 0xD7, 0x89, 0xC2, 0xB7, 0x65, 0x44, 0x8C,
                0x86, 0x35, 0xFB, 0x6C
            ]
        );
        // Test if finalization is not repeated twice
        assert_eq!(
            res.get_hash(),
            [
                0xEF, 0x53, 0x7F, 0x25, 0xC8, 0x95, 0xBF, 0xA7, 0x82, 0x52, 0x65, 0x29, 0xA9, 0xB6,
                0x3D, 0x97, 0xAA, 0x63, 0x15, 0x64, 0xD5, 0xD7, 0x89, 0xC2, 0xB7, 0x65, 0x44, 0x8C,
                0x86, 0x35, 0xFB, 0x6C
            ]
        )
    }
    #[test]
    fn long_ascii() {
        let mut res = SHA256::new_default();
        let val = &b"The quick brown fox jumps over the lazy dog.".to_vec();
        for _ in 0..1000 {
            res.update(val);
        }
        let hash = res.get_hash();
        assert_eq!(
            &get_hash_string(&hash),
            "c264fca077807d391df72fadf39dd63be21f1823f65ca530c9637760eabfc18c"
        );
        let mut res = SHA256::new_default();
        let val = &b"a".to_vec();
        for _ in 0..999 {
            res.update(val);
        }
        let hash = res.get_hash();
        assert_eq!(
            &get_hash_string(&hash),
            "d9fe27f3d807a7c46467325f7189495e82b099ce2e14c5b16cc76697fa909f81"
        )
    }
    #[test]
    fn short_ascii() {
        let mut res = SHA256::new_default();
        let val = &b"a".to_vec();
        res.update(val);
        let hash = res.get_hash();
        assert_eq!(
            &get_hash_string(&hash),
            "ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb"
        );
    }
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## TEA

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

```rust
use std::num::Wrapping as W;

struct TeaContext {
    key0: u64,
    key1: u64,
}

impl TeaContext {
    pub fn new(key: &[u64; 2]) -> TeaContext {
        TeaContext {
            key0: key[0],
            key1: key[1],
        }
    }

    pub fn encrypt_block(&self, block: u64) -> u64 {
        let (mut b0, mut b1) = divide_u64(block);
        let (k0, k1) = divide_u64(self.key0);
        let (k2, k3) = divide_u64(self.key1);
        let mut sum = W(0u32);

        for _ in 0..32 {
            sum += W(0x9E3779B9);
            b0 += ((b1 << 4) + k0) ^ (b1 + sum) ^ ((b1 >> 5) + k1);
            b1 += ((b0 << 4) + k2) ^ (b0 + sum) ^ ((b0 >> 5) + k3);
        }

        ((b1.0 as u64) << 32) | b0.0 as u64
    }

    pub fn decrypt_block(&self, block: u64) -> u64 {
        let (mut b0, mut b1) = divide_u64(block);
        let (k0, k1) = divide_u64(self.key0);
        let (k2, k3) = divide_u64(self.key1);
        let mut sum = W(0xC6EF3720u32);

        for _ in 0..32 {
            b1 -= ((b0 << 4) + k2) ^ (b0 + sum) ^ ((b0 >> 5) + k3);
            b0 -= ((b1 << 4) + k0) ^ (b1 + sum) ^ ((b1 >> 5) + k1);
            sum -= W(0x9E3779B9);
        }

        ((b1.0 as u64) << 32) | b0.0 as u64
    }
}

#[inline]
fn divide_u64(n: u64) -> (W<u32>, W<u32>) {
    (W(n as u32), W((n >> 32) as u32))
}

pub fn tea_encrypt(plain: &[u8], key: &[u8]) -> Vec<u8> {
    let tea = TeaContext::new(&[to_block(&key[..8]), to_block(&key[8..16])]);
    let mut result: Vec<u8> = Vec::new();

    for i in (0..plain.len()).step_by(8) {
        let block = to_block(&plain[i..i + 8]);
        result.extend(from_block(tea.encrypt_block(block)).iter());
    }

    result
}

pub fn tea_decrypt(cipher: &[u8], key: &[u8]) -> Vec<u8> {
    let tea = TeaContext::new(&[to_block(&key[..8]), to_block(&key[8..16])]);
    let mut result: Vec<u8> = Vec::new();

    for i in (0..cipher.len()).step_by(8) {
        let block = to_block(&cipher[i..i + 8]);
        result.extend(from_block(tea.decrypt_block(block)).iter());
    }

    result
}

#[inline]
fn to_block(data: &[u8]) -> u64 {
    data[0] as u64
        | (data[1] as u64) << 8
        | (data[2] as u64) << 16
        | (data[3] as u64) << 24
        | (data[4] as u64) << 32
        | (data[5] as u64) << 40
        | (data[6] as u64) << 48
        | (data[7] as u64) << 56
}

fn from_block(block: u64) -> [u8; 8] {
    [
        block as u8,
        (block >> 8) as u8,
        (block >> 16) as u8,
        (block >> 24) as u8,
        (block >> 32) as u8,
        (block >> 40) as u8,
        (block >> 48) as u8,
        (block >> 56) as u8,
    ]
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn test_block_convert() {
        assert_eq!(
            to_block(&[0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd, 0xef]),
            0xefcdab8967452301
        );

        assert_eq!(
            from_block(0xefcdab8967452301),
            [0x01, 0x23, 0x45, 0x67, 0x89, 0xab, 0xcd, 0xef]
        );
    }

    #[test]
    fn test_tea_encrypt() {
        assert_eq!(
            tea_encrypt(
                &[0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
                &[
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    0x00, 0x00, 0x00
                ]
            ),
            [0x0A, 0x3A, 0xEA, 0x41, 0x40, 0xA9, 0xBA, 0x94]
        );
    }

    #[test]
    fn test_tea_encdec() {
        let plain = &[0x1b, 0xcc, 0xd4, 0x31, 0xa0, 0xf6, 0x8a, 0x55];
        let key = &[
            0x20, 0x45, 0x08, 0x10, 0xb0, 0x23, 0xe2, 0x17, 0xc3, 0x81, 0xd6, 0xf2, 0xee, 0x00,
            0xa4, 0x8a,
        ];
        let cipher = tea_encrypt(plain, key);

        assert_eq!(tea_decrypt(&cipher[..], key), plain);
    }
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## Transposition

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

```rust
//! Transposition Cipher
//!
//! The Transposition Cipher is a method of encryption by which a message is shifted
//! according to a regular system, so that the ciphertext is a rearrangement of the
//! original message. The most commonly referred to Transposition Cipher is the
//! COLUMNAR TRANSPOSITION cipher, which is demonstrated below.

use std::ops::Range;

/// Encrypts or decrypts a message, using multiple keys. The
/// encryption is based on the columnar transposition method.
pub fn transposition(decrypt_mode: bool, msg: &str, key: &str) -> String {
    let key_uppercase: String = key.to_uppercase();
    let mut cipher_msg: String = msg.to_string();

    let keys: Vec<&str> = match decrypt_mode {
        false => key_uppercase.split_whitespace().collect(),
        true => key_uppercase.split_whitespace().rev().collect(),
    };

    for cipher_key in keys.iter() {
        let mut key_order: Vec<usize> = Vec::new();
        let mut counter: u8 = 0;

        // Removes any non-alphabet characters from 'msg'
        cipher_msg = cipher_msg
            .to_uppercase()
            .chars()
            .filter(|&c| c.is_ascii_alphabetic())
            .collect();

        // Determines the sequence of the columns, as dictated by the
        // alphabetical order of the keyword's letters
        let mut key_ascii: Vec<(usize, u8)> =
            cipher_key.bytes().enumerate().collect::<Vec<(usize, u8)>>();

        key_ascii.sort_by_key(|&(_, key)| key);

        key_ascii.iter_mut().for_each(|(_, key)| {
            *key = counter;
            counter += 1;
        });

        key_ascii.sort_by_key(|&(index, _)| index);

        key_ascii
            .into_iter()
            .for_each(|(_, key)| key_order.push(key.into()));

        // Determines whether to encrypt or decrypt the message,
        // and returns the result
        cipher_msg = match decrypt_mode {
            false => encrypt(cipher_msg, key_order),
            true => decrypt(cipher_msg, key_order),
        };
    }

    cipher_msg
}

/// Performs the columnar transposition encryption
fn encrypt(mut msg: String, key_order: Vec<usize>) -> String {
    let mut encrypted_msg: String = String::from("");
    let mut encrypted_vec: Vec<String> = Vec::new();

    let msg_len: usize = msg.len();
    let key_len: usize = key_order.len();

    let mut msg_index: usize = msg_len;
    let mut key_index: usize = key_len;

    // Loop each column, pushing it to a Vec<T>
    while !msg.is_empty() {
        let mut chars: String = String::from("");
        let mut index: usize = 0;
        key_index -= 1;

        // Loop every nth character, determined by key length, to create a column
        while index < msg_index {
            let ch: char = msg.remove(index);
            chars.push(ch);

            index += key_index;
            msg_index -= 1;
        }

        encrypted_vec.push(chars);
    }

    // Concatenate the columns into a string, determined by the
    // alphabetical order of the keyword's characters
    let mut indexed_vec: Vec<(usize, &String)> = Vec::new();
    let mut indexed_msg: String = String::from("");
    let mut counter: usize = 0;

    key_order.into_iter().for_each(|key_index| {
        indexed_vec.push((key_index, &encrypted_vec[counter]));
        counter += 1;
    });

    indexed_vec.sort();

    indexed_vec.into_iter().for_each(|(_, column)| {
        indexed_msg.push_str(column);
    });

    // Split the message by a space every nth character, determined by
    // 'message length divided by keyword length' to the next highest integer.
    let msg_div: usize = (msg_len as f32 / key_len as f32).ceil() as usize;
    let mut counter: usize = 0;

    indexed_msg.chars().for_each(|c| {
        encrypted_msg.push(c);
        counter += 1;
        if counter == msg_div {
            encrypted_msg.push(' ');
            counter = 0;
        }
    });

    encrypted_msg.trim_end().to_string()
}

/// Performs the columnar transposition decryption
fn decrypt(mut msg: String, key_order: Vec<usize>) -> String {
    let mut decrypted_msg: String = String::from("");
    let mut decrypted_vec: Vec<String> = Vec::new();
    let mut indexed_vec: Vec<(usize, String)> = Vec::new();

    let msg_len: usize = msg.len();
    let key_len: usize = key_order.len();

    // Split the message into columns, determined by 'message length divided by keyword length'.
    // Some columns are larger by '+1', where the prior calculation leaves a remainder.
    let split_size: usize = (msg_len as f64 / key_len as f64) as usize;
    let msg_mod: usize = msg_len % key_len;
    let mut counter: usize = msg_mod;

    let mut key_split: Vec<usize> = key_order.clone();
    let (split_large, split_small) = key_split.split_at_mut(msg_mod);

    split_large.sort_unstable();
    split_small.sort_unstable();

    split_large.iter_mut().rev().for_each(|key_index| {
        counter -= 1;
        let range: Range<usize> =
            ((*key_index * split_size) + counter)..(((*key_index + 1) * split_size) + counter + 1);

        let slice: String = msg[range.clone()].to_string();
        indexed_vec.push((*key_index, slice));

        msg.replace_range(range, "");
    });

    split_small.iter_mut().for_each(|key_index| {
        let (slice, rest_of_msg) = msg.split_at(split_size);
        indexed_vec.push((*key_index, (slice.to_string())));
        msg = rest_of_msg.to_string();
    });

    indexed_vec.sort();

    key_order.into_iter().for_each(|key| {
        if let Some((_, column)) = indexed_vec.iter().find(|(key_index, _)| key_index == &key) {
            decrypted_vec.push(column.to_string());
        }
    });

    // Concatenate the columns into a string, determined by the
    // alphabetical order of the keyword's characters
    for _ in 0..split_size {
        decrypted_vec.iter_mut().for_each(|column| {
            decrypted_msg.push(column.remove(0));
        })
    }

    if !decrypted_vec.is_empty() {
        decrypted_vec.into_iter().for_each(|chars| {
            decrypted_msg.push_str(&chars);
        })
    }

    decrypted_msg
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn encryption() {
        assert_eq!(
            transposition(
                false,
                "The quick brown fox jumps over the lazy dog",
                "Archive",
            ),
            "TKOOL ERJEZ CFSEG QOURY UWMTD HBXVA INPHO"
        );

        assert_eq!(
            transposition(
                false,
                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,/;'[]{}:|_+=-`~() ",
                "Tenacious"
            ),
            "DMVENW ENWFOX BKTCLU FOXGPY CLUDMV GPYHQZ IRAJSA JSBKTH QZIR"
        );

        assert_eq!(
            transposition(false, "WE ARE DISCOVERED. FLEE AT ONCE.", "ZEBRAS"),
            "EVLNA CDTES EAROF ODEEC WIREE"
        );
    }

    #[test]
    fn decryption() {
        assert_eq!(
            transposition(true, "TKOOL ERJEZ CFSEG QOURY UWMTD HBXVA INPHO", "Archive"),
            "THEQUICKBROWNFOXJUMPSOVERTHELAZYDOG"
        );

        assert_eq!(
            transposition(
                true,
                "DMVENW ENWFOX BKTCLU FOXGPY CLUDMV GPYHQZ IRAJSA JSBKTH QZIR",
                "Tenacious"
            ),
            "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ"
        );

        assert_eq!(
            transposition(true, "EVLNA CDTES EAROF ODEEC WIREE", "ZEBRAS"),
            "WEAREDISCOVEREDFLEEATONCE"
        );
    }

    #[test]
    fn double_encryption() {
        assert_eq!(
            transposition(
                false,
                "The quick brown fox jumps over the lazy dog",
                "Archive Snow"
            ),
            "KEZEUWHAH ORCGRMBIO TLESOUDVP OJFQYTXN"
        );

        assert_eq!(
            transposition(
                false,
                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,/;'[]{}:|_+=-`~() ",
                "Tenacious Drink"
            ),
            "DWOCXLGZSKI VNBUPDYRJHN FTOCVQJBZEW KFYMHASQMEX LGUPIATR"
        );

        assert_eq!(
            transposition(false, "WE ARE DISCOVERED. FLEE AT ONCE.", "ZEBRAS STRIPE"),
            "CAEEN SOIAE DRLEF WEDRE EVTOC"
        );
    }

    #[test]
    fn double_decryption() {
        assert_eq!(
            transposition(
                true,
                "KEZEUWHAH ORCGRMBIO TLESOUDVP OJFQYTXN",
                "Archive Snow"
            ),
            "THEQUICKBROWNFOXJUMPSOVERTHELAZYDOG"
        );

        assert_eq!(
            transposition(
                true,
                "DWOCXLGZSKI VNBUPDYRJHN FTOCVQJBZEW KFYMHASQMEX LGUPIATR",
                "Tenacious Drink",
            ),
            "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ"
        );

        assert_eq!(
            transposition(true, "CAEEN SOIAE DRLEF WEDRE EVTOC", "ZEBRAS STRIPE"),
            "WEAREDISCOVEREDFLEEATONCE"
        );
    }
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## Vigenère

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

```rust
//! Vigenère Cipher
//!
//! # Algorithm
//!
//! Rotate each ascii character by the offset of the corresponding key character.
//! When we reach the last key character, we start over from the first one.
//! This implementation does not rotate unicode characters.

/// Vigenère cipher to rotate plain_text text by key and return an owned String.
pub fn vigenere(plain_text: &str, key: &str) -> String {
    // Remove all unicode and non-ascii characters from key
    let key: String = key.chars().filter(|&c| c.is_ascii_alphabetic()).collect();
    let key = key.to_ascii_lowercase();

    let key_len = key.len();
    if key_len == 0 {
        return String::from(plain_text);
    }

    let mut index = 0;

    plain_text
        .chars()
        .map(|c| {
            if c.is_ascii_alphabetic() {
                let first = if c.is_ascii_lowercase() { b'a' } else { b'A' };
                let shift = key.as_bytes()[index % key_len] - b'a';
                index += 1;
                // modulo the distance to keep character range
                (first + (c as u8 + shift - first) % 26) as char
            } else {
                c
            }
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn empty() {
        assert_eq!(vigenere("", "test"), "");
    }

    #[test]
    fn vigenere_base() {
        assert_eq!(
            vigenere("LoremIpsumDolorSitAmet", "base"),
            "MojinIhwvmVsmojWjtSqft"
        );
    }

    #[test]
    fn vigenere_with_spaces() {
        assert_eq!(
            vigenere(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                "spaces"
            ),
            "Ddrgq ahhuo hgddr uml sbev, ggfheexwljr chahxsemfy tlkx."
        );
    }

    #[test]
    fn vigenere_unicode_and_numbers() {
        assert_eq!(
            vigenere("1 Lorem ⏳ ipsum dolor sit amet Ѡ", "unicode"),
            "1 Fbzga ⏳ ltmhu fcosl fqv opin Ѡ"
        );
    }

    #[test]
    fn vigenere_unicode_key() {
        assert_eq!(
            vigenere("Lorem ipsum dolor sit amet", "😉 key!"),
            "Vspoq gzwsw hmvsp cmr kqcd"
        );
    }

    #[test]
    fn vigenere_empty_key() {
        assert_eq!(vigenere("Lorem ipsum", ""), "Lorem ipsum");
    }
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## XOR

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

```rust
pub fn xor_bytes(text: &[u8], key: u8) -> Vec<u8> {
    text.iter().map(|c| c ^ key).collect()
}

pub fn xor(text: &str, key: u8) -> Vec<u8> {
    xor_bytes(text.as_bytes(), key)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_simple() {
        let test_string = "test string";
        let ciphered_text = xor(test_string, 32);
        assert_eq!(test_string.as_bytes(), xor_bytes(&ciphered_text, 32));
    }

    #[test]
    fn test_every_alphabet_with_space() {
        let test_string = "The quick brown fox jumps over the lazy dog";
        let ciphered_text = xor(test_string, 64);
        assert_eq!(test_string.as_bytes(), xor_bytes(&ciphered_text, 64));
    }

    #[test]
    fn test_multi_byte() {
        let test_string = "日本語";
        let key = 42;
        let ciphered_text = xor(test_string, key);
        assert_eq!(test_string.as_bytes(), xor_bytes(&ciphered_text, key));
    }

    #[test]
    fn test_zero_byte() {
        let test_string = "The quick brown fox jumps over the lazy dog";
        let key = ' ' as u8;
        let ciphered_text = xor(test_string, key);
        assert_eq!(test_string.as_bytes(), xor_bytes(&ciphered_text, key));
    }

    #[test]
    fn test_invalid_byte() {
        let test_string = "The quick brown fox jumps over the lazy dog";
        let key = !0 as u8;
        let ciphered_text = xor(test_string, key);
        assert_eq!(test_string.as_bytes(), xor_bytes(&ciphered_text, key));
    }
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## Salsa20

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

```rust
/*
 * Salsa20 implementation based on https://en.wikipedia.org/wiki/Salsa20
 * Salsa20 is a stream cipher developed by Daniel J. Bernstein. To use it, the
 * `salsa20` function should be called with appropriate parameters and the
 * output of the function should be XORed with plain text.
 */

macro_rules! quarter_round {
    ($v1:expr,$v2:expr,$v3:expr,$v4:expr) => {
        $v2 ^= ($v1.wrapping_add($v4).rotate_left(7));
        $v3 ^= ($v2.wrapping_add($v1).rotate_left(9));
        $v4 ^= ($v3.wrapping_add($v2).rotate_left(13));
        $v1 ^= ($v4.wrapping_add($v3).rotate_left(18));
    };
}

/**
 * `salsa20` function takes as input an array of 16 32-bit integers (512 bits)
 * of which 128 bits is the constant 'expand 32-byte k', 256 bits is the key,
 * and 128 bits are nonce and counter. It is up to the user to determine how
 * many bits each of nonce and counter take, but a default of 64 bits each
 * seems to be a sane choice.
 *
 * The 16 input numbers can be thought of as the elements of a 4x4 matrix like
 * the one bellow, on which we do the main operations of the cipher.
 *
 * +----+----+----+----+
 * | 00 | 01 | 02 | 03 |
 * +----+----+----+----+
 * | 04 | 05 | 06 | 07 |
 * +----+----+----+----+
 * | 08 | 09 | 10 | 11 |
 * +----+----+----+----+
 * | 12 | 13 | 14 | 15 |
 * +----+----+----+----+
 *
 * As per the diagram bellow, input[0, 5, 10, 15] are the constants mentioned
 * above, input[1, 2, 3, 4, 11, 12, 13, 14] is filled with the key, and
 * input[6, 7, 8, 9] should be filled with nonce and counter values. The output
 * of the function is stored in `output` variable and can be XORed with the
 * plain text to produce the cipher text.
 *
 * +------+------+------+------+
 * |      |      |      |      |
 * | C[0] | key1 | key2 | key3 |
 * |      |      |      |      |
 * +------+------+------+------+
 * |      |      |      |      |
 * | key4 | C[1] | no1  | no2  |
 * |      |      |      |      |
 * +------+------+------+------+
 * |      |      |      |      |
 * | ctr1 | ctr2 | C[2] | key5 |
 * |      |      |      |      |
 * +------+------+------+------+
 * |      |      |      |      |
 * | key6 | key7 | key8 | C[3] |
 * |      |      |      |      |
 * +------+------+------+------+
*/
pub fn salsa20(input: &[u32; 16], output: &mut [u32; 16]) {
    output.copy_from_slice(&input[..]);
    for _ in 0..10 {
        // Odd round
        quarter_round!(output[0], output[4], output[8], output[12]); // column 1
        quarter_round!(output[5], output[9], output[13], output[1]); // column 2
        quarter_round!(output[10], output[14], output[2], output[6]); // column 3
        quarter_round!(output[15], output[3], output[7], output[11]); // column 4

        // Even round
        quarter_round!(output[0], output[1], output[2], output[3]); // row 1
        quarter_round!(output[5], output[6], output[7], output[4]); // row 2
        quarter_round!(output[10], output[11], output[8], output[9]); // row 3
        quarter_round!(output[15], output[12], output[13], output[14]); // row 4
    }
    for (a, &b) in output.iter_mut().zip(input.iter()) {
        *a = a.wrapping_add(b);
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::fmt::Write;

    const C: [u32; 4] = [0x65787061, 0x6e642033, 0x322d6279, 0x7465206b];

    fn output_hex(inp: &[u32; 16]) -> String {
        let mut res = String::new();
        res.reserve(512 / 4);
        for &x in inp {
            write!(&mut res, "{x:08x}").unwrap();
        }
        res
    }
    #[test]
    // test vector 1
    fn basic_tv1() {
        let mut inp = [0u32; 16];
        let mut out = [0u32; 16];
        inp[0] = C[0];
        inp[1] = 0x01020304; // 1, 2, 3, 4
        inp[2] = 0x05060708; // 5, 6, 7, 8, ...
        inp[3] = 0x090a0b0c;
        inp[4] = 0x0d0e0f10;
        inp[5] = C[1];
        inp[6] = 0x65666768; // 101, 102, 103, 104
        inp[7] = 0x696a6b6c; // 105, 106, 107, 108, ...
        inp[8] = 0x6d6e6f70;
        inp[9] = 0x71727374;
        inp[10] = C[2];
        inp[11] = 0xc9cacbcc; // 201, 202, 203, 204
        inp[12] = 0xcdcecfd0; // 205, 206, 207, 208, ...
        inp[13] = 0xd1d2d3d4;
        inp[14] = 0xd5d6d7d8;
        inp[15] = C[3];
        salsa20(&inp, &mut out);
        // Checked with wikipedia implementation, does not agree with
        // "https://cr.yp.to/snuffle/spec.pdf"
        assert_eq!(
            output_hex(&out),
            concat!(
                "de1d6f8d91dbf69d0db4b70c8b4320d236694432896d98b05aa7b76d5738ca13",
                "04e5a170c8e479af1542ed2f30f26ba57da20203cfe955c66f4cc7a06dd34359"
            )
        );
    }
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## HMAC

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

```rust
pub trait Hasher<const DIGEST_BYTES: usize> {
    /// return a new instance with default parameters
    fn new_default() -> Self;

    /// Add new data
    fn update(&mut self, data: &[u8]);

    /// Returns the hash of current data. If it is necessary does finalization
    /// work on the instance, thus it may no longer make sense to do `update`
    /// after calling this.
    fn get_hash(&mut self) -> [u8; DIGEST_BYTES];
}

/// HMAC based on RFC2104, applicable to many cryptographic hash functions
pub struct HMAC<const KEY_BYTES: usize, const DIGEST_BYTES: usize, H: Hasher<DIGEST_BYTES>> {
    pub inner_internal_state: H,
    pub outer_internal_state: H,
}

impl<const KEY_BYTES: usize, const DIGEST_BYTES: usize, H: Hasher<DIGEST_BYTES>>
    HMAC<KEY_BYTES, DIGEST_BYTES, H>
{
    pub fn new_default() -> Self {
        HMAC {
            inner_internal_state: H::new_default(),
            outer_internal_state: H::new_default(),
        }
    }

    /// Note that `key` must be no longer than `KEY_BYTES`. According to RFC,
    /// if it is so, you should replace it with its hash. We do not do this
    /// automatically due to fear of `DIGEST_BYTES` not being the same as
    /// `KEY_BYTES` or even being longer than it
    pub fn add_key(&mut self, key: &[u8]) -> Result<(), &'static str> {
        match key.len().cmp(&KEY_BYTES) {
            std::cmp::Ordering::Less | std::cmp::Ordering::Equal => {
                let mut tmp_key = [0u8; KEY_BYTES];
                for (d, s) in tmp_key.iter_mut().zip(key.iter()) {
                    *d = *s;
                }
                // key ^ 0x363636.. should be used as inner key
                for b in tmp_key.iter_mut() {
                    *b ^= 0x36;
                }
                self.inner_internal_state.update(&tmp_key);
                // key ^ 0x5c5c5c.. should be used as outer key, but the key is
                // already XORed with 0x363636.. , so it must now be XORed with
                // 0x6a6a6a..
                for b in tmp_key.iter_mut() {
                    *b ^= 0x6a;
                }
                self.outer_internal_state.update(&tmp_key);
                Ok(())
            }
            _ => Err("Key is longer than `KEY_BYTES`."),
        }
    }

    pub fn update(&mut self, data: &[u8]) {
        self.inner_internal_state.update(data);
    }

    pub fn finalize(&mut self) -> [u8; DIGEST_BYTES] {
        self.outer_internal_state
            .update(&self.inner_internal_state.get_hash());
        self.outer_internal_state.get_hash()
    }
}

#[cfg(test)]
mod tests {
    use super::super::sha256::tests::get_hash_string;
    use super::super::SHA256;
    use super::HMAC;

    #[test]
    fn sha256_basic() {
        // To test this, use the following command on linux:
        // echo -n "Hello World" | openssl sha256 -hex -mac HMAC -macopt hexkey:"deadbeef"
        let mut hmac: HMAC<64, 32, SHA256> = HMAC::new_default();
        hmac.add_key(&[0xde, 0xad, 0xbe, 0xef]).unwrap();
        hmac.update(&b"Hello World".to_vec());
        let hash = hmac.finalize();
        assert_eq!(
            get_hash_string(&hash),
            "f585fc4536e8e7f378437465b65b6c2eb79036409b18a7d28b6d4c46d3a156f8"
        );
    }
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

## Rot13

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

```rust
pub fn rot13(text: &str) -> String {
    let to_enc = text.to_uppercase();
    to_enc
        .chars()
        .map(|c| match c {
            'A'..='M' => ((c as u8) + 13) as char,
            'N'..='Z' => ((c as u8) - 13) as char,
            _ => c,
        })
        .collect()
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn test_single_letter() {
        assert_eq!("N", rot13("A"));
    }

    #[test]
    fn test_bunch_of_letters() {
        assert_eq!("NOP", rot13("ABC"));
    }

    #[test]
    fn test_non_ascii() {
        assert_eq!("😀NO", rot13("😀AB"));
    }

    #[test]
    fn test_twice() {
        assert_eq!("ABCD", rot13(&rot13("ABCD")));
    }
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

```rust
pub fn another_rot13(text: &str) -> String {
    let input = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    let output = "NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm";
    text.chars()
        .map(|c| match input.find(c) {
            Some(i) => output.chars().nth(i).unwrap(),
            None => c,
        })
        .collect()
}

#[cfg(test)]
mod tests {
    // Note this useful idiom: importing names from outer (for mod tests) scope.
    use super::*;

    #[test]
    fn test_simple() {
        assert_eq!(another_rot13("ABCzyx"), "NOPmlk");
    }

    #[test]
    fn test_every_alphabet_with_space() {
        assert_eq!(
            another_rot13("The quick brown fox jumps over the lazy dog"),
            "Gur dhvpx oebja sbk whzcf bire gur ynml qbt"
        );
    }

    #[test]
    fn test_non_alphabet() {
        assert_eq!(another_rot13("🎃 Jack-o'-lantern"), "🎃 Wnpx-b'-ynagrea");
    }
}
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....
