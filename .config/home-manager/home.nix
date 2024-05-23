{ config, pkgs, ... }:

{
  home.username = "naim";
  home.homeDirectory = "/home/naim";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.packages = with pkgs; [
    fortune
    cowsay
    wpsoffice
    #jetbrains.clion
    # flatpak
    #skypeforlinux # won't work other than NixOS
  ];

  programs.git = {
    enable = true;
    userName = "Julkar Naim";
    userEmail = "julkar.naim@abbvie.com";
  };

  nixpkgs.config.allowUnfree = true;


  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
