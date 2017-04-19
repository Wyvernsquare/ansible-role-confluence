# ansible-confluence

An ansible playbook for installing and configuring confluence

Modify host file
Example run: 'ansible-playbook -i hosts confluence.yml --ask-vault-pass'
or run on local VM via vagrant provision via Vagrantfile

## Assumptions
Things that may need adapted for other environments include: username (vagrant), package management, hostsfile (ip address).

Ansible Vault is needed to unlock and use the postgres password.
ansible-vault create postgres_pass.yml

For more see [Ansible Vault](http://docs.ansible.com/playbooks_vault.html) documentation.

## Actions
This playbook does the following things:
 * update / upgrade apt
 * install postgresql
 * enables postgresql actions (passwordless sudo)
 * creates confluence database and user with appropriate privilege levels
 * installs confluence
