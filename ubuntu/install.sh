#!/bin/bash
sudo apt install unzip curl git -y
echo “=========================================”
echo “ ********  Update and Install unzip Done  ********”
echo “=========================================”

#	Install Terraform
#       Remove Old Version (if installed manually)
#       sudo rm -f /usr/local/bin/terraform

sudo apt update -y
sudo apt install -y gnupg software-properties-common curl

curl -fsSL https://apt.releases.hashicorp.com/gpg | \
sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update
sudo apt install terraform -y
terraform -version

echo “======================================================================================================================”
echo “ ********  Installed Terraform ********”
echo “We install Terraform using HashiCorp official APT repository so that future upgrades can be handled using apt upgrade.”
echo “=======================================================================================================================”
echo “==========    Install AWS CLI    ===============”
echo “=======================================================================================================================”

#	Install AWS CLI
#  Remove Old Attempt (if any)
# sudo apt remove awscli -y

echo “Download Official AWS CLI v2”
echo “=========================================”
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws –version

echo “I install AWS CLI v2 using the official bundled installer provided by AWS instead of using apt, because apt provides outdated v1 versions.”
echo “=========================================”
#           Git Clone for Terraform
#git clone https://github.com/Mwagh5022Git/devops-projects-terraform.git
#cd devops-projects-terraform
#touch terra.sh
#chmod +x terra.sh
