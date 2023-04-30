# dotfiles

## Objective of this repository
Setup a fresh Fedora workstation with all packages and configurations automatically.

## Requirements to run
1 Install pip
2 Install ansible
3 Insert the following command:
```
ansible-playbook local.yml
```
## Testing ansible-playbook

1. ```docker build -t my-fedora-image .```
2. ```docker run -it -v ~/dotfiles:/dotfiles my-fedora-image bash```

## Ansible-playbook steps

### Install packages

- run setup\_dnf\_conf.sh
- git
    - ```git clone https://github.com/troclaux/dotfiles```
- pip
    - ansible
- fzf
- zsh
- install neovim requirements
    - ripgrep
    - fd-find
    - gcc-c++
    - bat
- nvim
    - setup packer
    - install plugins
- stow
    - setup dotfiles
- Install remaining packages
    - htop
    - go
    - tree
- Clone favorite repositories
    - ```git clone https://github.com/MichaelCade/90DaysOfDevOps```
    - ```git clone https://github.com/bregman-arie/devops-exercises```
    - ```git clone https://github.com/adonovan/gopl.io/```
