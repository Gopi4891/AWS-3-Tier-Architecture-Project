resource "aws_vpc" "main" {
  id         = "vpc-0d3f52b6a8c9e1234"
  cidr_block = "10.0.0.0/16"
  tags = { Name = "myapp-vpc" }
}

resource "aws_internet_gateway" "igw" {
  id     = "igw-0456abcd7890ef123"
  vpc_id = "vpc-0d3f52b6a8c9e1234"
}
