//mod bash_ninja;

    //1. Turn on TV 
    //2. Start Kodi
    //3. Swap to HDMI1 (FreeView TV)


#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] extern crate rocket;
mod bash_ninja;

#[get("/on")]
fn on() -> &'static str {
    let current_dir = std::env::current_dir().expect("Error");
    let base_path = current_dir.display();
    let _on = bash_ninja::run_script(format!("{}/src/scripts/tv_on.sh", base_path));
    "Hello, world!"
}

#[get("/kodi")]
fn kodi() -> &'static str {
    let current_dir = std::env::current_dir().expect("Error");
    let base_path = current_dir.display();
    let _kodi = bash_ninja::run_script(format!("{}/src/scripts/start_kodi.sh", base_path));
    "Hello, world!"
}

#[get("/swap")]
fn swap() -> &'static str {
    let current_dir = std::env::current_dir().expect("Error");
    let base_path = current_dir.display();
    let _swap = bash_ninja::run_script(format!("{}/src/scripts/tv_swap.sh", base_path));
    "Hello, world!"
}


fn main() {
    rocket::ignite().mount("/", routes![on,kodi,swap]).launch();
}

// fn main() {
//     let base_path = "/home/pi/src/rusty_pi/src/";
//     let _on = bash_ninja::run_script(format!("{}scripts/tv_on.sh", base_path));
//     let _kodi = bash_ninja::run_script(format!("{}scripts/start_kodi.sh", base_path));
//     let _swap = bash_ninja::run_script(format!("{}scripts/tv_swap.sh", base_path));
// }
