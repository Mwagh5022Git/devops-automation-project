#!/bin/bash

echo "==================================="
echo " AWS AUTO CLEANUP SYSTEM "
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

echo "AWS Authentication Successful"

echo "-----------------------------------"
echo "1. Checking EC2 Instances"
echo "-----------------------------------"

INSTANCES=$(aws ec2 describe-instances \
--query 'Reservations[*].Instances[*].InstanceId' \
--output text)

if [ -n "$INSTANCES" ]; then
echo "Terminating EC2 Instances..."
aws ec2 terminate-instances --instance-ids $INSTANCES
else
echo "No EC2 Instances Found"
fi

echo "-----------------------------------"
echo "2. Checking Load Balancers"
echo "-----------------------------------"

LBS=$(aws elbv2 describe-load-balancers \
--query 'LoadBalancers[*].LoadBalancerArn' \
--output text)

for lb in $LBS
do
aws elbv2 delete-load-balancer --load-balancer-arn $lb
echo "Deleted Load Balancer: $lb"
done

echo "-----------------------------------"
echo "3. Cleaning S3 Buckets"
echo "-----------------------------------"

BUCKETS=$(aws s3api list-buckets \
--query 'Buckets[*].Name' \
--output text)

for bucket in $BUCKETS
do
aws s3 rm s3://$bucket --recursive
aws s3api delete-bucket --bucket $bucket
echo "Deleted Bucket: $bucket"
done

echo "-----------------------------------"
echo "4. Removing DynamoDB Tables"
echo "-----------------------------------"

TABLES=$(aws dynamodb list-tables --output text)

for table in $TABLES
do
aws dynamodb delete-table --table-name $table
echo "Deleted Table: $table"
done

echo "-----------------------------------"
echo "5. Deleting SNS Topics"
echo "-----------------------------------"

TOPICS=$(aws sns list-topics \
--query 'Topics[*].TopicArn' \
--output text)

for topic in $TOPICS
do
aws sns delete-topic --topic-arn $topic
echo "Deleted Topic: $topic"
done

echo "-----------------------------------"
echo "6. Removing CloudWatch Logs"
echo "-----------------------------------"

LOGS=$(aws logs describe-log-groups \
--query 'logGroups[*].logGroupName' \
--output text)

for log in $LOGS
do
aws logs delete-log-group --log-group-name $log
echo "Deleted Log Group: $log"
done

echo "-----------------------------------"
echo "Cleanup Completed Successfully"
echo "-----------------------------------"
