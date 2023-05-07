# Objetive
Automatically configure a fresh Linux workstation by installing all required packages and configurations using Ansible 

# Requirements
1 Install Ansible
2 Insert the following command:
```
ansible-playbook local.yml -t dotfiles --ask-vault-pass --skip-tags "flatpaks, clone"
```
# Use Docker to test Ansible playbook

```chmod u+x setup_test_container.sh```
```./setup_test_container.sh```
