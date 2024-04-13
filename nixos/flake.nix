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


outputs = { self, nixpkgs, chaotic, hyprland, ...}@inputs: {
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

  nixConfig = {
    extra-substituters = ["https://hyprland.cachix.org"];
    extra-trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
}

