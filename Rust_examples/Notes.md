# Rust by Examples
&nbsp;
## Basics
***

#### Comments : 
// or /* */ for regular or ///, //! for documentation.

&nbsp;
#### Print : 
```format!``` : write to string.
```printl!/println!``` : same but print to console.  ```eprint!/eprintln!``` : same but to standard error.  

examples ([code](./0-printing/helloworld.rs)) : 
```rust
    println!("{} days", 31);
    println!("{0}, this is {1}. {1}, this is {0}", "Alice", "Bob");
    println!("{subject} {verb} {object}",
            object="the lazy dog",
            subject="the quick brown fox",
            verb="jumps over");
    println!("Base 10:               {}",   69420); //69420
    println!("Base 2 (binary):       {:b}", 69420); //10000111100101100
    println!("Base 8 (octal):        {:o}", 69420); //207454
    println!("Base 16 (hexadecimal): {:x}", 69420); //10f2c
    println!("Base 16 (hexadecimal): {:X}", 69420); //10F2C
    println!("{number:>5}", number=1); //whitespaces before
    println!("{number:0<5}", number=1); //0s after
    println!("{pi:.3}"); //round pi to the 3th digit
```
From [std::fmt](https://doc.rust-lang.org/std/fmt/), { } uses `fmt::Display` while { :?} uses `fmt::Debug`.

&nbsp;
#### Debug : 
While `fmt::Display` must be implemented by hand, `fmt::Debug` can be derived for every type.
To do so write : `#[derive(Debug)]` before the struct def.
The tradeoff is that it sacrifices elegance.

##### Display : 
As said, `fmt::Display` need to be implemented for new types (and generic containers due to ambiguity of how to display for different elements).

