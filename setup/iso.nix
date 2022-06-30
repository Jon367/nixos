# iso.nix
{ config, pkgs, ... }:
{

  imports = [

    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>

  ];

  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
    python
    nano
    git
    parted
    nix-prefetch-scripts
  ];

  # Enable SSH in the boot process.
  systemd.services.sshd.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCiERvtF7QE84C0K4nW7/XazFvLZCvPOutz4aqEzkp+H9AFVqCVVGFVOmVGmSSaMWXgp3XxcYCIbZGDYeq3g17joE0uUzixhp+ouBfAGag9f7AMU3CiG2iFASqsRiaJY+TsPaGLIFh3iai/UmRWmiD22mJKU7buVNf2LjUoOWASjJHkvMqmbpQV7vAklzGs1honFMxyWijPwjnu+cf/WxxN7rk4eLHaH2rztbp0yIbhHeJ1WjlXXQ8GxKDL7TrILTl5cFVD9vHr65hvVJqLAjZqfe3k5r3NjWRwSMnil6st26N3xDdF0Ij1J5vuqo6F+elPlNF9sBdTy+9U48MfRHDIOkmhJFVxZUd+AoRfXNFeGttQWdKFK7L4SC2nAKI7jm87W6Q5BU2pnIb3IciGqqI16iWMKR6IW59FzEve+BYPu2uVWLYNFhEHD7GhvqFxmRmL0n0dNcPbgdrcGSVHn6NDDDMECDh53z2ao5QKYlqksnm8MCpB67iBCxSvxEMRDfM= jon@jupiter"
    ];

}
