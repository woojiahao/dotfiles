#!/bin/bash

echo "Updating system..."
sudo -i
pacman -Syy --noconfirm
pacman -Su --noconfirm

echo "Setting up Git"
pacman -S --needed git base-devel
git config --global user.name "woojiahao"
git config --global user.email "woojiahao1234@gmail.com"

echo "Installing yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ../
rm -rf yay/

echo "Installing linux headers"
yay -S --noconfirm linux$(uname -r|sed 's/\W//g'|cut -c1-3)-headers

echo "Installing packages"
yay -S --needed - < package.txt

echo "Setting up Java"
archlinux-java set java-11-openjdk

echo "Setting up Docker"
systemctl start docker
systemctl enable docker
gpasswd -a $USERNAME docker

echo "Setting up VirtualBox"
uname -r
gpasswd -a $USERNAME vboxusers

echo "Setting up Vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Rebooting"
reboot
