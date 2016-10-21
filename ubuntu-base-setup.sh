#!/bin/bash

if [ ! -x /usr/bin/ansible ]; then
	sudo apt-get install -y software-properties-common
	sudo apt-add-repository -y ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install -y ansible
fi

#Run Ansible
PYTHONIOENCODING='utf-8' ansible-playbook base-desktop.yml --extra-vars "artifactory_username=$ARTIFACTORY_USERNAME artifactory_password=$ARTIFACTORY_PASSWORD kubuntu=false"
