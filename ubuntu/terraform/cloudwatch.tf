resource "aws_cloudwatch_log_group" "log" {
  name = "/devops/app"
  retention_in_days = 7
}
/*
forwarded_values {
  query_string = false

  cookies {
    forward = "none"
  }
}
*/
