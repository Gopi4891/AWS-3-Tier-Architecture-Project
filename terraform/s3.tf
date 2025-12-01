resource "aws_s3_bucket" "app_bucket" {
  bucket = "myapp-static-files-demo123"
  arn    = "arn:aws:s3:::myapp-static-files-demo123"

  tags = {
    Name = "myapp-bucket"
  }
}
