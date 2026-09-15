{ ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "eza -la --icons";
      gs = "git status";
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#nixosshabbir";
    };
    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      share = true;
    };
  };
}
