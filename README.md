# Objetive
Automatically configure a fresh Linux workstation by installing all required packages and configurations using Ansible 

# Requirements
- Install Ansible
- Insert the following command:
```
ansible-playbook local.yml -t dotfiles --ask-vault-pass --skip-tags "flatpaks, clone"
```
# Use Docker to test Ansible playbook

```chmod u+x setup_test_container.sh```
```./setup_test_container.sh```
