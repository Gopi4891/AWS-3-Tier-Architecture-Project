resource "aws_subnet" "public_1" {
  id                   = "subnet-0abc12d34ef567890"
  vpc_id               = "vpc-0d3f52b6a8c9e1234"
  cidr_block           = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = { Name = "myapp-public-1" }
}

resource "aws_subnet" "private_app" {
  id         = "subnet-0bbb12d34ef567acd"
  vpc_id     = "vpc-0d3f52b6a8c9e1234"
  cidr_block = "10.0.2.0/24"
  tags = { Name = "myapp-private-app" }
}

resource "aws_subnet" "private_db" {
  id         = "subnet-0ccc12d34ef567efg"
  vpc_id     = "vpc-0d3f52b6a8c9e1234"
  cidr_block = "10.0.3.0/24"
  tags = { Name = "myapp-private-db" }
}
