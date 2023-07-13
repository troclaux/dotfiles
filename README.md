# Objective
Automatically configure a fresh Linux workstation by installing all required packages and dotfiles with Ansible

# Installation
- Install git
- Clone repository with the command below:
```
git clone https://github.com/troclaux/dotfiles ~/dotfiles
```
- Install Ansible
- Run Ansible playbook with the command below:
```
ansible-playbook local.yml -t dotfiles --ask-vault-pass --skip-tags "flatpaks, clone"
```
# Use Docker to test Ansible playbook

```
chmod +x setup_test_container.sh
```

```
./setup_test_container.sh
```
