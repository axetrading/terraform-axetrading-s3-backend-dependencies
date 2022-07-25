output "tfstate_bucket_name" {
  value       = aws_s3_bucket.tfstate.id
  description = "Name of the S3 bucket for storing Terraform state"
}

output "tfstate_bucket_arn" {
  value       = aws_s3_bucket.tfstate.arn
  description = "ARN of the S3 bucket for storing Terraform state"
}

output "tflocks_table_name" {
  value       = aws_dynamodb_table.tflocks.name
  description = "Name of the DynamoDB table for locking Terraform state"
}

output "tflocks_table_arn" {
  value       = aws_dynamodb_table.tflocks.arn
  description = "ARN of the DynamoDB table for locking Terraform state"
}