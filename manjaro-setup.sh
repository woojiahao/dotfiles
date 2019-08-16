#!/bin/bash
# This is the installation script for all the software used for Manjaro
# This function is to retrieve an AUR package and install it 
aur_download () {
  cd ~/Downloads/
  AUR="https://aur.archlinux.org/$1.git"
  git clone AUR && cd $1 && makepkg -sic && cd .. && rm -rf $1 
}

# Update packages first to prevent errors
pacman -Syuu
# Install all applications compatible with pacman
# TODO: Create script to setup postgresql
pacman -S vim jre11-openjdk jdk11-openjdk openjdk11-doc telegram-desktop libreoffice-still gimp gcc make docker
pacman -S linux$(uname -r|sed 's/\W//g'|cut -c1-3)-headers
pacman -S snapd && systemctl enable --now snapd.socket && ln -s /var/lib/snapd/snap /snap

# Install all applicatons found in the AUR
aur_download "google-chrome"
aur_download "discord-canary"
aur_download "jetbrains-toolbox"
aur_download "visual-studio-code-bin"
aur_download "spotify"
aur_download "postman"
aur_download "imagewriter"
aur_download "skypeforlinux-stable-bin"

# Install all applications found in snap 
pacman -Qi snapd
if [ $? -eq 0 ]; then
  snap install slack --classic
fi 

# Reboot OS
reboot