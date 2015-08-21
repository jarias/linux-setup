#!/bin/bash

if [ ! -x /usr/bin/ansible ]; then
	#Install Ansible
	sudo apt-get install software-properties-common
	sudo apt-add-repository ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install ansible
fi

#Run Ansible
PYTHONIOENCODING='utf-8' ansible-playbook desktop.yml --ask-sudo-pass
