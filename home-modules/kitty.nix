{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    settings = {
      # ------------------------------------------------------------
      # TRANSPARENCY + BLUR (works on Wayland/Niri)
      # ------------------------------------------------------------
      background_opacity = "0.85";       # 0.0 (fully transparent) - 1.0 (solid)
      dynamic_background_opacity = true; # opacity can be changed at runtime with Ctrl+Shift+a
      background_blur = 30;              # blur strength (works if the Niri compositor supports blur)

      # ------------------------------------------------------------
      # PERFORMANCE (fast + lightweight priority)
      # ------------------------------------------------------------
      repaint_delay = 8;
      input_delay = 1;
      sync_to_monitor = true;

      # ------------------------------------------------------------
      # LOOK & FEEL
      # ------------------------------------------------------------
      window_padding_width = 8;
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      cursor_shape = "beam";
      cursor_blink_interval = "0.5";

      # Tab bar minimal
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
    };
    # Theme: "Tokyo Night Storm" - dark, soft-contrast, popular color scheme
    # (name must match exactly as listed in kitty-themes' themes.json)
    themeFile = "Tokyo Night Storm";
  };

  # ------------------------------------------------------------
  # BLUR NOTE: to actually see the transparency/blur, the window-rule
  # below must exist in ~/.config/niri/config.kdl (inside niri.nix's
  # niri-config.kdl file). Without it, the focus-ring draws a solid
  # background behind the focused window and hides the blur/transparency:
  #
  #   window-rule {
  #       match app-id=r#"^kitty$"#
  #       draw-border-with-background false
  #   }
  #
  # (this rule belongs in niri.nix's config.kdl, not here in kitty.nix)
  # ------------------------------------------------------------
}
