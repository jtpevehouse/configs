# Overview

This maintains current tools and plugins used for my daily dev workflow

- Kitty: terminal emulator
- Fish: shell
- Neovim: text editor
- Tmux: terminal window manager
- Hypr: Hypr environment
  - Hyprland: tiling window manager
  - Hypridle: idle daemon
  - Hyprlock: lock screen
  - Hyprpaper: wallpaper
- waybar: status bar for Wayland

# Usage

## Install all configs

### Debian

Run `scripts/install_configs_deb.sh`

### Arch

Run `scripts/install_configs_arch.sh`

## Install fish plugins

Run `scripts/install_fisher.fish`

## Copy configs

Run `scripts/copy_configs.sh`

```
copy_configs.sh -l
    copy configs from ~/workspace to ~/.config

copy_configs.sh -h
    copy configs from ~/.config to ~/workspace
```
