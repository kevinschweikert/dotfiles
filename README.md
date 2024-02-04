# Mac Setup

This is my personal macOS configuration. It's a work in progress.

## Installation

```shell
set -x BW_SESSION (bw unlock --raw)
ansible-galaxy install -r requirements.yml
ansible-playbook main.yml --ask-become-pass
```
