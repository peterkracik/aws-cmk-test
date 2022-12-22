# Purpose: Create an S3 bucket with encryption
resource "aws_s3_bucket" "s3_encrypted" {
  bucket = "pk-test-encrypted-bucket"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = module.kms.key_arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

# Description: This file uploads a test file to the encrypted S3 bucket
resource "aws_s3_bucket_object" "file_encrypted" {
  key    = "test.txt"
  bucket = aws_s3_bucket.s3_encrypted.id
  source = "${path.module}/lambda/test.txt"
}