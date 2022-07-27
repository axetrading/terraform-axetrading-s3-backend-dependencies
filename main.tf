/**
 * # Terraform S3 Backend Depdendencies
 *
 * Resources for bootstrapping a Terraform setup.
 *
 * The id parameter is used to prefix the tfstate bucket and tflocks table. It is recommended to set this
 * to the AWS account name and use these prefixes to find the right bucket/table, which protects you from
 * accidentally running Terraform in the wrong account.
 */

resource "aws_s3_bucket" "tfstate" {
  bucket_prefix = "tfstate-${var.id}-"
}

resource "aws_s3_bucket_public_access_block" "tfstate" {
  bucket                  = aws_s3_bucket.tfstate.id
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate" {
  bucket = aws_s3_bucket.tfstate.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

locals {
  suffix = trimprefix(aws_s3_bucket.tfstate.id, aws_s3_bucket.tfstate.bucket_prefix)
}

resource "aws_dynamodb_table" "tflocks" {
  name         = "tflocks-${var.id}-${local.suffix}"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
  server_side_encryption {
    enabled = true
  }
}