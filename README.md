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
ansible-playbook local.yml -K
```
# Use Docker to test Ansible playbook

```
chmod +x setup_test_container.sh
```

```
./setup_test_container.sh
```
