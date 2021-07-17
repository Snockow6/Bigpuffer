#!/bin/bash
echo "Run main.yml playbook \n"
if which ansible &> /dev/null # checks to see if ansible is installed
then 
  ansbile=true
else
  pip3 install ansible -y
fi

echo "Check ansible galaxy modules are installed\n"
# check for posix 
if [ ! -d "~/.ansible/collections/ansible_collections/ansible/posix/" ]; then
  ansible-galaxy collection install ansible.posix
fi

# check for community general 
if [ ! -d "~/.ansible/collections/ansible_collections/community/" ]; then
  ansible-galaxy collection install community.general

fi


echo "Checking Connection with Server"
if ping -c 1 192.168.10.102 &> /dev/null
then
  echo "Success"
else
  echo "Server is Unreachable exiting"
  exit
fi

echo "git pull latest from main"
git pull

echo "run playbook"
ansible-playbook main.yml