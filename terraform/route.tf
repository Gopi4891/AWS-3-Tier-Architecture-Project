resource "aws_route_table" "public_rt" {
  id     = "rtb-0123abcd4567ef890"
  vpc_id = "vpc-0d3f52b6a8c9e1234"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0456abcd7890ef123"
  }

  tags = { Name = "myapp-public-rt" }
}

resource "aws_route_table_association" "public_1_assoc" {
  subnet_id      = "subnet-0abc12d34ef567890"
  route_table_id = "rtb-0123abcd4567ef890"
}
