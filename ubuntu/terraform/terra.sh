#!/bin/bash

echo "AWS LOGIN"
aws configure

cd terraform || exit

terraform init
terraform plan
terraform apply -auto-approve

echo "======== INFRA CREATED ========"
terraform output
