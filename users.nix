{ config, pkgs, ... }:

{
  programs.fish.enable = true;
  users.mutableUsers = false;
  users.users.root.hashedPassword = "$6$eBqRRr/VdidVdyze$FsyrZOvU6MLyW/LHUGs8.OfYkhC.YnPg85XXFi4L348ANfGebDU6jHGbUTC3XHd55KYtyXoD3ePuNcHQ2nqA81";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jon = {
    isNormalUser = true;
    home = "/home/jon";
    extraGroups = [ "wheel" "video" "video" "networkmanager"];# "lp" "scanner" ];
    hashedPassword = "$6$65hsLISHekZVm179$hLTgH1gJ3YoNQAVjh1f6xpvRVYdP3wFKu8WDEKCwIRSrikMyjnalSTgCao9TDvOWjQ6.kRdZp9IsCxMWlDEv81";
    createHome = true;
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCiERvtF7QE84C0K4nW7/XazFvLZCvPOutz4aqEzkp+H9AFVqCVVGFVOmVGmSSaMWXgp3XxcYCIbZGDYeq3g17joE0uUzixhp+ouBfAGag9f7AMU3CiG2iFASqsRiaJY+TsPaGLIFh3iai/UmRWmiD22mJKU7buVNf2LjUoOWASjJHkvMqmbpQV7vAklzGs1honFMxyWijPwjnu+cf/WxxN7rk4eLHaH2rztbp0yIbhHeJ1WjlXXQ8GxKDL7TrILTl5cFVD9vHr65hvVJqLAjZqfe3k5r3NjWRwSMnil6st26N3xDdF0Ij1J5vuqo6F+elPlNF9sBdTy+9U48MfRHDIOkmhJFVxZUd+AoRfXNFeGttQWdKFK7L4SC2nAKI7jm87W6Q5BU2pnIb3IciGqqI16iWMKR6IW59FzEve+BYPu2uVWLYNFhEHD7GhvqFxmRmL0n0dNcPbgdrcGSVHn6NDDDMECDh53z2ao5QKYlqksnm8MCpB67iBCxSvxEMRDfM= jon@jupiter" ];
  };

}
