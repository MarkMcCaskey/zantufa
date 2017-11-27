extern crate pest;
#[macro_use]
extern crate pest_derive;

use pest::Parser;

#[cfg(debug_assertions)]
const _GRAMMAR: &'static str = include_str!("zantufa-1.2.pest"); 

#[derive(Parser)]
#[grammar = "zantufa-1.2.pest"] 
struct Zantufa;

fn main() {
    let mut program = ".i mi nelci do".to_string();
    let output = Zantufa::parse_str(Rule::text, &mut program);

    println!("{:?}", output)
}
