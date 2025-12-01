resource "aws_security_group" "alb_sg" {
  id          = "sg-0123abcd4567ef001"
  vpc_id      = "vpc-0d3f52b6a8c9e1234"
  description = "ALB security group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "app_sg" {
  id          = "sg-0123abcd4567ef002"
  vpc_id      = "vpc-0d3f52b6a8c9e1234"

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["sg-0123abcd4567ef001"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
