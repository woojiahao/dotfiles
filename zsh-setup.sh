#!/bin/bash
# Run this script as root to ensure that all the commands work
# Installation follows instructions from https://youtu.be/tQidq76Q8WA
# After reboot, use the ZSH configurator to set up
pacman -S zsh 
zsh --version 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh root 
chsh -s /bin/zsh $USERNAME
chsh -s $(which zsh)
reboot
