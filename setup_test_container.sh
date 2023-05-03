#!/bin/bash
echo -e "Select action:\n(1)Build image only\n(2)Run container only\n(3)Build image and run container"
read action
echo -e "\nSelect Dockerfile distro:\n(1)Ubuntu\n(2)Fedora"
read distro

if [[ $action -eq 1 || $action -eq 3 ]]; then

    if [[ $distro -eq 1 ]]; then
        docker build -t my-ubuntu-image ./ubuntu/
    elif [[ $distro -eq 2 ]]; then
        docker build -t my-fedora-image ./fedora/
    else
        echo -e "Invalid value inserted for linux distribution, insert 1 or 2" 
        exit 1
    fi

fi

if [[ $action -eq 2 || $action -eq 3 ]]; then

    if [[ $distro -eq 1 ]]; then
        docker run -it -v ~/dotfiles:/root/dotfiles my-ubuntu-image
    elif [[ $distro -eq 2 ]]; then
        docker run -it -v ~/dotfiles:/root/dotfiles my-fedora-image
    else
        echo -e "Invalid value inserted for linux distribution, insert 1 or 2"
    fi

else
    echo -e "Invalid value inserted for action, insert 1, 2 or 3"
    exit 1
fi