#!/bin/bash

#Install Ansible
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible

#Run Ansible
PYTHONIOENCODING='utf-8' ansible-playbook desktop.yml
