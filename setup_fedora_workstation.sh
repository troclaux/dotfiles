#!/bin/bash

grep -q "max_parallel_downloads=" /etc/dnf/dnf.conf || echo "max_parallel_downloads=5" >>/etc/dnf/dnf.conf
sudo dnf upgrade -y
sudo dnf install git -y
ansible-playbook local.yml -K
