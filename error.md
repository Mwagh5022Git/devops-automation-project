आपका deployment इन services के साथ चल रहा है:
    Amazon VPC
    Amazon EC2
    Elastic Load Balancing
    Amazon CloudFront
    Amazon CloudWatch
    Amazon SNS
    Amazon DynamoDB
लेकिन कुछ configuration missing है।

1️⃣ ALB Error — No Internet Gateway
    vpc.tf
2️⃣ CloudFront Permission Error
    AWS console में जाएँ:
    AWS Identity and Access Management

    IAM      → Users     → Mwagh-DevOps     → Add permissions
  Attach policy:
    
    CloudFrontFullAccess
3️⃣ CloudWatch Log Group Permission
    Error:
    
      logs:CreateLogGroup not allowed
  Fix

    IAM user को policy attach करें:
    CloudWatchLogsFullAccess
4️⃣ SNS Permission Error
    Error:

    SNS:GetTopicAttributes not allowed
  Fix
    Attach policy:
      
      AmazonSNSFullAccess
5️⃣ DynamoDB Table Already Exists
    Error:
      
      Table already exists: terraform-lock
  Fix (choose one)
    Option 1 — table delete करें
    
    AWS Console      → DynamoDB     → Tables     → terraform-lock     → Delete
    
   Option 2 — Terraform state import करें
    
    terraform import aws_dynamodb_table.lock terraform-lock
6️⃣ Subnet CIDR Conflict
    Error:

    CIDR 10.0.1.0/24 conflicts with another subnet
  मतलब उसी VPC में वही subnet पहले से exist है।
    Fix
    
    vpc.tf में CIDR change करें:
    10.0.1.0/24
    10.0.2.0/24
    10.0.3.0/24
  Example:

    resource "aws_subnet" "public" {
      vpc_id = aws_vpc.main.id
      cidr_block = "10.0.10.0/24"
    }
7️⃣ Fix करने के बाद Run करें
    
    terraform init
    terraform validate
    terraform plan
    terraform apply
