AWS Credentials
Step 1 — AWS Console

Login करें:

    👉 https://console.aws.amazon.com
फिर:

    IAM   → Users    → Your user   → Security Credentials     → Create Access Key
Step 2 — New Key Use करें

  Example:

    Access Key: AKIAxxxxxxxxxxxx
    Secret Key: xxxxxxxxxxxxxxxxxxxxxxxxx
Step 3 — Test AWS CLI
  Ubuntu में run करें:

    aws configure
  Enter:
    AWS Access Key ID
    AWS ecret Access Key
    Region: ap-south-1
    Output: json

  फिर test:
  aws sts get-caller-identity

  अगर सही होगा तो output आएगा:
      Account: xxxxxxxxx
      UserId: xxxxxxxxx
      Arn: arn:aws:iam::xxxx:user/xxxx
      3️⃣ Terraform दुबारा run करें

    terraform init
    terraform validate
    terraform plan
    terraform apply

या आपका script:

./terra.sh
