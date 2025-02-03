#!/bin/bash

printf "Installing and configuring Hyprland\n\n"
sudo pacman -S hyprland dunst pipewire wireplumber xdg-desktop-portal-hyprland \
	xdg-desktop-portal-wlr qt5-wayland qt6-wayland hyprpaper hyprlock hypridle \
	gdm blueman networkmanager nextcloud network-manager-applet gnome-keyring

yay -S wofi waybar

sudo systemctl enable gdm.service
