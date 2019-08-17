#!/bin/bash
# Installation script installs VirtualBox onto Manjaro 
uname -r 
pacman -S virtualbox
gpasswd -a $USERNAME vboxusers
reboot