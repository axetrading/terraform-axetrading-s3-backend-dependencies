terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.22"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}
