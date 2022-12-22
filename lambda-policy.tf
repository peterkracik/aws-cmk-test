resource "aws_iam_policy" "lambda_s3_policy" {
  name        = "pk-test-lambda-s3-policy"
  path        = "/"
  description = "Access to s3 buckets"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket",
        ],
        "Resource" : [
          "${aws_s3_bucket.s3_encrypted.arn}",
          "${aws_s3_bucket.s3_encrypted.arn}/*",
          "${aws_s3_bucket.s3_unencrypted.arn}",
          "${aws_s3_bucket.s3_unencrypted.arn}/*",
        ]
      }
    ]
  })
}