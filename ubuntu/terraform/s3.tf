/*
resource "aws_s3_bucket" "bucket" {
  bucket = "manish-devops-bucket-12345"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
*/

resource "aws_s3_bucket" "site" {
  bucket = "mwagh-devops-project-bucket-2026"
  tags = {
    Name = "DevOpsProjectBucket"
  }
}
