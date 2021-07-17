#!/bin/bash
echo "Run main.yml playbook"
if which ansible &> /dev/null # checks to see if ansible is installed
then 
  ansbile=true
else
  pip3 install ansible
fi

echo "make sure external ansible modules are installed"
# if directory doesnt exist download ansible collection posix
if [ ! -d "~/.ansible/collections/ansible_collections/ansible/posix"] 
then
  ansible-galaxy collection install ansible.posix
fi

# if directory doesnt exist download ansible collection general
if [ ! -d "~/.ansible/collections/ansible_collections/community/general/"]
then 
  ansible-galaxy collection install community.general
fi 

echo "Checking Connection with Server"
if ping -c 1 bigpuffer.shed.lan &> /dev/null
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