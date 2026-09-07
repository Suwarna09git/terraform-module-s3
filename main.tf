resource "aws_s3_bucket" "this" {
  bucket        = var.bucket_name
  force_destroy = var.environment != "prod"

  tags = merge(var.tags, {
    Name = var.bucket_name
  })
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = var.environment == "prod" ? "Enabled" : "Suspended"
  }
}
