import json
import boto3
from pprint import pprint
import os


s3_client = boto3.client("s3")
s3_bucket = os.environ["S3_BUCKET"]
s3_prefix = ""
s3_file_key = "test.txt"

def handler(event, context):
    response = s3_client.list_objects_v2(Bucket=s3_bucket, Prefix=s3_prefix, StartAfter=s3_prefix,)
    s3_files = response["Contents"]
    file_content = s3_client.get_object(Bucket=s3_bucket, Key=s3_file_key)["Body"].read()
    print(file_content)
    return file_content


