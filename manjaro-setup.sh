#!/bin/bash
# This is the installation script for all the software used for Manjaro
# This function is to retrieve an AUR package and install it 
aur_download () {
  if [ -z $1 ]
  then 
    echo "AUR package name must be provided"
  else 
    AUR="https://aur.archlinux.org/$1.git"
    git clone $AUR
    cd $1
    makepkg -sic --noconfirm 
    cd .. 
    sudo rm -rf $1 
  fi 
}

# Update packages first to prevent errors
sudo pacman -Syuu

# Install all applications compatible with pacman
# Install essential packages
echo "Installing essential packages"
sudo pacman -S --noconfirm base-devel gcc make linux$(uname -r|sed 's/\W//g'|cut -c1-3)-headers

# Install both Java 8 and 11 - use Java 11 as default while Java 8 is used for development purposes
echo "Installing Java 8 & 11 and set Java 11 as default"
sudo pacman -S --noconfirm jre8-openjdk jdk8-openjdk openjdk8-doc jre11-openjdk jdk11-openjdk openjdk11-doc
archlinux-java set java-11-openjdk

# Install all the basic applications
echo "Installing basic application"
sudo pacman -S --noconfirm vim telegram-desktop libreoffice-still gimp noto-fonts-emoji discord xclip neofetch pandoc
sudo pacman -S --noconfirm snapd && systemctl enable --now snapd.socket && ln -s /var/lib/snapd/snap /snap

# Set up Docker (Sets the docker service to run on boot too)
echo "Installing Docker"
sudo pacman -S --noconfirm docker docker-machine docker-compose
systemctl start docker
systemctl enable docker
sudo gpasswd -a $USERNAME docker

# Set up Ruby
echo "Installing Ruby"
sudo pacman -S --noconfirm ruby ruby-irb
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
