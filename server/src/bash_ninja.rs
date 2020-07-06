use std::process::{Command};
//--- bash_ninja should handle all linux commands ---//

//Execute command
pub fn execute(exe: &str){
    let _result = Command::new(exe).spawn().unwrap().wait();
}

//Execute command with an argument
pub fn execute_arg(exe: &str, arg: &str){
    let _result = Command::new(exe).arg(arg).spawn().unwrap().wait();
}

//Execute a bash script 
pub fn run_script(path: std::string::String) -> std::process::Child {
    println!("Run script with Path: {}",path);
    let _result = Command::new("bash").arg(path).spawn().unwrap();
    
    return _result;
}

