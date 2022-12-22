# Description: This file creates an unencrypted S3 bucket and uploads a file to it
resource "aws_s3_bucket" "s3_unencrypted" {
  bucket = "pk-test-not-encrypted-bucket"
  acl    = "private"
}

# Description: This file uploads a test file to the unencrypted S3 bucket
resource "aws_s3_bucket_object" "file_unencrypted" {
  key    = "test.txt"
  bucket = aws_s3_bucket.s3_unencrypted.id
  source = "${path.module}/lambda/test.txt"
}