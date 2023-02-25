#!/bin/bash

# chmod +x flatpak_setup.sh

# Add the Flatpak PPA to the system
sudo add-apt-repository ppa:flatpak/stable

# Install Flatpak and the required packages
sudo apt-get update
sudo apt-get install flatpak gnome-software-plugin-flatpak

# Add the Flathub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Restart the system to complete the installation
echo "Flatpak has been installed. Please restart your system to complete the setup."

