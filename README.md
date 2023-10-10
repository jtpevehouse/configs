# Overview

This maintains current tools and plugins used for my daily dev workflow

- Alacritty: terminal emulator
- Fish: shell
- Neovim: text editor
- Tmux: terminal window manager

# Usage

## Install all configs

Run `scripts/install_configs_deb.sh`

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
