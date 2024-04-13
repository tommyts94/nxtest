{ pkgs, config, ...}:{

   # Variables

   environment.sessionVariables = {
   	QT_QPA_PLATFORMTHEME = "qt5ct";
   	CLUTTER_BACKEND = "wayland";
   	WLR_RENDERER = "vulkan";
    XDG_CURRENT_DESKTOP = "Hyprland";
   	XDG_SESSION_DESKTOP = "Hyprland";
   	XDG_SESSION_TYPE = "wayland";
   	EDITOR = "micro";
   	TERMINAL = "alacritty";
   };
   #XDG
   
   xdg.portal.enable = true;
   xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

   services.flatpak.enable = true; 
   
   # Graphics and gaming
   programs.steam.enable = true;
   virtualisation.waydroid.enable = true;
   hardware.opengl.enable = true;
   hardware.opengl.driSupport32Bit = true;  
   hardware.opengl.driSupport = true;
   hardware.opengl.extraPackages = with pkgs; [vulkan-loader libva vaapiVdpau libdrm];
   hardware.opengl.extraPackages32 = with pkgs; [vulkan-loader libva vaapiVdpau libdrm];
   #chaotic.mesa-git.enable = true;
   #chaotic.mesa-git.extraPackages = with pkgs; [ mesa_git vulkan-loader libva vaapiVdpau libdrm];
   #chaotic.mesa-git.extraPackages32 = with pkgs.pkgsi686Linux; [mesa32_git vulkan-loader libva vaapiVdpau libdrm];
   #chaotic.mesa-git.fallbackSpecialisation = true;
   # Misc
   zramSwap.enable = true;
   hardware.cpu.amd.updateMicrocode = true;
   programs.bash.shellAliases = {
   nx = "sudo nano /etc/nixos/configuration.nix";
   rb = "sudo nixos-rebuild switch --impure";
   clean = "sudo nix-collect-garbage -d";
   hp = "nano ~/.config/hypr/hyprland.conf";
   };

   # Virtualization
   virtualisation.libvirtd.enable = true;
   programs.dconf.enable = true; # virt-manager requires dconf to remember settings
   users.users.thomas.extraGroups = [ "libvirtd" ];

   #Polkit
   systemd = {
     user.services.polkit-gnome-authentication-agent-1 = {
       description = "polkit-gnome-authentication-agent-1";
       wantedBy = [ "graphical-session.target" ];
       wants = [ "graphical-session.target" ];
       after = [ "graphical-session.target" ];
       serviceConfig = {
           Type = "simple";
           ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
           Restart = "on-failure";
           RestartSec = 1;
           TimeoutStopSec = 10;
         };
  };
};

   # Swaylock
   security.pam.services.swaylock = {
       text = ''
         auth include login
       '';
     };
   virtualisation.podman.enable = true;
   nix.settings.auto-optimise-store = true;
   nix.gc = {
    automatic = true;
    dates = "weekly";
  };
services.gvfs.enable = true;
xdg.mime.enable = true;
xdg.mime.defaultApplications = {
	"inode/directory" = "ranger.desktop";
	"application/zip" = "ranger.desktop";
};


}
