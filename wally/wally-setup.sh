#!/bin/bash
# Installation of Wally for Ergodox EZ
# Run as root
pacman -S --noconfirm gtk3 webkit2gtk libusb
touch /etc/udev/rules.d/50-wally.rules
cp 50-wally.rules /etc/udev/rules.d/50-wally.rules
chmod +x wally
./wally
