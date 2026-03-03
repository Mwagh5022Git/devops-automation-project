output "vpc_id" {
  value = aws_vpc.main.id
}

output "s3_bucket" {
  value = aws_s3_bucket.bucket.id
}

output "alb_dns" {
  value = aws_lb.alb.dns_name
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.cdn.domain_name
}
