#!/bin/bash

sudo dnf upgrade -y && \
sudo dnf install git -y && \
git clone https://github.com/troclaux/dotfiles && \
ansible-playbook local.yml -K --skip-tags "zsh_plugins"
