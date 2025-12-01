resource "aws_instance" "app_server" {
  ami                         = "ami-0e6329e222e662a52"
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-0bbb12d34ef567acd"
  vpc_security_group_ids      = ["sg-0123abcd4567ef002"]

  tags = { Name = "myapp-app-server" }
}
