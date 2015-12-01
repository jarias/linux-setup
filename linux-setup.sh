#!/bin/bash

if [ ! -x /usr/bin/ansible ]; then
	#Install Ansible
	sudo pacman -S ansible
fi

#Run Ansible
PYTHONIOENCODING='utf-8' ansible-playbook desktop.yml --ask-sudo-pass
