{ config, pkgs, ... }:

{
  home.username = "p";
  home.homeDirectory = "/home/p";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    antigen
    ghostty
    nerd-fonts.monoid
    waybar
  ];

  programs.zsh = {
    enable = true;
    initContent = ''
      source ${pkgs.antigen}/share/antigen/antigen.zsh

      antigen use oh-my-zsh
      antigen bundle git
      antigen bundle zsh-users/zsh-completions
      antigen bundle zsh-users/zsh-autosuggestions
      antigen bundle zsh-users/zsh-syntax-highlighting

      antigen apply
    '';
  };

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      font-family = "Monoid Nerd Font Mono";
      shell-integration = "zsh";
    };
  };

  programs.waybar = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Prudhvi Krishna Surapaneni";
    userEmail = "p@nullptr.in";
  };
}
