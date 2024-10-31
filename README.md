
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

## Software without automated installation

- VS Code
- Docker Desktop
- rustup
