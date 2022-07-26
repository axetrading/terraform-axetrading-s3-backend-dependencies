<!-- BEGIN_TF_DOCS -->
# Terraform S3 Backend Depdendencies

Resources for bootstrapping a Terraform setup.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.tflocks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_s3_bucket.tfstate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_ownership_controls.tfstate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_public_access_block.tfstate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.tfstate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.tfstate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tflocks_table_arn"></a> [tflocks\_table\_arn](#output\_tflocks\_table\_arn) | ARN of the DynamoDB table for locking Terraform state |
| <a name="output_tflocks_table_name"></a> [tflocks\_table\_name](#output\_tflocks\_table\_name) | Name of the DynamoDB table for locking Terraform state |
| <a name="output_tfstate_bucket_arn"></a> [tfstate\_bucket\_arn](#output\_tfstate\_bucket\_arn) | ARN of the S3 bucket for storing Terraform state |
| <a name="output_tfstate_bucket_name"></a> [tfstate\_bucket\_name](#output\_tfstate\_bucket\_name) | Name of the S3 bucket for storing Terraform state |

## Development

Generation of this README and formatting of Terraform code is done via a Git pre-commit hook. To install run:

    scripts/install-hooks.sh

To run the tests you need to login to AWS (use the "Infra Testing" account) and run `./test.sh`.

Releases are published (after running the tests) by pushing a semver tag (e.g. `v1.2.3`).
<!-- END_TF_DOCS -->