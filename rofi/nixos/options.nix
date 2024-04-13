{ pkgs, config, ...}:{
   #XDG & Hypr
   nix.settings.experimental-features = [ "nix-command" "flakes" ];
   xdg.portal.enable = true;
   programs.hyprland.portalPackage = pkgs.xdg-desktop-portal-hyprland;
   programs.hyprland.xwayland.enable = true;
   xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
   
   services.flatpak.enable = true; 
   
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
   #Tweaks
   services.tlp = {
      enable = true;
      settings = {
         SOUND_POWER_SAVE_ON_AC = 0;
         SOUND_POWER_SAVE_ON_BAT = 0;
        
         DISK_IOSCHED = "mq-deadline mq-deadline";
         SATA_LINKPWR_ON_AC = "max_performance";
        
         RADEON_DPM_PERF_LEVEL_ON_AC = "high";
         RADEON_DPM_PERF_LEVEL_ON_BAT = "auto";
         RADEON_DPM_STATE_ON_AC = "performance";
         RADEON_DPM_STATE_ON_BAT = "battery";
   
        
         PLATFORM_PROFILE_ON_AC = "performance";
         PLATFORM_PROFILE_ON_BAT= "low-power";
        
         CPU_DRIVER_OPMODE_ON_AC = "active";
         CPU_DRIVER_OPMODE_ON_BAT= "active";
         CPU_SCALING_GOVERNOR_ON_AC = "performance";
         CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
         CPU_BOOST_ON_AC = 1;
         CPU_BOOST_ON_BAT = 1;
         CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
         CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
       };
 };

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
   };

   # Virtualization
   virtualisation.libvirtd.enable = true;
   programs.virt-manager.enable = true;
   users.users.thomas.extraGroups = [ "libvirtd" "video"];

 
   virtualisation.podman.enable = true;
   nix.settings.auto-optimise-store = true;
   nix.gc = {
    automatic = true;
    dates = "weekly";
  };
}
