#!/bin/bash

path=`pwd`
ansible_path="${path}/ansible"
ssh_key_path="${path}/terraform-ec2/key.pem"

echo "### Configure instance"
cd ${ansible_path}
ansible-playbook playbook.yml -i inventory.yml --key-file "${ssh_key_path}" --diff
