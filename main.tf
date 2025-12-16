# S3 Module: 建立 bucket with custom name
resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name != "" ? "$$ {var.bucket_name}- $${random_string.bucket_suffix.result}" : "my-terraform-bucket-${random_string.bucket_suffix.result}"

  tags = {
    Name        = var.bucket_name != "" ? var.bucket_name : "My Terraform Bucket"
    Environment = "Demo"
  }
}

