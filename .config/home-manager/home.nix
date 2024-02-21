{ config, pkgs, ... }:

{
  home.username = "naim";
  home.homeDirectory = "/home/naim";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.packages = [
      pkgs.fortune
  ];

  programs.git = {
    enable = true;
    userName = "Julkar Naim";
    userEmail = "julkar.naim@abbvie.com";
  };


  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
