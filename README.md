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

## Ansible-playbook steps

### Install packages

1. run setup\_dnf\_conf exe
2. git
3. pip
    - ansible
4. zsh
5. nvim
    - setup packer
        - ripgrep
        - fd-find
    - install plugins
5. stow
    - setup dotfiles
6. Install remaining packages
    - htop
    - go
7. Clone favorite repositories
```
git clone https://github.com/MichaelCade/90DaysOfDevOps && \
git clone https://github.com/bregman-arie/devops-exercises && \
git clone https://github.com/adonovan/gopl.io/
```
