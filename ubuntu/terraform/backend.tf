/*
terraform {
  backend "s3" {
    bucket         = "manish-devops-terraform-state"
    key            = "prod/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
*/
