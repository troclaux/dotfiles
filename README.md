
# Dotfiles

> Automatically configure a fresh Linux workstation by installing all required packages and dotfiles

## Installation

Clone Github repository:

```
git clone https://github.com/troclaux/dotfiles ~/dotfiles
```

- Install Ansible
- Run Ansible playbook with the command below:

```
ansible-playbook local.yml -K
```

## To test Ansible playbook, run the script that builds the Docker image and runs the container

```
chmod +x setup_test_container.sh && \
./setup_test_container.sh
```

## scripts to run after ansible-playbook to finish setting up linux

- `./scripts/fix_nvim_permissions.sh`
- `./scripts/install_flatpaks.sh`
- `./scripts/install_nerd_font.sh`
- `./scripts/install_node.sh`
- `./scripts/go_install.sh`
- `./scripts/ohmyzsh.sh`

## Software without automated installation

- VS Code
- Docker Desktop
- rustup
