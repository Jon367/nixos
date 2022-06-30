
{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "colemak";
    xkbOptions = "caps:escape";
    displayManager.startx.enable = true;
    windowManager.dwm.enable = true;

  };

}
