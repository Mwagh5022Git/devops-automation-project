#!/bin/bash
sudo apt update -y
sudo apt install unzip curl git -y

#	Install Terraform
wget https://releases.hashicorp.com/terraform/1.6.6/terraform_1.6.6_linux_amd64.zip
unzip terraform_1.6.6_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform -version

#	Install AWS CLI
sudo apt install awscli -y
aws configure
sudo -i

#           Git Clone for Terraform
git clone https://github.com/Mwagh5022Git/devops-projects-terraform.git
cd devops-projects-terraform
touch terra.sh
chmod +x terra.sh
