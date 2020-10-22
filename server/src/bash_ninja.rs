use std::process::{Command};
//Execute a bash script 
pub fn run_script(path: std::string::String) -> Result<std::process::Child, Box<dyn std::error::Error>> {
    println!("Run script with Path: {}",path);
    let _result = Command::new("bash").arg(path).spawn()?;

    Ok(_result)
}

