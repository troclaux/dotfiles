# Objetive
Automatically configure a fresh Linux workstation by installing all required packages and configurations using Ansible 

# Requirements to run
1 Install Ansible
2 Insert the following command:
```
ansible-playbook local.yml -t dotfiles --ask-vault-pass --skip-tags "flatpaks, clone"
```
# Testing ansible-playbook

```chmod u+x setup_test_container.sh```
```./setup_test_container.sh```

# Ansible-playbook steps

- If Linux distro is Fedora, add dnf.conf configurations
    - max_parallel_downloads=5
    - fastestmirror=True
    - deltarpm=True
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
    - setup kickstart neovim
    - install plugins
- stow
    - setup dotfiles
- Install remaining packages
    - go
    - gcc
    - htop
    - tree
- Install GUI programs
    - code
    - chrome
    - firefox
    - telegram 
    - discord
    - VLC
    - bitwarden
    - GNOME extension manager
- Clone favorite repositories
    - ```git clone https://github.com/MichaelCade/90DaysOfDevOps```
    - ```git clone https://github.com/bregman-arie/devops-exercises```
    - ```git clone https://github.com/adonovan/gopl.io/```
