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
    waybar-mpris
    kanshi
    wl-clipboard
    fzf
    ripgrep
    gnumake
    fd
    lua-language-server
    stylua
    swaylock
    swayidle
    gcc
    tree-sitter
    google-cloud-sdk
    kubectl
    k9s

    # nix
    nil
    nixpkgs-fmt

    # signal
    signal-cli
    signal-desktop
  ];

  xdg.configFile."kanshi" = {
    source = config.lib.file.mkOutOfStoreSymlink ./config/kanshi;
    recursive = true;
  };

  xdg.configFile."waybar" = {
    source = config.lib.file.mkOutOfStoreSymlink ./config/waybar;
    recursive = true;
  };

  xdg.configFile."sway" = {
    source = config.lib.file.mkOutOfStoreSymlink ./config/sway;
    recursive = true;
  };

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
      background-opacity = "0.90";
      theme = "Tomorrow Night Bright";
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

  services.kanshi = {
    enable = true;
  };

  # programs.firefox.preferences = {
  #   "media.ffmpeg.vaapi.enabled" = true;
  #   "media.hardware-video-decoding.force-enabled" = true;
  #   "gfx.x11-egl.force-enabled" = true;
  #   "widget.dmabuf.force-enabled" = true;
  # };
}
