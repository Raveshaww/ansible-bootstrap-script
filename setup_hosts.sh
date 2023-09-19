#!/bin/bash
ansible all --extra-vars @vars/secrets.yaml --ask-vault-pass -m user -a "name=ansible state=present password={{ password }}"
ansible all --extra-vars @vars/secrets.yaml --ask-vault-pass -m authorized_key -a "user=ansible state=present key={{ lookup('file', '/home/$USER/.ssh/id_rsa.pub') }}"
ansible all --extra-vars @vars/secrets.yaml --ask-vault-pass -m shell -a "echo 'ansible ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/ansible"
ansible all -m ping