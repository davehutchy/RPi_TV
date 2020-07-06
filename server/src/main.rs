//mod bash_ninja;

    //1. Turn on TV 
    //2. Start Kodi
    //3. Swap to HDMI1 (FreeView TV)


#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] extern crate rocket;
mod bash_ninja;

#[get("/kodi")]
fn kodi() -> &'static str {
    let current_dir = std::env::current_dir().expect("Error");
    let base_path = current_dir.display();
    let _kodi = bash_ninja::run_script(format!("{}/src/scripts/start_kodi.sh", base_path)).wait();
    swap_hdmi()
}
fn swap_hdmi() -> &'static str{
    let current_dir = std::env::current_dir().expect("Error");
    let base_path = current_dir.display();
    let _swap = bash_ninja::run_script(format!("{}/src/scripts/tv_swap.sh", base_path));
    "Kodi Exited Swapping to HDMI1"
}

fn main() {
    rocket::ignite().mount("/", routes![kodi]).launch();
}
