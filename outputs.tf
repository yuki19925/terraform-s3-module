output "bucket_name" {
  description = "建立的 S3 bucket 名稱"
  value       = aws_s3_bucket.this.bucket
}
