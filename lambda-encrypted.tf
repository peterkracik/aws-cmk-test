
resource "aws_iam_role" "iam_lambda_encrypted" {
  name = "pk-test-lambda-encrypted"

  managed_policy_arns = [
    aws_iam_policy.lambda_s3_policy.arn,
  ]

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "lambda_encrypted" {
  function_name    = "read-s3-encrypted"
  role             = aws_iam_role.iam_lambda_encrypted.arn
  handler          = "index.handler"
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  runtime          = "python3.9"

  environment {
    variables = {
      S3_BUCKET = aws_s3_bucket.s3_encrypted.id
    }
  }
}