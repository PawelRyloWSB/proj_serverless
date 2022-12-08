resource "aws_s3_bucket" "site" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_website_configuration" "site" {
  bucket = aws_s3_bucket.site.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_bucket_acl" "site" {
  bucket = aws_s3_bucket.site.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "site" {
  bucket = aws_s3_bucket.site.id
  policy = templatefile("bucket_policy.json", {})
  }

resource "aws_s3_object" "example" {
  key                    = "index.html"
  bucket                 = aws_s3_bucket.site.id
  source                 = "terraform/www/index.html"
  acl = "public-read"
  content_type = "text/html"

}

resource "aws_s3_object" "error" {
  key                    = "error.html"
  bucket                 = aws_s3_bucket.site.id
  source                 = "terraform/www/error.html"
  acl = "public-read"
  content_type = "text/html"
}