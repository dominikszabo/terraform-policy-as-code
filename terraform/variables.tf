# terraform/variables.tf

variable "bucket_name" {
  description = "tf_S3_bucket"
  type        = string
}

variable "bucket_name2" {
  description = "Second S3 bucket name"
  type        = string
}