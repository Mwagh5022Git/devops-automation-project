#!/bin/bash

echo "========== AWS LOGIN =========="
read -p "Enter AWS Access Key: " ACCESS_KEY
read -s -p "Enter AWS Secret Key: " SECRET_KEY
echo
read -p "Enter AWS Region: " REGION

aws configure set aws_access_key_id $ACCESS_KEY
aws configure set aws_secret_access_key $SECRET_KEY
aws configure set region $REGION

#echo "========== Switching to another Bash File  =========="
#chmod +x terra.sh
#./terra.sh
#echo "========== Return to aws_config Bash File =========="


echo "AWS Configured Successfully"

echo "========== Terraform INIT =========="
terraform init

echo "========== Terraform PLAN =========="
terraform plan

echo "========== Terraform APPLY =========="
terraform apply -auto-approve

echo "========== SERVICES CREATED =========="
terraform output

echo "========== PROCESS COMPLETED =========="
