#!/bin/bash

echo -e "Select action:\n\
(1) Build Ubuntu image\n\
(2) Build Fedora image\n\
(3) Start Ubuntu container with bash\n\
(4) Start Fedora container with bash\n\
(5) Start Ubuntu container with ansible playbook\n\
(6) Start Fedora container with ansible playbook\n"

read action

case $action in
1) docker build -t my-ubuntu-image ./ubuntu/ ;;
2) docker build -t my-fedora-image ./fedora/ ;;
3) docker run -it --rm -v ~/dotfiles:/root/dotfiles --entrypoint /bin/bash my-ubuntu-image ;;
4) docker run -it --rm -v ~/dotfiles:/root/dotfiles --entrypoint /bin/bash my-fedora-image ;;
5) docker run -it --rm -v ~/dotfiles:/root/dotfiles my-ubuntu-image ;;
6) docker run -it --rm -v ~/dotfiles:/root/dotfiles my-fedora-image ;;
*) echo -e "Invalid value inserted for action, insert a number between 1 and 6" && exit 1 ;;
esac
