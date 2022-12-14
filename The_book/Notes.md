# The Book
&nbsp;
## Compiling
***
 - compiling : `rustc name.rs` then `./name`.
 -  cargo :
    - new project : `cargo new name`
    - building : `cargo build`
    - running : `cargo run`
    - adding dependancies : write `rand = "0.8.3"` in Cargo.toml (instead of ```extern crate rand;
use rand::Rng; ``` in the .rs)
    - updating dependancies : `cargo update`
    - documentation : `cargo doc --open`

&nbsp;
## Basics (I/O, rand and match)
***

- read line :
```rust
let mut guess = String::new();
io::stdin()
    .read_line(&mut guess)
    .expect("Failed to read line")
```

- generate random number : 
```rust
let secret_number = rand::thread_rng().gen_range(1..=100);
```

- match :
```rust
match guess.cmp(&secret_number) {
    Ordering::Less => println!("Too small!"),
    Ordering::Greater => println!("Too big!"),
    Ordering::Equal => {
            println!("You win!");
            break;  //breaks the loop it's in
            }
}
```

&nbsp;
## Common Concepts
***

#### Variables and Mutability

`let` is immutable (meaning that `let x= 5; x=6;` returns an error).

mutable : `let mut`.

constant : `const NAME: u32 = 3.14;`

shadowing : declaring a new variable with the same name as the previous one.
```rust
let x = 5;

let x = x + 1;  //x = 6

{
    let x = x * 2; // x =  12 inside this scope
}
// x = 6
```
Effectivly, it creates a new variable each time (that may be local and therefore overwrites the global one ONLY INSIDE its scope ; it can also have a different type).

&nbsp;
#### Data Types
https://doc.rust-lang.org/book/ch03-02-data-types.html