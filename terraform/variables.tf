# terraform/variables.tf

variable "bucket_name" {
  description = "The name for the primary S3 bucket."
  type        = string
}

variable "bucket_name2" {
  description = "The name for the secondary S3 bucket."
  type        = string
}