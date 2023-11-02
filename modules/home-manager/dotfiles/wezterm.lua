local wezterm = require 'wezterm'

return {
  hide_tab_bar_if_only_one_tab = true,
  check_for_updates = false, -- Only use if auto updating (ie flatpak)
  check_for_updates_interval_seconds = 101606400,
  show_update_window = false,
  -- Theme and Terminal look
  color_scheme = 'Dracula+',
  window_background_opacity = 0.95,

  -- Font Settings
  font = wezterm.font('JetBrains Mono'),
  font_size = 14.0,
  default_cursor_style = 'SteadyUnderline',

  -- Disable ligatures - don't know if I care
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },

  -- CSI Mode - Not sure what this is
  enable_csi_u_key_encoding = false,

  -- Keybindings
  --disable_default_key_bindings = true,
  keys = {
        {
          mods = "CTRL|SHIFT",
          key = [[p]],
          action = wezterm.action {
          SplitHorizontal = {domain = "CurrentPaneDomain"}
          }
        },
        {
          mods = "CTRL|SHIFT",
          key = [[o]],
          action = wezterm.action {
          SplitVertical = {domain = "CurrentPaneDomain"}
          }
        },
        {
          mods = "CTRL|SHIFT",
          key = [[r]],  
          action="ReloadConfiguration"
        },
        {
          mods = "CTRL|SHIFT",
          key = [[c]],
          action = wezterm.action{CopyTo="ClipboardAndPrimarySelection"}
        },
        {
          mods = "CTRL|SHIFT",
          key = [[v]],
          action = wezterm.action{PasteFrom="Clipboard"}
        },
        { 
          mods = "CTRL|SHIFT",
          key = "LeftArrow", 
          action = wezterm.action{ActivatePaneDirection="Left"}
        },
        { 
          mods = "CTRL|SHIFT",
          key = "RightArrow", 
          action = wezterm.action{ActivatePaneDirection="Right"}
        },
        { 
          mods="CTRL|SHIFT",
          key = "UpArrow", 
          action=wezterm.action{ActivatePaneDirection="Up"}
        },
        { 
          mods="CTRL|SHIFT",
          key = "DownArrow", 
          action=wezterm.action{ActivatePaneDirection="Down"}
        },
  }
}
