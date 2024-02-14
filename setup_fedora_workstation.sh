#!/bin/bash

grep -q "max_parallel_downloads=" /etc/dnf/dnf.conf || echo "max_parallel_downloads=5" >> /etc/dnf/dnf.conf && \
grep -q "deltarpm=True" /etc/dnf/dnf.conf || echo "deltarpm=True" >> /etc/dnf/dnf.conf && \
sudo dnf upgrade -y && \
sudo dnf install git -y && \
git clone https://github.com/troclaux/dotfiles && \
ansible-playbook local.yml -K --skip-tags "zsh_plugins,clone"
