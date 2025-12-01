resource "aws_lb" "alb" {
  arn  = "arn:aws:elasticloadbalancing:ap-south-1:111122223333:loadbalancer/app/myapp-alb/abc123def456"
  name = "myapp-alb"
  load_balancer_type = "application"
  subnets = [
    "subnet-0abc12d34ef567890"
  ]
  security_groups = ["sg-0123abcd4567ef001"]
}

resource "aws_lb_target_group" "tg" {
  arn  = "arn:aws:elasticloadbalancing:ap-south-1:111122223333:targetgroup/myapp-tg/abc123456def7890"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-0d3f52b6a8c9e1234"
}

resource "aws_lb_listener" "listener" {
  arn = "arn:aws:elasticloadbalancing:ap-south-1:111122223333:listener/app/myapp-alb/abc123def456/789abc123def"
  load_balancer_arn = "arn:aws:elasticloadbalancing:ap-south-1:111122223333:loadbalancer/app/myapp-alb/abc123def456"
  port     = 80
  protocol = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "arn:aws:elasticloadbalancing:ap-south-1:111122223333:targetgroup/myapp-tg/abc123456def7890"
  }
}
