#!/bin/bash

printf "Installing and configuring Hyprland"
sudo pacman -S hyprland dunst pipewire wireplumber xdg-desktop-portal-hyprland \
	xdg-desktop-portal-wlr qt5-wayland qt6-wayland hyprpaper hyprlock hypridle \
	gdm 

sudo systemctl enable gdm.service
