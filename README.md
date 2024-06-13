# Dotfiles

This are my personal dotfiles (currently only macOS). It's a work in progress.
Provisioning works with [Ansible](https://www.ansible.com/) but not without running from scratch.
Thinking about switching to [chezmoi](https://www.chezmoi.io/)

## Installation
```shell
set -x BW_SESSION (bw unlock --raw)
ansible-galaxy install -r requirements.yml
ansible-playbook main.yml --ask-become-pass
```
