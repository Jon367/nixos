{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{   
  
  imports = [
    (import "${home-manager}/nixos")
  ];

#  nixpkgs.config.allowUnfree = true;
  home-manager.users.root = { pkgs, ... }: {
    home = {
#      packages = with pkgs; [
#
 #     ];
      stateVersion = "22.05";      
      sessionVariables = { EDITOR = "neovim"; };   
    };

    programs = {
      git = {
        enable = true;
        userName = "Jonathan";
        userEmail = "joeclementine@protonmail.com";
      };

      neovim = {
        enable = true;
        viAlias = true;
      };
    };  
    xdg.configFile."nvim/init.vim".source = ./nvim/init.vim;

  };
}
