import boto3
import json
import os

outputs = json.loads(os.environ['TF_OUTPUTS'])

s3 = boto3.client('s3')

tfstate_bucket_name = outputs['tfstate_bucket_name']['value']
tfstate_bucket_arn = outputs['tfstate_bucket_arn']['value']

assert tfstate_bucket_name.startswith('tfstate-testid-'), 'tfstate prefix'

assert tfstate_bucket_arn == f'arn:aws:s3:::{tfstate_bucket_name}', 'tfstate bucket ARN'

block_config = s3.get_public_access_block(Bucket=tfstate_bucket_name)['PublicAccessBlockConfiguration']
assert block_config['BlockPublicAcls'], 'BlockPublicAcls'
assert block_config['BlockPublicPolicy'], 'BlockPublicPolicy'
assert block_config['RestrictPublicBuckets'], 'RestrictPublicBuckets'

assert s3.get_bucket_versioning(Bucket=tfstate_bucket_name)['Status'] == 'Enabled', 'versioning'

bucket_encryption_config = s3.get_bucket_encryption(Bucket=tfstate_bucket_name)['ServerSideEncryptionConfiguration']
assert bucket_encryption_config['Rules'][0]['ApplyServerSideEncryptionByDefault']['SSEAlgorithm'] == 'AES256', 'encryption'

dynamodb = boto3.client('dynamodb')

tflocks_table_name = outputs['tflocks_table_name']['value']
tflocks_table_arn = outputs['tflocks_table_arn']['value']

assert tflocks_table_name.startswith('tflocks-testid-'), 'tflocks prefix'

tflocks_table = dynamodb.describe_table(TableName=tflocks_table_name)['Table']
assert len(tflocks_table['KeySchema']) == 1, 'one key'
assert tflocks_table['KeySchema'][0]['AttributeName'] == 'LockID', 'key attribute'
assert tflocks_table['KeySchema'][0]['KeyType'] == 'HASH', 'key type'

assert tflocks_table['BillingModeSummary']['BillingMode'] == 'PAY_PER_REQUEST', 'pay as you go'

assert tflocks_table['SSEDescription']['SSEType'] == 'KMS', 'tflocks table encryption'

