#!/usr/bin/fish

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source 
fisher install jorgebucaran/fisher
fisher install jorgebucaran/nvm.fish
nvm install latest
fisher install PatrickF1/fzf.fish
fisher install jomik/fish-gruvbox
fisher install catppuccin/fish
fisher install jorgebucaran/hydro
