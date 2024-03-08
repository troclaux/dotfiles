#!/bin/bash
echo -e "Select action:\n(1)Build image\n(2)Run container"
read action
echo -e "\nSelect Dockerfile distro:\n(1)Ubuntu\n(2)Fedora"
read distro

case $action in
1)
	case $distro in
	1) docker build -t my-ubuntu-image ./ubuntu/ ;;
	2) docker build -t my-fedora-image ./fedora/ ;;
	*) echo -e "Invalid value inserted for linux distribution, insert 1 or 2" && exit 1 ;;
	esac
	;;
2)
	case $distro in
	1) docker run -it --rm -v ~/dotfiles:/root/dotfiles my-ubuntu-image ;;
	2) docker run -it --rm -v ~/dotfiles:/root/dotfiles my-fedora-image ;;
	*) echo -e "Invalid value inserted for linux distribution, insert 1 or 2" && exit 1 ;;
	esac
	;;
*) echo -e "Invalid value inserted for action, insert 1 or 2" && exit 1 ;;
esac
