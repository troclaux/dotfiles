#!/bin/bash

# Install Flatpak and the required packages
sudo apt-get update && \
sudo apt-get install -y flatpak && \
sudo apt-get install -y flatpak gnome-software-plugin-flatpak && \

# Add the Flathub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Flatpaks
flatpak install flathub org.telegram.desktop -y && \
flatpak install flathub com.discordapp.Discord -y && \
flatpak install flathub org.qbittorrent.qBittorrent -y && \
flatpak install flathub com.obsproject.Studio -y && \
flatpak install flathub com.mattjakeman.ExtensionManager -y && \
flatpak install flathub org.videolan.VLC -y && \
flatpak install flathub com.brave.Browser -y && \
flatpak install flathub com.stremio.Stremio -y
