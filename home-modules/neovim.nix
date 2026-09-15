{ pkgs, ... }:
{
  # Install Neovim only as a package, without using programs.neovim.
  # This prevents Home Manager from managing ~/.config/nvim/,
  # leaving the entire Neovim configuration under your control.

  home.packages = with pkgs; [
    neovim

    # --- Global LSPs ---
    # Kept global (not per-project) because they're needed for editing
    # config files, scripts, and docs ANYWHERE - not tied to one project
    # with its own flake (e.g. Lua for this very nvim config, Nix for
    # nixos-config itself, YAML/Markdown for random docs).
    lua-language-server
    nixd
    bash-language-server
    vscode-langservers-extracted # html, css, json
    yaml-language-server
    marksman # markdown

    # Formatters (lightweight, useful everywhere)
    prettier
    stylua
    nixfmt # replaces the deprecated nixfmt-rfc-style
    rustfmt
    gofumpt
    shfmt

    # Treesitter
    tree-sitter

    # Telescope
    ripgrep
    fd

    # NOTE: unzip/unrar/p7zip intentionally NOT listed here anymore -
    # they're general-purpose tools already installed system-wide via
    # modules/packages.nix, so listing them here too was pure duplication.

    # NOTE: heavier, language-specific tools (rust-analyzer, pyright,
    # typescript-language-server, gopls, clang-tools, dart, debuggers,
    # nodejs, gcc, etc.) are intentionally NOT installed globally anymore.
    # They now live in per-project dev shells under dev-templates/ - copy
    # the relevant flake.nix + .envrc into a project and run `direnv allow`.
    # See dev-templates/README.md for usage.
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
