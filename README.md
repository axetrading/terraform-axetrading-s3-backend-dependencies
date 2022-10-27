<!-- BEGIN_TF_DOCS -->
# Terraform S3 Backend Depdendencies

Resources for bootstrapping a Terraform setup.

The id parameter is used to prefix the tfstate bucket and tflocks table. It is recommended to set this
to the AWS account name and use these prefixes to find the right bucket/table, which protects you from
accidentally running Terraform in the wrong account.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.22 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.22 |

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.tflocks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_s3_bucket.tfstate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_ownership_controls.tfstate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_public_access_block.tfstate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.tfstate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.tfstate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_id"></a> [id](#input\_id) | Unique identifier to include in the name. Use of AWS account name recommended (serves as validation you're in the correct account). | `string` | n/a | yes |

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