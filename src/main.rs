mod bash_ninja;

    //1. Turn on TV 
    //2. Start Kodi
    //3. Swap to HDMI1 (FreeView TV)

fn main() {
    let _on = bash_ninja::run_script("scripts/tv_on.sh");
    let _kodi = bash_ninja::run_script("scripts/start_kodi.sh");
    let _swap = bash_ninja::run_script("scripts/tv_swap.sh");
}
