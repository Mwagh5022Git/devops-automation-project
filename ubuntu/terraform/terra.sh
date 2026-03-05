#!/bin/bash
/*
// echo "AWS LOGIN"
// aws configure

//cd terraform || exit

//terraform init
//terraform plan
//terraform apply -auto-approve

//echo "======== INFRA CREATED ========"
//terraform output
*/

#!/bin/bash

echo "Enter AWS Access Key:"
read ACCESS_KEY

echo "Enter AWS Secret Key:"
read SECRET_KEY

echo "Enter AWS Region:"
read REGION

aws configure set aws_access_key_id $ACCESS_KEY
aws configure set aws_secret_access_key $SECRET_KEY
aws configure set default.region $REGION

echo "AWS Login Successful"

cd terraform

echo "Initializing Terraform..."
terraform init

echo "Validating Terraform..."
terraform validate

echo "Planning Infrastructure..."
terraform plan -out=tfplan

echo "Creating Infrastructure..."
terraform apply tfplan

echo "Fetching Running Services..."

aws ec2 describe-instances --query 'Reservations[*].Instances[*].InstanceId'

aws s3 ls

aws dynamodb list-tables

aws sns list-topics

aws elbv2 describe-load-balancers

echo "Infrastructure Deployment Completed"
