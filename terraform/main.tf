terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  required_version = ">=0.14.9"

}

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "malconip-terraform-state"
    key    = "tfstate-s3-bucket"
    region = "us-east-1"
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "malconip-terraform-state"

  versioning {
    enabled = true
  }
}