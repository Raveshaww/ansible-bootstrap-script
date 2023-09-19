# Ansible Bootstrap Script
Sometimes you have some nodes that are already provisioned with one user account, and you would like to start managing them with Ansible. This script provides an easy way to get an Ansible user on a list of target nodes in a way that is more in line with what I've found to be general expectations when running other playbooks.
###
- You may need to install `sshpass` on the system you're running the script from.
- `acl` may need to be installed on Ubuntu target nodes
- You'll need to set up an ansible-vault file at `vars/secrets.yaml` with the following defined:
    - `ansible_become_password`
    - `password`
        - Remember to properly hash this for the user creation command
            - `ansible all -i localhost, -m debug -a "msg={{ 'mypassword' | password_hash('sha512', 'mysecretsalt') }}"`
    - `ansible_user`
    - `ansible_password`
- Check filepaths for things like ssh key
- Be sure to check the filepath for the inventory file in ansible.cfg