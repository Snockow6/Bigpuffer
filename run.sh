#!/bin/bash
echo "git pull latest from main"
git pull

echo "run playbook"
ansible-playbook main.yml