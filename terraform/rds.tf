resource "aws_db_instance" "rds" {
  arn                   = "arn:aws:rds:ap-south-1:111122223333:db:myappdb"
  identifier            = "myappdb"
  instance_class        = "db.t3.micro"
  allocated_storage     = 20
  engine                = "mysql"
  username              = "admin"
  password              = "password123"
  db_subnet_group_name  = "myapp-db-subnet-group"
  vpc_security_group_ids = ["sg-0123abcd4567ef002"]
}
