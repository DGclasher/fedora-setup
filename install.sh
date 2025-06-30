#!/bin/bash

sudo dnf update -y

# Copying dots
mkdir ~/.config
chown $(whoami): ~/.config
cp -r ./dotconfig/* ~/.config
cp -r ./bg.jpg ~/.config
cp .Xresources .Xnord .xinitrc ~/

# Essential packages 
sudo dnf install -y sddm bspwm sxhkd kitty rofi polybar picom thunar nitrogen lxpolkit
sudo dnf install -y vim lxappearance

# ocs-url installation
sudo dnf install -y ./rpm-packages/ocs-url-3.1.0-1.fc20.x86_64.rpm

# Installing fonts
sudo dnf install -y fontawesome-fonts fontawesome-fonts-web
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d /usr/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d /usr/share/fonts

# Reloading Font
fc-cache -vf

# Cleanup
rm ./FiraCode.zip ./Meslo.zip

sudo systemctl enable sddm
sudo systemctl set-default graphical.target
