#!/bin/bash
# This is the installation script for all the software used for Manjaro
# This function is to retrieve an AUR package and install it 
aur_download () {
  AUR="https://aur.archlinux.org/$1.git"
  git clone $AUR && cd $1 && makepkg -sic --noconfirm && cd .. && sudo rm -rf $1 
}

# Update packages first to prevent errors
sudo pacman -Syuu
# Install all applications compatible with pacman
# Set up should not display prompts
# TODO: Create script to setup postgresql
sudo pacman -S --noconfirm base-devel vim jre11-openjdk jdk11-openjdk openjdk11-doc telegram-desktop libreoffice-still gimp gcc make noto-fonts-emoji discord xclip neofetch
sudo pacman -S --noconfirm linux$(uname -r|sed 's/\W//g'|cut -c1-3)-headers
sudo pacman -S --noconfirm snapd && systemctl enable --now snapd.socket && ln -s /var/lib/snapd/snap /snap

# Set up Docker (Sets the docker service to run on boot too)
sudo pacman -S docker
systemctl start docker
systemctl enable docker
sudo gpasswd -a $USERNAME docker

# Set up Ruby
sudo pacman -S ruby ruby-irb
sudo export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# Install all applicatons found in the AUR
aur_download "google-chrome"
aur_download "jetbrains-toolbox"
aur_download "visual-studio-code-bin"
aur_download "postman"
aur_download "imagewriter"
aur_download "skypeforlinux-stable-bin"
aur_download "slack-desktop"

# Install all applications found in snap 
sudo snap install spotify

# Reboot OS
sudo reboot
