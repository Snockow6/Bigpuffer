#!/bin/bash
echo "Run main.yml playbook"
if which ansible &> /dev/null # checks to see if ansible is installed
then 
  ansbile=true
else
  pip3 install ansible -y
fi

ansible-playbook main.yml