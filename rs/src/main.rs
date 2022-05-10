#![windows_subsystem = "windows"]

use std::process::{Command, Stdio};
use std::{env};
use std::io;

#[allow(non_snake_case)]
fn main() -> Result<(), io::Error> {
    println!("Starting game...");
    let args: Vec<String> = env::args().collect(); // collect args given to the program
    let mut cmd = Command::new("./love/lovec.exe");
    cmd.arg("./");
    // check if "--dev" is in the arguments
    if args.contains(&"--dev".to_string()) { cmd.arg("--console"); } else { cmd.arg("--release"); };
    cmd.stdout(Stdio::inherit()).stdin(Stdio::inherit()).stderr(Stdio::inherit()); // link shell output to game output
    let mut res = cmd.spawn().unwrap(); // spawn program
    // wait for the game to finish
    res.wait().unwrap(); 
    Ok(())
}
