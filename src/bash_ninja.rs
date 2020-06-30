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
pub fn run_script(path: &str){
    let _result = Command::new("bash").arg(path).spawn().unwrap().wait();
}

