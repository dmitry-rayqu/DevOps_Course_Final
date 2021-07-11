#!/bin/bash
path=`pwd`
terraform_path="${path}/terraform-ec2"

echo "### Create VPC..."
cd ${terraform_path}
terraform init   || exit 1
terraform plan   || exit 1
terraform apply

echo "Подставьте значение из вывода public_ip в ansible.inventory.yml"
