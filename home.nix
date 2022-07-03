{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{   
  
  imports = [
    (import "${home-manager}/nixos")
  ];

  programs.fish.enable = true;
  nixpkgs.config.allowUnfree = true;
  home-manager.users.jon = { pkgs, ... }: {
    home = {
      packages = with pkgs; [
        librewolf
        spotify
      ];
      stateVersion = "22.05";      
      sessionVariables = { EDITOR = "neovim"; };   
    };

    programs = {
      git = {
        enable = true;
        userName = "Jonathan";
        userEmail = "joeclementine@protonmail.com";
      };

      fish = {
        enable = true;
        shellAliases = {
          rm = "rm -i";
          cp = "cp -i";
          mv = "mv -i";
          mkdir = "mkdir -p";
        };
        shellAbbrs = {
          g = "git";
          m = "make";
          n = "nvim";
          o = "open";
          p = "python3";
        };
        functions = {
          fish_greeting = {
            description = "Greeting to show when starting a fish shell";
            body = "";
          };
          mkdcd = {
            description = "Make a directory tree and enter it";
            body = "mkdir -p $argv[1]; and cd $argv[1]";
          };
        };
      };

      neovim = {
        enable = true;
        viAlias = true;
      };
    };  
    xdg.configFile."nvim/init.vim".source = ./nvim/init.vim;

  };
}
