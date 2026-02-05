# Dotfiles

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

## Install

```shell
git clone --bare https://github.com/jtpevehouse/configs.git $HOME/.dot
git --git-dir=$HOME/.dot --work-tree=$HOME checkout
git --git-dir=$HOME/.dot --work-tree=$HOME config --local status.showUntrackedFiles no

bash $HOME/dot_scripts/install_tools_<distro>.sh
```

## Tmux

Plugin manager: [TPM](https://github.com/tmux-plugins/tpm)

### Plugins used

| Plugin                                                                | Purpose                     |
| --------------------------------------------------------------------- | --------------------------- |
| [better mouse mode](https://github.com/NHDaly/tmux-better-mouse-mode) | Allows better mouse control |
| [nord](https://github.com/nordtheme/tmux)                             | Color scheme & powerline    |
| [gruvbox](https://github.com/egel/tmux-gruvbox)                       | Color scheme & powerline    |

### Custom Keymaps

| Key                  | Function                             |
| -------------------- | ------------------------------------ |
| ALT + \*num\*        | Select window                        |
| ALT + \*vim keys\*   | Switch pane                          |
| ALT + \*arrow keys\* | Resize panes                         |
| ctrl+b + \|          | Split vertically in current dir      |
| ctrl+b + -           | Split horizontally in current dir    |
| ctrl+b + o           | Re order windows                     |
| ctrl+b + k           | Kill session (asks for confirmation) |
| ctrl+b + x           | Kill panel (asks for confirmation)   |
