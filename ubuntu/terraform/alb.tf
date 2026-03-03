resource "aws_lb" "alb" {
  name               = "devops-alb"
  load_balancer_type = "application"
  subnets            = [aws_subnet.public.id]
}
