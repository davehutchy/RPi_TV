use std::process::{Command};
//Execute a bash script 
pub fn run_script(path: std::string::String) -> std::process::Child {
    println!("Run script with Path: {}",path);
    let _result = Command::new("bash").arg(path).spawn().unwrap();

    return _result;
}

