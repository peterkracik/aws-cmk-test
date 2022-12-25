# Implement AWS KMS CMK

A simple terraform how to implement AWS KMS CMK. 
It deploys KMS key, 2 S3 buckets, one of them is encrypted and 2 Lambda functions.
One of the lambdas is assigned the grant to the KMS key and thus can read files from both buckets

read more [Implementing AWS KMS — Customer Managed Key for the S3 bucket with the terraform](https://medium.com/@peterkracik/implementing-aws-kms-customer-managed-key-for-the-s3-bucket-with-the-terraform-bea6307db3e8)
