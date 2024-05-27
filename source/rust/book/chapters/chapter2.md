# Programming a Guessing Game
"Programming a Guessing Game" is a common introductory project used to teach programming concepts, and it's often used as a starting point for learning Rust. Here's a basic breakdown:

## The Objective
The objective of the guessing game is for the computer to generate a random number within a specified range and challenge the player to guess that number. The player keeps guessing until they correctly guess the number. After each guess, the computer provides feedback to the player, informing them whether their guess was too high, too low, or correct.

## Steps to Implement the Game
1. **Generate a Random Number**: The game starts by generating a random number within a specified range. In Rust, you can use the `rand` crate to generate random numbers.

2. **Prompt the Player for Input**: The game prompts the player to input their guess.

3. **Read and Validate Input**: Read the player's input and validate it to ensure it's a valid number within the specified range.

4. **Compare the Guess with the Target Number**: Compare the player's guess with the target number.

5. **Provide Feedback**: If the guess is incorrect, provide feedback to the player, telling them whether their guess was too high or too low.

6. **Repeat Until Correct Guess**: Repeat steps 2-5 until the player correctly guesses the number.

7. **End Game**: Once the player guesses the correct number, end the game and display a congratulatory message.

## Implementing in Rust
Here's a simplified version of how you might implement this game in Rust:

```rust
use rand::Rng;
use std::io;
use std::cmp::Ordering;

fn main() {
    println!("Guess the number!");

    let secret_number = rand::thread_rng().gen_range(1..101);

    loop {
        println!("Please input your guess.");

        let mut guess = String::new();

        io::stdin()
            .read_line(&mut guess)
            .expect("Failed to read line");

        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        println!("You guessed: {}", guess);

        match guess.cmp(&secret_number) {
            Ordering::Less => println!("Too small!"),
            Ordering::Greater => println!("Too big!"),
            Ordering::Equal => {
                println!("You win!");
                break;
            }
        }
    }
}
```

### Explanation
- We import necessary crates (`rand` for random number generation) and modules (`io` for input/output, `cmp` for comparison).
- We generate a random number between 1 and 100 using `rand::thread_rng().gen_range(1..101)`.
- We enter a loop where the player can make guesses until they guess the correct number.
- Inside the loop, we read the player's input, parse it into an integer, and compare it with the secret number.
- Based on the comparison, we provide feedback to the player, telling them if their guess was too small, too big, or correct.
- If the guess is correct, we break out of the loop and end the game with a congratulatory message.
