
# Dotfiles

> Automatically configure a fresh Linux workstation by installing all required packages and configuration files

## Prerequisites

- Git
- Ansible

## Installation

Clone Github repository:

```bash
git clone https://github.com/troclaux/dotfiles ~/dotfiles
```

Run Ansible playbook to setup a new linux machine:

```bash
ansible-playbook -K ~/dotfiles/local.yml
```

## Testing Ansible playbook

Make the script `setup_test_container.sh` executable:

```bash
chmod +x ~/dotfiles/setup_test_container.sh
```

Run the script to setup a Docker container where you can test the Ansible playbook:

```bash
./setup_test_container.sh
```

## Scripts to run after using Ansible playbook

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
