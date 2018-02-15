#!/bin/bash

#if [ ! -x /usr/bin/ansible ]; then
#	sudo apt-get install -y software-properties-common
#	sudo apt-add-repository -y ppa:ansible/ansible
#	sudo apt-get update
#	sudo apt-get install -y ansible
#fi

if [ -z "$DOTFILES_REPO" ]; then
  echo "Missing dotfiles Github repo URL"
  exit 1
fi

CONFIGURE_BACKUPS="${CONFIGURE_BACKUPS:-yes}"
CONFIGURE_TARSNAP="${CONFIGURE_BACKUPS:-yes}"

if [ "$CONFIGURE_BACKUPS" == "yes" ] && ([ -z $NAS_USERNAME ] || [ -z $NAS_HOSTNAME ]); then
  echo "Configure backups is enable but no NAS username or domain provided"
  exit 1
fi

ANSIBLE_EXTRA_VARS=$(
  cat <<EOF
{
"nas_username":"${NAS_USERNAME}",
"nas_hostname":"${NAS_HOSTNAME}",
"dotfiles_repo":"${DOTFILES_REPO}",
"configure_backups":"${CONFIGURE_BACKUPS}",
"configure_tarsnap":"${CONFIGURE_TARSNAP}"
}
EOF
)

#Run Ansible
ansible-playbook desktop.yml \
  --ask-become-pass \
  --extra-vars "${ANSIBLE_EXTRA_VARS}"
