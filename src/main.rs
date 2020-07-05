mod bash_ninja;

    //1. Turn on TV 
    //2. Start Kodi
    //3. Swap to HDMI1 (FreeView TV)


// #![feature(proc_macro_hygiene, decl_macro)]

// #[macro_use] extern crate rocket;
// mod bash_ninja;

// #[get("/on")]
// fn on() -> &'static str {
//     let _on = bash_ninja::run_script("scripts/tv_on.sh");
//     "Hello, world!"
// }

// #[get("/kodi")]
// fn kodi() -> &'static str {

//     let _kodi = bash_ninja::run_script("scripts/start_kodi.sh");
//     "Hello, world!"
// }

// #[get("/swap")]
// fn swap() -> &'static str {

//     let _swap = bash_ninja::run_script("scripts/tv_swap.sh");
//     "Hello, world!"
// }


// fn main() {
//     rocket::ignite().mount("/", routes![on,kodi,swap]).launch();
// }

fn main() {
    let base_path = "/home/pi/src/Rusty_Pi/src/";
    let _on = bash_ninja::run_script(format!("{}scripts/tv_on.sh", base_path));
    let _kodi = bash_ninja::run_script(format!("{}scripts/start_kodi.sh", base_path));
    let _swap = bash_ninja::run_script(format!("{}scripts/tv_swap.sh", base_path));
}
