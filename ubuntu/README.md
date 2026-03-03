Project Flow

Ubuntu
   ↓
terra.sh
   ↓
AWS Login (CLI Configure)
   ↓
Terraform Init → Plan → Apply
   ↓
AWS Infra Creation:
VPC → Subnets → IGW → Route Table
EC2 (Launch Template)
S3 (Versioning Enabled)
DynamoDB (Terraform State Locking)
SNS
CloudWatch
ALB (ELB)
Auto Scaling Group
AMI
CloudFront
   ↓
Output Summary
