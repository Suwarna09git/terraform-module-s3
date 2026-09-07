# terraform-module-s3

Terraform module to create an AWS S3 bucket with versioning and AES256 encryption.

## Usage

```hcl
module "s3" {
  source = "git::https://github.com/<your-org>/terraform-module-s3.git?ref=v1.0.0"

  bucket_name = "myapp-dev-assets-20240101"
  environment = "dev"

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}
```

## Inputs

| Name        | Description                              | Type          | Default | Required |
|-------------|------------------------------------------|---------------|---------|----------|
| bucket_name | Globally unique S3 bucket name           | `string`      | —       | yes      |
| environment | Environment (controls versioning/destroy)| `string`      | —       | yes      |
| tags        | Map of tags to apply                     | `map(string)` | `{}`    | no       |

## Outputs

| Name        | Description          |
|-------------|----------------------|
| bucket_name | Name of the bucket   |
| bucket_arn  | ARN of the bucket    |

## Behaviour by Environment

| Feature         | dev        | uat        | prod       |
|-----------------|------------|------------|------------|
| Versioning      | Suspended  | Suspended  | Enabled    |
| force_destroy   | true       | true       | false      |
| Encryption      | AES256     | AES256     | AES256     |
