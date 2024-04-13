{ inputs, pkgs, ...}: {


programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };
  
  environment.systemPackages = with pkgs; [
     atool
     neovim
     ranger
     unzip
     qemu
     virt-manager
     virglrenderer
     gvfs
     python311
     python311Packages.pynvim
     inputs.nix-software-center.packages.${system}.nix-software-center
     brave
     wofi
     wl-clipboard
     alacritty
     rofi-wayland
     xdg-desktop-portal-hyprland
     xdg-desktop-portal-gtk
     xdg-utils
     stremio
     pavucontrol
     python3
     python3Packages.pipx
     waybar
     hyprpaper
     pkgs.distrobox 
     pkgs.polkit_gnome
     hypridle
     hyprlock
     pkgs.libsForQt5.qt5ct
     heroic
     pkgs.libsForQt5.qt5.qtwayland
     pkgs.qt6.qtwayland
     pkgs.steam
     pkgs.bottles
     pkgs.lutris
     pkgs.wineWowPackages.full
     pkgs.gamescope
     pkgs.mangohud  
     protonup-qt
     pkgs.steamtinkerlaunch
     pkgs.blueman
     micro
     pkgs.qbittorrent
     pkgs.libsForQt5.qtstyleplugin-kvantum
     pkgs.qt6Packages.qtstyleplugin-kvantum
    mako
    discord
     ];
 
  fonts.packages = with pkgs; [
     roboto
     font-awesome
     nerdfonts
     jetbrains-mono
   ];
   
}
