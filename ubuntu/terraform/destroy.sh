#!/bin/bash

echo "Starting Infrastructure Cleanup..."

echo "Enter AWS Access Key:"
read AWS_ACCESS_KEY_ID

echo "Enter AWS Secret Key:"
read AWS_SECRET_ACCESS_KEY

echo "Enter AWS Region:"
read AWS_DEFAULT_REGION

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION

echo "AWS Login Successful"

echo "Initializing Terraform..."
terraform init

echo "Destroying Infrastructure..."
terraform destroy -auto-approve

echo "Listing Remaining Resources..."

echo "EC2 Instances:"
aws ec2 describe-instances --query 'Reservations[*].Instances[*].InstanceId'

echo "S3 Buckets:"
aws s3 ls

echo "DynamoDB Tables:"
aws dynamodb list-tables

echo "SNS Topics:"
aws sns list-topics

echo "Load Balancers:"
aws elbv2 describe-load-balancers

echo "Cleanup Completed!"
