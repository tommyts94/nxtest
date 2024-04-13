{
  description = "Thomas's system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    nix-software-center.url = "github:vlinkz/nix-software-center"; 
    #xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";
   };


outputs = inputs@{ nixpkgs, chaotic, hyprland, ...}: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
       specialArgs = { inherit inputs hyprland; };
       modules = [
        /etc/nixos/configuration.nix
         hyprland.nixosModules.default
         {programs.hyprland.enable = true;}
         chaotic.nixosModules.default
      ];
    };
  };


}

