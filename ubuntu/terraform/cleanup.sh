#!/bin/bash

echo "==================================="
echo " DEVOPS INFRA CLEANUP SCRIPT "
echo "==================================="

echo "Enter AWS Access Key:"
read AWS_ACCESS_KEY_ID

echo "Enter AWS Secret Key:"
read AWS_SECRET_ACCESS_KEY

echo "Enter AWS Region:"
read AWS_DEFAULT_REGION

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION

echo "AWS Authentication Completed"

echo "-----------------------------------"
echo "Step 1 : Terraform Destroy"
echo "-----------------------------------"

terraform init
terraform destroy -auto-approve

echo "-----------------------------------"
echo "Step 2 : Terminate EC2 Instances"
echo "-----------------------------------"

INSTANCE_IDS=$(aws ec2 describe-instances \
--query "Reservations[*].Instances[*].InstanceId" \
--output text)

if [ ! -z "$INSTANCE_IDS" ]; then
aws ec2 terminate-instances --instance-ids $INSTANCE_IDS
echo "EC2 instances terminated"
else
echo "No EC2 instances found"
fi

echo "-----------------------------------"
echo "Step 3 : Delete Load Balancers"
echo "-----------------------------------"

LBS=$(aws elbv2 describe-load-balancers \
--query "LoadBalancers[*].LoadBalancerArn" \
--output text)

for lb in $LBS
do
aws elbv2 delete-load-balancer --load-balancer-arn $lb
echo "Deleted LB: $lb"
done

echo "-----------------------------------"
echo "Step 4 : Empty and Delete S3 Buckets"
echo "-----------------------------------"

BUCKETS=$(aws s3api list-buckets \
--query "Buckets[*].Name" \
--output text)

for bucket in $BUCKETS
do
aws s3 rm s3://$bucket --recursive
aws s3api delete-bucket --bucket $bucket
echo "Deleted bucket: $bucket"
done

echo "-----------------------------------"
echo "Step 5 : Delete DynamoDB Tables"
echo "-----------------------------------"

TABLES=$(aws dynamodb list-tables --output text)

for table in $TABLES
do
aws dynamodb delete-table --table-name $table
echo "Deleted table: $table"
done

echo "-----------------------------------"
echo "Step 6 : Delete SNS Topics"
echo "-----------------------------------"

TOPICS=$(aws sns list-topics \
--query "Topics[*].TopicArn" \
--output text)

for topic in $TOPICS
do
aws sns delete-topic --topic-arn $topic
echo "Deleted topic: $topic"
done

echo "-----------------------------------"
echo "Step 7 : Delete CloudWatch Logs"
echo "-----------------------------------"

LOGS=$(aws logs describe-log-groups \
--query "logGroups[*].logGroupName" \
--output text)

for log in $LOGS
do
aws logs delete-log-group --log-group-name $log
echo "Deleted log group: $log"
done

echo "-----------------------------------"
echo "Infrastructure Cleanup Completed"
echo "-----------------------------------"
