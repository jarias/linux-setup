#!/bin/bash

if [ ! -x /usr/bin/ansible ]; then
	sudo apt-get install -y software-properties-common
	sudo apt-add-repository -y ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install -y ansible
fi

if [ -z "$ARTIFACTORY_USERNAME" ] || [ -z $ARTIFACTORY_PASSWORD ]; then
  echo "Missing Edify artifactory credentials"
  exit 1
fi

if [ -z "$DOTFILES_REPO" ]; then
  echo "Missing dotfiles Github repo URL"
  exit 1
fi

CONFIGURE_BACKUPS="${CONFIGURE_BACKUPS:-yes}"

#Run Ansible
ansible-playbook desktop.yml \
  --ask-become-pass \
  --extra-vars "dotfiles_repo=${DOTFILES_REPO} configure_backups=${CONFIGURE_BACKUPS} artifactory_username=${ARTIFACTORY_USERNAME} artifactory_password=${ARTIFACTORY_PASSWORD}"
