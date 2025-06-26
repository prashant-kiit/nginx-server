#!/bin/bash

# Run Terraform
terraform init
terraform apply -auto-approve

# Get EC2 public IP from Terraform output
EC2_IP=$(terraform output -raw ec2_public_ip)

echo "EC2 public IP: $EC2_IP"

# Generate Ansible inventory file
cat <<EOF > hosts.ini
[ec2]
$EC2_IP ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa_aws
EOF

# Run Ansible Playbook
ansible-playbook -i hosts.ini install.yml
