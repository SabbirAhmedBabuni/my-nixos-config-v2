{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };

      directory = {
        truncation_length = 3;
        style = "bold cyan";
      };

      git_branch = {
        symbol = " ";
        style = "bold purple";
      };

      username = {
        show_always = false;
        style_user = "bold blue";
      };

      hostname = {
        ssh_only = true;
      };

      cmd_duration = {
        min_time = 2000;
        format = "took [$duration]($style) ";
        style = "bold yellow";
      };

      nix_shell = {
        symbol = "❄️ ";
        format = "via [$symbol$state]($style) ";
        style = "bold blue";
      };
    };
  };
}
