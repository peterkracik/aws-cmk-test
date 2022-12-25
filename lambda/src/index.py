import json
import boto3
from pprint import pprint
import os


s3_client = boto3.client("s3")
s3_enrypted_bucket = os.environ["S3_ENCRYPTED_BUCKET"]
s3_unencrypted_bucket = os.environ["S3_UNENCRYPTED_BUCKET"]
s3_prefix = ""
s3_file_key = "test.txt"

def handler(event, context):

    try:
        file_content = s3_client.get_object(Bucket=s3_unencrypted_bucket, Key=s3_file_key)["Body"].read()
        print("content of the unencrypted file:")
        print(file_content)
    except Exception as e:
        print("Error: {}".format(e))

    try:
        file_content = s3_client.get_object(Bucket=s3_enrypted_bucket, Key=s3_file_key)["Body"].read()
        print("content of the encrypted file:")
        print(file_content)
    except Exception as e:
        print("Error: {}".format(e))



