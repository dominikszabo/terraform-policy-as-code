# terraform/main.tf

# Configure the AWS provider
terraform {
  required_version = ">= 1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Resource: S3 Bucket
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  tags = {
    Name        = "ExampleBucket"
    Environment = "Dev"
    Exposure    = "private"
  }
}

# Extra section for new ACL format
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id
  acl    = "private"
}

# Output the bucket name
output "bucket_name" {
  value = aws_s3_bucket.example.id
}

# ------


# Resource: S3 Bucket
resource "aws_s3_bucket" "example2" {
  bucket = var.bucket_name2

  tags = {
    Name        = "ExampleBucket"
    Environment = "Dev"
    Exposure    = "public"
  }
}

# Extra section for new ACL format
resource "aws_s3_bucket_acl" "example2" {
  bucket = aws_s3_bucket.example2.id
  acl    = "public"
}

# Output the bucket name
output "bucket_name2" {
  value = aws_s3_bucket.example2.id
}