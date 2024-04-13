{ inputs, pkgs, ...}: {

  environment.systemPackages = with pkgs; [
     spotify
     qemu
     kitty
     wofi
     virt-manager
     virglrenderer
     adw-gtk3
     pyprland
     ranger
     atool
     unzip
     wl-clipboard
     alacritty
     rofi-wayland
     pavucontrol
     waybar
     hyprpaper
     pasystray
     pkgs.polkit_gnome
     swayidle
     swaylock-effects
     qt6Packages.qtstyleplugin-kvantum
     libsForQt5.qtstyleplugin-kvantum
     pkgs.libsForQt5.qt5.qtwayland
     qt6Packages.qt6ct
     pkgs.qt6.qtwayland
     pkgs.libsForQt5.qt5ct
     xdg-utils
     inputs.nix-software-center.packages.${system}.nix-software-center
     brave
     stremio
     pkgs.distrobox 
     pkgs.lutris
     pkgs.wineWowPackages.full
     pkgs.gamescope
     pkgs.mangohud  
     protonup-qt
     pkgs.steamtinkerlaunch
     micro
     pkgs.qbittorrent
     gnome-text-editor
     ];
 
  fonts.packages = with pkgs; [
     roboto
     font-awesome
     nerdfonts
     jetbrains-mono
     ];  
}
