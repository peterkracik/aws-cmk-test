# Description: KMS key for encrypted bucket
module "kms" {
  source  = "terraform-aws-modules/kms/aws"

  description         = "KMS key for encrypted bucket"
  enable_key_rotation = false
  create_external     = true
  key_usage           = "ENCRYPT_DECRYPT"

  key_owners         = []
  key_administrators = []
  key_users          = []

  aliases                 = ["pk-test/encrypted-bucket"]
  aliases_use_name_prefix = true

  grants = {
    lambda_doc_convert = {
      grantee_principal = aws_iam_role.iam_lambda_encrypted.arn
      operations        = ["Encrypt", "Decrypt", "GenerateDataKey"]
    }
  }
}