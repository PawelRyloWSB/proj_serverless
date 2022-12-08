output "s3_bucket_arn" {
  value = "arn:aws:s3:::${var.bucket_name}"
}

output "bucket_name" {
  value = var.bucket_name
}

output "bucket_domain" {
  value = "lab1.s3.amazonaws.com"
}

output "bucket_website_endpoint" {
  value = "http://${var.bucket_name}.s3-website.localhost.localstack.cloud:4566/"
}