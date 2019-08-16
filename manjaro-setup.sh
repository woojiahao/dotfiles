#!/bin/bash
# This is the installation script for all the software used for Manjaro

# This function is to retrieve an AUR package and install it 
aur_download () {
  cd ~/Downloads/
  AUR="https://aur.archlinux.org/$1.git"
  git clone AUR && cd $1 && makepkg -sic && cd .. && rm -r $1 
}

# Update packages first to prevent errors
pacman -Syuu
# Install all applications compatible with pacman
pacman -S vim snapd jre11-openjdk jdk11-openjdk openjdk11-doc gcc make linux$(uname -r|sed 's/\W//g'|cut -c1-3)-headers && systemctl enable --now snapd.socket && ln -s /var/lib/snapd/snap /snap

# Install all applicatons found in the AUR
aur_download "google-chrome"
aur_download "discord-canary"
aur_download "jetbrains-toolbox"
aur_download "visual-studio-code-bin"
aur_download "spotify"

# Install all applications found in snap 
pacman -Qi snapd
if [ $? -eq 0 ]; then
  snap install postman telegram-desktop libreoffice gimp
  snap install skype --classic 
  snap install slack --classic
fi 

# Reboot OS
reboot