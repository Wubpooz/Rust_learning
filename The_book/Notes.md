# The Book
&nbsp;
## 1. Compiling
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
## 2. Basics (I/O, rand and match)
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
## 3. Common Concepts
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

Type annotation : 
```rust
let i:u8 = 42;
```

Scalar types : represents a single value (int, float, bool, char).  

• Integer : 
| Length | Signed | Unsigned |
|--------|--------|----------|
| 8-bit | `i8`|`u8`|
| 16-bit| `i16`|`u16`|
| 32-bit| `i32`|`u32`|
|64-bit|`i64`|`u64`|
|128-bit|`i128`|`u128`|
Signed are stored using 2's complement (so from $- 2^{n-1}$ to $2^{n-1}-1$).

You can write decimal as `19_000` and byte (`u8`) as `b'A'`.


• Float : 
Either `f32`or `f64` (default is the second).

• Char & Boolean : as in C.


&nbsp;
Compound types : group multiple values.

• Tuple : 
fixed length, multiple types
```rust
let tup: (i32,f64,u8) = (500, 6.4,1);
let (x,y,z) = tup;
```
The second line is used to recover the components. Alternatively you can use `tup.i`, where `i` is the indice.

The empty tuple `()` is the `unit` type, the empty one.

&nbsp;
• Array :
fixed length, single type
```rust
let a : [i32;5] = [1,2,3,4,5];
```
The first parameter is the type, the second the length ( also use to initalize).
Accessing is the usual `a[i]`.

&nbsp; 
#### Functions

Delcaration :
```rust
fn fct_name(var:i32) -> i32 /*return type*/ { expr;}
```


Rust supports functionnal patterns such as : 
```rust
let x = {let y=3; y+1}   // x=4

fn plus_one(x:i32) -> i32 {
    x+1;
}
```
It returns the last value in scope or the value in a `return`.

&nbsp;
#### Flow statements

Flow statements don't require parenthesis.

for each : `for el in a {}`.



&nbsp;
## 4. Ownership
***

Stack is LIFO, used to store fixed,known -size data.  
Heap is unorganized so pointer based (that can be in the heap).
Stack is faster both in and out.  
Functions called (with variables etc) are on the stack.  

&nbsp;
Ownership Rules :
- each value has an owner.
- one owner at a time.
- when owner is out of scope, the value is dropped.

